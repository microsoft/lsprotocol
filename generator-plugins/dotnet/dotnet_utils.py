# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

import pathlib
from typing import Dict, List

import generator.model as model

from .dotnet_enums import generate_enums

PACKAGE_DIR_NAME = "lsprotocol"


def generate_from_spec(spec: model.LSPModel, output_dir: str) -> None:
    """Generate the code for the given spec."""
    # key is the relative path to the file, value is the content
    code: Dict[str, str] = generate_package_code(spec)
    for file_name in code:
        pathlib.Path(output_dir, PACKAGE_DIR_NAME, file_name).write_text(
            code[file_name], encoding="utf-8"
        )


def generate_package_code(spec: model.LSPModel) -> Dict[str, str]:
    return generate_enums(spec)
