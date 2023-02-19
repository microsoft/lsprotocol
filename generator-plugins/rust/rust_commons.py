# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

from typing import Dict, List

import generator.model as model


def generate_custom_enum() -> Dict[str, List[str]]:
    return {
        "CustomStringEnum": [
            "/// This type allows extending any string enum to support custom values.",
            "#[derive(Serialize, Deserialize, PartialEq, Debug)]",
            "#[serde(untagged)]",
            "pub enum CustomStringEnum<T> {",
            "    /// The value is one of the known enum values.",
            "    Known(T),",
            "    /// The value is custom.",
            "    Custom(String),",
            "}",
            "",
        ],
        "CustomIntEnum": [
            "/// This type allows extending any integer enum to support custom values.",
            "#[derive(Serialize, Deserialize, PartialEq, Debug)]",
            "#[serde(untagged)]",
            "pub enum CustomIntEnum<T> {",
            "    /// The value is one of the known enum values.",
            "    Known(T),",
            "    /// The value is custom.",
            "    Custom(i64),",
            "}",
            "",
        ],
    }


def generate_commons(model: model.LSPModel) -> Dict[str, List[str]]:
    return {
        **generate_custom_enum(),
    }
