# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

from typing import Dict, List, Union

from generator import model

from .dotnet_commons import TypeData
from .dotnet_constants import NAMESPACE
from .dotnet_helpers import class_wrapper, get_usings, namespace_wrapper

SPECIAL_CLASSES = [
    "LSPObject",
    "LSPAny",
    "LSPArray",
]


def generate_special_classes(spec: model.LSPModel, types: TypeData) -> None:
    """Generate code for special classes in LSP"""
    for special_class in SPECIAL_CLASSES:
        for struct_def in spec.structures + spec.typeAliases:
            if struct_def.name == special_class:
                generate_special_class(struct_def, spec, types)


def generate_special_class(
    struct_def: model.Structure, spec: model.LSPModel, types: TypeData
) -> Dict[str, str]:
    """Generate code for a special class"""
    lines: List[str] = []

    if struct_def.name == "LSPObject":
        lines = namespace_wrapper(
            NAMESPACE,
            get_usings(["JObject", "DataContract"]),
            class_wrapper(struct_def, [], "JObject"),
        )
    if struct_def.name == "LSPAny":
        lines = namespace_wrapper(
            NAMESPACE,
            get_usings(["DataContract"]),
            class_wrapper(struct_def, [], "object"),
        )
    if struct_def.name == "LSPArray":
        lines = namespace_wrapper(
            NAMESPACE,
            get_usings(["JArray", "DataContract"]),
            class_wrapper(struct_def, [], "JArray"),
        )

    types.add_type_info(struct_def, struct_def.name, lines)
