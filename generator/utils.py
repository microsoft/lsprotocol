# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

import copy
import itertools
import keyword
import re
from typing import Callable, Dict, List, Optional, Tuple

from . import model

ClassGenCallback = Callable[[str, bool, List[str]], None]
METHOD_NAME_RE_1 = re.compile(r"(.)([A-Z][a-z]+)")
METHOD_NAME_RE_2 = re.compile(r"([a-z0-9])([A-Z])")


def _generate_field_validator(
    type_def: model.LSP_TYPE_SPEC, optional: bool = False
) -> str:
    """Generates attrs.field validator for a given field base of type."""
    code = []

    if type_def.kind == "base":
        if type_def.name == "integer":
            # Example of a integer type optional value
            # attrs.field(
            #     validator=attrs.validators.optional(validators.integer_validator))
            #     default=None,
            # )
            code = [
                "attrs.field(",  # Parenthesis open field
                "validator=attrs.validators.optional(validators.integer_validator),"
                if optional
                else "validator=validators.integer_validator",
                "default=None," if optional else "",
                ")",  # Parenthesis close field
            ]
        elif type_def.name == "uinteger":
            # Example of a uinteger type optional value
            # attrs.field(
            #     validator=attrs.validators.optional(validators.uinteger_validator))
            #     default=None,
            # )
            code = [
                "attrs.field(",  # Parenthesis open field
                "validator=attrs.validators.optional(validators.uinteger_validator),"
                if optional
                else "validator=validators.uinteger_validator",
                "default=None," if optional else "",
                ")",  # Parenthesis close field
            ]
        elif type_def.name in ["string", "DocumentUri", "Uri"]:
            # Example of a string type optional value
            # attrs.field(
            #     validator=attrs.validators.optional(attrs.validators.instance_of(str)))
            #     default=None,
            # )
            code = [
                "attrs.field(",  # Parenthesis open field
                "validator=attrs.validators.optional(attrs.validators.instance_of(str)),"
                if optional
                else "validator=attrs.validators.instance_of(str)",
                "default=None," if optional else "",
                ")",  # Parenthesis close field
            ]
        elif type_def.name == "boolean":
            # Example of a boolean type optional value
            # attrs.field(
            #     validator=attrs.validators.optional(attrs.validators.instance_of(bool)))
            #     default=None,
            # )
            code = [
                "attrs.field(",  # Parenthesis open field
                "validator=attrs.validators.optional(attrs.validators.instance_of(bool)),"
                if optional
                else "validator=attrs.validators.instance_of(bool)",
                "default=None," if optional else "",
                ")",  # Parenthesis close field
            ]
        elif type_def.name == "decimal":
            # Example of a decimal type optional value
            # attrs.field(
            #     validator=attrs.validators.optional(attrs.validators.instance_of(float)))
            #     default=None,
            # )
            code = [
                "attrs.field(",  # Parenthesis open field.
                "validator=attrs.validators.optional(attrs.validators.instance_of(float)),"
                if optional
                else "validator=attrs.validators.instance_of(float)",
                "default=None," if optional else "",
                ")",  # Parenthesis close field.
            ]
        else:
            # For all other 'base' type fields that don't require validation use these.
            code = ["attrs.field(default=None)"] if optional else ["attrs.field()"]
    else:
        # For all other non 'base' type fields that don't require validation use these.
        code = ["attrs.field(default=None)"] if optional else ["attrs.field()"]

    return "".join(code)


def _generate_type_name(
    type_def: model.LSP_TYPE_SPEC, class_name: Optional[str] = None
) -> str:
    """Get typing wrapped type name based on LSP type definition."""

    if type_def.kind == "stringLiteral":
        # These are string constants used in some LSP types.
        # TODO: Use this with python >= 3.8
        # return f"Literal['{type_def.value}']"
        return "str"

    if type_def.kind == "reference" or type_def.kind == "literal":
        # The reference kind is a named type which is part of LSP.
        # The literal kind is a dynamically generated type and the
        # name for it is generated as needed. It is expected that when
        # this function is called name is set.
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
        elif type_def.name in ["string", "DocumentUri", "Uri"]:
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


