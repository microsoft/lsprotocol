# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

import collections
import pathlib
from typing import Dict, List, Optional, OrderedDict, Sequence, Tuple, Union

import generator.plugins.python.utils as pyUtils
import generator.model as model


PACKAGE_NAME = "LSProtocol"
PACKAGE_DIR_NAME = PACKAGE_NAME.lower()

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
        pathlib.Path(output_dir, PACKAGE_DIR_NAME, "src", PACKAGE_DIR_NAME, file_name).write_text(
            code[file_name], encoding="utf-8"
        )

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
            "util.cr": pyUtils.lines_to_str((util_code_lines))
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
        return [f"LSP_VERSION = \"{lsp_model.metaData.version}\""]

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
            [x.method for x in (lsp_model.requests + lsp_model.notifications)] # type: ignore
        )
        code_lines = (
            [""]
            + sorted([f"{pyUtils._snake_case_item_name(m).upper()} = \"{m}\"" for m in methods])
            + [""]
        )
        code_lines += [
            "METHOD_TO_TYPES = {",
            "    # Requests"
        ]

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
                f"\"{request.method}\": {{\n{request_class}, {response_class}, {params_type}, {registration_type}\n}},"
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
                f"\"{notification.method}\": {{\n{notification_class}, Nil, {params_type}, {registration_type}\n}},"
            ]

        code_lines += sorted(notify_types)
        code_lines += ["}\n"]

        code_lines += [
            f"alias Request = {' | '.join(sorted(request_classes))}\n",
            f"alias Response = {' | '.join(sorted(response_classes))}\n",
            f"alias Notification = {' | '.join(sorted(notification_classes))}\n",
            "alias Message = Request | Response | Notification | ResponseErrorMessage | ResponseMessage\n",
            f"REQUESTS = [\n{',\n '.join(sorted(request_classes))}\n]\n",
            f"RESPONSES = [\n{',\n '.join(sorted(response_classes))}\n]\n",
            f"NOTIFICATIONS = [\n{',\n '.join(sorted(notification_classes))}\n]\n",
            f"MESSAGE_TYPES = REQUESTS + RESPONSES + NOTIFICATIONS + [ResponseErrorMessage, ResponseMessage]",
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
                f'\"{n.method}\": MessageDirection.parse("{n.messageDirection}"),'
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

    def _add_enum(self, enum_def: model.Enum):
        code_lines = []
        indent = " " * 2

        if enum_def.documentation:
            code_lines += [
                f"# {enum_def.documentation.replace("\n", "\n# ")}"
            ]

        if enum_def.since:
            code_lines += [
                f"# Since: #{enum_def.since}"
            ]

        if enum_def.proposed:
            code_lines += [
                "# Proposed"
            ]

        if enum_def.type.name == "string":
            mappings = []
            for item in enum_def.values:
                if item.name.lower() == item.value.lower(): # type: ignore
                    continue
                mappings.append(item)

            if len(mappings) > 0:
                code_lines += [f"Enum.string {enum_def.name}, mappings: {{",]

                for item in mappings:
                    code_lines += [
                        f" {pyUtils._capitalized_item_name(item.name)}: \"{item.value}\","
                    ]

                code_lines += ["} do"]
            else:
                code_lines += [f"Enum.string {enum_def.name} do",]

        else:
            code_lines += [
                f"Enum.number {enum_def.name} do"
            ]

        for item in enum_def.values:
            item_lines = []

            name = pyUtils._capitalized_item_name(item.name)
            value = item.value
            doc = None

            if item.documentation:
                doc = f"# {item.documentation.replace("\n", "\n  # ") if item.documentation else ""}"
                item_lines += [doc]


            if item.since:
                code_lines += [
                    f"  # Since: #{item.since}"
                ]

            if item.proposed:
                code_lines += [
                    "  # Proposed"
                ]

            if enum_def.type.name == "string":
                item_lines += [f"  {name}"]
            else:
                item_lines += [f"  {name} = {value}"]

            code_lines += item_lines

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
            code_lines += [
                f"# {type_alias.documentation.replace("\n", "\n# ")}"
            ]

        if type_alias.since:
            code_lines += [
                f"# Since: #{type_alias.since}"
            ]

        if type_alias.proposed:
            code_lines += [
                "# Proposed"
            ]

        code_lines += [
            f"alias {type_alias.name} = {type_name}"
        ]

        self._add_type_code(type_alias.name, code_lines)

    def _add_structures(self, lsp_model: model.LSPModel) -> None:
        for struct_def in lsp_model.structures:
            self._add_structure(struct_def, lsp_model)

    def _add_structure(
        self,
        struct_def: model.Structure,
        lsp_model: model.LSPModel
    ) -> None:
        if self._has_type(struct_def.name):
            return

        definitions = self._get_dependent_types(struct_def, lsp_model)
        for d in definitions:
            self._add_structure(d, lsp_model)

        code_lines = []

        if struct_def.documentation:
            code_lines += [
                f"# {struct_def.documentation.replace("\n", "\n# ")}"
            ]

        if struct_def.since:
            code_lines += [
                f"# Since: #{struct_def.since}"
            ]

        if struct_def.proposed:
            code_lines += [
                "# Proposed"
            ]

        code_lines += [f"class {struct_def.name.strip("_")}"]
        code_lines += [f"  include JSON::Serializable"]
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
            self._add_and_type(type_def, name, lsp_model.structures) # type: ignore

    def _add_and_type(
        self,
        type_def: model.LSP_TYPE_SPEC,
        class_name: str,
        structures: List[model.Structure]
    ) -> None:
        if type_def.kind != "and":
            raise ValueError("Only `and` type code generation is supported")

        code_lines = []

        code_lines += [f"class {class_name.strip("_")}"]
        code_lines += [f"  include JSON::Serializable"]

        properties = []
        for item in type_def.items: # type: ignore
            if item.kind == "reference":
                for structure in structures:
                    if structure.name == item.name: # type: ignore
                        properties += structure.properties
            else:
                raise ValueError("Only `reference` types are supported for `and` type generation.")

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
                "  property code : Int32",
                "  # A string providing a short description of the error.",
                "  property message : String",
                "  # A primitive or structured value that contains additional information about the error. Can be omitted.",
                "  property data : LSPAny?",
                "",
                "  def initialize(@code : Int32, @message : String, @data : LSPAny? = nil)",
                "  end",
                "end"
            ]
        )

        self._add_type_code(
            "ResponseErrorMessage",
            [
                "class ResponseErrorMessage",
                "  include JSON::Serializable",
                "",
                "  property jsonrpc : String = \"2.0\"",
                "  # The request id where the error occurred.",
                "  property id : Int32 | String",
                "  # The error object in case a request fails.",
                "  property error : ResponseError?",
                "",
                "  def initialize(@id : Int32 | String, @error : ResponseError? = nil)",
                "  end",
                "end"
            ]
        )

        self._add_type_code(
            "ResponseMessage",
            [
                "class ResponseMessage",
                "  include JSON::Serializable",
                "",
                "  property jsonrpc : String = \"2.0\"",
                "  # The request id where the error occurred.",
                "  property id : Int32 | String",
                "  # The error object in case a request fails.",
                "  @[JSON::Field(emit_null: true)]",
                "  property result : JSON::Any?",
                "",
                "  def initialize(@id : Int32 | String, @result : JSON::Any? = nil)",
                "  end",
                "end"
            ]
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
                            "name": request.params.name # type: ignore
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
                request.result.kind == "base" and request.result.name == "null" # type: ignore
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
                f"# {request.documentation.replace("\n", "\n# ") if request.documentation else ""}",
                f"class {class_name}Request",
                "  include JSON::Serializable",
                "",
                "  # The request id.",
                "  property id : Int32 | String",
                f"  property params : {params_type}",
                "  # The method to be invoked.",
                f"  property method : String = \"{request.method}\"",
                "  property jsonrpc : String = \"2.0\"",
                "",
                f"  def initialize(@id : Int32 | String, @params : {params_type})",
                "  end",
                "end"
            ]
        )

        self._add_type_code(
            f"{class_name}Response",
            [
                f"class {class_name}Response",
                "  include JSON::Serializable",
                "",
                "  # The request id.",
                "  property id : Int32 | String?",
                f"  property result : {result_type}",
                "  property jsonrpc : String = \"2.0\"",
                "",
                f"  def initialize(@id : Int32 | String, @result : {result_type})",
                "  end",
                "end"
            ]
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
                f"# {notification.documentation.replace("\n", "\n# ") if notification.documentation else ""}",
                f"class {class_name}Notification",
                "  include JSON::Serializable",
                "",
                "  property id : Int32 | String | Nil",
                f"  property params : {params_type}",
                "  # The method to be invoked.",
                f"  property method : String = \"{notification.method}\"",
                "  property jsonrpc : String = \"2.0\"",
                "",
                f"  def initialize(@params : {params_type})",
                "  end",
                "end"
            ],
        )

    def _add_lsp_method_type(self, lsp_model: model.LSPModel) -> None:
        code_lines = []
        directions: set[str] = set([
            x.messageDirection for x in (lsp_model.requests + lsp_model.notifications) # type: ignore
        ])

        code_lines += [f"Enum.string MessageDirection do",]

        for item in directions:
            code_lines += [f"  {pyUtils._capitalized_item_name(item)}"]

        code_lines += ["end"]

        self._add_type_code("MessageDirection", code_lines)

    def _has_type(self, type_name: str) -> bool:
        if type_name.startswith(('"', "'")):
            type_name = type_name[1:-1]
        return type_name in self._types

    def _generate_properties(self, properties):
        properties = list({x.name: x for x in properties}.values())

        code_lines = []
        for p in properties:
            if p.name != pyUtils._to_snake_case(p.name):
                code_lines += [
                    f"\n  @[JSON::Field(key: \"{p.name}\")]"
                ]

            code_lines += [
                f"  property {pyUtils._to_snake_case(p.name)} : {self._generate_type_name(p.type)}{"?" if p.optional else ""}"
            ]

        code_lines += ["  def initialize("]

        for p in [p for p in properties if not p.optional]:
            code_lines += [
                f"    @{pyUtils._to_snake_case(p.name)} : {self._generate_type_name(p.type)},"
            ]

        for p in [p for p in properties if p.optional]:
            code_lines += [
                f"    @{pyUtils._to_snake_case(p.name)} : {self._generate_type_name(p.type)}? = nil,"
            ]

        code_lines += [
            "  )",
            "  end"
        ]

        return code_lines

    def _get_dependent_types(
        self,
        struct_def: model.Structure,
        lsp_model: model.LSPModel
    ) -> List[model.Structure]:
        definitions: List[model.Structure] = []

        includes = (struct_def.extends or []) + (struct_def.mixins or []) # type: ignore
        for inc in includes:
            for struct in lsp_model.structures:
                if struct.name == inc.name and inc.kind == "reference": # type: ignore
                    definitions.append(struct)
                    definitions.extend(self._get_dependent_types(struct, lsp_model))

        definitions = list({x.name: x for x in definitions}.values())

        return definitions

    def _generate_type_name(
        self,
        type_def: model.LSP_TYPE_SPEC,
        class_name: Optional[str] = None,
        prefix: str = ""
    ) -> str:
        # if type_def.kind ==

        if type_def.kind == "stringLiteral":
            return "String"

        if type_def.kind == "literal":
            return "JSON::Any?"

        if type_def.kind == "reference":
            custom_val = self._get_custom_value_type(type_def.name) # type: ignore
            if custom_val:
                return f"{type_def.name} | {custom_val}" # type: ignore

            return type_def.name # type: ignore

        if type_def.kind == "array":
            return f"Array({self._generate_type_name(type_def.element, class_name, prefix)})" # type: ignore

        if type_def.kind == "or":
            types = []
            for item in type_def.items: # type: ignore
                types.append(self._generate_type_name(item, class_name, prefix))
            return f"{' | '.join(types)}"

        if type_def.kind == "and":
            if not class_name:
                raise ValueError(str(type_def))
            return class_name

        if type_def.kind == "base":
            if type_def.name == "decimal": # type: ignore
                return "Float32"
            elif type_def.name == "boolean": # type: ignore
                return "Bool"
            elif type_def.name == "integer": # type: ignore
                return "Int32"
            elif type_def.name == "uinteger": # type: ignore
                return "UInt32"
            elif type_def.name in ["string", "DocumentUri", "URI"]: # type: ignore
                return "String"
            elif type_def.name == "null": # type: ignore
                return "Nil"
            else:
                raise ValueError(str(type_def))

        if type_def.kind == "map":
            return f"Hash({self._generate_type_name(type_def.key, class_name, prefix)}, {self._generate_type_name(type_def.value, class_name, prefix)})" # type: ignore

        if type_def.kind == "tuple":
            types = []
            for item in type_def.items: # type: ignore
                types.append(self._generate_type_name(item, class_name, prefix))
            return f"Tuple({' | '.join(types)})"

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
