# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

import json
import pathlib

import pytest

import generator.model as model


def test_model_loading():
    root = pathlib.Path(__file__).parent.parent / "generator"
    json_model = json.loads((root / "lsp.json").read_text(encoding="utf-8"))

    model.LSPModel(**json_model)


def test_model_loading_failure():
    root = pathlib.Path(__file__).parent.parent / "generator"
    json_model = json.loads((root / "lsp.json").read_text(encoding="utf-8"))

    del json_model["structures"][0]["name"]
    with pytest.raises(TypeError):
        model.LSPModel(**json_model)