def _generate_and_type(
    type_def: model.LSP_TYPE_SPEC,
    class_name: str,
    structures: List[model.Structure],
    on_class: ClassGenCallback,
) -> Tuple[List[str], List[str]]:
    if type_def.kind != "and":
        raise ValueError("Only `and` type code generation is supported.")

    indent = " " * 4
    import_lines = ["import attrs"]
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

    # Ensure that we mark any property as optional if it supports None type.
    # We only need to do this for properties not explicitly marked as optional.
    for p in properties:
        if not p.optional:
            p.optional = _has_null_base_type(p)

    imports, code = _generate_properties(properties, indent)
    import_lines += imports
    code_lines += code

    on_class(
        class_name,
        any(keyword.iskeyword(p.name) for p in properties),
        [p.name for p in properties if _has_null_base_type(p)],
    )

    return imports, code_lines


def _has_null_base_type(prop: model.Property) -> bool:
    """Detect if the type is indirectly optional."""
    if prop.type.kind == "or":
        # If one of the types in the item list is a `null` then that means the
        # field can be None. So we can treat that field as optional.
        return any(t.kind == "base" and t.name == "null" for t in prop.type.items)
    else:
        return False


def _generate_literal_dynamic_classes(
    literal_def: model.LiteralType,
    on_class: ClassGenCallback,
) -> Tuple[List[str], List[str]]:
    """Generate class definition for anonymous types described in LSP.

    Please ensure that you set a name via `literal_def.name` before
    calling this function.
    """
    # We use typing and attrs while defining the class and fields.
    import_lines = ["import attrs"]
    # These are needed for integer and uinteger types.
    import_lines += ["from . import validators"]

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
        f"{indent}# Proposed: {literal_def.proposed}" if literal_def.proposed else "",
    ]

    # Remove unnecessary empty lines. This can happen if doc string or comments are missing.
    code_lines = [code for code in code_lines if len(code) > 0]

    imports, code = _generate_properties(literal_def.value.properties, indent)
    import_lines += imports
    code_lines += code

    # Detect if the class has properties that might be keywords.
    on_class(
        literal_def.name,
        any(keyword.iskeyword(p.name) for p in literal_def.value.properties),
        [p.name for p in literal_def.value.properties if _has_null_base_type(p)],
    )

    return (import_lines, code_lines)


def _sanitize_comment(text: str) -> str:
    """LSP spec comments can contain newlines or characters that should not be
    used or can cause issues with python code clean them up."""
    return text.replace("\r", "").replace("\n", "")


def _generate_type_aliases(
    type_alias: model.TypeAlias,
    on_class: ClassGenCallback,
) -> Tuple[List[str], List[str]]:
    """GenerateTypeAlias based on type alias definition in LSP."""
    import_lines = []
    code_lines = []

    try:
        # TypeAlias definition can contain anonymous types as a part of its
        # definition. We generate them here first before we get to defile the
        # TypeAlias.
        count = itertools.count(1)
        for sub_type in type_alias.type.items or []:
            if sub_type.kind == "literal":
                # Anonymous types have no name so generate a name. We append `_Type#`
                # to generate the name, where `#` is a number.
                sub_type.name = (
                    sub_type.name
                    if sub_type.name
                    else f"{type_alias.name}_Type{next(count)}"
                )

                imports, code = _generate_literal_dynamic_classes(sub_type, on_class)
                import_lines += imports
                code_lines += code
    except AttributeError:
        # It can be a typ alias where all the types are primitive or forward references.
        # We don't need to define those yet.
        pass

    # clean up the docstring for the class itself.
    doc = _get_indented_documentation(type_alias.documentation)

    code_lines += [
        f"{type_alias.name} = {_generate_type_name(type_alias.type)}",
        f'"""{doc}"""' if type_alias.documentation else "",
        f"# Since: {_sanitize_comment(type_alias.since)}" if type_alias.since else "",
        f"# Proposed: {_sanitize_comment(type_alias.proposed)}"
        if type_alias.proposed
        else "",
    ]

    on_class(type_alias.name, False, [])

    return (import_lines, [code for code in code_lines if len(code) > 0])


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


def _snake_case_item_name(original: str) -> str:
    """Generate python enum names from LSP Enum definition names.
    Example:
    * PlainText -> PLAIN_TEXT
    * $import -> IMPORT
    """
    enum_item_name = original
    if enum_item_name.startswith("$"):
        enum_item_name = enum_item_name[1:]
    enum_item_name = re.sub("(.)([A-Z][a-z]+)", r"\1_\2", enum_item_name)
    enum_item_name = re.sub("([a-z0-9])([A-Z])", r"\1_\2", enum_item_name)
    return enum_item_name


