# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

import os
from typing import Dict, List, Optional, Union


import generator.model as model
from .rust_lang_utils import lines_to_doc_comments, to_snake_case, to_upper_camel_case


def generate_custom_enum() -> Dict[str, List[str]]:
    return {
        "CustomStringEnum": [
            "/// This type allows extending any string enum to support custom values.",
            "#[derive(Serialize, Deserialize, PartialEq, Debug)]",
            "#[serde(untagged)]",
            "pub enum CustomStringEnum<T> {",
            "    /// The value is one of the known enum values.",
            "    Known(T),",
            "    /// The value is custom.",
            "    Custom(String),",
            "}",
            "",
        ],
        "CustomIntEnum": [
            "/// This type allows extending any integer enum to support custom values.",
            "#[derive(Serialize, Deserialize, PartialEq, Debug)]",
            "#[serde(untagged)]",
            "pub enum CustomIntEnum<T> {",
            "    /// The value is one of the known enum values.",
            "    Known(T),",
            "    /// The value is custom.",
            "    Custom(i64),",
            "}",
            "",
        ],
        "OR2": [
            "/// This allows a field to have two types.",
            "#[derive(Serialize, Deserialize, PartialEq, Debug)]",
            "#[serde(untagged)]",
            "pub enum OR2<T, U> {",
            "    T(T),",
            "    U(U),",
            "}",
            "",
        ],
        "OR3": [
            "/// This allows a field to have three types.",
            "#[derive(Serialize, Deserialize, PartialEq, Debug)]",
            "#[serde(untagged)]",
            "pub enum OR3<T, U, V> {",
            "    T(T),",
            "    U(U),",
            "    V(V),",
            "}",
            "",
        ],
        "OR4": [
            "/// This allows a field to have four types.",
            "#[derive(Serialize, Deserialize, PartialEq, Debug)]",
            "#[serde(untagged)]",
            "pub enum OR4<T, U, V, W> {",
            "    T(T),",
            "    U(U),",
            "    V(V),",
            "    W(W),",
            "}",
            "",
        ],
        "OR5": [
            "/// This allows a field to have five types.",
            "#[derive(Serialize, Deserialize, PartialEq, Debug)]",
            "#[serde(untagged)]",
            "pub enum OR5<T, U, V, W, X> {",
            "    T(T),",
            "    U(U),",
            "    V(V),",
            "    W(W),",
            "    X(X),",
            "}",
            "",
        ],
        "OR6": [
            "/// This allows a field to have six types.",
            "#[derive(Serialize, Deserialize, PartialEq, Debug)]",
            "#[serde(untagged)]",
            "pub enum OR6<T, U, V, W, X, Y> {",
            "    T(T),",
            "    U(U),",
            "    V(V),",
            "    W(W),",
            "    X(X),",
            "    Y(Y),",
            "}",
            "",
        ],
        "OR7": [
            "/// This allows a field to have seven types.",
            "#[derive(Serialize, Deserialize, PartialEq, Debug)]",
            "#[serde(untagged)]",
            "pub enum OR7<T, U, V, W, X, Y, Z> {",
            "    T(T),",
            "    U(U),",
            "    V(V),",
            "    W(W),",
            "    X(X),",
            "    Y(Y),",
            "    Z(Z),",
            "}",
            "",
        ],
        "LSPObject": [
            "/// This is a base type for all user LSP objects.",
            "#[derive(Serialize, Deserialize, PartialEq, Debug)]",
            "#[serde(untagged)]",
            "pub enum LSPObject<'a>{",
            "    Known(&'a LSPAny<'a>),",
            '    #[lang = "None"]',
            "    None,",
            "}",
            "",
        ],
    }


def generate_commons(model: model.LSPModel) -> Dict[str, List[str]]:
    return {
        **generate_custom_enum(),
    }


def lsp_to_base_types(lsp_type: model.BaseType):
    if lsp_type.name in ["string", "DocumentUri", "URI", "RegExp"]:
        return "String"
    elif lsp_type.name in ["decimal"]:
        return "f64"
    elif lsp_type.name in ["integer"]:
        return "i64"
    elif lsp_type.name in ["uinteger"]:
        return "u64"
    elif lsp_type.name in ["boolean"]:
        return "bool" 
    
    # null should be handled by the caller as an Option<> type
    raise ValueError(f"Unknown base type: {lsp_type.name}")


def _get_enum(name:str, spec: model.LSPModel) -> Optional[model.Enum]:
    for enum in spec.enumerations:
        if enum.name == name:
            return enum
    return None

def _is_str_enum(enum_def: model.Enum) -> bool:
    return all(isinstance(item.value, str) for item in enum_def.values)

def _is_int_enum(enum_def: model.Enum) -> bool:
    return all(isinstance(item.value, int) for item in enum_def.values)

