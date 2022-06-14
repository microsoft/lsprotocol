# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

import pathlib
import sys

import pytest


@pytest.fixture
def customize_sys_path():
    sys.path.append(str(pathlib.Path(__file__).parent))
