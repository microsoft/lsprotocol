# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

import collections
import copy
import itertools
import keyword
import re
from typing import List, Optional, OrderedDict, Sequence, Tuple, Union

from . import model

METHOD_NAME_RE_1 = re.compile(r"(.)([A-Z][a-z]+)")
METHOD_NAME_RE_2 = re.compile(r"([a-z0-9])([A-Z])")


def _generate_field_validator(
    type_def: model.LSP_TYPE_SPEC, optional: bool = False
) -> str:
    """Generates attrs.field validator for a given field base of type."""

    if type_def.kind == "base":
        if type_def.name == "integer":
            validator = "validators.integer_validator"
        elif type_def.name == "uinteger":
            validator = "validators.uinteger_validator"
        elif type_def.name in ["string", "DocumentUri", "URI", "Uri"]:
            validator = "attrs.validators.instance_of(str)"
        elif type_def.name == "boolean":
            validator = "attrs.validators.instance_of(bool)"
        elif type_def.name == "decimal":
            validator = "attrs.validators.instance_of(float)"
        else:
            validator = None
    else:
        validator = None

    if optional:
        if validator:
            return f"attrs.field(validator=attrs.validators.optional({validator}), default=None)"
        else:
            return "attrs.field(default=None)"
    else:
        if validator:
            return f"attrs.field(validator={validator})"
        else:
            return "attrs.field()"


def _generate_type_name(
    type_def: model.LSP_TYPE_SPEC, class_name: Optional[str] = None
) -> str:
    """Get typing wrapped type name based on LSP type definition."""

    if type_def.kind == "stringLiteral":
        # These are string constants used in some LSP types.
        # TODO: Use this with python >= 3.8
        # return f"Literal['{type_def.value}']"
        return "str"

    if type_def.kind == "literal":
        # A general type 'Any' has no properties
        if (
            isinstance(type_def.value, model.LiteralValue)
            and len(type_def.value.properties) == 0
        ):
            return "Any"

        # The literal kind is a dynamically generated type and the
        # name for it is generated as needed. It is expected that when
        # this function is called name is set.
        if type_def.name:
            return f"'{type_def.name}'"

        # If name is missing, and there are properties then it is a dynamic
        # type. It should have already been generated.
        raise ValueError(str(type_def))

    if type_def.kind == "reference":
        # The reference kind is a named type which is part of LSP.
        return f"'{type_def.name}'"

    if type_def.kind == "array":
        # This is a linear collection type, LSP does not specify if
        # this needs to be ordered. Also, usingList here because
        # cattrs does not work well withIterable for some reason.
        return f"List[{_generate_type_name(type_def.element)}]"

    if type_def.kind == "or":
        # This type means that you can have either of the types under `items`
        # as the value. So, from typing point of view this is a union. The `or`
        # type means it is going to be one of the types, never both (see `and`)
        # Example:
        # id :Union[str, int]
        #     * This means that id can either be string or integer, cannot be both.
        types = []
        for item in type_def.items:
            types.append(_generate_type_name(item))
        return f"Union[{','.join(types)}]"

    if type_def.kind == "and":
        # This type means that the value has properties of all the types under
        # `items`. This type is equivalent of `class C(A, B)`. Where A and B are
        # defined in `items`. This type should be generated separately, here we
        # return the optionally provided class for this.
        if not class_name:
            raise ValueError(str(type_def))
        return class_name

    if type_def.kind == "base":
        # The `base` kind is used for primitive data types.
        if type_def.name == "decimal":
            return "float"
        elif type_def.name == "boolean":
            return "bool"
        elif type_def.name in ["integer", "uinteger"]:
            return "int"
        elif type_def.name in ["string", "DocumentUri", "URI"]:
            return "str"
        elif type_def.name == "null":
            return "None"
        else:
            # Unknown base kind.
            raise ValueError(str(type_def))

    if type_def.kind == "map":
        # This kind defines a dictionary like object.
        return f"Dict[{_generate_type_name(type_def.key)}, {_generate_type_name(type_def.value)}]"

    if type_def.kind == "tuple":
        # This kind defined a tuple like object.
        types = []
        for item in type_def.items:
            types.append(_generate_type_name(item))
        return f"Tuple[{','.join(types)}]"

    raise ValueError(str(type_def))


