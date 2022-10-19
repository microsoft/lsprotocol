# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

import sys
from typing import Any, List, Optional, Union

import attrs
import cattrs
import cattrs.gen

from . import _hooks
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
    converter: cattrs.Converter = cattrs.Converter(),
) -> cattrs.Converter:
    """Adds cattrs hooks for LSP lsp_types to the given converter."""
    resolve_forward_references()
    converter = _hooks._register_generated_hooks(converter)
    converter = _register_required_structure_hooks(converter)
    return _register_custom_property_hooks(converter)


def _register_required_structure_hooks(
    converter: cattrs.Converter,
) -> cattrs.Converter:
    def _lsp_object_hook(object_: Any, type_: type) -> Any:
        if object_ is None:
            return object_
        else:
            for type_ in [str, bool, int, float, list]:
                if isinstance(object_, type_):
                    return type_(object_)
            else:
                return object_

    def _text_document_filter_hook(
        object_: Any, _: type
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
        object_: Any, _: type
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

    NotebookSelectorItem = attrs.fields(
        lsp_types.NotebookCellTextDocumentFilter
    ).notebook.type
    STRUCTURE_HOOKS = [
        (type(None), lambda object_, _type: object_),
        (Optional[Union[int, str]], lambda object_, _type: object_),
        (Union[int, str], lambda object_, _type: object_),
        (lsp_types.LSPAny, _lsp_object_hook),
        (Optional[Union[str, bool]], lambda object_, _type: object_),
        (Optional[Union[bool, Any]], lambda object_, _type: object_),
        (
            Union[
                lsp_types.TextDocumentFilter_Type1,
                lsp_types.TextDocumentFilter_Type2,
                lsp_types.TextDocumentFilter_Type3,
                lsp_types.NotebookCellTextDocumentFilter,
            ],
            _text_document_filter_hook,
        ),
        (lsp_types.DocumentFilter, _text_document_filter_hook),
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
        (
            Union[lsp_types.LSPObject, List["LSPAny"], str, int, float, bool, None],
            _lsp_object_hook,
        ),
        (
            Union[
                lsp_types.LSPObject, List[lsp_types.LSPAny], str, int, float, bool, None
            ],
            _lsp_object_hook,
        ),
    ]

    if sys.version_info > (3, 8):
        STRUCTURE_HOOKS += [
            (
                Union[
                    lsp_types.LSPObject,
                    List[
                        Union[
                            lsp_types.LSPObject,
                            List["LSPAny"],
                            str,
                            int,
                            float,
                            bool,
                            None,
                        ]
                    ],
                    str,
                    int,
                    float,
                    bool,
                    None,
                ],
                _lsp_object_hook,
            )
        ]

    for type_, hook in STRUCTURE_HOOKS:
        converter.register_structure_hook(type_, hook)

    return converter


def _register_custom_property_hooks(converter: cattrs.Converter) -> cattrs.Converter:
    def _to_camel_case(name: str) -> str:
        # TODO: when min Python becomes >= 3.9, then update this to:
        # `return name.removesuffix("_")`.
        new_name = name[:-1] if name.endswith("_") else name
        parts = new_name.split("_")
        return parts[0] + "".join(p.title() for p in parts[1:])

    def _omit(cls: type, prop: str) -> bool:
        special = lsp_types.is_special_property(cls, prop)
        return not special

    def _with_custom_unstructure(cls: type) -> Any:
        attributes = {
            a.name: cattrs.gen.override(
                rename=_to_camel_case(a.name),
                omit_if_default=_omit(cls, a.name),
            )
            for a in attrs.fields(cls)
        }
        return cattrs.gen.make_dict_unstructure_fn(cls, converter, **attributes)

    def _with_custom_structure(cls: type) -> Any:
        attributes = {
            a.name: cattrs.gen.override(
                rename=_to_camel_case(a.name),
                omit_if_default=_omit(cls, a.name),
            )
            for a in attrs.fields(cls)
        }
        return cattrs.gen.make_dict_structure_fn(cls, converter, **attributes)

    converter.register_unstructure_hook_factory(attrs.has, _with_custom_unstructure)
    converter.register_structure_hook_factory(attrs.has, _with_custom_structure)
    return converter
