# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

import collections
import pathlib
import re
from typing import Dict, List, Optional, OrderedDict

import generator.model as model
import generator.plugins.python.utils as pyUtils

PACKAGE_NAME = "LSProtocol"
PACKAGE_DIR_NAME = PACKAGE_NAME.lower()

BASIC_LINK_RE = re.compile(r"{@link +(\w+) ([\w ]+)}")
BASIC_LINK_RE2 = re.compile(r"{@link +(\w+)\.(\w+) ([\w \.`]+)}")
BASIC_LINK_RE3 = re.compile(r"{@link +(\w+)}")
BASIC_LINK_RE4 = re.compile(r"{@link +(\w+)\.(\w+)}")
BASIC_LINK_RE5 = re.compile(r"{@link +(\w+) (\w+)\[\]}")
BASIC_LINK_RE6 = re.compile(r"{@linkcode +(\w+)\.(\w+)}")

# These are special type aliases to preserve backward compatibility.
CUSTOM_REQUEST_PARAMS_ALIASES = []


def generate_from_spec(spec: model.LSPModel, output_dir: str, test_dir: str) -> None:
    """Generate the code for the given spec."""
    # key is the relative path to the file, value is the content
    code: Dict[str, str] = TypesCodeGenerator(spec).get_code()

    output_path = pathlib.Path(output_dir, PACKAGE_DIR_NAME, "src")
    if not output_path.exists():
        output_path.mkdir(parents=True, exist_ok=True)

    for file_name in code:
        pathlib.Path(
            output_dir, PACKAGE_DIR_NAME, "src", PACKAGE_DIR_NAME, file_name
        ).write_text(code[file_name], encoding="utf-8")