def _to_class_name(lsp_method_name: str) -> str:
    """Convert from LSP method name (e.g., textDocument/didSave) to python
    class name (e.g., TextDocumentDidSave)"""
    name = lsp_method_name[2:] if lsp_method_name.startswith("$/") else lsp_method_name
    name = name.replace("/", "_")
    name = METHOD_NAME_RE_1.sub(r"\1_\2", name)
    name = METHOD_NAME_RE_2.sub(r"\1_\2", name)
    return "".join(part.title() for part in name.split("_"))


def lines_to_str(lines: Union[Sequence[str], List[str]]) -> str:
    return "\n".join(lines)


def _sanitize_comment(text: str) -> str:
    """LSP spec comments can contain newlines or characters that should not be
    used or can cause issues with python code clean them up."""
    return text.replace("\r", "").replace("\n", "")


def _has_null_base_type(prop: model.Property) -> bool:
    """Detect if the type is indirectly optional."""
    if prop.type.kind == "or":
        # If one of the types in the item list is a `null` then that means the
        # field can be None. So we can treat that field as optional.
        return any(t.kind == "base" and t.name == "null" for t in prop.type.items)
    else:
        return False


def _to_snake_case(name: str) -> str:
    new_name = METHOD_NAME_RE_1.sub(r"\1_\2", name)
    new_name = METHOD_NAME_RE_2.sub(r"\1_\2", new_name)
    new_name = new_name.lower()
    return f"{new_name}_" if keyword.iskeyword(new_name) else new_name


def _snake_case_item_name(original: str) -> str:
    """Generate snake case names from LSP definition names.
    Example:
    * PlainText -> PLAIN_TEXT
    * $import -> IMPORT
    """
    new_name = original
    if new_name.startswith("$"):
        new_name = new_name[1:]
    if new_name.startswith("/"):
        new_name = new_name[1:]
    new_name = new_name.replace("/", "_")
    new_name = re.sub("(.)([A-Z][a-z]+)", r"\1_\2", new_name)
    new_name = re.sub("([a-z0-9])([A-Z])", r"\1_\2", new_name)
    return f"{new_name}_" if keyword.iskeyword(new_name) else new_name


def _capitalized_item_name(original: str) -> str:
    """Generate capitalized names from LSP definition names.
    Example:
    * someClass -> SomeClass
    * some_class -> SomeClass
    """
    parts = _snake_case_item_name(original).split("_")
    new_name = "".join(x.title() for x in parts)
    return f"{new_name}_" if keyword.iskeyword(new_name) else new_name


def _get_indented_documentation(
    documentation: Optional[str], indent: str = ""
) -> Optional[str]:
    """Clean up doc string from LSP model and word wrap with correct indent
    level."""
    doc = (
        indent.join(documentation.splitlines(keepends=True)) if documentation else None
    )
    if doc:
        doc = doc.replace("**​/*", "**/*").replace("∕", "/")
        doc = doc[:-2] if doc.endswith("*/") else doc
        doc = doc.strip()
        doc = re.sub(r"\[(?P<class>[A-Za-z]*)\]\(\#(?P=class)\)", r"\1", doc)
        doc = re.sub(r"\[(?P<class>[\S]*)(\[\])\]\(\#(?P=class)\)", r"\1\2", doc)
        doc = re.sub(r"\[([\w\ ]+)\]\(\#[\w\.]+\)", r"\1", doc)
    return doc


