# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

import json
import pathlib

import jsonschema


def test_validate_with_schema():
    root = pathlib.Path(__file__).parent.parent / "generator"
    model = json.loads((root / "lsp.json").read_text(encoding="utf-8"))
    schema = json.loads((root / "lsp.schema.json").read_text(encoding="utf-8"))

    jsonschema.validate(model, schema)
