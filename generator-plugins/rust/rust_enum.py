# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

from typing import List, Union

import generator.model as model

from .rust_commons import TypeData, generate_extras
from .rust_lang_utils import indent_lines, lines_to_doc_comments, to_upper_camel_case


def _get_enum_docs(enum: Union[model.Enum, model.EnumItem]) -> List[str]:
    doc = enum.documentation.splitlines(keepends=False) if enum.documentation else []
    return lines_to_doc_comments(doc)


def generate_enum(enum: model.Enum, types: TypeData) -> None:
    is_int = all(isinstance(item.value, int) for item in enum.values)

    lines = (
        _get_enum_docs(enum)
        + generate_extras(enum)
        + [
            "#[derive(Serialize, Deserialize, PartialEq, Debug, Eq, Clone)]",
            f"pub enum {enum.name} " "{",
        ]
    )

    for item in enum.values:
        if is_int:
            field = [
                f"{to_upper_camel_case(item.name)} = {item.value},",
            ]
        else:
            field = [
                f'#[serde(rename = "{item.value}")]',
                f"{to_upper_camel_case(item.name)},",
            ]

        lines += indent_lines(
            _get_enum_docs(item) + generate_extras(item) + field + [""]
        )

    lines += ["}"]

    types.add_type_info(enum, enum.name, lines)


def generate_enums(enums: List[model.Enum], types: TypeData) -> None:
    for enum in enums:
        generate_enum(enum, types)
