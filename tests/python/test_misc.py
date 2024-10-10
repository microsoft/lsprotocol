# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

import pytest
from hamcrest import assert_that, is_
from lsprotocol import types as lsp


@pytest.mark.parametrize(
    ("msg", "expected"),
    [
        (lsp.PROGRESS, "both"),
        (lsp.WORKSPACE_WILL_RENAME_FILES, "clientToServer"),
        (lsp.WORKSPACE_WORKSPACE_FOLDERS, "serverToClient"),
    ],
)
def test_message_direction(msg, expected):
    assert_that(lsp.message_direction(msg), is_(expected))


@pytest.mark.parametrize(
    ("cls", "expected"), [(lsp.CancelNotification, True), (lsp.CancelParams, False)]
)
def test_is_special_class(cls, expected):
    assert_that(lsp.is_special_class(cls), is_(expected))


@pytest.mark.parametrize(
    ("cls", "expected"),
    [
        (lsp.CancelNotification, False),
        (lsp.CallHierarchyIncomingCall, True),
    ],
)
def test_is_keyword_class(cls, expected):
    assert_that(lsp.is_keyword_class(cls), is_(expected))
