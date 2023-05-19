# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

from typing import Dict, List, Optional, Tuple, Union

from generator import model

from .dotnet_commons import TypeData
from .dotnet_constants import NAMESPACE
from .dotnet_helpers import (
    class_wrapper,
    generate_extras,
    get_doc,
    get_usings,
    namespace_wrapper,
    to_upper_camel_case,
)


def _get_enum(name: str, spec: model.LSPModel) -> Optional[model.Enum]:
    for enum in spec.enumerations:
        if enum.name == name:
            return enum
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
    if type_def.kind == "reference":
        enum_def = _get_enum(type_def.name, spec)
        if enum_def and enum_def.supportsCustomValues:
            if _is_str_enum(enum_def):
                name = f"string"
            elif _is_int_enum(enum_def):
                name = f"int"
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
        pass
    elif type_def.kind == "stringLiteral":
        name = "string"
    elif type_def.kind == "tuple":
        subset = filter_null_base_type(type_def.items)
        name = f"({', '.join(get_type_name(item, types, spec, name_context) for item in subset)})"
    elif type_def.kind == "or":
        subset = filter_null_base_type(type_def.items)
        name = f"OrType<{', '.join(get_type_name(item, types, spec, name_context) for item in subset)}>"
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
        type_names = ", ".join(
            get_type_name(item, types, spec, name_context) for item in subset
        )
        return f"[JsonConverter(typeof(OrTypeConverter<{type_names}>))]"
    return None


def generate_property(
    prop_def: model.Property, spec: model.LSPModel, types: TypeData
) -> List[str]:
    name = to_upper_camel_case(prop_def.name)
    type_name = get_type_name(prop_def.type, types, spec, name)
    converter = get_converter(prop_def.type, types, spec, name)
    lines = (
        get_doc(prop_def.documentation)
        + generate_extras(prop_def)
        + ([converter] if converter else [])
        + [
            f'[DataMember(Name = "{prop_def.name}")]',
            f"public {type_name} {name} {{ get; set; }}",
        ]
    )
    return lines


def generate_from_struct(
    struct: model.Structure, spec: model.LSPModel, types: TypeData
):
    derived = ", ".join(get_type_name(e, types, spec) for e in struct.extends)
    inner = []
    for prop in struct.properties:
        inner += generate_property(prop, spec, types)
    lines = class_wrapper(struct, inner, derived)
    types.add_type_info(struct, struct.name, lines)


def generate_all_classes(spec: model.LSPModel, types: TypeData):
    for struct in spec.structures:
        generate_from_struct(struct, spec, types)
