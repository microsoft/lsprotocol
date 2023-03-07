# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

import os
import pathlib
from typing import List

import generator.model as model

from .rust_commons import generate_commons
from .rust_enum import generate_enums
from .rust_file_header import license_header
from .rust_lang_utils import lines_to_comments
from .rust_structs import generate_structures, generate_type_aliases

PACKAGE_DIR_NAME = "lsprotocol"


def generate_from_spec(spec: model.LSPModel, output_dir: str) -> None:
    code = generate_package_code(spec)
    for file_name in code:
        pathlib.Path(output_dir, PACKAGE_DIR_NAME, file_name).write_text(
            code[file_name], encoding="utf-8"
        )


def generate_package_code(spec: model.LSPModel) -> List[str]:
    return {
        "src/lib.rs": generate_lib_rs(spec),
    }


def generate_lib_rs(spec: model.LSPModel) -> List[str]:
    lines = lines_to_comments(license_header())
    lines += [
        "",
        "// This file is generated by the LSP generator. Do not edit it manually.",
    ]
    lines += [
        "use serde_repr::*;",
        "use serde::{Serialize, Deserialize};",
        "use std::collections::HashMap;",
        "",
    ]

    types = {
        **generate_commons(spec),
        **generate_enums(spec.enumerations),
    }

    generate_type_aliases(spec, types)
    generate_structures(spec, types)

    for name in types:
        if types[name]:
            lines += types[name]
            lines += [""]

    return "\n".join(lines)