def _generate_enum(
    enum_def: model.Enum,
    on_class: ClassGenCallback,
) -> Tuple[List[str], List[str]]:
    """Generates enum class definition using enum specification from the LSP
    model."""
    import_lines = ["import enum"]
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
        name = _snake_case_item_name(item.name).upper()
        value = f'"{item.value}"' if enum_def.type.name == "string" else f"{item.value}"
        doc = _get_indented_documentation(item.documentation, indent)
        item_lines = [
            f"{indent}{name} = {value}",
            f'{indent}"""{doc}"""' if item.documentation else "",
            f"{indent}# Since: {_sanitize_comment(item.since)}" if item.since else "",
            f"{indent}# Proposed: {_sanitize_comment(item.proposed)}"
            if item.proposed
            else "",
        ]

        # Remove unnecessary empty lines.
        code_lines += [code for code in item_lines if len(code) > 0]

    on_class(enum_def.name, False, [])
    return (import_lines, code_lines)


def _generate_properties(
    properties: List[model.Property], indent: str
) -> Tuple[List[str], List[str]]:
    import_lines = []
    code_lines = []
    # sort properties so that you have non-optional properties first then optional properties
    properties = [p for p in properties if not p.optional] + [
        p for p in properties if p.optional
    ]

    for property_def in properties:
        doc = _get_indented_documentation(property_def.documentation, indent)
        validator = _generate_field_validator(property_def.type, property_def.optional)

        type_validator = ""
        if validator:
            import_lines += ["from . import validators"]
            type_validator = f" = {validator}"

        type_name = _generate_type_name(property_def.type)
        if property_def.optional:
            type_name = f"Optional[{type_name}]"

        # make sure that property name is not a python keyword.
        name = property_def.name
        if keyword.iskeyword(name):
            name = f"{name}_"

        prop_lines = [f"{indent}{name}: {type_name}{type_validator}"]
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

    return [], code_lines


def _generate_struct(
    struct_def: model.Structure,
    structs: Dict[str, model.Structure],
    model: model.LSPModel,
    on_class: ClassGenCallback,
) -> Tuple[List[str], List[str]]:
    import_lines = []
    code_lines = []

    # If the name is in this dict then it means it is already defined.
    if struct_def.name in structs:
        return import_lines, code_lines

    # `extends` and `mixins` both are used as classes from which the
    # current class to derive from.
    extends = struct_def.extends or []
    mixins = struct_def.mixins or []

    definitions = [
        t
        for s in extends + mixins
        for t in model.structures
        if t.name == s.name and s.kind == "reference"
    ]
    for d in definitions:
        imports, code = _generate_struct(d, structs, model, on_class)
        import_lines += imports
        code_lines += code
        # ensure there is an empty line between each class entry
        code_lines += [""]

    indent = " " * 4
    doc = _get_indented_documentation(struct_def.documentation, indent)
    import_lines += ["import attrs"]
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
    code_lines += [code for code in class_lines if len(code) > 0] + [""]

    # Inheriting from multiple classes can cause problems especially when using
    # `attrs.define`.
    properties = copy.deepcopy(struct_def.properties)
    for d in definitions:
        properties += copy.deepcopy(d.properties)

    # Ensure that we mark any property as optional if it supports None type.
    # We only need to do this for properties not explicitly marked as optional.
    for p in properties:
        if not p.optional:
            p.optional = _has_null_base_type(p)

    imports, code = _generate_properties(properties, indent)
    import_lines += imports
    code_lines += code

    # If the class has no properties then add `pass`
    if len(properties) == 0:
        code_lines += [f"{indent}pass"]

    # Detect if the class has properties that might be keywords.
    on_class(
        class_name,
        any(keyword.iskeyword(p.name) for p in properties),
        [p.name for p in properties if _has_null_base_type(p)],
    )

    structs[struct_def.name] = "done"
    return import_lines, code_lines


