# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

from typing import Any, Optional, Union

import attrs
import cattrs
import cattrs.gen

from . import types as lsp_types

# Flag to ensure we only resolve forward references once.
_resolved_forward_references = False


def resolve_forward_references() -> None:
    """Resolve forward references for faster processing with cattrs."""
    global _resolved_forward_references
    if not _resolved_forward_references:
        # Creating a concrete list here because `resolve_types` mutates the provided map.
        items = list(filter(lambda p: attrs.has(p[1]), lsp_types.ALL_TYPES_MAP.items()))
        for _, value in items:
            attrs.resolve_types(value, lsp_types.ALL_TYPES_MAP, {})
        _resolved_forward_references = True


def get_converter(
    converter: Optional[cattrs.Converter] = cattrs.Converter(),
) -> cattrs.Converter:
    """Adds cattrs hooks for LSP lsp_types to the given converter."""
    resolve_forward_references()
    converter = _register_required_structure_hooks(converter)
    return _register_custom_property_hooks(converter)


def _register_required_structure_hooks(
    converter: cattrs.Converter,
) -> cattrs.Converter:
    def _optional_union_int_str(object_: Any, type_: type) -> Optional[Union[int, str]]:
        return _union_int_str(object_, type_) if object_ else None

    def _union_int_str(object_: Any, type_: type) -> Union[int, str]:
        return str(object_) if isinstance(object_, str) else int(object_)

    def _lsp_object_hook(
        object_: Any, type_: type
    ) -> Union[lsp_types.LSPObject, lsp_types.LSPArray, str, int, float, bool, None]:
        if not object_:
            return object_
        else:
            for type_ in [str, bool, int, float, list]:
                if isinstance(object_, type_):
                    return type_(object_)
            else:
                return object_

    def _optional_union_str_bool(
        object_: Any, type_: type
    ) -> Optional[Union[str, bool]]:
        if object_:
            return str(object_) if isinstance(object_, str) else bool(object_)
        else:
            return None

    def _text_document_filter_hook(
        object_: Any, type_: type
    ) -> Union[
        str,
        lsp_types.TextDocumentFilter_Type1,
        lsp_types.TextDocumentFilter_Type2,
        lsp_types.TextDocumentFilter_Type3,
        lsp_types.NotebookCellTextDocumentFilter,
    ]:
        if isinstance(object_, str):
            return str(object_)
        elif "notebook" in object_:
            return converter.structure(
                object_, lsp_types.NotebookCellTextDocumentFilter
            )
        elif "language" in object_:
            return converter.structure(object_, lsp_types.TextDocumentFilter_Type1)
        elif "scheme" in object_:
            return converter.structure(object_, lsp_types.TextDocumentFilter_Type2)
        else:
            return converter.structure(object_, lsp_types.TextDocumentFilter_Type3)

    def _notebook_filter_hook(
        object_: Any, type_: type
    ) -> Union[
        str,
        lsp_types.NotebookDocumentFilter_Type1,
        lsp_types.NotebookDocumentFilter_Type2,
        lsp_types.NotebookDocumentFilter_Type3,
    ]:
        if isinstance(object_, str):
            return str(object_)
        elif "notebookType" in object_:
            return converter.structure(object_, lsp_types.NotebookDocumentFilter_Type1)
        elif "scheme" in object_:
            return converter.structure(object_, lsp_types.NotebookDocumentFilter_Type2)
        else:
            return converter.structure(object_, lsp_types.NotebookDocumentFilter_Type3)

    DocumentSelectorItem = Union[str, "DocumentFilter"]
    NotebookSelectorItem = attrs.fields(
        lsp_types.NotebookCellTextDocumentFilter
    ).notebook.type
    STRUCTURE_HOOKS = [
        (type(None), lambda _object, _type: None),
        (Optional[Union[int, str]], _optional_union_int_str),
        (Union[int, str], _union_int_str),
        (lsp_types.LSPAny, _lsp_object_hook),
        (Optional[Union[str, bool]], _optional_union_str_bool),
        (
            Union[
                str,
                lsp_types.TextDocumentFilter_Type1,
                lsp_types.TextDocumentFilter_Type2,
                lsp_types.TextDocumentFilter_Type3,
                lsp_types.NotebookCellTextDocumentFilter,
            ],
            _text_document_filter_hook,
        ),
        (DocumentSelectorItem, _text_document_filter_hook),
        (
            Union[
                str,
                lsp_types.NotebookDocumentFilter_Type1,
                lsp_types.NotebookDocumentFilter_Type2,
                lsp_types.NotebookDocumentFilter_Type3,
            ],
            _notebook_filter_hook,
        ),
        (NotebookSelectorItem, _notebook_filter_hook),
    ]

    for type_, hook in STRUCTURE_HOOKS:
        converter.register_structure_hook(type_, hook)

    return converter


def _register_custom_property_hooks(converter: cattrs.Converter) -> cattrs.Converter:
    def _keyword_rename(name: str):
        # TODO: when min Python becomes >= 3.9, then update this to:
        # return name.removesuffix("_")
        return name[:-1] if name.endswith("_") else name

    def _omit(cls: type, prop: str) -> bool:
        special = lsp_types.is_special_property(cls, prop)
        return not special

    def _with_custom_unstructure(cls: type) -> Any:
        attributes = {
            a.name: cattrs.gen.override(
                rename=_keyword_rename(a.name),
                omit_if_default=_omit(cls, a.name),
            )
            for a in attrs.fields(cls)
        }
        return cattrs.gen.make_dict_unstructure_fn(cls, converter, **attributes)

    def _with_custom_structure(cls: type) -> Any:
        attributes = {
            a.name: cattrs.gen.override(
                rename=_keyword_rename(a.name),
                omit_if_default=_omit(cls, a.name),
            )
            for a in attrs.fields(cls)
        }
        return cattrs.gen.make_dict_structure_fn(cls, converter, **attributes)

    converter.register_unstructure_hook_factory(attrs.has, _with_custom_unstructure)
    converter.register_structure_hook_factory(attrs.has, _with_custom_structure)
    return converter


DEFAULT_CONVERTER = get_converter()
