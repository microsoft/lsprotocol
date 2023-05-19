# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

from typing import Dict, List, Optional, Tuple, Union

import cattrs

from generator import model

from .dotnet_commons import TypeData
from .dotnet_constants import NAMESPACE
from .dotnet_helpers import (
    class_wrapper,
    generate_extras,
    get_doc,
    get_usings,
    interface_wrapper,
    namespace_wrapper,
    to_upper_camel_case,
)


def _get_enum(name: str, spec: model.LSPModel) -> Optional[model.Enum]:
    for enum in spec.enumerations:
        if enum.name == name:
            return enum
    return None


def _get_struct(name: str, spec: model.LSPModel) -> Optional[model.Enum]:
    for struct in spec.structures:
        if struct.name == name:
            return struct
    return None


def _is_str_enum(enum_def: model.Enum) -> bool:
    return all(isinstance(item.value, str) for item in enum_def.values)


def _is_int_enum(enum_def: model.Enum) -> bool:
    return all(isinstance(item.value, int) for item in enum_def.values)


def lsp_to_base_types(lsp_type: model.BaseType):
    if lsp_type.name in ["string", "RegExp"]:
        return "string"
    elif lsp_type.name in ["DocumentUri", "URI"]:
        return "Uri"
    elif lsp_type.name in ["decimal"]:
        return "float"
    elif lsp_type.name in ["integer"]:
        return "int"
    elif lsp_type.name in ["uinteger"]:
        return "uint"
    elif lsp_type.name in ["boolean"]:
        return "bool"

    # null should be handled by the caller as an Option<> type
    raise ValueError(f"Unknown base type: {lsp_type.name}")


def has_null_base_type(items: List[model.LSP_TYPE_SPEC]) -> bool:
    return any(item.kind == "base" and item.name == "null" for item in items)


def filter_null_base_type(
    items: List[model.LSP_TYPE_SPEC],
) -> List[model.LSP_TYPE_SPEC]:
    return [item for item in items if not (item.kind == "base" and item.name == "null")]


def get_type_name(
    type_def: model.LSP_TYPE_SPEC,
    types: TypeData,
    spec: model.LSPModel,
    name_context: Optional[str] = None,
) -> str:
    name = None
    if type_def.kind == "reference":
        enum_def = _get_enum(type_def.name, spec)
        if enum_def and enum_def.supportsCustomValues:
            if _is_str_enum(enum_def):
                name = f"string"
            elif _is_int_enum(enum_def):
                name = f"int"
        elif type_def.name == "Command":
            name = "CommandAction"
        elif type_def.name == "ChangeAnnotationIdentifier":
            name = "string"
        elif type_def.name == "DocumentSelector":
            name = "DocumentFilter[]"
        else:
            name = type_def.name
    elif type_def.kind == "array":
        name = f"{get_type_name(type_def.element, types, spec, name_context)}[]"
    elif type_def.kind == "map":
        key_type = get_type_name(type_def.key, types, spec, name_context)
        value_type = get_type_name(type_def.value, types, spec, name_context)
        name = f"Dictionary<{key_type}, {value_type}>"
    elif type_def.kind == "base":
        name = lsp_to_base_types(type_def)
    elif type_def.kind == "literal":
        name = "Literal"
    elif type_def.kind == "stringLiteral":
        name = "string"
    elif type_def.kind == "tuple":
        subset = filter_null_base_type(type_def.items)
        subset_types = [
            get_type_name(item, types, spec, name_context) for item in subset
        ]
        name = f"({', '.join(subset_types)})"
    elif type_def.kind == "or":
        subset = filter_null_base_type(type_def.items)
        if len(subset) == 1:
            name = get_type_name(subset[0], types, spec, name_context)
        elif len(subset) >= 2:
            subset_types = [
                get_type_name(item, types, spec, name_context) for item in subset
            ]
            name = f"OrType<{', '.join(subset_types)}>"
        else:
            raise ValueError(f"Unknown type kind: {type_def.kind}")
    else:
        raise ValueError(f"Unknown type kind: {type_def.kind}")
    return name


def get_converter(
    type_def: model.LSP_TYPE_SPEC,
    types: TypeData,
    spec: model.LSPModel,
    name_context: Optional[str] = None,
) -> Optional[str]:
    if type_def.kind == "base" and type_def.name in ["DocumentUri", "URI"]:
        return "[JsonConverter(typeof(DocumentUriConverter))]"
    elif type_def.kind == "or":
        subset = filter_null_base_type(type_def.items)
        if len(subset) >= 2:
            type_names = ", ".join(
                get_type_name(item, types, spec, name_context) for item in subset
            )
            return f"[JsonConverter(typeof(OrTypeConverter<{type_names}>))]"
    return None


def generate_property(
    prop_def: model.Property, spec: model.LSPModel, types: TypeData, usings: List[str]
) -> List[str]:
    name = to_upper_camel_case(prop_def.name)
    type_name = get_type_name(prop_def.type, types, spec, name)
    converter = get_converter(prop_def.type, types, spec, name)
    special_optional = prop_def.type.kind == "or" and has_null_base_type(
        prop_def.type.items
    )
    optional = "?" if prop_def.optional or special_optional else ""
    lines = (
        get_doc(prop_def.documentation)
        + generate_extras(prop_def)
        + ([converter] if converter else [])
        + (
            ["[JsonProperty(NullValueHandling = NullValueHandling.Ignore)]"]
            if optional and not special_optional
            else []
        )
        + [
            f'[DataMember(Name = "{prop_def.name}")]',
            f"public {type_name}{optional} {name} {{ get; set; }}",
        ]
    )
    usings.append("DataMember")
    if converter:
        usings.append("JsonConverter")
    if optional and not special_optional:
        usings.append("JsonProperty")
    return lines