def _to_class_name(lsp_method_name: str) -> str:
    """Convert from LSP method name (e.g., textDocument/didSave) to python
    class name (e.g., TextDocumentDidSave)"""
    name = lsp_method_name[2:] if lsp_method_name.startswith("$/") else lsp_method_name
    name = name.replace("/", "_")
    name = METHOD_NAME_RE_1.sub(r"\1_\2", name)
    name = METHOD_NAME_RE_2.sub(r"\1_\2", name)
    return "".join(part.title() for part in name.split("_"))


def _generate_requests(
    requests: List[model.Request], on_class: ClassGenCallback
) -> Tuple[List[str], List[str]]:
    indent = " " * 4
    import_lines = ["import attrs"]
    code_lines = [
        "@attrs.define",
        f"class ResponseError:",
        f"{indent}code: int = attrs.field(validator=validators.integer_validator)",
        f'{indent}"""A number indicating the error type that occurred."""',
        "",
        f"{indent}message: str = attrs.field(validator=attrs.validators.instance_of(str))",
        f'{indent}"""A string providing a short description of the error."""',
        "",
        f"{indent}data:Optional[LSPAny] = attrs.field(default=None)",
        f'{indent}"""A primitive or structured value that contains additional information',
        f'{indent}about the error. Can be omitted."""',
        "",
        "@attrs.define",
        f"class ResponseErrorMessage:",
        f"{indent}id:Optional[Union[int, str]] = attrs.field(default=None)",
        f'{indent}"""The request id where the error occurred."""',
        f"{indent}error:Optional[ResponseError] = attrs.field(default=None)",
        f'{indent}"""The error object in case a request fails."""',
        f'{indent}jsonrpc: str = attrs.field(default="2.0")',
        "",
    ]
    on_class(f"ResponseErrorMessage", False, ["error", "jsonrpc"])

    for request in requests:
        class_name = _to_class_name(request.method)
        doc = _get_indented_documentation(request.documentation, indent)

        if request.params:
            params_type = _generate_type_name(request.params, f"{class_name}Params")
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

        class_lines = [
            "@attrs.define",
            f"class {class_name}Request:",
            f'{indent}"""{doc}"""' if request.documentation else "",
            f"{indent}id:Union[int, str] = attrs.field()",
            f'{indent}"""The request id."""',
            f"{indent}params: {params_type} ={params_field}",
            f'{indent}method: str = "{request.method}"',
            f'{indent}"""The method to be invoked."""',
            f'{indent}jsonrpc: str = attrs.field(default="2.0")',
            "",
            "@attrs.define",
            f"class {class_name}Response:",
            f"{indent}id:Optional[Union[int, str]] = attrs.field()",
            f'{indent}"""The request id."""',
            f"{indent}result: {result_type} = {result_field}",
            f'{indent}jsonrpc: str = attrs.field(default="2.0")',
            "",
        ]

        on_class(f"{class_name}Request", False, ["method", "jsonrpc"])
        on_class(f"{class_name}Response", False, ["result", "jsonrpc"])

        code_lines += class_lines

    return import_lines, code_lines


def _generate_notifications(
    notifications: List[model.Notification], on_class: ClassGenCallback
) -> Tuple[List[str], List[str]]:
    indent = " " * 4
    import_lines = ["import attrs"]
    code_lines = []

    for notification in notifications:
        class_name = _to_class_name(notification.method)
        doc = _get_indented_documentation(notification.documentation, indent)

        if notification.params:
            params_type = _generate_type_name(notification.params)
            params_field = "attrs.field()"
        else:
            params_type = "Optional[None]"
            params_field = "attrs.field(default=None)"

        class_lines = [
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
            "",
        ]
        on_class(f"{class_name}Notification", False, ["method", "jsonrpc"])

        code_lines += class_lines

    return import_lines, code_lines


def generate_type_aliases(
    model: model.LSPModel,
    on_class: ClassGenCallback,
) -> Tuple[List[str], List[str]]:
    """Generate imports and code for all type alias definitions in LSP
    model."""
    import_lines = []
    code_lines = []

    for type_alias_def in model.typeAliases:
        imports, code = _generate_type_aliases(type_alias_def, on_class)
        import_lines += imports
        code_lines += code
        # ensure there is an empty line between each entry
        code_lines += [""]

    # Remove duplicate imports and ensure there is separation
    import_lines = list(set(import_lines)) + [""]
    return import_lines, code_lines


