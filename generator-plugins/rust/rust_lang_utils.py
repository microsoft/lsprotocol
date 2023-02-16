# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.


from typing import List


def lines_to_comments(lines: List[str]) -> List[str]:
    return ["// " + line for line in lines]


def lines_to_doc_comments(lines: List[str]) -> List[str]:
    return ["/// " + line for line in lines]


def lines_to_block_comment(lines: List[str]) -> List[str]:
    return ["/*"] + lines + ["*/"]


def to_snake_case(name: str) -> str:
    result = ""
    for i, c in enumerate(name):
        if i > 0 and c.isupper():
            result += "_"
        result += c.lower()
    return result


def has_upper_case(name: str) -> bool:
    return any(c.isupper() for c in name)


def is_snake_case(name: str) -> bool:
    return (
        not name.startswith("_")
        and not name.endswith("_")
        and ("_" in name)
        and not has_upper_case(name)
    )


def to_upper_camel_case(name: str) -> str:
    if not is_snake_case(name):
        name = to_snake_case(name)
    return "".join([c.capitalize() for c in name.split("_")])


def to_camel_case(name: str) -> str:
    if not is_snake_case(name):
        name = to_snake_case(name)
    parts = name.split("_")
    if len(parts) > 1:
        return parts[0] + "".join([c.capitalize() for c in parts[1:]])
    else:
        return parts[0]
