# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

from typing import Dict, List, Union

from generator import model

from .dotnet_helpers import file_header, lines_to_doc_comments, to_upper_camel_case


def generate_enums(spec: model.LSPModel) -> Dict[str, str]:
    """Generate the code for the given spec."""
    # key is the relative path to the file, value is the content
    code: Dict[str, str] = {}
    for enum_def in spec.enumerations:
        file_name = to_upper_camel_case(enum_def.name) + ".cs"
        if file_name in code:
            raise Exception(f"Duplicate file name {file_name}")
        code[file_name] = generate_enum(enum_def)
    return code


def _get_enum_doc(enum: Union[model.Enum, model.EnumItem]) -> List[str]:
    doc = enum.documentation.splitlines(keepends=False) if enum.documentation else []
    return lines_to_doc_comments(doc)


def generate_enum(enum: model.Enum) -> List[str]:
    use_enum_member = all(isinstance(item.value, str) for item in enum.values)
    indent = " " * 4
    lines = file_header()
    if use_enum_member:
        lines += [
            "using System.Runtime.Serialization;",
            "",
        ]
    lines += ["namespace LSProtocol {"]
    lines += [f"{indent}{line}" for line in _get_enum_doc(enum)]
    lines += [
        f"{indent}public enum {enum.name} ",
        f"{indent}" "{",
    ]

    for item in enum.values:
        name = to_upper_camel_case(item.name)

        lines += [f"{indent*2}{line}" for line in _get_enum_doc(item)]
        if use_enum_member:
            lines += [f'{indent*2}[EnumMember(Value = "{item.value}")]{name},']
        else:
            lines += [f"{indent*2}{name} = {item.value},"]
        lines += [""]

    lines += [f"{indent}" "}", "}"]
    return "\n".join(lines)