def generate_enums(
    model: model.LSPModel,
    on_class: ClassGenCallback,
) -> Tuple[List[str], List[str]]:
    import_lines = []
    code_lines = []

    for enum_def in model.enumerations:
        imports, code = _generate_enum(enum_def, on_class)
        import_lines += imports
        code_lines += code
        # ensure there is an empty line between each entry
        code_lines += [""]

    # Remove duplicate imports and ensure there is separation
    import_lines = list(set(import_lines)) + [""]
    return import_lines, code_lines


def generate_structs(
    model: model.LSPModel,
    on_class: ClassGenCallback,
) -> Tuple[List[str], List[str]]:
    import_lines = []
    code_lines = []

    structs = {}
    for struct_def in model.structures:
        imports, code = _generate_struct(struct_def, structs, model, on_class)
        import_lines += imports
        code_lines += code
        # ensure there is an empty line between each entry
        code_lines += [""]

    # Remove duplicate imports and ensure there is separation
    import_lines = list(set(import_lines)) + [""]
    return import_lines, code_lines


def generate_and_types(
    model: model.LSPModel,
    on_class: ClassGenCallback,
) -> Tuple[List[str], List[str]]:
    import_lines = []
    code_lines = []

    # Collect all and types in the model from known locations
    and_types = []
    for request in model.requests:
        if request.params and request.params.kind == "and":
            class_name = f"{_to_class_name(request.method)}Params"
            and_types.append((f"{class_name}", request.params))
        if request.registrationOptions and request.registrationOptions.kind == "and":
            class_name = f"{_to_class_name(request.method)}Options"
            and_types.append((f"{class_name}", request.registrationOptions))

    for notification in model.notifications:
        if notification.params and notification.params.kind == "and":
            class_name = f"{_to_class_name(notification.method)}Params"
            and_types.append((f"{class_name}", notification.params))
        if (
            notification.registrationOptions
            and notification.registrationOptions.kind == "and"
        ):
            class_name = f"{_to_class_name(notification.method)}Options"
            and_types.append((f"{class_name}", notification.registrationOptions))

    for name, type_def in and_types:
        imports, code = _generate_and_type(type_def, name, model.structures, on_class)
        import_lines += imports
        code_lines += code

    # Remove duplicate imports and ensure there is separation
    import_lines = list(set(import_lines)) + [""]
    return import_lines, code_lines


def generate_message_objects(
    model: model.LSPModel,
    on_class: ClassGenCallback,
) -> Tuple[List[str], List[str]]:
    import_lines = []
    code_lines = []

    imports, code = _generate_requests(model.requests, on_class)
    import_lines += imports
    code_lines += code

    imports, code = _generate_notifications(model.notifications, on_class)
    import_lines += imports
    code_lines += code

    code_lines += ["METHOD_TO_TYPES = {"]

    request_classes = []
    response_classes = []
    notification_classes = []

    for request in model.requests:
        class_name = _to_class_name(request.method)

        params_type = None
        if request.params:
            params_type = _generate_type_name(
                request.params, f"{class_name}Params"
            ).strip("\"'")
            on_class(params_type, False, [])

        registration_type = None
        if request.registrationOptions:
            registration_type = _generate_type_name(
                request.registrationOptions, f"{class_name}Options"
            ).strip("\"'")
            on_class(registration_type, False, [])

        request_class = f"{class_name}Request"
        response_class = f"{class_name}Response"
        code_lines += [
            f'"{request.method}": ({request_class}, {response_class}, {params_type}, {registration_type}),'
        ]
        request_classes.append(request_class)
        response_classes.append(response_class)
        on_class(request_class, False, [])
        on_class(response_class, False, [])

    for notification in model.notifications:
        class_name = _to_class_name(notification.method)

        params_type = None
        if notification.params:
            params_type = _generate_type_name(
                notification.params, f"{class_name}Params"
            ).strip("\"'")
            on_class(params_type, False, [])

        registration_type = None
        if notification.registrationOptions:
            registration_type = _generate_type_name(
                notification.registrationOptions, f"{class_name}Options"
            ).strip("\"'")
            on_class(registration_type, False, [])

        notification_class = f"{class_name}Notification"
        code_lines += [
            f'"{notification.method}": ({notification_class}, None, {params_type}, {registration_type}),'
        ]
        notification_classes.append(notification_class)
        on_class(notification_class, False, [])

    code_lines += ["}", ""]

    code_lines += [
        f"REQUESTS =Union[{', '.join(request_classes)}]",
        f"RESPONSES =Union[{', '.join(response_classes)}]",
        f"NOTIFICATIONS =Union[{', '.join(notification_classes)}]",
        f"MESSAGE_TYPES =Union[REQUESTS, RESPONSES, NOTIFICATIONS, ResponseErrorMessage]",
        "",
    ]

    return import_lines, code_lines


