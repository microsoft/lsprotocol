# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

from typing import Dict, List

import generator.model as model

from .rust_lang_utils import lines_to_doc_comments, to_upper_camel_case


def generate_int_enum(enum: model.Enum) -> List[str]:
    is_int = all(isinstance(item.value, int) for item in enum.values)
    if not is_int:
        raise Exception("Enum is not an integer enum")

    doc = enum.documentation.splitlines(keepends=False) if enum.documentation else []
    lines = lines_to_doc_comments(doc) +  [
        f"#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]",
        f"#[repr(i64)]",
        f"pub enum {enum.name} " "{",
    ]

    for item in enum.values:
        doc = item.documentation.splitlines(keepends=False) if item.documentation else []
        lines += lines_to_doc_comments(doc) +  [
            f"    {to_upper_camel_case(item.name)} = {item.value},",
        ]

    lines += ["}"]

    return lines

def generate_string_enum(enum: model.Enum) -> List[str]:
    is_string = all(isinstance(item.value, str) for item in enum.values)
    if not is_string:
        raise Exception("Enum is not a string enum")

    doc = enum.documentation.splitlines(keepends=False) if enum.documentation else []
    lines = lines_to_doc_comments(doc) +  [
        f"#[derive(Serialize, Deserialize, PartialEq, Debug)]",
        f"pub enum {enum.name} " "{",
    ]

    for item in enum.values:
        doc = item.documentation.splitlines(keepends=False) if item.documentation else []
        lines += lines_to_doc_comments(doc) +  [
            f"    #[serde(rename = \"{item.value}\")]",
            f"    {to_upper_camel_case(item.name)},",
        ]

    lines += ["}"]

    return lines

def generate_enum(enum: model.Enum) -> List[str]:
    is_int = all(isinstance(item.value, int) for item in enum.values)
    lines = []
    if is_int:
        lines += generate_int_enum(enum)
    else:
        lines += generate_string_enum(enum)
    return lines


def generate_enums(enums: List[model.Enum]) -> Dict[str, List[str]]:
    return {enum.name: generate_enum(enum) for enum in enums}
