# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

# ****** THIS IS A GENERATED FILE, DO NOT EDIT. ******
# Steps to generate:
# 1. Checkout https://github.com/microsoft/lsprotocol
# 2. Install nox: `python -m pip install nox`
# 3. Run command: `python -m nox --session build_lsp`

module LSProtocol
  CALL_HIERARCHY_INCOMING_CALLS            = "callHierarchy/incomingCalls"
  CALL_HIERARCHY_OUTGOING_CALLS            = "callHierarchy/outgoingCalls"
  CANCEL_REQUEST                           = "$/cancelRequest"
  CLIENT_REGISTER_CAPABILITY               = "client/registerCapability"
  CLIENT_UNREGISTER_CAPABILITY             = "client/unregisterCapability"
  CODE_ACTION_RESOLVE                      = "codeAction/resolve"
  CODE_LENS_RESOLVE                        = "codeLens/resolve"
  COMPLETION_ITEM_RESOLVE                  = "completionItem/resolve"
  DOCUMENT_LINK_RESOLVE                    = "documentLink/resolve"
  EXIT                                     = "exit"
  INITIALIZE                               = "initialize"
  INITIALIZED                              = "initialized"
  INLAY_HINT_RESOLVE                       = "inlayHint/resolve"
  LOG_TRACE                                = "$/logTrace"
  NOTEBOOK_DOCUMENT_DID_CHANGE             = "notebookDocument/didChange"
  NOTEBOOK_DOCUMENT_DID_CLOSE              = "notebookDocument/didClose"
  NOTEBOOK_DOCUMENT_DID_OPEN               = "notebookDocument/didOpen"
  NOTEBOOK_DOCUMENT_DID_SAVE               = "notebookDocument/didSave"
  PROGRESS                                 = "$/progress"
  SET_TRACE                                = "$/setTrace"
  SHUTDOWN                                 = "shutdown"
  TELEMETRY_EVENT                          = "telemetry/event"
  TEXT_DOCUMENT_CODE_ACTION                = "textDocument/codeAction"
  TEXT_DOCUMENT_CODE_LENS                  = "textDocument/codeLens"
  TEXT_DOCUMENT_COLOR_PRESENTATION         = "textDocument/colorPresentation"
  TEXT_DOCUMENT_COMPLETION                 = "textDocument/completion"
  TEXT_DOCUMENT_DECLARATION                = "textDocument/declaration"
  TEXT_DOCUMENT_DEFINITION                 = "textDocument/definition"
  TEXT_DOCUMENT_DIAGNOSTIC                 = "textDocument/diagnostic"
  TEXT_DOCUMENT_DID_CHANGE                 = "textDocument/didChange"
  TEXT_DOCUMENT_DID_CLOSE                  = "textDocument/didClose"
  TEXT_DOCUMENT_DID_OPEN                   = "textDocument/didOpen"
  TEXT_DOCUMENT_DID_SAVE                   = "textDocument/didSave"
  TEXT_DOCUMENT_DOCUMENT_COLOR             = "textDocument/documentColor"
  TEXT_DOCUMENT_DOCUMENT_HIGHLIGHT         = "textDocument/documentHighlight"
  TEXT_DOCUMENT_DOCUMENT_LINK              = "textDocument/documentLink"
  TEXT_DOCUMENT_DOCUMENT_SYMBOL            = "textDocument/documentSymbol"
  TEXT_DOCUMENT_FOLDING_RANGE              = "textDocument/foldingRange"
  TEXT_DOCUMENT_FORMATTING                 = "textDocument/formatting"
  TEXT_DOCUMENT_HOVER                      = "textDocument/hover"
  TEXT_DOCUMENT_IMPLEMENTATION             = "textDocument/implementation"
  TEXT_DOCUMENT_INLAY_HINT                 = "textDocument/inlayHint"
  TEXT_DOCUMENT_INLINE_COMPLETION          = "textDocument/inlineCompletion"
  TEXT_DOCUMENT_INLINE_VALUE               = "textDocument/inlineValue"
  TEXT_DOCUMENT_LINKED_EDITING_RANGE       = "textDocument/linkedEditingRange"
  TEXT_DOCUMENT_MONIKER                    = "textDocument/moniker"
  TEXT_DOCUMENT_ON_TYPE_FORMATTING         = "textDocument/onTypeFormatting"
  TEXT_DOCUMENT_PREPARE_CALL_HIERARCHY     = "textDocument/prepareCallHierarchy"
  TEXT_DOCUMENT_PREPARE_RENAME             = "textDocument/prepareRename"
  TEXT_DOCUMENT_PREPARE_TYPE_HIERARCHY     = "textDocument/prepareTypeHierarchy"
  TEXT_DOCUMENT_PUBLISH_DIAGNOSTICS        = "textDocument/publishDiagnostics"
  TEXT_DOCUMENT_RANGES_FORMATTING          = "textDocument/rangesFormatting"
  TEXT_DOCUMENT_RANGE_FORMATTING           = "textDocument/rangeFormatting"
  TEXT_DOCUMENT_REFERENCES                 = "textDocument/references"
  TEXT_DOCUMENT_RENAME                     = "textDocument/rename"
  TEXT_DOCUMENT_SELECTION_RANGE            = "textDocument/selectionRange"
  TEXT_DOCUMENT_SEMANTIC_TOKENS_FULL       = "textDocument/semanticTokens/full"
  TEXT_DOCUMENT_SEMANTIC_TOKENS_FULL_DELTA = "textDocument/semanticTokens/full/delta"
  TEXT_DOCUMENT_SEMANTIC_TOKENS_RANGE      = "textDocument/semanticTokens/range"
  TEXT_DOCUMENT_SIGNATURE_HELP             = "textDocument/signatureHelp"
  TEXT_DOCUMENT_TYPE_DEFINITION            = "textDocument/typeDefinition"
  TEXT_DOCUMENT_WILL_SAVE                  = "textDocument/willSave"
  TEXT_DOCUMENT_WILL_SAVE_WAIT_UNTIL       = "textDocument/willSaveWaitUntil"
  TYPE_HIERARCHY_SUBTYPES                  = "typeHierarchy/subtypes"
  TYPE_HIERARCHY_SUPERTYPES                = "typeHierarchy/supertypes"
  WINDOW_LOG_MESSAGE                       = "window/logMessage"
  WINDOW_SHOW_DOCUMENT                     = "window/showDocument"
  WINDOW_SHOW_MESSAGE                      = "window/showMessage"
  WINDOW_SHOW_MESSAGE_REQUEST              = "window/showMessageRequest"
  WINDOW_WORK_DONE_PROGRESS_CANCEL         = "window/workDoneProgress/cancel"
  WINDOW_WORK_DONE_PROGRESS_CREATE         = "window/workDoneProgress/create"
  WORKSPACE_APPLY_EDIT                     = "workspace/applyEdit"
  WORKSPACE_CODE_LENS_REFRESH              = "workspace/codeLens/refresh"
  WORKSPACE_CONFIGURATION                  = "workspace/configuration"
  WORKSPACE_DIAGNOSTIC                     = "workspace/diagnostic"
  WORKSPACE_DIAGNOSTIC_REFRESH             = "workspace/diagnostic/refresh"
  WORKSPACE_DID_CHANGE_CONFIGURATION       = "workspace/didChangeConfiguration"
  WORKSPACE_DID_CHANGE_WATCHED_FILES       = "workspace/didChangeWatchedFiles"
  WORKSPACE_DID_CHANGE_WORKSPACE_FOLDERS   = "workspace/didChangeWorkspaceFolders"
  WORKSPACE_DID_CREATE_FILES               = "workspace/didCreateFiles"
  WORKSPACE_DID_DELETE_FILES               = "workspace/didDeleteFiles"
  WORKSPACE_DID_RENAME_FILES               = "workspace/didRenameFiles"
  WORKSPACE_EXECUTE_COMMAND                = "workspace/executeCommand"
  WORKSPACE_FOLDING_RANGE_REFRESH          = "workspace/foldingRange/refresh"
  WORKSPACE_INLAY_HINT_REFRESH             = "workspace/inlayHint/refresh"
  WORKSPACE_INLINE_VALUE_REFRESH           = "workspace/inlineValue/refresh"
  WORKSPACE_SEMANTIC_TOKENS_REFRESH        = "workspace/semanticTokens/refresh"
  WORKSPACE_SYMBOL                         = "workspace/symbol"
  WORKSPACE_SYMBOL_RESOLVE                 = "workspaceSymbol/resolve"
  WORKSPACE_WILL_CREATE_FILES              = "workspace/willCreateFiles"
  WORKSPACE_WILL_DELETE_FILES              = "workspace/willDeleteFiles"
  WORKSPACE_WILL_RENAME_FILES              = "workspace/willRenameFiles"
  WORKSPACE_WORKSPACE_FOLDERS              = "workspace/workspaceFolders"

  METHOD_TO_TYPES = {
    # Requests
    "callHierarchy/incomingCalls": {
      CallHierarchyIncomingCallsRequest, CallHierarchyIncomingCallsResponse, CallHierarchyIncomingCallsParams, Nil,
    },
    "callHierarchy/outgoingCalls": {
      CallHierarchyOutgoingCallsRequest, CallHierarchyOutgoingCallsResponse, CallHierarchyOutgoingCallsParams, Nil,
    },
    "client/registerCapability": {
      ClientRegisterCapabilityRequest, ClientRegisterCapabilityResponse, RegistrationParams, Nil,
    },
    "client/unregisterCapability": {
      ClientUnregisterCapabilityRequest, ClientUnregisterCapabilityResponse, UnregistrationParams, Nil,
    },
    "codeAction/resolve": {
      CodeActionResolveRequest, CodeActionResolveResponse, CodeAction, Nil,
    },
    "codeLens/resolve": {
      CodeLensResolveRequest, CodeLensResolveResponse, CodeLens, Nil,
    },
    "completionItem/resolve": {
      CompletionItemResolveRequest, CompletionItemResolveResponse, CompletionItem, Nil,
    },
    "documentLink/resolve": {
      DocumentLinkResolveRequest, DocumentLinkResolveResponse, DocumentLink, Nil,
    },
    "initialize": {
      InitializeRequest, InitializeResponse, InitializeParams, Nil,
    },
    "inlayHint/resolve": {
      InlayHintResolveRequest, InlayHintResolveResponse, InlayHint, Nil,
    },
    "shutdown": {
      ShutdownRequest, ShutdownResponse, Nil, Nil,
    },
    "textDocument/codeAction": {
      TextDocumentCodeActionRequest, TextDocumentCodeActionResponse, CodeActionParams, CodeActionRegistrationOptions,
    },
    "textDocument/codeLens": {
      TextDocumentCodeLensRequest, TextDocumentCodeLensResponse, CodeLensParams, CodeLensRegistrationOptions,
    },
    "textDocument/colorPresentation": {
      TextDocumentColorPresentationRequest, TextDocumentColorPresentationResponse, ColorPresentationParams, TextDocumentColorPresentationOptions,
    },
    "textDocument/completion": {
      TextDocumentCompletionRequest, TextDocumentCompletionResponse, CompletionParams, CompletionRegistrationOptions,
    },
    "textDocument/declaration": {
      TextDocumentDeclarationRequest, TextDocumentDeclarationResponse, DeclarationParams, DeclarationRegistrationOptions,
    },
    "textDocument/definition": {
      TextDocumentDefinitionRequest, TextDocumentDefinitionResponse, DefinitionParams, DefinitionRegistrationOptions,
    },
    "textDocument/diagnostic": {
      TextDocumentDiagnosticRequest, TextDocumentDiagnosticResponse, DocumentDiagnosticParams, DiagnosticRegistrationOptions,
    },
    "textDocument/documentColor": {
      TextDocumentDocumentColorRequest, TextDocumentDocumentColorResponse, DocumentColorParams, DocumentColorRegistrationOptions,
    },
    "textDocument/documentHighlight": {
      TextDocumentDocumentHighlightRequest, TextDocumentDocumentHighlightResponse, DocumentHighlightParams, DocumentHighlightRegistrationOptions,
    },
    "textDocument/documentLink": {
      TextDocumentDocumentLinkRequest, TextDocumentDocumentLinkResponse, DocumentLinkParams, DocumentLinkRegistrationOptions,
    },
    "textDocument/documentSymbol": {
      TextDocumentDocumentSymbolRequest, TextDocumentDocumentSymbolResponse, DocumentSymbolParams, DocumentSymbolRegistrationOptions,
    },
    "textDocument/foldingRange": {
      TextDocumentFoldingRangeRequest, TextDocumentFoldingRangeResponse, FoldingRangeParams, FoldingRangeRegistrationOptions,
    },
    "textDocument/formatting": {
      TextDocumentFormattingRequest, TextDocumentFormattingResponse, DocumentFormattingParams, DocumentFormattingRegistrationOptions,
    },
    "textDocument/hover": {
      TextDocumentHoverRequest, TextDocumentHoverResponse, HoverParams, HoverRegistrationOptions,
    },
    "textDocument/implementation": {
      TextDocumentImplementationRequest, TextDocumentImplementationResponse, ImplementationParams, ImplementationRegistrationOptions,
    },
    "textDocument/inlayHint": {
      TextDocumentInlayHintRequest, TextDocumentInlayHintResponse, InlayHintParams, InlayHintRegistrationOptions,
    },
    "textDocument/inlineCompletion": {
      TextDocumentInlineCompletionRequest, TextDocumentInlineCompletionResponse, InlineCompletionParams, InlineCompletionRegistrationOptions,
    },
    "textDocument/inlineValue": {
      TextDocumentInlineValueRequest, TextDocumentInlineValueResponse, InlineValueParams, InlineValueRegistrationOptions,
    },
    "textDocument/linkedEditingRange": {
      TextDocumentLinkedEditingRangeRequest, TextDocumentLinkedEditingRangeResponse, LinkedEditingRangeParams, LinkedEditingRangeRegistrationOptions,
    },
    "textDocument/moniker": {
      TextDocumentMonikerRequest, TextDocumentMonikerResponse, MonikerParams, MonikerRegistrationOptions,
    },
    "textDocument/onTypeFormatting": {
      TextDocumentOnTypeFormattingRequest, TextDocumentOnTypeFormattingResponse, DocumentOnTypeFormattingParams, DocumentOnTypeFormattingRegistrationOptions,
    },
    "textDocument/prepareCallHierarchy": {
      TextDocumentPrepareCallHierarchyRequest, TextDocumentPrepareCallHierarchyResponse, CallHierarchyPrepareParams, CallHierarchyRegistrationOptions,
    },
    "textDocument/prepareRename": {
      TextDocumentPrepareRenameRequest, TextDocumentPrepareRenameResponse, PrepareRenameParams, Nil,
    },
    "textDocument/prepareTypeHierarchy": {
      TextDocumentPrepareTypeHierarchyRequest, TextDocumentPrepareTypeHierarchyResponse, TypeHierarchyPrepareParams, TypeHierarchyRegistrationOptions,
    },
    "textDocument/rangeFormatting": {
      TextDocumentRangeFormattingRequest, TextDocumentRangeFormattingResponse, DocumentRangeFormattingParams, DocumentRangeFormattingRegistrationOptions,
    },
    "textDocument/rangesFormatting": {
      TextDocumentRangesFormattingRequest, TextDocumentRangesFormattingResponse, DocumentRangesFormattingParams, DocumentRangeFormattingRegistrationOptions,
    },
    "textDocument/references": {
      TextDocumentReferencesRequest, TextDocumentReferencesResponse, ReferenceParams, ReferenceRegistrationOptions,
    },
    "textDocument/rename": {
      TextDocumentRenameRequest, TextDocumentRenameResponse, RenameParams, RenameRegistrationOptions,
    },
    "textDocument/selectionRange": {
      TextDocumentSelectionRangeRequest, TextDocumentSelectionRangeResponse, SelectionRangeParams, SelectionRangeRegistrationOptions,
    },
    "textDocument/semanticTokens/full": {
      TextDocumentSemanticTokensFullRequest, TextDocumentSemanticTokensFullResponse, SemanticTokensParams, SemanticTokensRegistrationOptions,
    },
    "textDocument/semanticTokens/full/delta": {
      TextDocumentSemanticTokensFullDeltaRequest, TextDocumentSemanticTokensFullDeltaResponse, SemanticTokensDeltaParams, SemanticTokensRegistrationOptions,
    },
    "textDocument/semanticTokens/range": {
      TextDocumentSemanticTokensRangeRequest, TextDocumentSemanticTokensRangeResponse, SemanticTokensRangeParams, Nil,
    },
    "textDocument/signatureHelp": {
      TextDocumentSignatureHelpRequest, TextDocumentSignatureHelpResponse, SignatureHelpParams, SignatureHelpRegistrationOptions,
    },
    "textDocument/typeDefinition": {
      TextDocumentTypeDefinitionRequest, TextDocumentTypeDefinitionResponse, TypeDefinitionParams, TypeDefinitionRegistrationOptions,
    },
    "textDocument/willSaveWaitUntil": {
      TextDocumentWillSaveWaitUntilRequest, TextDocumentWillSaveWaitUntilResponse, WillSaveTextDocumentParams, TextDocumentRegistrationOptions,
    },
    "typeHierarchy/subtypes": {
      TypeHierarchySubtypesRequest, TypeHierarchySubtypesResponse, TypeHierarchySubtypesParams, Nil,
    },
    "typeHierarchy/supertypes": {
      TypeHierarchySupertypesRequest, TypeHierarchySupertypesResponse, TypeHierarchySupertypesParams, Nil,
    },
    "window/showDocument": {
      WindowShowDocumentRequest, WindowShowDocumentResponse, ShowDocumentParams, Nil,
    },
    "window/showMessageRequest": {
      WindowShowMessageRequestRequest, WindowShowMessageRequestResponse, ShowMessageRequestParams, Nil,
    },
    "window/workDoneProgress/create": {
      WindowWorkDoneProgressCreateRequest, WindowWorkDoneProgressCreateResponse, WorkDoneProgressCreateParams, Nil,
    },
    "workspace/applyEdit": {
      WorkspaceApplyEditRequest, WorkspaceApplyEditResponse, ApplyWorkspaceEditParams, Nil,
    },
    "workspace/codeLens/refresh": {
      WorkspaceCodeLensRefreshRequest, WorkspaceCodeLensRefreshResponse, Nil, Nil,
    },
    "workspace/configuration": {
      WorkspaceConfigurationRequest, WorkspaceConfigurationResponse, ConfigurationParams, Nil,
    },
    "workspace/diagnostic": {
      WorkspaceDiagnosticRequest, WorkspaceDiagnosticResponse, WorkspaceDiagnosticParams, Nil,
    },
    "workspace/diagnostic/refresh": {
      WorkspaceDiagnosticRefreshRequest, WorkspaceDiagnosticRefreshResponse, Nil, Nil,
    },
    "workspace/executeCommand": {
      WorkspaceExecuteCommandRequest, WorkspaceExecuteCommandResponse, ExecuteCommandParams, ExecuteCommandRegistrationOptions,
    },
    "workspace/foldingRange/refresh": {
      WorkspaceFoldingRangeRefreshRequest, WorkspaceFoldingRangeRefreshResponse, Nil, Nil,
    },
    "workspace/inlayHint/refresh": {
      WorkspaceInlayHintRefreshRequest, WorkspaceInlayHintRefreshResponse, Nil, Nil,
    },
    "workspace/inlineValue/refresh": {
      WorkspaceInlineValueRefreshRequest, WorkspaceInlineValueRefreshResponse, Nil, Nil,
    },
    "workspace/semanticTokens/refresh": {
      WorkspaceSemanticTokensRefreshRequest, WorkspaceSemanticTokensRefreshResponse, Nil, Nil,
    },
    "workspace/symbol": {
      WorkspaceSymbolRequest, WorkspaceSymbolResponse, WorkspaceSymbolParams, WorkspaceSymbolRegistrationOptions,
    },
    "workspace/willCreateFiles": {
      WorkspaceWillCreateFilesRequest, WorkspaceWillCreateFilesResponse, CreateFilesParams, FileOperationRegistrationOptions,
    },
    "workspace/willDeleteFiles": {
      WorkspaceWillDeleteFilesRequest, WorkspaceWillDeleteFilesResponse, DeleteFilesParams, FileOperationRegistrationOptions,
    },
    "workspace/willRenameFiles": {
      WorkspaceWillRenameFilesRequest, WorkspaceWillRenameFilesResponse, RenameFilesParams, FileOperationRegistrationOptions,
    },
    "workspace/workspaceFolders": {
      WorkspaceWorkspaceFoldersRequest, WorkspaceWorkspaceFoldersResponse, Nil, Nil,
    },
    "workspaceSymbol/resolve": {
      WorkspaceSymbolResolveRequest, WorkspaceSymbolResolveResponse, WorkspaceSymbol, Nil,
    },
    # Notifications
    "$/cancelRequest": {
      CancelRequestNotification, Nil, CancelParams, Nil,
    },
    "$/logTrace": {
      LogTraceNotification, Nil, LogTraceParams, Nil,
    },
    "$/progress": {
      ProgressNotification, Nil, ProgressParams, Nil,
    },
    "$/setTrace": {
      SetTraceNotification, Nil, SetTraceParams, Nil,
    },
    "exit": {
      ExitNotification, Nil, Nil, Nil,
    },
    "initialized": {
      InitializedNotification, Nil, InitializedParams, Nil,
    },
    "notebookDocument/didChange": {
      NotebookDocumentDidChangeNotification, Nil, DidChangeNotebookDocumentParams, NotebookDocumentSyncRegistrationOptions,
    },
    "notebookDocument/didClose": {
      NotebookDocumentDidCloseNotification, Nil, DidCloseNotebookDocumentParams, NotebookDocumentSyncRegistrationOptions,
    },
    "notebookDocument/didOpen": {
      NotebookDocumentDidOpenNotification, Nil, DidOpenNotebookDocumentParams, NotebookDocumentSyncRegistrationOptions,
    },
    "notebookDocument/didSave": {
      NotebookDocumentDidSaveNotification, Nil, DidSaveNotebookDocumentParams, NotebookDocumentSyncRegistrationOptions,
    },
    "telemetry/event": {
      TelemetryEventNotification, Nil, LSPAny, Nil,
    },
    "textDocument/didChange": {
      TextDocumentDidChangeNotification, Nil, DidChangeTextDocumentParams, TextDocumentChangeRegistrationOptions,
    },
    "textDocument/didClose": {
      TextDocumentDidCloseNotification, Nil, DidCloseTextDocumentParams, TextDocumentRegistrationOptions,
    },
    "textDocument/didOpen": {
      TextDocumentDidOpenNotification, Nil, DidOpenTextDocumentParams, TextDocumentRegistrationOptions,
    },
    "textDocument/didSave": {
      TextDocumentDidSaveNotification, Nil, DidSaveTextDocumentParams, TextDocumentSaveRegistrationOptions,
    },
    "textDocument/publishDiagnostics": {
      TextDocumentPublishDiagnosticsNotification, Nil, PublishDiagnosticsParams, Nil,
    },
    "textDocument/willSave": {
      TextDocumentWillSaveNotification, Nil, WillSaveTextDocumentParams, TextDocumentRegistrationOptions,
    },
    "window/logMessage": {
      WindowLogMessageNotification, Nil, LogMessageParams, Nil,
    },
    "window/showMessage": {
      WindowShowMessageNotification, Nil, ShowMessageParams, Nil,
    },
    "window/workDoneProgress/cancel": {
      WindowWorkDoneProgressCancelNotification, Nil, WorkDoneProgressCancelParams, Nil,
    },
    "workspace/didChangeConfiguration": {
      WorkspaceDidChangeConfigurationNotification, Nil, DidChangeConfigurationParams, DidChangeConfigurationRegistrationOptions,
    },
    "workspace/didChangeWatchedFiles": {
      WorkspaceDidChangeWatchedFilesNotification, Nil, DidChangeWatchedFilesParams, DidChangeWatchedFilesRegistrationOptions,
    },
    "workspace/didChangeWorkspaceFolders": {
      WorkspaceDidChangeWorkspaceFoldersNotification, Nil, DidChangeWorkspaceFoldersParams, Nil,
    },
    "workspace/didCreateFiles": {
      WorkspaceDidCreateFilesNotification, Nil, CreateFilesParams, FileOperationRegistrationOptions,
    },
    "workspace/didDeleteFiles": {
      WorkspaceDidDeleteFilesNotification, Nil, DeleteFilesParams, FileOperationRegistrationOptions,
    },
    "workspace/didRenameFiles": {
      WorkspaceDidRenameFilesNotification, Nil, RenameFilesParams, FileOperationRegistrationOptions,
    },
  }

  alias Request = CallHierarchyIncomingCallsRequest | CallHierarchyOutgoingCallsRequest | ClientRegisterCapabilityRequest | ClientUnregisterCapabilityRequest | CodeActionResolveRequest | CodeLensResolveRequest | CompletionItemResolveRequest | DocumentLinkResolveRequest | InitializeRequest | InlayHintResolveRequest | ShutdownRequest | TextDocumentCodeActionRequest | TextDocumentCodeLensRequest | TextDocumentColorPresentationRequest | TextDocumentCompletionRequest | TextDocumentDeclarationRequest | TextDocumentDefinitionRequest | TextDocumentDiagnosticRequest | TextDocumentDocumentColorRequest | TextDocumentDocumentHighlightRequest | TextDocumentDocumentLinkRequest | TextDocumentDocumentSymbolRequest | TextDocumentFoldingRangeRequest | TextDocumentFormattingRequest | TextDocumentHoverRequest | TextDocumentImplementationRequest | TextDocumentInlayHintRequest | TextDocumentInlineCompletionRequest | TextDocumentInlineValueRequest | TextDocumentLinkedEditingRangeRequest | TextDocumentMonikerRequest | TextDocumentOnTypeFormattingRequest | TextDocumentPrepareCallHierarchyRequest | TextDocumentPrepareRenameRequest | TextDocumentPrepareTypeHierarchyRequest | TextDocumentRangeFormattingRequest | TextDocumentRangesFormattingRequest | TextDocumentReferencesRequest | TextDocumentRenameRequest | TextDocumentSelectionRangeRequest | TextDocumentSemanticTokensFullDeltaRequest | TextDocumentSemanticTokensFullRequest | TextDocumentSemanticTokensRangeRequest | TextDocumentSignatureHelpRequest | TextDocumentTypeDefinitionRequest | TextDocumentWillSaveWaitUntilRequest | TypeHierarchySubtypesRequest | TypeHierarchySupertypesRequest | WindowShowDocumentRequest | WindowShowMessageRequestRequest | WindowWorkDoneProgressCreateRequest | WorkspaceApplyEditRequest | WorkspaceCodeLensRefreshRequest | WorkspaceConfigurationRequest | WorkspaceDiagnosticRefreshRequest | WorkspaceDiagnosticRequest | WorkspaceExecuteCommandRequest | WorkspaceFoldingRangeRefreshRequest | WorkspaceInlayHintRefreshRequest | WorkspaceInlineValueRefreshRequest | WorkspaceSemanticTokensRefreshRequest | WorkspaceSymbolRequest | WorkspaceSymbolResolveRequest | WorkspaceWillCreateFilesRequest | WorkspaceWillDeleteFilesRequest | WorkspaceWillRenameFilesRequest | WorkspaceWorkspaceFoldersRequest

  alias Response = CallHierarchyIncomingCallsResponse | CallHierarchyOutgoingCallsResponse | ClientRegisterCapabilityResponse | ClientUnregisterCapabilityResponse | CodeActionResolveResponse | CodeLensResolveResponse | CompletionItemResolveResponse | DocumentLinkResolveResponse | InitializeResponse | InlayHintResolveResponse | ShutdownResponse | TextDocumentCodeActionResponse | TextDocumentCodeLensResponse | TextDocumentColorPresentationResponse | TextDocumentCompletionResponse | TextDocumentDeclarationResponse | TextDocumentDefinitionResponse | TextDocumentDiagnosticResponse | TextDocumentDocumentColorResponse | TextDocumentDocumentHighlightResponse | TextDocumentDocumentLinkResponse | TextDocumentDocumentSymbolResponse | TextDocumentFoldingRangeResponse | TextDocumentFormattingResponse | TextDocumentHoverResponse | TextDocumentImplementationResponse | TextDocumentInlayHintResponse | TextDocumentInlineCompletionResponse | TextDocumentInlineValueResponse | TextDocumentLinkedEditingRangeResponse | TextDocumentMonikerResponse | TextDocumentOnTypeFormattingResponse | TextDocumentPrepareCallHierarchyResponse | TextDocumentPrepareRenameResponse | TextDocumentPrepareTypeHierarchyResponse | TextDocumentRangeFormattingResponse | TextDocumentRangesFormattingResponse | TextDocumentReferencesResponse | TextDocumentRenameResponse | TextDocumentSelectionRangeResponse | TextDocumentSemanticTokensFullDeltaResponse | TextDocumentSemanticTokensFullResponse | TextDocumentSemanticTokensRangeResponse | TextDocumentSignatureHelpResponse | TextDocumentTypeDefinitionResponse | TextDocumentWillSaveWaitUntilResponse | TypeHierarchySubtypesResponse | TypeHierarchySupertypesResponse | WindowShowDocumentResponse | WindowShowMessageRequestResponse | WindowWorkDoneProgressCreateResponse | WorkspaceApplyEditResponse | WorkspaceCodeLensRefreshResponse | WorkspaceConfigurationResponse | WorkspaceDiagnosticRefreshResponse | WorkspaceDiagnosticResponse | WorkspaceExecuteCommandResponse | WorkspaceFoldingRangeRefreshResponse | WorkspaceInlayHintRefreshResponse | WorkspaceInlineValueRefreshResponse | WorkspaceSemanticTokensRefreshResponse | WorkspaceSymbolResolveResponse | WorkspaceSymbolResponse | WorkspaceWillCreateFilesResponse | WorkspaceWillDeleteFilesResponse | WorkspaceWillRenameFilesResponse | WorkspaceWorkspaceFoldersResponse

  alias Notification = CancelRequestNotification | ExitNotification | InitializedNotification | LogTraceNotification | NotebookDocumentDidChangeNotification | NotebookDocumentDidCloseNotification | NotebookDocumentDidOpenNotification | NotebookDocumentDidSaveNotification | ProgressNotification | SetTraceNotification | TelemetryEventNotification | TextDocumentDidChangeNotification | TextDocumentDidCloseNotification | TextDocumentDidOpenNotification | TextDocumentDidSaveNotification | TextDocumentPublishDiagnosticsNotification | TextDocumentWillSaveNotification | WindowLogMessageNotification | WindowShowMessageNotification | WindowWorkDoneProgressCancelNotification | WorkspaceDidChangeConfigurationNotification | WorkspaceDidChangeWatchedFilesNotification | WorkspaceDidChangeWorkspaceFoldersNotification | WorkspaceDidCreateFilesNotification | WorkspaceDidDeleteFilesNotification | WorkspaceDidRenameFilesNotification

  alias Message = Request | Response | Notification | ResponseErrorMessage | ResponseMessage

  REQUESTS = [
    CallHierarchyIncomingCallsRequest,
    CallHierarchyOutgoingCallsRequest,
    ClientRegisterCapabilityRequest,
    ClientUnregisterCapabilityRequest,
    CodeActionResolveRequest,
    CodeLensResolveRequest,
    CompletionItemResolveRequest,
    DocumentLinkResolveRequest,
    InitializeRequest,
    InlayHintResolveRequest,
    ShutdownRequest,
    TextDocumentCodeActionRequest,
    TextDocumentCodeLensRequest,
    TextDocumentColorPresentationRequest,
    TextDocumentCompletionRequest,
    TextDocumentDeclarationRequest,
    TextDocumentDefinitionRequest,
    TextDocumentDiagnosticRequest,
    TextDocumentDocumentColorRequest,
    TextDocumentDocumentHighlightRequest,
    TextDocumentDocumentLinkRequest,
    TextDocumentDocumentSymbolRequest,
    TextDocumentFoldingRangeRequest,
    TextDocumentFormattingRequest,
    TextDocumentHoverRequest,
    TextDocumentImplementationRequest,
    TextDocumentInlayHintRequest,
    TextDocumentInlineCompletionRequest,
    TextDocumentInlineValueRequest,
    TextDocumentLinkedEditingRangeRequest,
    TextDocumentMonikerRequest,
    TextDocumentOnTypeFormattingRequest,
    TextDocumentPrepareCallHierarchyRequest,
    TextDocumentPrepareRenameRequest,
    TextDocumentPrepareTypeHierarchyRequest,
    TextDocumentRangeFormattingRequest,
    TextDocumentRangesFormattingRequest,
    TextDocumentReferencesRequest,
    TextDocumentRenameRequest,
    TextDocumentSelectionRangeRequest,
    TextDocumentSemanticTokensFullDeltaRequest,
    TextDocumentSemanticTokensFullRequest,
    TextDocumentSemanticTokensRangeRequest,
    TextDocumentSignatureHelpRequest,
    TextDocumentTypeDefinitionRequest,
    TextDocumentWillSaveWaitUntilRequest,
    TypeHierarchySubtypesRequest,
    TypeHierarchySupertypesRequest,
    WindowShowDocumentRequest,
    WindowShowMessageRequestRequest,
    WindowWorkDoneProgressCreateRequest,
    WorkspaceApplyEditRequest,
    WorkspaceCodeLensRefreshRequest,
    WorkspaceConfigurationRequest,
    WorkspaceDiagnosticRefreshRequest,
    WorkspaceDiagnosticRequest,
    WorkspaceExecuteCommandRequest,
    WorkspaceFoldingRangeRefreshRequest,
    WorkspaceInlayHintRefreshRequest,
    WorkspaceInlineValueRefreshRequest,
    WorkspaceSemanticTokensRefreshRequest,
    WorkspaceSymbolRequest,
    WorkspaceSymbolResolveRequest,
    WorkspaceWillCreateFilesRequest,
    WorkspaceWillDeleteFilesRequest,
    WorkspaceWillRenameFilesRequest,
    WorkspaceWorkspaceFoldersRequest,
  ]

  RESPONSES = [
    CallHierarchyIncomingCallsResponse,
    CallHierarchyOutgoingCallsResponse,
    ClientRegisterCapabilityResponse,
    ClientUnregisterCapabilityResponse,
    CodeActionResolveResponse,
    CodeLensResolveResponse,
    CompletionItemResolveResponse,
    DocumentLinkResolveResponse,
    InitializeResponse,
    InlayHintResolveResponse,
    ShutdownResponse,
    TextDocumentCodeActionResponse,
    TextDocumentCodeLensResponse,
    TextDocumentColorPresentationResponse,
    TextDocumentCompletionResponse,
    TextDocumentDeclarationResponse,
    TextDocumentDefinitionResponse,
    TextDocumentDiagnosticResponse,
    TextDocumentDocumentColorResponse,
    TextDocumentDocumentHighlightResponse,
    TextDocumentDocumentLinkResponse,
    TextDocumentDocumentSymbolResponse,
    TextDocumentFoldingRangeResponse,
    TextDocumentFormattingResponse,
    TextDocumentHoverResponse,
    TextDocumentImplementationResponse,
    TextDocumentInlayHintResponse,
    TextDocumentInlineCompletionResponse,
    TextDocumentInlineValueResponse,
    TextDocumentLinkedEditingRangeResponse,
    TextDocumentMonikerResponse,
    TextDocumentOnTypeFormattingResponse,
    TextDocumentPrepareCallHierarchyResponse,
    TextDocumentPrepareRenameResponse,
    TextDocumentPrepareTypeHierarchyResponse,
    TextDocumentRangeFormattingResponse,
    TextDocumentRangesFormattingResponse,
    TextDocumentReferencesResponse,
    TextDocumentRenameResponse,
    TextDocumentSelectionRangeResponse,
    TextDocumentSemanticTokensFullDeltaResponse,
    TextDocumentSemanticTokensFullResponse,
    TextDocumentSemanticTokensRangeResponse,
    TextDocumentSignatureHelpResponse,
    TextDocumentTypeDefinitionResponse,
    TextDocumentWillSaveWaitUntilResponse,
    TypeHierarchySubtypesResponse,
    TypeHierarchySupertypesResponse,
    WindowShowDocumentResponse,
    WindowShowMessageRequestResponse,
    WindowWorkDoneProgressCreateResponse,
    WorkspaceApplyEditResponse,
    WorkspaceCodeLensRefreshResponse,
    WorkspaceConfigurationResponse,
    WorkspaceDiagnosticRefreshResponse,
    WorkspaceDiagnosticResponse,
    WorkspaceExecuteCommandResponse,
    WorkspaceFoldingRangeRefreshResponse,
    WorkspaceInlayHintRefreshResponse,
    WorkspaceInlineValueRefreshResponse,
    WorkspaceSemanticTokensRefreshResponse,
    WorkspaceSymbolResolveResponse,
    WorkspaceSymbolResponse,
    WorkspaceWillCreateFilesResponse,
    WorkspaceWillDeleteFilesResponse,
    WorkspaceWillRenameFilesResponse,
    WorkspaceWorkspaceFoldersResponse,
  ]

  NOTIFICATIONS = [
    CancelRequestNotification,
    ExitNotification,
    InitializedNotification,
    LogTraceNotification,
    NotebookDocumentDidChangeNotification,
    NotebookDocumentDidCloseNotification,
    NotebookDocumentDidOpenNotification,
    NotebookDocumentDidSaveNotification,
    ProgressNotification,
    SetTraceNotification,
    TelemetryEventNotification,
    TextDocumentDidChangeNotification,
    TextDocumentDidCloseNotification,
    TextDocumentDidOpenNotification,
    TextDocumentDidSaveNotification,
    TextDocumentPublishDiagnosticsNotification,
    TextDocumentWillSaveNotification,
    WindowLogMessageNotification,
    WindowShowMessageNotification,
    WindowWorkDoneProgressCancelNotification,
    WorkspaceDidChangeConfigurationNotification,
    WorkspaceDidChangeWatchedFilesNotification,
    WorkspaceDidChangeWorkspaceFoldersNotification,
    WorkspaceDidCreateFilesNotification,
    WorkspaceDidDeleteFilesNotification,
    WorkspaceDidRenameFilesNotification,
  ]

  MESSAGE_TYPES = REQUESTS + RESPONSES + NOTIFICATIONS + [ResponseErrorMessage, ResponseMessage]

  MESSAGE_DIRECTION = {
    # Request methods
    "callHierarchy/incomingCalls":            MessageDirection.parse("clientToServer"),
    "callHierarchy/outgoingCalls":            MessageDirection.parse("clientToServer"),
    "client/registerCapability":              MessageDirection.parse("serverToClient"),
    "client/unregisterCapability":            MessageDirection.parse("serverToClient"),
    "codeAction/resolve":                     MessageDirection.parse("clientToServer"),
    "codeLens/resolve":                       MessageDirection.parse("clientToServer"),
    "completionItem/resolve":                 MessageDirection.parse("clientToServer"),
    "documentLink/resolve":                   MessageDirection.parse("clientToServer"),
    "initialize":                             MessageDirection.parse("clientToServer"),
    "inlayHint/resolve":                      MessageDirection.parse("clientToServer"),
    "shutdown":                               MessageDirection.parse("clientToServer"),
    "textDocument/codeAction":                MessageDirection.parse("clientToServer"),
    "textDocument/codeLens":                  MessageDirection.parse("clientToServer"),
    "textDocument/colorPresentation":         MessageDirection.parse("clientToServer"),
    "textDocument/completion":                MessageDirection.parse("clientToServer"),
    "textDocument/declaration":               MessageDirection.parse("clientToServer"),
    "textDocument/definition":                MessageDirection.parse("clientToServer"),
    "textDocument/diagnostic":                MessageDirection.parse("clientToServer"),
    "textDocument/documentColor":             MessageDirection.parse("clientToServer"),
    "textDocument/documentHighlight":         MessageDirection.parse("clientToServer"),
    "textDocument/documentLink":              MessageDirection.parse("clientToServer"),
    "textDocument/documentSymbol":            MessageDirection.parse("clientToServer"),
    "textDocument/foldingRange":              MessageDirection.parse("clientToServer"),
    "textDocument/formatting":                MessageDirection.parse("clientToServer"),
    "textDocument/hover":                     MessageDirection.parse("clientToServer"),
    "textDocument/implementation":            MessageDirection.parse("clientToServer"),
    "textDocument/inlayHint":                 MessageDirection.parse("clientToServer"),
    "textDocument/inlineCompletion":          MessageDirection.parse("clientToServer"),
    "textDocument/inlineValue":               MessageDirection.parse("clientToServer"),
    "textDocument/linkedEditingRange":        MessageDirection.parse("clientToServer"),
    "textDocument/moniker":                   MessageDirection.parse("clientToServer"),
    "textDocument/onTypeFormatting":          MessageDirection.parse("clientToServer"),
    "textDocument/prepareCallHierarchy":      MessageDirection.parse("clientToServer"),
    "textDocument/prepareRename":             MessageDirection.parse("clientToServer"),
    "textDocument/prepareTypeHierarchy":      MessageDirection.parse("clientToServer"),
    "textDocument/rangeFormatting":           MessageDirection.parse("clientToServer"),
    "textDocument/rangesFormatting":          MessageDirection.parse("clientToServer"),
    "textDocument/references":                MessageDirection.parse("clientToServer"),
    "textDocument/rename":                    MessageDirection.parse("clientToServer"),
    "textDocument/selectionRange":            MessageDirection.parse("clientToServer"),
    "textDocument/semanticTokens/full":       MessageDirection.parse("clientToServer"),
    "textDocument/semanticTokens/full/delta": MessageDirection.parse("clientToServer"),
    "textDocument/semanticTokens/range":      MessageDirection.parse("clientToServer"),
    "textDocument/signatureHelp":             MessageDirection.parse("clientToServer"),
    "textDocument/typeDefinition":            MessageDirection.parse("clientToServer"),
    "textDocument/willSaveWaitUntil":         MessageDirection.parse("clientToServer"),
    "typeHierarchy/subtypes":                 MessageDirection.parse("clientToServer"),
    "typeHierarchy/supertypes":               MessageDirection.parse("clientToServer"),
    "window/showDocument":                    MessageDirection.parse("serverToClient"),
    "window/showMessageRequest":              MessageDirection.parse("serverToClient"),
    "window/workDoneProgress/create":         MessageDirection.parse("serverToClient"),
    "workspace/applyEdit":                    MessageDirection.parse("serverToClient"),
    "workspace/codeLens/refresh":             MessageDirection.parse("serverToClient"),
    "workspace/configuration":                MessageDirection.parse("serverToClient"),
    "workspace/diagnostic":                   MessageDirection.parse("clientToServer"),
    "workspace/diagnostic/refresh":           MessageDirection.parse("serverToClient"),
    "workspace/executeCommand":               MessageDirection.parse("clientToServer"),
    "workspace/foldingRange/refresh":         MessageDirection.parse("serverToClient"),
    "workspace/inlayHint/refresh":            MessageDirection.parse("serverToClient"),
    "workspace/inlineValue/refresh":          MessageDirection.parse("serverToClient"),
    "workspace/semanticTokens/refresh":       MessageDirection.parse("serverToClient"),
    "workspace/symbol":                       MessageDirection.parse("clientToServer"),
    "workspace/willCreateFiles":              MessageDirection.parse("clientToServer"),
    "workspace/willDeleteFiles":              MessageDirection.parse("clientToServer"),
    "workspace/willRenameFiles":              MessageDirection.parse("clientToServer"),
    "workspace/workspaceFolders":             MessageDirection.parse("serverToClient"),
    "workspaceSymbol/resolve":                MessageDirection.parse("clientToServer"),
    # Notification methods
    "$/cancelRequest":                     MessageDirection.parse("both"),
    "$/logTrace":                          MessageDirection.parse("serverToClient"),
    "$/progress":                          MessageDirection.parse("both"),
    "$/setTrace":                          MessageDirection.parse("clientToServer"),
    "exit":                                MessageDirection.parse("clientToServer"),
    "initialized":                         MessageDirection.parse("clientToServer"),
    "notebookDocument/didChange":          MessageDirection.parse("clientToServer"),
    "notebookDocument/didClose":           MessageDirection.parse("clientToServer"),
    "notebookDocument/didOpen":            MessageDirection.parse("clientToServer"),
    "notebookDocument/didSave":            MessageDirection.parse("clientToServer"),
    "telemetry/event":                     MessageDirection.parse("serverToClient"),
    "textDocument/didChange":              MessageDirection.parse("clientToServer"),
    "textDocument/didClose":               MessageDirection.parse("clientToServer"),
    "textDocument/didOpen":                MessageDirection.parse("clientToServer"),
    "textDocument/didSave":                MessageDirection.parse("clientToServer"),
    "textDocument/publishDiagnostics":     MessageDirection.parse("serverToClient"),
    "textDocument/willSave":               MessageDirection.parse("clientToServer"),
    "window/logMessage":                   MessageDirection.parse("serverToClient"),
    "window/showMessage":                  MessageDirection.parse("serverToClient"),
    "window/workDoneProgress/cancel":      MessageDirection.parse("clientToServer"),
    "workspace/didChangeConfiguration":    MessageDirection.parse("clientToServer"),
    "workspace/didChangeWatchedFiles":     MessageDirection.parse("clientToServer"),
    "workspace/didChangeWorkspaceFolders": MessageDirection.parse("clientToServer"),
    "workspace/didCreateFiles":            MessageDirection.parse("clientToServer"),
    "workspace/didDeleteFiles":            MessageDirection.parse("clientToServer"),
    "workspace/didRenameFiles":            MessageDirection.parse("clientToServer"),
  }
end