def generate_model_types(model: model.LSPModel) -> str:
    header = [
        "# Copyright (c) Microsoft Corporation. All rights reserved.",
        "# Licensed under the MIT License.",
        "",
        "# ****** THIS IS A GENERATED FILE, DO NOT EDIT. ******",
        "# Steps to generate:",
        "# 1. Checkout https://github.com/microsoft/lsprotocol",
        "# 2. Install nox: `python -m pip install nox`",
        "# 3. Run command: `python -m nox --session build_lsp`",
        "",
        "",
        "from typing import Dict, List, Optional, Tuple, Union",
    ]
    all_imports: List[str] = []
    all_code: List[str] = ['__lsp_version__ = "3.17.0"']

    keyword_classes: List[str] = []
    all_classes: List[str] = []
    special_classes: List[str] = []
    special_properties: List[str] = []

    def collect(name: str, is_keyword: bool, properties: List[str]):
        all_classes.append(name)
        if is_keyword:
            keyword_classes.append(name)
        if properties:
            special_classes.append(name)
            special_properties.extend([f"'{name}.{p}'" for p in properties])

    imports, code = generate_enums(model, collect)
    all_imports += imports
    all_code += code

    imports, code = generate_type_aliases(model, collect)
    all_imports += imports
    all_code += code

    imports, code = generate_structs(model, collect)
    all_imports += imports
    all_code += code

    imports, code = generate_and_types(model, collect)
    all_imports += imports
    all_code += code

    imports, code = generate_message_objects(model, collect)
    all_imports += imports
    all_code += code

    # These classes have properties that may be python keywords.
    all_code += [f"_KEYWORD_CLASSES = [{', '.join(keyword_classes)}]"]
    all_code += [
        "def is_keyword_class(cls) -> bool:",
        '    """Returns true if the class has a property that may be python keyword."""',
        "    return any(cls is c for c in _KEYWORD_CLASSES)",
        "",
    ]

    # These are classes that have properties that need special handling
    # during serialization of the class based on LSP.
    # See: https://github.com/microsoft/vscode-languageserver-node/issues/967
    all_code += [f"_SPECIAL_CLASSES = [{', '.join(special_classes)}]"]
    all_code += [
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
    #     * documentSelector property:
    #         When you set `documentSelector` to None in python it has to be preserved when
    #         serializing it. Since the serialized JSON value `{"documentSelector": null}`
    #         means use the Clients document selector. Omitting it might throw error.
    #     * prepareProvider property
    #         This property does NOT need special handling, since omitting it or using
    #         `{"prepareProvider": null}` has the same meaning.
    all_code += [f"_SPECIAL_PROPERTIES = [{', '.join(special_properties)}]"]
    all_code += [
        "def is_special_property(cls, property_name) -> bool:",
        '    """Returns true if the class or its properties require special handling.',
        "    Example:",
        "      Consider RenameRegistrationOptions",
        "        * documentSelector property:",
        "            When you set `documentSelector` to None in python it has to be preserved when",
        '            serializing it. Since the serialized JSON value `{"documentSelector": null}`',
        "            means use the Clients document selector. Omitting it might throw error. ",
        "        * prepareProvider property",
        "            This property does NOT need special handling, since omitting it or using",
        '            `{"prepareProvider": null}` in JSON has the same meaning.',
        '"""',
        '    qualified_name = f"{cls.__name__}.{property_name}"',
        "    return qualified_name in _SPECIAL_PROPERTIES",
        "",
    ]

    all_code += ["", "ALL_TYPES_MAP = {"]
    all_code += [f"'{name}': {name}," for name in all_classes]
    all_code += ["}", ""]
    # Remove duplicate imports and ensure there is separation
    all_imports = list(set([l for l in all_imports if len(l) > 0])) + [""]

    return "\n".join(header + all_imports + all_code)