class TypesCodeGenerator:
    def __init__(self, lsp_model: model.LSPModel):
        self._lsp_model = lsp_model
        self._reset()

    def _reset(self):
        self._types: OrderedDict[str, List[str]] = collections.OrderedDict()
        self._imports: List[str] = [
            "import enum",
            "from typing import Any, Dict, List, Optional, Tuple, Union",
            "import attrs",
            "from . import validators",
        ]
        self._keyword_classes: List[str] = []
        self._special_classes: List[str] = []
        self._special_properties: List[str] = []

    def _add_keyword_class(self, class_name) -> None:
        if class_name not in self._keyword_classes:
            self._keyword_classes.append(class_name)

    def _get_imports(self) -> List[str]:
        return self._imports

    def _get_header(self) -> List[str]:
        return [
            "# Copyright (c) Microsoft Corporation. All rights reserved.",
            "# Licensed under the MIT License.",
            "",
            "# ****** THIS IS A GENERATED FILE, DO NOT EDIT. ******",
            "# Steps to generate:",
            "# 1. Checkout https://github.com/microsoft/lsprotocol",
            "# 2. Install nox: `python -m pip install nox`",
            "# 3. Run command: `python -m nox --session build_lsp`",
            "",
        ]

    def get_code(self) -> str:
        self._reset()
        self._generate_code(self._lsp_model)

        code_lines = (
            self._get_header()
            + self._get_imports()
            + self._get_meta_data(self._lsp_model)
            + self._get_types_code()
            + self._get_utility_code(self._lsp_model)
        )
        return lines_to_str(code_lines)

    def _add_special(self, class_name: str, properties: List[str]) -> None:
        if properties:
            self._special_classes.append(class_name)
            self._special_properties.extend([f"'{class_name}.{p}'" for p in properties])

    def _get_types_code(self) -> List[str]:
        code_lines = []
        for v in self._types.values():
            code_lines.extend(v)
        return code_lines

    def _add_import(self, import_line: str) -> None:
        if import_line not in self._imports:
            self._imports.append(import_line)

    def _has_type(self, type_name: str) -> bool:
        if type_name.startswith(('"', "'")):
            type_name = type_name[1:-1]
        return type_name in self._types

    def _add_type_code(self, type_name: str, code: List[str]) -> None:
        if not self._has_type(type_name):
            self._types[type_name] = code
            self._types.move_to_end(type_name)

    def _add_enum(self, enum_def: model.Enum) -> None:
        code_lines = [
            "" if "ErrorCodes" in enum_def.name else "@enum.unique",
            f"class {enum_def.name}(enum.Enum):",
        ]
        indent = " " * 4
        doc = _get_indented_documentation(enum_def.documentation, indent)
        code_lines += [
            f'{indent}"""{doc}"""' if enum_def.documentation else "",
            f"{indent}# Since: {_sanitize_comment(enum_def.since)}"
            if enum_def.since
            else "",
            f"{indent}# Proposed: {_sanitize_comment(enum_def.proposed)}"
            if enum_def.proposed
            else "",
        ]

        # Remove unnecessary empty lines
        code_lines = [code for code in code_lines if len(code) > 0]

        for item in enum_def.values:
            name = _capitalized_item_name(item.name)
            value = (
                f'"{item.value}"' if enum_def.type.name == "string" else f"{item.value}"
            )
            doc = _get_indented_documentation(item.documentation, indent)
            item_lines = [
                f"{indent}{name} = {value}",
                f'{indent}"""{doc}"""' if item.documentation else "",
                f"{indent}# Since: {_sanitize_comment(item.since)}"
                if item.since
                else "",
                f"{indent}# Proposed: {_sanitize_comment(item.proposed)}"
                if item.proposed
                else "",
            ]

            # Remove unnecessary empty lines.
            code_lines += [code for code in item_lines if len(code) > 0]

        self._add_type_code(enum_def.name, code_lines)

    def _add_enums(self, lsp_model: model.LSPModel) -> None:
        for enum_def in lsp_model.enumerations:
            self._add_enum(enum_def)

    def _process_literal_types(
        self, class_name: str, type_def: model.LSP_TYPE_SPEC
    ) -> None:
        if type_def.kind == "literal" and len(type_def.value.properties) > 0:
            type_def.name = type_def.name or _to_class_name(f"{class_name}_Type")
            self._add_literal_type(type_def)
        elif type_def.kind == "or":
            count = itertools.count(1)
            for sub_type in type_def.items or []:
                try:
                    # Anonymous types have no name so generate a name. We append `_Type#`
                    # to generate the name, where `#` is a number.
                    sub_type.name = sub_type.name or _to_class_name(
                        f"{class_name}_Type{next(count)}"
                    )
                except AttributeError:
                    pass
                self._process_literal_types(class_name, sub_type)
        elif type_def.kind == "array":
            try:
                type_def.element.name = type_def.element.name or _to_class_name(
                    f"{class_name}_Type"
                )
            except AttributeError:
                pass
            self._process_literal_types(class_name, type_def.element)
        elif type_def.kind == "and":
            raise ValueError(str(type_def))
        else:
            pass

    def _generate_properties(
        self, class_name: str, properties: List[model.Property], indent: str
    ) -> List[str]:
        code_lines = []

        # Ensure that we mark any property as optional if it supports None type.
        # We only need to do this for properties not explicitly marked as optional.
        for p in properties:
            if not p.optional:
                p.optional = _has_null_base_type(p)

        # sort properties so that you have non-optional properties first then optional properties
        properties = [p for p in properties if not p.optional] + [
            p for p in properties if p.optional
        ]

        for property_def in properties:
            self._process_literal_types(
                f"{class_name}/{property_def.name}", property_def.type
            )

            doc = _get_indented_documentation(property_def.documentation, indent)
            type_validator = _generate_field_validator(
                property_def.type, property_def.optional
            )

            type_name = _generate_type_name(property_def.type)
            if property_def.optional:
                type_name = f"Optional[{type_name}]"

            # make sure that property name is not a python keyword and snake cased.
            name = _to_snake_case(property_def.name)

            prop_lines = [f"{indent}{name}: {type_name} = {type_validator}"]
            prop_lines += [
                f'{indent}"""{doc}"""' if property_def.documentation else "",
                f"{indent}# Since: {_sanitize_comment(property_def.since)}"
                if property_def.since
                else "",
                f"{indent}# Proposed: {_sanitize_comment(property_def.proposed)}"
                if property_def.proposed
                else "",
            ]
            # Remove unnecessary empty lines and add a single empty line
            code_lines += [code for code in prop_lines if len(code) > 0] + [""]

        return code_lines

    def _add_literal_type(self, literal_def: model.LiteralType) -> None:
        if self._has_type(literal_def.name):
            return

        # indent level for use with fields, doc string, and comments.
        indent = " " * 4

        # clean up the docstring for the class itself.
        doc = _get_indented_documentation(literal_def.documentation, indent)

        # Code here should include class, its doc string, and any comments.
        code_lines = [
            "@attrs.define",
            f"class {literal_def.name}:",
            f'{indent}"""{doc}"""' if literal_def.documentation else "",
            f"{indent}# Since: {literal_def.since}" if literal_def.since else "",
            f"{indent}# Proposed: {literal_def.proposed}"
            if literal_def.proposed
            else "",
        ]

        # Remove unnecessary empty lines. This can happen if doc string or comments are missing.
        code_lines = [code for code in code_lines if len(code) > 0]

        code_lines += self._generate_properties(
            literal_def.name, literal_def.value.properties, indent
        )

        self._add_type_code(literal_def.name, code_lines)

        if any(keyword.iskeyword(p.name) for p in literal_def.value.properties):
            self._add_keyword_class(literal_def.name)

        self._add_special(
            literal_def.name,
            [
                _to_snake_case(p.name)
                for p in literal_def.value.properties
                if _has_null_base_type(p)
            ],
        )

    def _add_type_alias(self, type_alias: model.TypeAlias) -> None:

        # TypeAlias definition can contain anonymous types as a part of its
        # definition. We generate them here first before we get to defile the
        # TypeAlias.
        count = itertools.count(1)
        if type_alias.type.kind == "or":
            for sub_type in type_alias.type.items or []:
                if sub_type.kind == "literal":
                    # Anonymous types have no name so generate a name. We append `_Type#`
                    # to generate the name, where `#` is a number.
                    sub_type.name = (
                        sub_type.name or f"{type_alias.name}_Type{next(count)}"
                    )
                    self._add_literal_type(sub_type)

            # clean up the docstring for the class itself.
        doc = _get_indented_documentation(type_alias.documentation)

        code_lines = [
            f"{type_alias.name} = {_generate_type_name(type_alias.type)}",
            f'"""{doc}"""' if type_alias.documentation else "",
            f"# Since: {_sanitize_comment(type_alias.since)}"
            if type_alias.since
            else "",
            f"# Proposed: {_sanitize_comment(type_alias.proposed)}"
            if type_alias.proposed
            else "",
        ]
        code_lines = [code for code in code_lines if len(code) > 0]

        self._add_type_code(type_alias.name, code_lines)

    def _add_type_aliases(self, lsp_model: model.LSPModel) -> None:
        for type_def in lsp_model.typeAliases:
            self._add_type_alias(type_def)

    def _add_structure(
        self,
        struct_def: model.Structure,
        lsp_model: model.LSPModel,
    ) -> None:
        if self._has_type(struct_def.name):
            return

        # `extends` and `mixins` both are used as classes from which the
        # current class to derive from.
        extends = struct_def.extends or []
        mixins = struct_def.mixins or []

        definitions = [
            t
            for s in extends + mixins
            for t in lsp_model.structures
            if t.name == s.name and s.kind == "reference"
        ]
        for d in definitions:
            self._add_structure(d, lsp_model)

        indent = " " * 4
        doc = _get_indented_documentation(struct_def.documentation, indent)
        class_name = struct_def.name

        class_lines = [
            "" if class_name == "LSPObject" else "@attrs.define",
            f"class {class_name}:",
            f'{indent}"""{doc}"""' if struct_def.documentation else "",
            f"{indent}# Since: {_sanitize_comment(struct_def.since)}"
            if struct_def.since
            else "",
            f"{indent}# Proposed: {_sanitize_comment(struct_def.proposed)}"
            if struct_def.proposed
            else "",
        ]

        # Remove unnecessary empty lines and add a single empty line
        code_lines = [code for code in class_lines if len(code) > 0] + [""]

        # Inheriting from multiple classes can cause problems especially when using
        # `attrs.define`.
        properties = copy.deepcopy(struct_def.properties)
        for d in definitions:
            properties += copy.deepcopy(d.properties)

        code_lines += self._generate_properties(class_name, properties, indent)
        # If the class has no properties then add `pass`
        if len(properties) == 0:
            code_lines += [f"{indent}pass"]

        # Detect if the class has properties that might be keywords.
        self._add_type_code(class_name, code_lines)

        if any(keyword.iskeyword(p.name) for p in properties):
            self._add_keyword_class(class_name)

        self._add_special(
            class_name,
            [_to_snake_case(p.name) for p in properties if _has_null_base_type(p)],
        )

    def _add_structures(self, lsp_model: model.LSPModel) -> None:
        for struct_def in lsp_model.structures:
            self._add_structure(struct_def, lsp_model)

    def _add_and_type(
        self,
        type_def: model.LSP_TYPE_SPEC,
        class_name: str,
        structures: List[model.Structure],
    ) -> Tuple[List[str], List[str]]:
        if type_def.kind != "and":
            raise ValueError("Only `and` type code generation is supported.")

        indent = " " * 4
        code_lines = [
            "@attrs.define",
            f"class {class_name}:",
        ]

        properties = []
        for item in type_def.items:
            if item.kind == "reference":
                for structure in structures:
                    if structure.name == item.name:
                        properties += copy.deepcopy(structure.properties)
            else:
                raise ValueError(
                    "Only `reference` types are supported for `and` type generation."
                )

        code_lines += self._generate_properties(class_name, properties, indent)

        self._add_type_code(class_name, code_lines)
        if any(keyword.iskeyword(p.name) for p in properties):
            self._add_keyword_class(class_name)

        self._add_special(
            class_name,
            [_to_snake_case(p.name) for p in properties if _has_null_base_type(p)],
        )

    def _add_and_types(self, lsp_model: model.LSPModel) -> None:
        # Collect all and types in the model from known locations
        and_types = []
        for request in lsp_model.requests:
            if request.params:
                if request.params.kind == "and":
                    class_name = f"{_to_class_name(request.method)}Params"
                    and_types.append((f"{class_name}", request.params))

            if request.registrationOptions:
                if request.registrationOptions.kind == "and":
                    class_name = f"{_to_class_name(request.method)}Options"
                    and_types.append((f"{class_name}", request.registrationOptions))

        for notification in lsp_model.notifications:
            if notification.params:
                if notification.params.kind == "and":
                    class_name = f"{_to_class_name(notification.method)}Params"
                    and_types.append((f"{class_name}", notification.params))

            if notification.registrationOptions:
                if notification.registrationOptions.kind == "and":
                    class_name = f"{_to_class_name(notification.method)}Options"
                    and_types.append(
                        (f"{class_name}", notification.registrationOptions)
                    )

        for name, type_def in and_types:
            self._add_and_type(type_def, name, lsp_model.structures)

    def _add_requests(self, lsp_mode: model.LSPModel) -> None:
        indent = " " * 4

        self._add_type_code(
            "ResponseError",
            [
                "@attrs.define",
                f"class ResponseError:",
                f"{indent}code: int = attrs.field(validator=validators.integer_validator)",
                f'{indent}"""A number indicating the error type that occurred."""',
                f"{indent}message: str = attrs.field(validator=attrs.validators.instance_of(str))",
                f'{indent}"""A string providing a short description of the error."""',
                f"{indent}data:Optional[LSPAny] = attrs.field(default=None)",
                f'{indent}"""A primitive or structured value that contains additional information',
                f'{indent}about the error. Can be omitted."""',
            ],
        )

        self._add_type_code(
            "ResponseErrorMessage",
            [
                "@attrs.define",
                "class ResponseErrorMessage:",
                f"{indent}id:Optional[Union[int, str]] = attrs.field(default=None)",
                f'{indent}"""The request id where the error occurred."""',
                f"{indent}error:Optional[ResponseError] = attrs.field(default=None)",
                f'{indent}"""The error object in case a request fails."""',
                f'{indent}jsonrpc: str = attrs.field(default="2.0")',
            ],
        )

        self._add_special("ResponseErrorMessage", ["error", "jsonrpc"])

        for request in lsp_mode.requests:
            class_name = _to_class_name(request.method)
            doc = _get_indented_documentation(request.documentation, indent)

            if request.params:
                params_type = _generate_type_name(request.params, f"{class_name}Params")
                if not self._has_type(params_type):
                    raise ValueError(f"{class_name}Params type definition is missing.")
                params_field = "attrs.field()"
            else:
                params_type = "Optional[None]"
                params_field = "attrs.field(default=None)"

            result_type = None
            if request.result:
                result_type = _generate_type_name(request.result)
                result_field = "attrs.field(default=None)"
            else:
                result_type = "Optional[None]"
                result_field = "attrs.field(default=None)"

            self._add_type_code(
                f"{class_name}Request",
                [
                    "@attrs.define",
                    f"class {class_name}Request:",
                    f'{indent}"""{doc}"""' if request.documentation else "",
                    f"{indent}id:Union[int, str] = attrs.field()",
                    f'{indent}"""The request id."""',
                    f"{indent}params: {params_type} ={params_field}",
                    f'{indent}method: str = "{request.method}"',
                    f'{indent}"""The method to be invoked."""',
                    f'{indent}jsonrpc: str = attrs.field(default="2.0")',
                ],
            )
            self._add_special(f"{class_name}Request", ["method", "jsonrpc"])

            self._add_type_code(
                f"{class_name}Response",
                [
                    "@attrs.define",
                    f"class {class_name}Response:",
                    f"{indent}id:Optional[Union[int, str]] = attrs.field()",
                    f'{indent}"""The request id."""',
                    f"{indent}result: {result_type} = {result_field}",
                    f'{indent}jsonrpc: str = attrs.field(default="2.0")',
                ],
            )
            self._add_special(f"{class_name}Response", ["result", "jsonrpc"])

    def _add_notifications(self, lsp_mode: model.LSPModel) -> None:
        indent = " " * 4

        for notification in lsp_mode.notifications:
            class_name = _to_class_name(notification.method)
            doc = _get_indented_documentation(notification.documentation, indent)

            if notification.params:
                params_type = _generate_type_name(
                    notification.params, f"{class_name}Params"
                )
                if not self._has_type(params_type):
                    raise ValueError(f"{class_name}Params type definition is missing.")
                params_field = "attrs.field()"
            else:
                params_type = "Optional[None]"
                params_field = "attrs.field(default=None)"

            self._add_type_code(
                f"{class_name}Notification",
                [
                    "@attrs.define",
                    f"class {class_name}Notification:",
                    f'{indent}"""{doc}"""' if notification.documentation else "",
                    f"{indent}params: {params_type} = {params_field}",
                    f"{indent}method:str =  attrs.field(",
                    f'validator=attrs.validators.in_(["{notification.method}"]),',
                    f'default="{notification.method}",',
                    ")",
                    f'{indent}"""The method to be invoked."""',
                    f'{indent}jsonrpc: str = attrs.field(default="2.0")',
                ],
            )
            self._add_special(f"{class_name}Notification", ["method", "jsonrpc"])

    def _add_lsp_method_type(self, lsp_model: model.LSPModel) -> None:
        indent = " " * 4
        directions = set(
            [x.messageDirection for x in (lsp_model.requests + lsp_model.notifications)]
        )
        code_lines = [
            "@enum.unique",
            "class MessageDirection(enum.Enum):",
        ]
        code_lines += [
            f"{indent}{_capitalized_item_name(m)} = '{m}'" for m in directions
        ]
        self._add_type_code("MessageDirection", code_lines)

    def _generate_code(self, lsp_model: model.LSPModel) -> None:
        self._add_enums(lsp_model)
        self._add_type_aliases(lsp_model)
        self._add_structures(lsp_model)
        self._add_and_types(lsp_model)
        self._add_requests(lsp_model)
        self._add_notifications(lsp_model)
        self._add_lsp_method_type(lsp_model)

    def _get_utility_code(self, lsp_model: model.LSPModel) -> List[str]:
        request_classes = []
        response_classes = []
        notification_classes = []

        methods = set(
            [x.method for x in (lsp_model.requests + lsp_model.notifications)]
        )
        code_lines = (
            [""]
            + sorted([f"{_snake_case_item_name(m).upper()} = '{m}'" for m in methods])
            + [""]
        )

        code_lines += ["METHOD_TO_TYPES = {", "    # Requests"]

        request_types = []
        for request in lsp_model.requests:
            class_name = _to_class_name(request.method)
            request_class = f"{class_name}Request"
            response_class = f"{class_name}Response"

            request_classes.append(request_class)
            response_classes.append(response_class)

            params_type = None
            if request.params:
                params_type = _generate_type_name(
                    request.params, f"{class_name}Params"
                ).strip("\"'")

            registration_type = None
            if request.registrationOptions:
                registration_type = _generate_type_name(
                    request.registrationOptions, f"{class_name}Options"
                ).strip("\"'")

            key = f"{_snake_case_item_name(request.method).upper()}"
            request_types += [
                f"{key}: ({request_class}, {response_class}, {params_type}, {registration_type}),"
            ]

        code_lines += sorted(request_types)
        code_lines += ["    # Notifications"]

        notify_types = []
        for notification in lsp_model.notifications:
            class_name = _to_class_name(notification.method)
            notification_class = f"{class_name}Notification"
            notification_classes.append(notification_class)

            params_type = None
            if notification.params:
                params_type = _generate_type_name(
                    notification.params, f"{class_name}Params"
                ).strip("\"'")

            registration_type = None
            if notification.registrationOptions:
                registration_type = _generate_type_name(
                    notification.registrationOptions, f"{class_name}Options"
                ).strip("\"'")

            key = f"{_snake_case_item_name(notification.method).upper()}"
            notify_types += [
                f"{key}: ({notification_class}, None, {params_type}, {registration_type}),"
            ]

        code_lines += sorted(notify_types)
        code_lines += ["}"]

        code_lines += [
            f"REQUESTS = Union[{', '.join(sorted(request_classes))}]",
            f"RESPONSES = Union[{', '.join(sorted(response_classes))}]",
            f"NOTIFICATIONS = Union[{', '.join(sorted(notification_classes))}]",
            "MESSAGE_TYPES = Union[REQUESTS, RESPONSES, NOTIFICATIONS, ResponseErrorMessage]",
            "",
        ]

        # These classes have properties that may be python keywords.
        code_lines += [
            f"_KEYWORD_CLASSES = [{', '.join(sorted(set(self._keyword_classes)))}]"
        ]
        code_lines += [
            "def is_keyword_class(cls) -> bool:",
            '    """Returns true if the class has a property that may be python keyword."""',
            "    return any(cls is c for c in _KEYWORD_CLASSES)",
            "",
        ]

        # These are classes that have properties that need special handling
        # during serialization of the class based on LSP.
        # See: https://github.com/microsoft/vscode-languageserver-node/issues/967
        code_lines += [
            f"_SPECIAL_CLASSES = [{', '.join(sorted(set(self._special_classes)))}]"
        ]
        code_lines += [
            "def is_special_class(cls) -> bool:",
            '    """Returns true if the class or its properties require special handling."""',
            "    return any(cls is c for c in _SPECIAL_CLASSES)",
            "",
        ]

        # This is a collection of `class_name.property` as string. These properties
        # need special handling as described by LSP>
        # See: https://github.com/microsoft/vscode-languageserver-node/issues/967
        #
        # Example:
        #   Consider RenameRegistrationOptions
        #     * document_selector property:
        #         When you set `document_selector` to None in python it has to be preserved when
        #         serializing it. Since the serialized JSON value `{"document_selector": null}`
        #         means use the Clients document selector. Omitting it might throw error.
        #     * prepare_provider property
        #         This property does NOT need special handling, since omitting it or using
        #         `{"prepare_provider": null}` has the same meaning.
        code_lines += [
            f"_SPECIAL_PROPERTIES = [{', '.join(sorted(set(self._special_properties)))}]"
        ]
        code_lines += [
            "def is_special_property(cls, property_name:str) -> bool:",
            '    """Returns true if the class or its properties require special handling.',
            "    Example:",
            "      Consider RenameRegistrationOptions",
            "        * document_selector property:",
            "            When you set `document_selector` to None in python it has to be preserved when",
            '            serializing it. Since the serialized JSON value `{"document_selector": null}`',
            "            means use the Clients document selector. Omitting it might throw error. ",
            "        * prepare_provider property",
            "            This property does NOT need special handling, since omitting it or using",
            '            `{"prepare_provider": null}` in JSON has the same meaning.',
            '    """',
            '    qualified_name = f"{cls.__name__}.{property_name}"',
            "    return qualified_name in _SPECIAL_PROPERTIES",
            "",
        ]

        code_lines += ["", "ALL_TYPES_MAP = {"]
        code_lines += sorted([f"'{name}': {name}," for name in set(self._types.keys())])
        code_lines += ["}", ""]

        code_lines += ["_MESSAGE_DIRECTION: Dict[str, str] = {"]

        code_lines += ["# Request methods"]
        code_lines += sorted(
            [
                f'{_snake_case_item_name(r.method).upper()}:"{r.messageDirection}",'
                for r in lsp_model.requests
            ]
        )
        code_lines += ["# Notification methods"]
        code_lines += sorted(
            [
                f'{_snake_case_item_name(n.method).upper()}:"{n.messageDirection}",'
                for n in lsp_model.notifications
            ]
        )

        code_lines += ["}", ""]

        code_lines += [
            "def message_direction(method:str) -> str:",
            '    """Returns message direction clientToServer, serverToClient or both."""',
            "    return _MESSAGE_DIRECTION[method]",
            "",
        ]

        return code_lines

    def _get_meta_data(self, lsp_model: model.LSPModel) -> List[str]:
        return [f"__lsp_version__ = '{lsp_model.metaData.version}'"]
