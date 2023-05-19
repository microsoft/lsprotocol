# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

import os
import pathlib
import subprocess
from typing import Dict, List

import generator.model as model

from .dotnet_classes import generate_all_classes
from .dotnet_commons import TypeData
from .dotnet_constants import NAMESPACE, PACKAGE_DIR_NAME
from .dotnet_enums import generate_enums
from .dotnet_helpers import namespace_wrapper
from .dotnet_special_classes import generate_special_classes


def generate_from_spec(spec: model.LSPModel, output_dir: str) -> None:
    """Generate the code for the given spec."""
    cleanup(output_dir)
    copy_custom_classes(output_dir)

    types = TypeData()
    generate_package_code(spec, types)
    for name, lines in types.get_all():
        file_name = f"{name}.cs"
        pathlib.Path(output_dir, PACKAGE_DIR_NAME, file_name).write_text(
            "\n".join(lines), encoding="utf-8"
        )

    subprocess.run(
        ["dotnet", "format"], cwd=os.fspath(pathlib.Path(output_dir, PACKAGE_DIR_NAME))
    )


def generate_package_code(spec: model.LSPModel, types: TypeData) -> Dict[str, str]:
    generate_enums(spec, types)
    generate_special_classes(spec, types)
    generate_all_classes(spec, types)


def cleanup(output_dir: str) -> None:
    """Cleanup the generated C# files."""
    output = pathlib.Path(output_dir, PACKAGE_DIR_NAME)
    for file in output.glob("*.cs"):
        file.unlink()


def copy_custom_classes(output_dir: str) -> None:
    """Copy the custom classes to the output directory."""
    output = pathlib.Path(output_dir, PACKAGE_DIR_NAME)
    custom = pathlib.Path(__file__).parent / "custom"
    for file in custom.glob("*.cs"):
        lines = file.read_text(encoding="utf-8").splitlines()
        lines = namespace_wrapper(NAMESPACE, [], lines)
        (output / file.name).write_text("\n".join(lines), encoding="utf-8")