def generate_interface_property(
    prop_def: model.Property, spec: model.LSPModel, types: TypeData
) -> List[str]:
    name = to_upper_camel_case(prop_def.name)
    type_name = get_type_name(prop_def.type, types, spec, name)
    special_optional = prop_def.type.kind == "or" and has_null_base_type(
        prop_def.type.items
    )
    optional = "?" if prop_def.optional or special_optional else ""
    lines = get_doc(prop_def.documentation) + [
        f"public {type_name}{optional} {name} {{ get; set; }}",
    ]
    return lines


def generate_class_from_struct(
    struct: model.Structure, spec: model.LSPModel, types: TypeData
):
    if types.get_by_name(struct.name):
        return

    interface = f"I{struct.name}"
    extends = set(
        [f"I{get_type_name(e, types, spec)}" for e in struct.extends]
        + ([interface] if types.get_by_name(interface) else [])
    )

    inner = []
    usings = ["DataContract"]

    properties = get_all_properties(struct, spec)
    for prop in properties:
        inner += generate_property(prop, spec, types, usings)

    lines = namespace_wrapper(
        NAMESPACE,
        get_usings(usings),
        class_wrapper(struct, inner, ", ".join(extends)),
    )
    types.add_type_info(struct, struct.name, lines)


def generate_interface_from_struct(
    struct: model.Structure, spec: model.LSPModel, types: TypeData
):
    if types.get_by_name(struct.name):
        return

    derived = set([f"I{get_type_name(e, types, spec)}" for e in struct.extends])

    inner = []
    created_properties = []
    for prop in struct.properties:
        inner += generate_interface_property(prop, spec, types)
        created_properties.append(prop.name)

    if not all(mixin.kind == "reference" for mixin in struct.mixins):
        raise ValueError(f"Struct {struct.name} has non-reference mixins")
    for mixin in [_get_struct(mixin.name, spec) for mixin in struct.mixins]:
        for prop in mixin.properties:
            if prop.name not in created_properties:
                inner += generate_interface_property(prop, spec, types)

    lines = namespace_wrapper(
        NAMESPACE,
        [],
        interface_wrapper(struct, inner, ", ".join(derived)),
    )
    types.add_type_info(struct, struct.name, lines)


def generate_class_from_type_alias(
    type_def: model.TypeAlias, spec: model.LSPModel, types: TypeData
) -> None:
    if types.get_by_name(type_def.name):
        return

    if type_def.name in ["ChangeAnnotationIdentifier", "DocumentSelector"]:
        return

    usings = ["DataContract"]
    type_name = get_type_name(type_def.type, types, spec, type_def.name)
    lines = namespace_wrapper(
        NAMESPACE,
        get_usings(usings),
        class_wrapper(type_def, [], type_name),
    )
    types.add_type_info(type_def, type_def.name, lines)


def copy_struct(struct_def: model.Structure, new_name: str):
    converter = cattrs.GenConverter()
    obj = converter.unstructure(struct_def, model.Structure)
    obj["name"] = new_name
    return model.Structure(**obj)


def copy_property(prop_def: model.Property):
    converter = cattrs.GenConverter()
    obj = converter.unstructure(prop_def, model.Property)
    return model.Property(**obj)


def get_all_extends(struct_def: model.Structure, spec) -> List[model.Structure]:
    extends = []
    for extend in struct_def.extends:
        extends.append(_get_struct(extend.name, spec))
        for struct in get_all_extends(_get_struct(extend.name, spec), spec):
            if not any(struct.name == e.name for e in extends):
                extends.append(struct)
    return extends


def get_all_properties(struct: model.Structure, spec) -> List[model.Structure]:
    properties = []
    for prop in struct.properties:
        properties.append(copy_property(prop))

    for extend in get_all_extends(struct, spec):
        for prop in get_all_properties(extend, spec):
            if not any(prop.name == p.name for p in properties):
                properties.append(copy_property(prop))

    if not all(mixin.kind == "reference" for mixin in struct.mixins):
        raise ValueError(f"Struct {struct.name} has non-reference mixins")
    for mixin in [_get_struct(mixin.name, spec) for mixin in struct.mixins]:
        for prop in get_all_properties(mixin, spec):
            if not any(prop.name == p.name for p in properties):
                properties.append(copy_property(prop))

    return properties


def generate_all_classes(spec: model.LSPModel, types: TypeData):
    interfaces = {}
    for struct in spec.structures:
        if not all(e.kind == "reference" for e in struct.extends):
            raise ValueError(f"Struct {struct.name} has non-reference extends")
        for extend in get_all_extends(struct, spec):
            name = f"I{extend.name}"
            if name not in interfaces:
                interfaces[name] = copy_struct(_get_struct(extend.name, spec), name)

    for struct in interfaces.values():
        generate_interface_from_struct(struct, spec, types)

    for struct in spec.structures:
        generate_class_from_struct(struct, spec, types)

    for type_alias in spec.typeAliases:
        generate_class_from_type_alias(type_alias, spec, types)