def get_type_name(type_def: model.LSP_TYPE_SPEC, types:Dict[str, Optional[List[str]]], spec: model.LSPModel, optional: Optional[bool] = None) -> str:
    if type_def.kind == 'reference':
        enum_def = _get_enum(type_def.name, spec)
        if enum_def and enum_def.supportsCustomValues:
            if _is_str_enum(enum_def):
                name = f"CustomStringEnum<{enum_def.name}>"
            elif _is_int_enum(enum_def):
                name = f"CustomIntEnum<{enum_def.name}>"
        else:
            name = type_def.name
    elif type_def.kind == 'array':
        name = f"Vec<{get_type_name(type_def.element, types, spec)}>"
    elif type_def.kind == 'map':
        key_type = get_type_name(type_def.key, types, spec)
        value_type = get_type_name(type_def.value, types, spec)
        name = f"HashMap<{key_type}, {value_type}>"
    elif type_def.kind == 'base':
        name = lsp_to_base_types(type_def)
    elif type_def.kind == 'or':
        has_null = any([True for sub_spec in type_def.items if sub_spec.kind == "base" and sub_spec.name == "null"])
        sub_set_items = [sub_spec for sub_spec in type_def.items if not (sub_spec.kind == "base" and sub_spec.name == "null")]
        sub_types = [get_type_name(sub_spec, types, spec) for sub_spec in sub_set_items]
        sub_types_str = ", ".join(sub_types)
        if len(sub_types) >= 2:
            name = f"OR{len(sub_types)}<{sub_types_str}>"
        elif len(sub_types) == 1:
            name = sub_types[0]
        else:
            raise ValueError(f"OR type with more than out of range count of subtypes: {type_def}")
        optional = optional or has_null
    elif type_def.kind == 'literal':
        name =  generate_literal_struct_name(type_def, types, spec)
        if name not in types:
            types[name] = generate_literal_struct_type(type_def, types, spec)
    elif type_def.kind == 'stringLiteral':
        name = "String"
        # TODO: generate proper string literals
    elif type_def.kind == 'tuple':
        has_null = any([True for sub_spec in type_def.items if sub_spec.kind == "base" and sub_spec.name == "null"])
        sub_set_items = [sub_spec for sub_spec in type_def.items if not (sub_spec.kind == "base" and sub_spec.name == "null")]
        sub_types = [get_type_name(sub_spec, types, spec) for sub_spec in sub_set_items]
        sub_types_str = ", ".join(sub_types)
        if len(sub_types) >= 2:
            name = f"({sub_types_str})"
        elif len(sub_types) == 1:
            name = sub_types[0]
        else:
            raise ValueError(f"Invalid number of items for tuple: {type_def}")
    else:
        raise ValueError(f"Unknown type kind: {type_def.kind}")
    
    return f"Option<{name}>" if optional else name
    
def generate_literal_struct_name(type_def: model.LiteralType, types:Dict[str, List[str]], spec: model.LSPModel) -> str:
    parts = []
    for property in type_def.value.properties:
        parts.append(to_upper_camel_case(property.name))
        parts.append(get_type_name(property.type, types, spec, property.optional))
    return f"Struct{''.join(parts)}".replace("<","").replace(">","").replace(",","").replace(" ","")

def generate_literal_struct_type(type_def: model.LiteralType, types:Dict[str, List[str]], spec: model.LSPModel) -> List[str]:
    name = generate_literal_struct_name(type_def, types, spec)
    if name in types:
        return types[name]

    doc = type_def.documentation.splitlines(keepends=False) if type_def.documentation else []
    inner_code = lines_to_doc_comments(doc)+ generate_extras(type_def)+[
        "#[derive(Serialize, Deserialize, PartialEq, Debug)]",
        '#[serde(rename_all = "camelCase")]',
        f"struct {name}", "{"]
    for property in type_def.value.properties:
        doc = property.documentation.splitlines(keepends=False) if property.documentation else []
        inner_code += lines_to_doc_comments(doc)
        inner_code += generate_extras(property)
        prop_name = to_snake_case(property.name)
        prop_type = get_type_name(property.type, types, spec, property.optional)
        inner_code += [f"pub {prop_name}: {prop_type},"]
        inner_code += [""]
    inner_code += ["}" , ""]
    types[name] = inner_code
    return inner_code

def generate_extras(type_def: Union[model.Enum, model.EnumItem, model.Property, model.TypeAlias, model.Structure])->List[str]:
    extras = []
    if type_def.deprecated:
        extras = ["#[deprecated]"]
    elif type_def.proposed:
        if type_def.since:
            extras = [f'#[cfg(feature = "proposed", since = "{type_def.since}")]']
        else:
            extras = [f'#[cfg(feature = "proposed")]']
    # else:
    #     if type_def.since:
    #         extras = [f'#[cfg(feature = "stable", since = "{type_def.since}")]']
    #     else:
    #         extras = [f'#[cfg(feature = "stable")]']
    return extras