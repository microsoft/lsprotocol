# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.


import json
import pathlib
import sys
from typing import Sequence

import jsonschema

from . import model, utils


def main(argv: Sequence[str]) -> None:

    # Validate against LSP model JSON schema.
    schema = json.loads((pathlib.Path(__file__).parent / "lsp.schema.json").read_text())
    model_content = pathlib.Path(argv[0]).read_text(encoding="utf-8")
    json_model = json.loads(model_content)
    jsonschema.validate(json_model, schema)

    # load model and generate types.
    spec = model.create_lsp_model(model_content)
    code = utils.generate_model_types(spec)

    if len(argv) == 1:
        print(code)
    else:
        pathlib.Path(argv[1]).write_text(code, encoding="utf-8")


if __name__ == "__main__":
    main(sys.argv[1:])
