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
    lines += ["use serde_repr::*;", "use serde::{Serialize, Deserialize};", ""]

    types = {
        **generate_commons(spec),
        **generate_enums(spec.enumerations),
    }

    for name in types:
        lines += types[name]
        lines += [""]

    return "\n".join(lines)
