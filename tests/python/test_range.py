# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

import hamcrest
import pytest

from lsprotocol import types as lsp


@pytest.mark.parametrize(
    ("a", "b", "expected"),
    [
        (
            lsp.Range(lsp.Position(1, 23), lsp.Position(4, 56)),
            lsp.Range(lsp.Position(1, 23), lsp.Position(4, 56)),
            True,
        ),
        (
            lsp.Range(lsp.Position(1, 23), lsp.Position(4, 56)),
            lsp.Range(lsp.Position(1, 23), lsp.Position(4, 57)),
            False,
        ),
        (
            lsp.Range(lsp.Position(1, 23), lsp.Position(4, 56)),
            lsp.Range(lsp.Position(1, 23), lsp.Position(7, 56)),
            False,
        ),
    ],
)
def test_range_equality(a, b, expected):
    hamcrest.assert_that(a == b, hamcrest.is_(expected))


@pytest.mark.parametrize(
    ("range", "expected"),
    [
        (lsp.Range(lsp.Position(0, 0), lsp.Position(0, 0)), False),
        (lsp.Range(lsp.Position(0, 0), lsp.Position(3, 0)), True),
        (lsp.Range(lsp.Position(1, 0), lsp.Position(3, 0)), True),
        (lsp.Range(lsp.Position(2, 0), lsp.Position(3, 0)), True),
        (lsp.Range(lsp.Position(2, 0), lsp.Position(2, 9)), True),
        (lsp.Range(lsp.Position(2, 5), lsp.Position(2, 5)), True),
        (lsp.Range(lsp.Position(2, 5), lsp.Position(2, 9)), True),
        (lsp.Range(lsp.Position(2, 6), lsp.Position(3, 0)), False),
        (lsp.Range(lsp.Position(3, 0), lsp.Position(3, 0)), False),
    ],
)
def test_range_contains(range, expected):
    pos = lsp.Position(2, 5)
    hamcrest.assert_that(pos in range, hamcrest.is_(expected))


@pytest.mark.parametrize(
    ("a_start", "a_end", "expected"),
    [
        (
            (0, 0),
            (1, 22),
            False,
        ),
        (
            (1, 22),
            (3, 45),
            True,
        ),
        (
            (1, 23),
            (4, 56),
            True,
        ),
        (
            (2, 23),
            (4, 30),
            True,
        ),
        (
            (2, 23),
            (5, 20),
            True,
        ),
        (
            (4, 57),
            (5, 20),
            False,
        ),
    ],
)
def test_range_overlaps(a_start, a_end, expected):
    a = lsp.Range(lsp.Position(*a_start), lsp.Position(*a_end))
    b = lsp.Range(lsp.Position(1, 23), lsp.Position(4, 56))
    hamcrest.assert_that(a.overlaps(b), hamcrest.is_(expected))
    # Test symmetry as well
    hamcrest.assert_that(b.overlaps(a), hamcrest.is_(expected))


@pytest.mark.parametrize(
    ("a_start", "a_end", "expected"),
    [
        (
            (0, 0),
            (1, 22),
            False,
        ),
        (
            (1, 22),
            (3, 45),
            False,
        ),
        (
            (1, 22),
            (4, 56),
            True,
        ),
        (
            (1, 23),
            (4, 56),
            True,
        ),
        (
            (2, 23),
            (4, 30),
            False,
        ),
        (
            (2, 23),
            (5, 20),
            False,
        ),
        (
            (4, 57),
            (5, 20),
            False,
        ),
    ],
)
def test_range_includes(a_start, a_end, expected):
    a = lsp.Range(lsp.Position(*a_start), lsp.Position(*a_end))
    b = lsp.Range(lsp.Position(1, 23), lsp.Position(4, 56))
    hamcrest.assert_that(a.includes(b), hamcrest.is_(expected))


def test_range_repr():
    a = lsp.Range(lsp.Position(1, 23), lsp.Position(4, 56))
    hamcrest.assert_that(f"{a!r}", hamcrest.is_("1:23-4:56"))
