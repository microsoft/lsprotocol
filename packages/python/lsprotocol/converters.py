# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

from importlib.metadata import version
from typing import Optional

import cattrs

from . import _hooks


def _get_default_converter():
    if version("cattrs") >= "25.0.0":
        return cattrs.Converter(structure_fallback_factory=lambda _: cattrs.fns.raise_error)
    return cattrs.Converter()


def get_converter(
    converter: Optional[cattrs.Converter] = None,
) -> cattrs.Converter:
    """Adds cattrs hooks for LSP lsp_types to the given converter."""
    if converter is None:
        converter = _get_default_converter()
    return _hooks.register_hooks(converter)
