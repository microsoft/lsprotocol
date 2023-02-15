# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.


import argparse
import importlib
import json
import os
import pathlib
import sys
from typing import Sequence

import importlib_resources as ir
import jsonschema

from . import model

PACKAGES_ROOT = pathlib.Path(__file__).parent.parent / "packages"


def get_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Generate types from LSP JSON model.")
    parser.add_argument(
        "--schema",
        "-s",
        help="Path to a model schema file. By default uses packaged schema.",
        type=str,
    )
    parser.add_argument(
        "--model",
        "-m",
        help="Path to a model JSON file. By default uses packaged model file.",
        type=str,
    )
    return parser


def main(argv: Sequence[str]) -> None:
    parser = get_parser()
    args = parser.parse_args(argv)

    # Validate against LSP model JSON schema.
    if args.schema:
        schema = json.load(pathlib.Path(args.schema).open("rb"))
    else:
        schema_file = ir.files("generator") / "lsp.schema.json"
        schema = json.load(schema_file.open("rb"))

    if args.model:
        json_model = json.load(pathlib.Path(args.model).open("rb"))
    else:
        model_file = ir.files("generator") / "lsp.json"
        json_model = json.load(model_file.open("rb"))

    print("Model schema validated.")
    jsonschema.validate(json_model, schema)

    print("Finding plugins.")
    plugin_root = pathlib.Path(__file__).parent.parent / "generator-plugins"
    plugins = []
    for item in plugin_root.iterdir():
        if (
            item.is_dir()
            and (item / "__init__.py").exists()
            and not item.name.startswith("_")
        ):
            plugins.append(item.name)
    print(f"Found plugins: {plugins}")
    print("Starting code generation.")

    for plugin in plugins:
        print(f"Running plugin {plugin}.")

        # load model and generate types for each plugin to avoid
        # any conflicts between plugins.
        spec: model.LSPModel = model.create_lsp_model(json_model)

        plugin_module = importlib.import_module(f"generator-plugins.{plugin}")
        plugin_module.generate(spec, os.fspath(PACKAGES_ROOT / plugin))


if __name__ == "__main__":
    main(sys.argv[1:])
