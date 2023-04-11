# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

from typing import Dict, List

import generator.model as model

from .rust_commons import TypeData, generate_extras
from .rust_lang_utils import lines_to_doc_comments, to_upper_camel_case


def generate_int_enum(enum: model.Enum, types: TypeData) -> None:
    is_int = all(isinstance(item.value, int) for item in enum.values)
    if not is_int:
        raise Exception("Enum is not an integer enum")

    extras = generate_extras(enum)
    doc = enum.documentation.splitlines(keepends=False) if enum.documentation else []
    lines = (
        lines_to_doc_comments(doc)
        + extras
        + [
            f"#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]",
            f"#[repr(i32)]",
            f"pub enum {enum.name} " "{",
        ]
    )

    indent = " " * 4
    for item in enum.values:
        extras = generate_extras(item)
        doc = (
            item.documentation.splitlines(keepends=False) if item.documentation else []
        )
        lines += [f"{indent}{line}" for line in lines_to_doc_comments(doc)]
        lines += [f"{indent}{line}" for line in extras]
        lines += [f"{indent}{to_upper_camel_case(item.name)} = {item.value},", ""]

    lines += ["}"]

    types.add_type_info(enum, enum.name, lines)


def generate_string_enum(enum: model.Enum, types: TypeData) -> None:
    is_string = all(isinstance(item.value, str) for item in enum.values)
    if not is_string:
        raise Exception("Enum is not a string enum")

    extras = generate_extras(enum)
    doc = enum.documentation.splitlines(keepends=False) if enum.documentation else []
    lines = (
        lines_to_doc_comments(doc)
        + extras
        + [
            f"#[derive(Serialize, Deserialize, PartialEq, Debug)]",
            f"pub enum {enum.name} " "{",
        ]
    )

    indent = " " * 4
    for item in enum.values:
        extras = generate_extras(item)
        doc = (
            item.documentation.splitlines(keepends=False) if item.documentation else []
        )
        lines += [f"{indent}{line}" for line in lines_to_doc_comments(doc)]
        lines += [f"{indent}{line}" for line in extras]
        lines += [f'{indent}#[serde(rename = "{item.value}")]']
        lines += [f"{indent}{to_upper_camel_case(item.name)},", ""]

    lines += ["}"]

    types.add_type_info(enum, enum.name, lines)


def generate_enum(enum: model.Enum, types: TypeData) -> None:
    if all(isinstance(item.value, int) for item in enum.values):
        return generate_int_enum(enum, types)
    return generate_string_enum(enum, types)


def generate_enums(enums: List[model.Enum], types: TypeData) -> None:
    for enum in enums:
        generate_enum(enum, types)
