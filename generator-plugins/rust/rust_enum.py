# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

from typing import Dict, List

import generator.model as model

from .rust_lang_utils import to_upper_camel_case


def generate_int_enum(enum: model.Enum) -> List[str]:
    is_int = all(isinstance(item.value, int) for item in enum.values)
    if not is_int:
        raise Exception("Enum is not an integer enum")

    return [
        f"#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]",
        f"#[repr(i64)]",
        f"pub enum {enum.name} " "{",
        *[f"    {to_upper_camel_case(item.name)} = {item.value}," for item in enum.values],
        "}",
    ]


def generate_enum(enum: model.Enum) -> List[str]:
    is_int = all(isinstance(item.value, int) for item in enum.values)
    lines = []
    if is_int:
        lines += generate_int_enum(enum)
    return lines


def generate_enums(enums: List[model.Enum]) -> Dict[str, List[str]]:
    return {enum.name: generate_enum(enum) for enum in enums}
