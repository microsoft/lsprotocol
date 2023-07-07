# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

import logging
import pathlib
from typing import Dict, List

import generator.model as model

from .testdata_generator import generate

logger = logging.getLogger("testdata")


def generate_from_spec(spec: model.LSPModel, output_dir: str) -> None:
    """Generate the code for the given spec."""
    cleanup(output_dir)
    output = pathlib.Path(output_dir)
    # key is the relative path to the file, value is the content
    code: Dict[str, str] = generate(spec, logger)
    for file_name in code:
        # print file size
        file = output / file_name
        file.write_text(code[file_name], encoding="utf-8")


def cleanup(output_dir: str) -> None:
    """Cleanup the generated C# files."""
    output = pathlib.Path(output_dir)
    for file in output.glob("*.json"):
        file.unlink()