class TypesCodeGenerator:
    def __init__(self, lsp_model: model.LSPModel) -> None:
        self._lsp_model = lsp_model
        self._reset()

    def get_code(self) -> Dict[str, str]:
        self._reset()
        self._generate_code(self._lsp_model)

        code_lines = (
            self._get_header()
            + [f"module {PACKAGE_NAME}"]
            + self._get_meta_data(self._lsp_model)
            + self._get_types_code()
            + ["end"]
        )

        util_code_lines = (
            self._get_header()
            + [f"module {PACKAGE_NAME}"]
            + self._get_utility_code(self._lsp_model)
            + ["end"]
        )

        return {
            "types.cr": pyUtils.lines_to_str(code_lines),
            "util.cr": pyUtils.lines_to_str((util_code_lines)),
        }

    def _reset(self):
        self._types: OrderedDict[str, List[str]] = collections.OrderedDict()

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

    def _get_meta_data(self, lsp_model: model.LSPModel) -> List[str]:
        return [f'LSP_VERSION = "{lsp_model.metaData.version}"']

    def _get_types_code(self) -> List[str]:
        code_lines = []
        for v in self._types.values():
            code_lines.extend(v)
            # Add blank lines between types
            code_lines.extend(["", ""])

        return code_lines

    def _get_utility_code(self, lsp_model: model.LSPModel) -> List[str]:
        code_lines = []

        request_classes = []
        response_classes = []
        notification_classes = []

        methods = set(
            [
                x.method
                for x in (list(lsp_model.requests) + list(lsp_model.notifications))
            ]
        )
        code_lines = (
            [""]
            + sorted(
                [f'{pyUtils._snake_case_item_name(m).upper()} = "{m}"' for m in methods]
            )
            + [""]
        )
        code_lines += ["METHOD_TO_TYPES = {", "    # Requests"]

        request_types = []
        for request in lsp_model.requests:
            class_name = pyUtils._to_class_name(request.method)
            request_class = f"{class_name}Request"
            response_class = f"{class_name}Response"

            request_classes.append(request_class)
            response_classes.append(response_class)

            params_type = None
            if request.params:
                params_type = self._generate_type_name(
                    request.params, f"{class_name}Params"
                ).strip("\"'")
            else:
                params_type = "Nil"

            registration_type = None
            if request.registrationOptions:
                registration_type = self._generate_type_name(
                    request.registrationOptions, f"{class_name}Options"
                ).strip("\"'")
            else:
                registration_type = "Nil"

            request_types += [
                f'"{request.method}": {{\n{request_class}, {response_class}, {params_type}, {registration_type}\n}},'
            ]

        code_lines += sorted(request_types)
        code_lines += ["    # Notifications"]

        notify_types = []
        for notification in lsp_model.notifications:
            class_name = pyUtils._to_class_name(notification.method)
            notification_class = f"{class_name}Notification"
            notification_classes.append(notification_class)

            params_type = None
            if notification.params:
                params_type = self._generate_type_name(
                    notification.params, f"{class_name}Params"
                ).strip("\"'")
            else:
                params_type = "Nil"

            registration_type = None
            if notification.registrationOptions:
                registration_type = self._generate_type_name(
                    notification.registrationOptions, f"{class_name}Options"
                ).strip("\"'")
            else:
                registration_type = "Nil"

            notify_types += [
                f'"{notification.method}": {{\n{notification_class}, Nil, {params_type}, {registration_type}\n}},'
            ]

        code_lines += sorted(notify_types)
        code_lines += ["}\n"]

        code_lines += [
            "STRING_TO_TYPES = {\n  ",
            "\n  ".join(
                [
                    f'"{t}" => {t},'
                    for t in request_classes + response_classes + notification_classes
                ]
            ),
            "}",
        ]

        code_lines += [
            f"alias Request = {' | '.join(sorted(request_classes))}\n",
            f"alias Response = {' | '.join(sorted(response_classes))}\n",
            f"alias Notification = {' | '.join(sorted(notification_classes))}\n",
            "alias Message = Request | Response | Notification | ResponseErrorMessage | ResponseMessage\n",
            f"REQUESTS = [\n{',\n '.join(sorted(request_classes))}\n]\n",
            f"RESPONSES = [\n{',\n '.join(sorted(response_classes))}\n]\n",
            f"NOTIFICATIONS = [\n{',\n '.join(sorted(notification_classes))}\n]\n",
            "MESSAGE_TYPES = REQUESTS + RESPONSES + NOTIFICATIONS + [ResponseErrorMessage, ResponseMessage]",
            "",
        ]

        # code_lines += ["", "ALL_TYPES_MAP = {"]
        # code_lines += sorted([f"\"{name}\": {name}," for name in set(self._types.keys())])
        # code_lines += ["}", ""]

        code_lines += ["MESSAGE_DIRECTION = {"]

        code_lines += ["  # Request methods"]
        code_lines += sorted(
            [
                f'"{r.method}": MessageDirection.parse("{r.messageDirection}"),'
                for r in lsp_model.requests
            ]
        )
        code_lines += ["# Notification methods"]
        code_lines += sorted(
            [
                f'"{n.method}": MessageDirection.parse("{n.messageDirection}"),'
                for n in lsp_model.notifications
            ]
        )

        code_lines += ["}", ""]

        return code_lines

    def _generate_code(self, lsp_model: model.LSPModel) -> None:
        self._add_structures(lsp_model)
        self._add_enums(lsp_model)
        self._add_type_aliases(lsp_model)
        self._add_and_types(lsp_model)
        self._add_requests(lsp_model)
        self._add_notifications(lsp_model)
        self._add_lsp_method_type(lsp_model)

    def _add_enums(self, lsp_model: model.LSPModel) -> None:
        for enum_def in lsp_model.enumerations:
            self._add_enum(enum_def)

    def _add_enum(self, enum_def: model.Enum) -> None:
        code_lines = []

        if enum_def.documentation:
            code_lines += [f"# {self._process_docs(enum_def.documentation)}"]

        code_lines += [f"enum {enum_def.name}"]
        mappings = []

        for item in enum_def.values:
            if (
                enum_def.type.name == "string"
                and item.name.lower() != str(item.value).lower()
            ):
                mappings.append(item)

            name = pyUtils._capitalized_item_name(item.name)

            if item.documentation:
                code_lines += [f"\n# {self._process_docs(item.documentation)}"]

            if enum_def.type.name == "string":
                code_lines += [f"  {name}"]
            else:
                code_lines += [f"  {name} = {item.value}"]

        if enum_def.type.name == "string":
            code_lines += self._string_enum_methods(mappings)
        else:
            code_lines += self._num_enum_methods()

        code_lines += ["end"]

        self._add_type_code(enum_def.name, code_lines)

    def _add_type_aliases(self, lsp_model: model.LSPModel) -> None:
        for type_alias in lsp_model.typeAliases:
            self._add_type_alias(type_alias)

    def _add_type_alias(self, type_alias):
        code_lines = []

        if type_alias.name in ["LSPAny", "LSPObject"]:
            type_name = "JSON::Any?"
        else:
            type_name = self._generate_type_name(type_alias.type)

        if type_alias.documentation:
            code_lines += [f"# {self._process_docs(type_alias.documentation)}"]

        code_lines += [f"alias {type_alias.name} = {type_name}"]

        self._add_type_code(type_alias.name, code_lines)

    def _add_structures(self, lsp_model: model.LSPModel) -> None:
        for struct_def in lsp_model.structures:
            self._add_structure(struct_def, lsp_model)

    def _add_structure(
        self, struct_def: model.Structure, lsp_model: model.LSPModel
    ) -> None:
        if self._has_type(struct_def.name):
            return

        definitions = self._get_dependent_types(struct_def, lsp_model)
        for d in definitions:
            self._add_structure(d, lsp_model)

        code_lines = []

        if struct_def.documentation:
            code_lines += [f"# {self._process_docs(struct_def.documentation)}"]

        struct_name = struct_def.name
        if struct_name.startswith("_"):
            struct_name = struct_name[1:] + "Private"

        code_lines += [f"class {struct_name}"]
        code_lines += ["  include JSON::Serializable"]
        code_lines += [""]

        properties = []

        for d in definitions:
            properties.extend(d.properties)

        properties.extend(struct_def.properties)

        properties = sorted(properties, key=lambda x: x.name)

        code_lines += self._generate_properties(properties)
        code_lines += ["end"]

        self._add_type_code(struct_def.name, code_lines)

    def _add_type_code(self, type_name: str, code: List[str]) -> None:
        if not self._has_type(type_name):
            self._types[type_name] = code
            self._types.move_to_end(type_name)

    def _add_and_types(self, lsp_model: model.LSPModel):
        and_types = []
        for request in lsp_model.requests:
            if request.params:
                if request.params.kind == "and":
                    class_name = f"{pyUtils._to_class_name(request.method)}Params"
                    and_types.append((class_name, request.params))

            if request.registrationOptions:
                if request.registrationOptions.kind == "and":
                    class_name = f"{pyUtils._to_class_name(request.method)}Options"
                    and_types.append((class_name, request.registrationOptions))

        for notification in lsp_model.notifications:
            if notification.params:
                if notification.params.kind == "and":
                    class_name = f"{pyUtils._to_class_name(notification.method)}Params"
                    and_types.append((class_name, notification.params))

            if notification.registrationOptions:
                if notification.registrationOptions.kind == "and":
                    class_name = f"{pyUtils._to_class_name(notification.method)}Options"
                    and_types.append((class_name, notification.registrationOptions))

        for name, type_def in and_types:
            self._add_and_type(type_def, name, list(lsp_model.structures))

    def _add_and_type(
        self,
        type_def: model.LSP_TYPE_SPEC,
        class_name: str,
        structures: List[model.Structure],
    ) -> None:
        if type_def.kind != "and":
            raise ValueError("Only `and` type code generation is supported")

        code_lines = []

        if class_name.startswith("_"):
            class_name = class_name[1:] + "Private"

        code_lines += [f"class {class_name}"]
        code_lines += ["  include JSON::Serializable"]

        properties = []
        for item in type_def.items:  # type: ignore
            if item.kind == "reference":
                for structure in structures:
                    if structure.name == item.name:  # type: ignore
                        properties += structure.properties
            else:
                raise ValueError(
                    "Only `reference` types are supported for `and` type generation."
                )

        code_lines += self._generate_properties(properties)
        code_lines += ["end"]

        self._add_type_code(class_name, code_lines)

    def _add_requests(self, lsp_mode: model.LSPModel) -> None:
        self._add_type_code(
            "ResponseError",
            [
                "class ResponseError",
                "  include JSON::Serializable",
                "",
                "  # A number indicating the error type that occurred.",
                "  getter code : Int32",
                "  # A string providing a short description of the error.",
                "  getter message : String",
                "  # A primitive or structured value that contains additional information about the error. Can be omitted.",
                "  getter data : LSPAny?",
                "",
                "  def initialize(@code : Int32, @message : String, @data : LSPAny? = nil)",
                "  end",
                "end",
            ],
        )

        self._add_type_code(
            "ResponseErrorMessage",
            [
                "class ResponseErrorMessage",
                "  include JSON::Serializable",
                "",
                '  getter jsonrpc : String = "2.0"',
                "",
                "  # The request id where the error occurred.",
                "  getter id : Int32 | String",
                "",
                "  # The error object in case a request fails.",
                "  getter error : ResponseError?",
                "",
                "  def initialize(@id : Int32 | String, @error : ResponseError? = nil)",
                "  end",
                "end",
            ],
        )

        self._add_type_code(
            "ResponseMessage",
            [
                "class ResponseMessage",
                "  include JSON::Serializable",
                "",
                '  getter jsonrpc : String = "2.0"',
                "",
                "  # The request id where the error occurred.",
                "  getter id : Int32 | String",
                "  # The error object in case a request fails.",
                "",
                "  @[JSON::Field(emit_null: true)]",
                "  getter result : JSON::Any?",
                "",
                "  def initialize(@id : Int32 | String, @result : JSON::Any? = nil)",
                "  end",
                "end",
            ],
        )

        for request in lsp_mode.requests:
            self._add_request(request)

    def _add_request(self, request: model.Request):
        class_name = pyUtils._to_class_name(request.method)

        if request.params:
            if (
                request.params.kind == "reference"
                and f"{class_name}Params" in CUSTOM_REQUEST_PARAMS_ALIASES
            ):
                params_type = f"{class_name}Params"

                self._add_type_alias(
                    model.TypeAlias(
                        name=params_type,
                        type={
                            "kind": "reference",
                            "name": request.params.name,  # type: ignore
                        },
                    )
                )
            else:
                params_type = self._generate_type_name(
                    request.params, f"{class_name}Params"
                )
            if not self._has_type(params_type):
                raise ValueError(f"{class_name}Params type definition is missing.")
        else:
            params_type = "Nil"

        result_type = None
        if request.result:
            if request.result.kind == "reference" or (
                request.result.kind == "base" and request.result.name == "null"  # type: ignore
            ):
                result_type = self._generate_type_name(request.result)
            else:
                result_type = f"{class_name}Result"
                self._add_type_alias(
                    model.TypeAlias(
                        name=result_type,
                        type=request.result,
                    )
                )

        else:
            params_type = "Nil"

        self._add_type_code(
            f"{class_name}Request",
            [
                f"# {self._process_docs(request.documentation) if request.documentation else ""}",
                f"class {class_name}Request",
                "  include JSON::Serializable",
                "",
                "  # The request id.",
                "  getter id : Int32 | String",
                "",
                f"  getter params : {params_type}",
                "",
                "  # The method to be invoked.",
                f'  getter method : String = "{request.method}"',
                "",
                '  getter jsonrpc : String = "2.0"',
                "",
                f"  def initialize(@id : Int32 | String, @params : {params_type})",
                "  end",
                "end",
            ],
        )

        self._add_type_code(
            f"{class_name}Response",
            [
                f"class {class_name}Response",
                "  include JSON::Serializable",
                "",
                "  # The request id.",
                "  getter id : Int32 | String?",
                f"  getter result : {result_type}",
                '  getter jsonrpc : String = "2.0"',
                "",
                f"  def initialize(@id : Int32 | String, @result : {result_type})",
                "  end",
                "end",
            ],
        )

    def _add_notifications(self, lsp_model: model.LSPModel) -> None:
        for notification in lsp_model.notifications:
            self._add_notification(notification)

    def _add_notification(self, notification: model.Notification) -> None:
        class_name = pyUtils._to_class_name(notification.method)

        if notification.params:
            params_type = self._generate_type_name(
                notification.params, f"{class_name}Params"
            )
            if not self._has_type(params_type):
                raise ValueError(f"{class_name}Params type definition is missing.")
        else:
            params_type = "Nil"

        self._add_type_code(
            f"{class_name}Notification",
            [
                f"# {self._process_docs(notification.documentation) if notification.documentation else ""}",
                f"class {class_name}Notification",
                "  include JSON::Serializable",
                "",
                "  getter id : Int32 | String?",
                f"  getter params : {params_type}",
                "  # The method to be invoked.",
                f'  getter method : String = "{notification.method}"',
                '  getter jsonrpc : String = "2.0"',
                "",
                f"  def initialize(@params : {params_type})",
                "  end",
                "end",
            ],
        )

    def _add_lsp_method_type(self, lsp_model: model.LSPModel) -> None:
        code_lines = []
        directions: set[str] = set(
            [
                x.messageDirection
                for x in (list(lsp_model.requests) + list(lsp_model.notifications))
            ]
        )

        mappings: list[model.EnumItem] = [
            model.EnumItem(x, x) for x in sorted(directions)
        ]

        code_lines += [
            "enum MessageDirection",
        ]

        for item in sorted(directions):
            code_lines += [f"  {pyUtils._capitalized_item_name(item)}"]

        code_lines += self._string_enum_methods(mappings)

        code_lines += ["end"]

        self._add_type_code("MessageDirection", code_lines)

    def _has_type(self, type_name: str) -> bool:
        if type_name.startswith(('"', "'")):
            type_name = type_name[1:-1]
        return type_name in self._types

    def _generate_properties(self, properties: List[model.Property]) -> List[str]:
        properties = list({x.name: x for x in properties}.values())

        code_lines = []
        for p in properties:
            code_lines += ["\n"]

            if p.documentation:
                code_lines += [f"# {self._process_docs(p.documentation)}"]

            if p.name != pyUtils._to_snake_case(p.name):
                code_lines += [f'  @[JSON::Field(key: "{p.name}")]']

            type_name = self._generate_type_name(p.type)
            question = p.optional and not type_name == "Nil"

            if type_name.endswith("| Nil"):
                type_name = type_name.rstrip("| Nil")
                question = True
            elif type_name.startswith("Nil |"):
                type_name = type_name.lstrip("Nil |")
                question = True

            code_lines += [
                f"  getter {pyUtils._to_snake_case(p.name)} : {type_name}{"?" if question else ""}"
            ]

        code_lines += ["  def initialize("]

        for p in [p for p in properties if not p.optional]:
            type_name = self._generate_type_name(p.type)
            question = not type_name == "Nil"

            if type_name.endswith("| Nil"):
                type_name = type_name.rstrip("| Nil")
                question = True
            elif type_name.startswith("Nil |"):
                type_name = type_name.lstrip("Nil |")
                question = True

            code_lines += [
                f"    @{pyUtils._to_snake_case(p.name)} : {type_name}{"?" if question else ""},"
            ]

        for p in [p for p in properties if p.optional]:
            type_name = self._generate_type_name(p.type)

            if type_name.endswith("| Nil"):
                type_name = type_name.rstrip("| Nil")
                question = True
            elif type_name.startswith("Nil |"):
                type_name = type_name.lstrip("Nil |")
                question = True

            code_lines += [
                f"    @{pyUtils._to_snake_case(p.name)} : {type_name}? = nil,"
            ]

        code_lines += ["  )", "  end"]

        return code_lines

    def _get_dependent_types(
        self, struct_def: model.Structure, lsp_model: model.LSPModel
    ) -> List[model.Structure]:
        definitions: List[model.Structure] = []

        includes = list(struct_def.extends or []) + list(struct_def.mixins or [])
        for inc in includes:
            for struct in lsp_model.structures:
                if struct.name == inc.name and inc.kind == "reference":  # type: ignore
                    definitions.append(struct)
                    definitions.extend(self._get_dependent_types(struct, lsp_model))

        definitions = list({x.name: x for x in definitions}.values())

        return definitions

    def _generate_type_name(
        self,
        type_def: model.LSP_TYPE_SPEC,
        class_name: Optional[str] = None,
        prefix: str = "",
    ) -> str:
        if type_def.kind == "stringLiteral":
            return "String"

        if type_def.kind == "literal":
            return "JSON::Any?"

        if type_def.kind == "reference":
            custom_val = self._get_custom_value_type(type_def.name)  # type: ignore
            if custom_val:
                return f"{type_def.name} | {custom_val}"  # type: ignore

            return type_def.name  # type: ignore

        if type_def.kind == "array":
            return f"Array({self._generate_type_name(type_def.element, class_name, prefix)})"  # type: ignore

        if type_def.kind == "or":
            types = []
            for item in type_def.items:  # type: ignore
                types.append(self._generate_type_name(item, class_name, prefix))
            return f"{' | '.join(sorted(set(types)))}"

        if type_def.kind == "and":
            if not class_name:
                raise ValueError(str(type_def))
            return class_name

        if type_def.kind == "base":
            if type_def.name == "decimal":  # type: ignore
                return "Float32"
            elif type_def.name == "boolean":  # type: ignore
                return "Bool"
            elif type_def.name == "integer":  # type: ignore
                return "Int32"
            elif type_def.name == "uinteger":  # type: ignore
                return "UInt32"
            elif type_def.name in ["string"]:  # type: ignore
                return "String"
            elif type_def.name in ["DocumentUri", "URI"]:  # type: ignore
                return "URI"
            elif type_def.name == "null":  # type: ignore
                return "Nil"
            else:
                raise ValueError(str(type_def))

        if type_def.kind == "map":
            return f"Hash({self._generate_type_name(type_def.key, class_name, prefix)}, {self._generate_type_name(type_def.value, class_name, prefix)})"  # type: ignore

        if type_def.kind == "tuple":
            types = []
            for item in type_def.items:  # type: ignore
                types.append(self._generate_type_name(item, class_name, prefix))
            return f"Array({' | '.join(sorted(set(types)))})"

        raise ValueError(str(type_def))

    def _get_custom_value_type(self, ref_name: str) -> Optional[str]:
        """Returns the custom supported type."""
        try:
            enum_def = [e for e in self._lsp_model.enumerations if e.name == ref_name][
                0
            ]
        except IndexError:
            enum_def = None
        if enum_def and enum_def.supportsCustomValues:
            if enum_def.type.name == "string":
                return "String"
            if enum_def.type.name == "integer":
                return "Int32"
            if enum_def.type.name == "uinteger":
                return "UInt32"
        return None

    def _process_docs(self, docs: str) -> str:
        docs = BASIC_LINK_RE.sub(r"`\1`", docs)
        docs = BASIC_LINK_RE2.sub(r"`\1#\2`", docs)
        docs = BASIC_LINK_RE3.sub(r"`\1`", docs)
        docs = BASIC_LINK_RE4.sub(r"`\1#\2`", docs)
        docs = BASIC_LINK_RE5.sub(r"`Array(\2)`", docs)
        docs = BASIC_LINK_RE6.sub(r"`\1#\2`", docs)
        return docs.replace("\n", "\n# ").strip()

    def _string_enum_methods(self, mappings: List[model.EnumItem]) -> List[str]:
        code_lines = [
            """\

                def self.new(pull : JSON::PullParser) : self
                    self.from_json(pull)
                end

                def self.from_json(pull : JSON::PullParser) : self
                    case pull.kind
                    when .int?
                    from_value(pull.read_int)
                    when .string?
                    parse(pull.read_string)
                    else
                        {% if @type.annotation(Flags) %}
                            pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
                        {% else %}
                            pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
                        {% end %}
                    end
                end

                def to_json(builder : JSON::Builder)
                    builder.string self.to_s
                end

                def to_s(io : IO) : Nil
                    io << self.to_s
                end
            """
        ]

        if len(mappings) > 0:
            code_lines += [
                "\n  def self.parse(string : String) : self",
                "    case string",
                "\n".join(
                    [
                        f'  when "{item.value}"\n  return self.new({pyUtils._capitalized_item_name(item.name)})'
                        for item in mappings
                    ]
                ),
                "    end",
                "",
                "    super",
                "  end",
            ]

            code_lines += [
                "\n  def to_s : String",
                "    case self",
                "\n".join(
                    [
                        f'  when {pyUtils._capitalized_item_name(item.name)}\n  return "{item.value}"'
                        for item in mappings
                    ]
                ),
                "    end",
                "",
                "    super",
                "  end",
            ]

        return code_lines

    def _num_enum_methods(self) -> List[str]:
        return [
            """\
            def self.new(pull : JSON::PullParser) : self
                self.from_json(pull)
            end

            def self.from_json(pull : JSON::PullParser) : self
                self.from_value?(pull.read_int) || pull.raise "Unknown enum #{self} value: #{pull.int_value}"
            end

            def to_json(json : JSON::Builder)
                json.number(value)
            end
            """
        ]
