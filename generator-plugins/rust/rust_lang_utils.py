# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.


import re
from typing import List


def lines_to_comments(lines: List[str]) -> List[str]:
    return ["// " + line for line in lines]


def lines_to_doc_comments(lines: List[str]) -> List[str]:
    return ["/// " + line for line in lines]


def lines_to_block_comment(lines: List[str]) -> List[str]:
    return ["/*"] + lines + ["*/"]


def get_parts(name: str) -> List[str]:
    name = name.replace("_", " ")
    return re.sub("(([a-z0-9])([A-Z]))", r"\2 \3", name).split()


def to_snake_case(name: str) -> str:
    return "_".join([part.lower() for part in get_parts(name)])


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
    return "".join([c.capitalize() for c in get_parts(name)])


def to_camel_case(name: str) -> str:
    parts = get_parts(name)
    if len(parts) > 1:
        return parts[0] + "".join([c.capitalize() for c in parts[1:]])
    else:
        return parts[0]
