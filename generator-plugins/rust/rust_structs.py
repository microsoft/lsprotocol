# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

from typing import Dict, List

import generator.model as model

from .rust_commons import generate_extras, generate_literal_struct_type, get_type_name
from .rust_lang_utils import lines_to_doc_comments, to_snake_case


def generate_type_aliases(
    spec: model.LSPModel, types: Dict[str, List[str]]
) -> Dict[str, List[str]]:
    for alias in spec.typeAliases:
        if alias.name == "LSPObject":
            continue
        types[alias.name] = generate_type_alias(alias, types, spec)
    return types


def generate_type_alias(
    alias_def: model.TypeAlias, types: Dict[str, List[str]], spec: model.LSPModel
) -> List[str]:
    doc = (
        alias_def.documentation.splitlines(keepends=False)
        if alias_def.documentation
        else []
    )

    lines = lines_to_doc_comments(doc) + generate_extras(alias_def)
    if alias_def.type.kind == "reference":
        lines += [f"pub type {alias_def.name} = {alias_def.type.name};"]
    elif alias_def.type.kind == "array":
        lines += [
            f"pub type {alias_def.name} = {get_type_name(alias_def.type, types, spec)};"
        ]
    elif alias_def.type.kind == "or":
        lines += [
            "#[derive(Serialize, Deserialize, PartialEq, Debug)]",
            "#[serde(untagged)]",
        ]
        lines += [f"pub enum {alias_def.name}", "{"]
        index = 0
        for sub_type in alias_def.type.items:
            if sub_type.kind == "base" and sub_type.name == "null":
                lines += [f"    None,"]
            else:
                lines += [
                    f"    ValueType{index}({get_type_name(sub_type, types, spec)}),"
                ]
            index += 1
        lines += ["}", ""]
    elif alias_def.type.kind == "and":
        pass
    elif alias_def.type.kind == "literal":
        lines += [
            f"pub type {alias_def.name} = {get_type_name(alias_def.type, types, spec)};"
        ]
    elif alias_def.type.kind == "base":
        lines += [
            f"pub type {alias_def.name} = {get_type_name(alias_def.type, types, spec)};"
        ]
    else:
        pass
    return lines


def generate_structures(
    spec: model.LSPModel, types: Dict[str, List[str]]
) -> Dict[str, List[str]]:
    for struct in spec.structures:
        types[struct.name] = generate_struct(struct, types, spec)
    return types


def generate_struct(
    struct_def: model.Structure, types: Dict[str, List[str]], spec: model.LSPModel
) -> List[str]:
    doc = (
        struct_def.documentation.splitlines(keepends=False)
        if struct_def.documentation
        else []
    )
    lines = lines_to_doc_comments(doc) + generate_extras(struct_def)
    lines += [
        "#[derive(Serialize, Deserialize, PartialEq, Debug)]",
        '#[serde(rename_all = "camelCase")]',
    ]

    properties = [p for p in struct_def.properties]
    for t in struct_def.extends + struct_def.mixins:
        if t.kind == "reference":
            for s in spec.structures:
                if s.name == t.name:
                    properties += [p for p in s.properties]
                    break
        elif t.kind == "literal":
            properties += [p for p in t.value.properties]
        else:
            pass

    lines += [f"pub struct {struct_def.name}", "{"]

    for property in struct_def.properties:
        doc = (
            property.documentation.splitlines(keepends=False)
            if property.documentation
            else []
        )
        lines += lines_to_doc_comments(doc)
        lines += generate_extras(property)
        prop_name = to_snake_case(property.name)
        prop_type = get_type_name(property.type, types, spec, property.optional)

        if prop_name in ["type"]:
            prop_name = f"{prop_name}_"
            lines += [f'#[serde(rename = "{property.name}")]']
        lines += [f"pub {prop_name}: {prop_type},"]
        lines += [""]
    lines += ["}"]
    lines += [""]
    return lines
