# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.


import argparse
import json
import pathlib
import sys
from typing import Sequence

import importlib_resources as ir
import jsonschema

from . import model, utils


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
    parser.add_argument(
        "--output",
        "-o",
        help="Path to a where the types should be written. By default uses stdout.",
        type=str,
        default="-",
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

    jsonschema.validate(json_model, schema)

    # load model and generate types.
    spec = model.create_lsp_model(json_model)
    code = utils.TypesCodeGenerator(spec).get_code()
    if args.output:
        pathlib.Path(argv[1]).write_text(code, encoding="utf-8")
    else:
        print(code)


if __name__ == "__main__":
    main(sys.argv[1:])
