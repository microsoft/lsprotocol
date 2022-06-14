# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

import typing
from types import NoneType

import attrs
import cattrs
from cattrs.gen import make_dict_structure_fn, make_dict_unstructure_fn, override

from . import types

_resolved = False


def resolve_forward_references():
    """Resolve forward references for faster processing with cattrs."""
    global _resolved
    if not _resolved:
        keys = list(types.ALL_TYPES_MAP.keys())
        for key in keys:
            value = types.ALL_TYPES_MAP[key]
            if attrs.has(value):
                attrs.resolve_types(value, types.ALL_TYPES_MAP, {})
        _resolved = True


def get_converter(
    converter: typing.Optional[cattrs.Converter] = cattrs.Converter(),
) -> cattrs.Converter:
    """Adds cattrs hooks for LSP types to the given converter."""
    resolve_forward_references()
    converter = _register_required_structure_hooks(converter)
    return _register_custom_property_hooks(converter)


def _register_required_structure_hooks(
    converter: cattrs.Converter,
) -> cattrs.Converter:
    def _optional_union_int_str(
        o: typing.Optional[typing.Union[int, str]], t: typing.Any
    ) -> typing.Optional[typing.Union[int, str]]:
        return _union_int_str(o, t) if o else None

    def _union_int_str(
        o: typing.Union[int, str], _t: typing.Any
    ) -> typing.Union[int, str]:
        return str(o) if isinstance(o, str) else int(o)

    def _lsp_object_hook(
        o: typing.Union[types.LSPObject, types.LSPArray, str, int, float, bool, None],
        _t: typing.Any,
    ) -> typing.Union[types.LSPObject, types.LSPArray, str, int, float, bool, None]:
        if not o:
            return o
        if isinstance(o, str):
            return str(o)
        if isinstance(o, bool):
            return bool(o)
        if isinstance(o, int):
            return int(o)
        if isinstance(o, float):
            return float(o)
        if isinstance(o, list):
            return list(o)
        return o

    def _optional_union_str_bool(
        o: typing.Optional[typing.Union[str, bool]], _t: typing.Any
    ) -> typing.Optional[typing.Union[str, bool]]:
        if o:
            return str(o) if isinstance(o, str) else bool(o)
        return None

    def _text_document_filter_hook(
        o: typing.Union[
            str,
            types.TextDocumentFilter_Type1,
            types.TextDocumentFilter_Type2,
            types.TextDocumentFilter_Type3,
            types.NotebookCellTextDocumentFilter,
        ],
        _t: typing.Any,
    ) -> typing.Union[
        str,
        types.TextDocumentFilter_Type1,
        types.TextDocumentFilter_Type2,
        types.TextDocumentFilter_Type3,
        types.NotebookCellTextDocumentFilter,
    ]:
        if isinstance(o, str):
            return str(o)
        if "notebook" in o:
            return converter.structure(o, types.NotebookCellTextDocumentFilter)
        if "language" in o:
            return converter.structure(o, types.TextDocumentFilter_Type1)
        if "scheme" in o:
            return converter.structure(o, types.TextDocumentFilter_Type2)
        return converter.structure(o, types.TextDocumentFilter_Type3)

    def _notebook_filter_hook(
        o: typing.Union[
            str,
            types.NotebookDocumentFilter_Type1,
            types.NotebookDocumentFilter_Type2,
            types.NotebookDocumentFilter_Type3,
        ],
        _t: typing.Any,
    ) -> typing.Union[
        str,
        types.NotebookDocumentFilter_Type1,
        types.NotebookDocumentFilter_Type2,
        types.NotebookDocumentFilter_Type3,
    ]:
        if isinstance(o, str):
            return str(o)
        if "notebookType" in o:
            return converter.structure(o, types.NotebookDocumentFilter_Type1)
        if "scheme" in o:
            return converter.structure(o, types.NotebookDocumentFilter_Type2)
        return converter.structure(o, types.NotebookDocumentFilter_Type3)

    STRUCTURE_HOOKS = [
        (NoneType, lambda _x, _y: None),
        (typing.Optional[typing.Union[int, str]], _optional_union_int_str),
        (typing.Union[int, str], _union_int_str),
        (
            typing.Union[types.LSPObject, types.LSPArray, str, int, float, bool, None],
            _lsp_object_hook,
        ),
        (typing.Optional[typing.Union[str, bool]], _optional_union_str_bool),
        (
            typing.Union[
                str,
                types.TextDocumentFilter_Type1,
                types.TextDocumentFilter_Type2,
                types.TextDocumentFilter_Type3,
                types.NotebookCellTextDocumentFilter,
            ],
            _text_document_filter_hook,
        ),
        (
            typing.Union[
                str,
                types.NotebookDocumentFilter_Type1,
                types.NotebookDocumentFilter_Type2,
                types.NotebookDocumentFilter_Type3,
            ],
            _notebook_filter_hook,
        ),
    ]

    for type_, hook in STRUCTURE_HOOKS:
        converter.register_structure_hook(type_, hook)

    return converter


def _register_custom_property_hooks(converter: cattrs.Converter) -> cattrs.Converter:
    def _keyword_rename(name: str):
        return name[:-1] if name.endswith("_") else name

    def _omit(cls, prop):
        special = types.is_special_property(cls, prop)
        return not special

    def _with_custom_unstructure(cls):
        return make_dict_unstructure_fn(
            cls,
            converter,
            **{
                a.name: override(
                    rename=_keyword_rename(a.name), omit_if_default=_omit(cls, a.name)
                )
                for a in attrs.fields(cls)
            },
        )

    def _with_custom_structure(cls):
        return make_dict_structure_fn(
            cls,
            converter,
            **{
                a.name: override(
                    rename=_keyword_rename(a.name),
                    omit_if_default=_omit(cls, a.name),
                )
                for a in attrs.fields(cls)
            },
        )

    converter.register_unstructure_hook_factory(attrs.has, _with_custom_unstructure)
    converter.register_structure_hook_factory(attrs.has, _with_custom_structure)
    return converter


DEFAULT_CONVERTER = get_converter()
