# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

# ****** THIS IS A GENERATED FILE, DO NOT EDIT. ******
# Steps to generate:
# 1. Checkout https://github.com/microsoft/lsprotocol
# 2. Install nox: `python -m pip install nox`
# 3. Run command: `python -m nox --session build_lsp`

from typing import Any, List, Optional, Union

import cattrs

from . import types as lsp_types


def _register_generated_hooks(converter: cattrs.Converter) -> cattrs.Converter:
    def _text_document_sync_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, (bool, int, str, float)):
            return object_
        return converter.structure(object_, lsp_types.TextDocumentSyncOptions)

    def _notebook_document_sync_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if "id" in object_:
            return converter.structure(
                object_, lsp_types.NotebookDocumentSyncRegistrationOptions
            )
        else:
            return converter.structure(object_, lsp_types.NotebookDocumentSyncOptions)

    def _hover_provider_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, (bool, int, str, float)):
            return object_
        return converter.structure(object_, lsp_types.HoverOptions)

    def _declaration_provider_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, (bool, int, str, float)):
            return object_
        if "id" in object_:
            return converter.structure(
                object_, lsp_types.DeclarationRegistrationOptions
            )
        else:
            return converter.structure(object_, lsp_types.DeclarationOptions)

    def _definition_provider_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, (bool, int, str, float)):
            return object_
        return converter.structure(object_, lsp_types.DefinitionOptions)

    def _type_definition_provider_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, (bool, int, str, float)):
            return object_
        if "id" in object_:
            return converter.structure(
                object_, lsp_types.TypeDefinitionRegistrationOptions
            )
        else:
            return converter.structure(object_, lsp_types.TypeDefinitionOptions)

    def _implementation_provider_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, (bool, int, str, float)):
            return object_
        if "id" in object_:
            return converter.structure(
                object_, lsp_types.ImplementationRegistrationOptions
            )
        else:
            return converter.structure(object_, lsp_types.ImplementationOptions)

    def _references_provider_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, (bool, int, str, float)):
            return object_
        return converter.structure(object_, lsp_types.ReferenceOptions)

    def _document_highlight_provider_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, (bool, int, str, float)):
            return object_
        return converter.structure(object_, lsp_types.DocumentHighlightOptions)

    def _document_symbol_provider_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, (bool, int, str, float)):
            return object_
        return converter.structure(object_, lsp_types.DocumentSymbolOptions)

    def _code_action_provider_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, (bool, int, str, float)):
            return object_
        return converter.structure(object_, lsp_types.CodeActionOptions)

    def _color_provider_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, (bool, int, str, float)):
            return object_
        if "id" in object_:
            return converter.structure(
                object_, lsp_types.DocumentColorRegistrationOptions
            )
        else:
            return converter.structure(object_, lsp_types.DocumentColorOptions)

    def _workspace_symbol_provider_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, (bool, int, str, float)):
            return object_
        return converter.structure(object_, lsp_types.WorkspaceSymbolOptions)

    def _document_formatting_provider_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, (bool, int, str, float)):
            return object_
        return converter.structure(object_, lsp_types.DocumentFormattingOptions)

    def _document_range_formatting_provider_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, (bool, int, str, float)):
            return object_
        return converter.structure(object_, lsp_types.DocumentRangeFormattingOptions)

    def _rename_provider_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, (bool, int, str, float)):
            return object_
        return converter.structure(object_, lsp_types.RenameOptions)

    def _folding_range_provider_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, (bool, int, str, float)):
            return object_
        if "id" in object_:
            return converter.structure(
                object_, lsp_types.FoldingRangeRegistrationOptions
            )
        else:
            return converter.structure(object_, lsp_types.FoldingRangeOptions)

    def _selection_range_provider_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, (bool, int, str, float)):
            return object_
        if "id" in object_:
            return converter.structure(
                object_, lsp_types.SelectionRangeRegistrationOptions
            )
        else:
            return converter.structure(object_, lsp_types.SelectionRangeOptions)

    def _call_hierarchy_provider_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, (bool, int, str, float)):
            return object_
        if "id" in object_:
            return converter.structure(
                object_, lsp_types.CallHierarchyRegistrationOptions
            )
        else:
            return converter.structure(object_, lsp_types.CallHierarchyOptions)

    def _linked_editing_range_provider_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, (bool, int, str, float)):
            return object_
        if "id" in object_:
            return converter.structure(
                object_, lsp_types.LinkedEditingRangeRegistrationOptions
            )
        else:
            return converter.structure(object_, lsp_types.LinkedEditingRangeOptions)

    def _semantic_tokens_provider_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if "id" in object_:
            return converter.structure(
                object_, lsp_types.SemanticTokensRegistrationOptions
            )
        else:
            return converter.structure(object_, lsp_types.SemanticTokensOptions)

    def _moniker_provider_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, (bool, int, str, float)):
            return object_
        if "id" in object_:
            return converter.structure(object_, lsp_types.MonikerRegistrationOptions)
        else:
            return converter.structure(object_, lsp_types.MonikerOptions)

    def _type_hierarchy_provider_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, (bool, int, str, float)):
            return object_
        if "id" in object_:
            return converter.structure(
                object_, lsp_types.TypeHierarchyRegistrationOptions
            )
        else:
            return converter.structure(object_, lsp_types.TypeHierarchyOptions)

    def _inline_value_provider_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, (bool, int, str, float)):
            return object_
        if "id" in object_:
            return converter.structure(
                object_, lsp_types.InlineValueRegistrationOptions
            )
        else:
            return converter.structure(object_, lsp_types.InlineValueOptions)

    def _inlay_hint_provider_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, (bool, int, str, float)):
            return object_
        if "id" in object_:
            return converter.structure(object_, lsp_types.InlayHintRegistrationOptions)
        else:
            return converter.structure(object_, lsp_types.InlayHintOptions)

    def _diagnostic_provider_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if "id" in object_:
            return converter.structure(object_, lsp_types.DiagnosticRegistrationOptions)
        else:
            return converter.structure(object_, lsp_types.DiagnosticOptions)

    def _save_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, (bool, int, str, float)):
            return object_
        return converter.structure(object_, lsp_types.SaveOptions)

    def _code_action_hook(object_: Any, _: type):
        if "command" in object_:
            return converter.structure(object_, lsp_types.Command)
        else:
            return converter.structure(object_, lsp_types.CodeAction)

    def _completion_list_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, list):
            return [
                converter.structure(item, lsp_types.CompletionItem) for item in object_
            ]
        else:
            return converter.structure(object_, lsp_types.CompletionList)

    def _location_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, list):
            return [
                converter.structure(
                    item,
                    (
                        lsp_types.LocationLink
                        if "targetUri" in item
                        else lsp_types.Location
                    ),
                )
                for item in object_
            ]
        else:
            return converter.structure(object_, lsp_types.Location)

    def _symbol_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, list):
            return [
                converter.structure(
                    item,
                    (
                        lsp_types.SymbolInformation
                        if "location" in item
                        else lsp_types.DocumentSymbol
                    ),
                )
                for item in object_
            ]

    def _markup_content_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, str):
            return object_
        if isinstance(object_, list):
            return [
                (
                    item
                    if isinstance(item, str)
                    else converter.structure(item, lsp_types.MarkedString_Type1)
                )
                for item in object_
            ]
        if "kind" in object_:
            return converter.structure(object_, lsp_types.MarkupContent)
        else:
            return converter.structure(object_, lsp_types.MarkedString_Type1)

    def _document_edit_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if "kind" in object_:
            if object_["kind"] == "create":
                return converter.structure(object_, lsp_types.CreateFile)
            elif object_["kind"] == "rename":
                return converter.structure(object_, lsp_types.RenameFile)
            elif object_["kind"] == "delete":
                return converter.structure(object_, lsp_types.DeleteFile)
            else:
                raise ValueError("Unknown edit kind: ", object_)
        else:
            return converter.structure(object_, lsp_types.TextDocumentEdit)

    def _semantic_tokens_hook(object_: Any, _: type):
        if object_ is None:
            return None
        if isinstance(object_, (bool, int, str, float)):
            return object_
        return converter.structure(object_, lsp_types.SemanticTokensOptionsFullType1)

    structure_hooks = [
        (
            Optional[
                Union[lsp_types.TextDocumentSyncOptions, lsp_types.TextDocumentSyncKind]
            ],
            _text_document_sync_hook,
        ),
        (
            Optional[
                Union[
                    lsp_types.NotebookDocumentSyncOptions,
                    lsp_types.NotebookDocumentSyncRegistrationOptions,
                ]
            ],
            _notebook_document_sync_hook,
        ),
        (Optional[Union[bool, lsp_types.HoverOptions]], _hover_provider_hook),
        (
            Optional[
                Union[
                    bool,
                    lsp_types.DeclarationOptions,
                    lsp_types.DeclarationRegistrationOptions,
                ]
            ],
            _declaration_provider_hook,
        ),
        (Optional[Union[bool, lsp_types.DefinitionOptions]], _definition_provider_hook),
        (
            Optional[
                Union[
                    bool,
                    lsp_types.TypeDefinitionOptions,
                    lsp_types.TypeDefinitionRegistrationOptions,
                ]
            ],
            _type_definition_provider_hook,
        ),
        (
            Optional[
                Union[
                    bool,
                    lsp_types.ImplementationOptions,
                    lsp_types.ImplementationRegistrationOptions,
                ]
            ],
            _implementation_provider_hook,
        ),
        (Optional[Union[bool, lsp_types.ReferenceOptions]], _references_provider_hook),
        (
            Optional[Union[bool, lsp_types.DocumentHighlightOptions]],
            _document_highlight_provider_hook,
        ),
        (
            Optional[Union[bool, lsp_types.DocumentSymbolOptions]],
            _document_symbol_provider_hook,
        ),
        (
            Optional[Union[bool, lsp_types.CodeActionOptions]],
            _code_action_provider_hook,
        ),
        (
            Optional[
                Union[
                    bool,
                    lsp_types.DocumentColorOptions,
                    lsp_types.DocumentColorRegistrationOptions,
                ]
            ],
            _color_provider_hook,
        ),
        (
            Optional[Union[bool, lsp_types.WorkspaceSymbolOptions]],
            _workspace_symbol_provider_hook,
        ),
        (
            Optional[Union[bool, lsp_types.DocumentFormattingOptions]],
            _document_formatting_provider_hook,
        ),
        (
            Optional[Union[bool, lsp_types.DocumentRangeFormattingOptions]],
            _document_range_formatting_provider_hook,
        ),
        (Optional[Union[bool, lsp_types.RenameOptions]], _rename_provider_hook),
        (
            Optional[
                Union[
                    bool,
                    lsp_types.FoldingRangeOptions,
                    lsp_types.FoldingRangeRegistrationOptions,
                ]
            ],
            _folding_range_provider_hook,
        ),
        (
            Optional[
                Union[
                    bool,
                    lsp_types.SelectionRangeOptions,
                    lsp_types.SelectionRangeRegistrationOptions,
                ]
            ],
            _selection_range_provider_hook,
        ),
        (
            Optional[
                Union[
                    bool,
                    lsp_types.CallHierarchyOptions,
                    lsp_types.CallHierarchyRegistrationOptions,
                ]
            ],
            _call_hierarchy_provider_hook,
        ),
        (
            Optional[
                Union[
                    bool,
                    lsp_types.LinkedEditingRangeOptions,
                    lsp_types.LinkedEditingRangeRegistrationOptions,
                ]
            ],
            _linked_editing_range_provider_hook,
        ),
        (
            Optional[
                Union[
                    lsp_types.SemanticTokensOptions,
                    lsp_types.SemanticTokensRegistrationOptions,
                ]
            ],
            _semantic_tokens_provider_hook,
        ),
        (
            Optional[
                Union[
                    bool, lsp_types.MonikerOptions, lsp_types.MonikerRegistrationOptions
                ]
            ],
            _moniker_provider_hook,
        ),
        (
            Optional[
                Union[
                    bool,
                    lsp_types.TypeHierarchyOptions,
                    lsp_types.TypeHierarchyRegistrationOptions,
                ]
            ],
            _type_hierarchy_provider_hook,
        ),
        (
            Optional[
                Union[
                    bool,
                    lsp_types.InlineValueOptions,
                    lsp_types.InlineValueRegistrationOptions,
                ]
            ],
            _inline_value_provider_hook,
        ),
        (
            Optional[
                Union[
                    bool,
                    lsp_types.InlayHintOptions,
                    lsp_types.InlayHintRegistrationOptions,
                ]
            ],
            _inlay_hint_provider_hook,
        ),
        (
            Optional[
                Union[
                    lsp_types.DiagnosticOptions, lsp_types.DiagnosticRegistrationOptions
                ]
            ],
            _diagnostic_provider_hook,
        ),
        (
            Optional[Union[lsp_types.SaveOptions, bool]],
            _save_hook,
        ),
        (
            Union[lsp_types.Command, lsp_types.CodeAction],
            _code_action_hook,
        ),
        (
            Optional[Union[List[lsp_types.CompletionItem], lsp_types.CompletionList]],
            _completion_list_hook,
        ),
        (
            Optional[
                Union[
                    lsp_types.Location,
                    List[lsp_types.Location],
                    List[lsp_types.LocationLink],
                ]
            ],
            _location_hook,
        ),
        (
            Optional[
                Union[List[lsp_types.SymbolInformation], List[lsp_types.DocumentSymbol]]
            ],
            _symbol_hook,
        ),
        (
            Union[
                lsp_types.MarkupContent,
                str,
                lsp_types.MarkedString_Type1,
                List[Union[str, lsp_types.MarkedString_Type1]],
            ],
            _markup_content_hook,
        ),
        (
            Union[
                lsp_types.TextDocumentEdit,
                lsp_types.CreateFile,
                lsp_types.RenameFile,
                lsp_types.DeleteFile,
            ],
            _document_edit_hook,
        ),
        (
            Optional[Union[bool, lsp_types.SemanticTokensOptionsFullType1]],
            _semantic_tokens_hook,
        ),
    ]
    for type_, hook in structure_hooks:
        converter.register_structure_hook(type_, hook)
    return converter
