// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.
use serde_repr::*;

#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum ErrorCodes {
    ParseError = -32700,
    InvalidRequest = -32600,
    MethodNotFound = -32601,
    InvalidParams = -32602,
    InternalError = -32603,
    ServerNotInitialized = -32002,
    UnknownErrorCode = -32001,
}

#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum LSPErrorCodes {
    RequestFailed = -32803,
    ServerCancelled = -32802,
    ContentModified = -32801,
    RequestCancelled = -32800,
}

#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum SymbolKind {
    File = 1,
    Module = 2,
    Namespace = 3,
    Package = 4,
    Class = 5,
    Method = 6,
    Property = 7,
    Field = 8,
    Constructor = 9,
    Enum = 10,
    Interface = 11,
    Function = 12,
    Variable = 13,
    Constant = 14,
    String = 15,
    Number = 16,
    Boolean = 17,
    Array = 18,
    Object = 19,
    Key = 20,
    Null = 21,
    EnumMember = 22,
    Struct = 23,
    Event = 24,
    Operator = 25,
    TypeParameter = 26,
}

#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum SymbolTag {
    Deprecated = 1,
}

#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum InlayHintKind {
    Type = 1,
    Parameter = 2,
}

#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum MessageType {
    Error = 1,
    Warning = 2,
    Info = 3,
    Log = 4,
}

#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum TextDocumentSyncKind {
    None = 0,
    Full = 1,
    Incremental = 2,
}

#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum TextDocumentSaveReason {
    Manual = 1,
    AfterDelay = 2,
    FocusOut = 3,
}

#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum CompletionItemKind {
    Text = 1,
    Method = 2,
    Function = 3,
    Constructor = 4,
    Field = 5,
    Variable = 6,
    Class = 7,
    Interface = 8,
    Module = 9,
    Property = 10,
    Unit = 11,
    Value = 12,
    Enum = 13,
    Keyword = 14,
    Snippet = 15,
    Color = 16,
    File = 17,
    Reference = 18,
    Folder = 19,
    EnumMember = 20,
    Constant = 21,
    Struct = 22,
    Event = 23,
    Operator = 24,
    TypeParameter = 25,
}

#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum CompletionItemTag {
    Deprecated = 1,
}

#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum InsertTextFormat {
    PlainText = 1,
    Snippet = 2,
}

#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum InsertTextMode {
    AsIs = 1,
    AdjustIndentation = 2,
}

#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum DocumentHighlightKind {
    Text = 1,
    Read = 2,
    Write = 3,
}

#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum FileChangeType {
    Created = 1,
    Changed = 2,
    Deleted = 3,
}

#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum WatchKind {
    Create = 1,
    Change = 2,
    Delete = 4,
}

#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum DiagnosticSeverity {
    Error = 1,
    Warning = 2,
    Information = 3,
    Hint = 4,
}

#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum DiagnosticTag {
    Unnecessary = 1,
    Deprecated = 2,
}

#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum CompletionTriggerKind {
    Invoked = 1,
    TriggerCharacter = 2,
    TriggerForIncompleteCompletions = 3,
}

#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum SignatureHelpTriggerKind {
    Invoked = 1,
    TriggerCharacter = 2,
    ContentChange = 3,
}

#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum CodeActionTriggerKind {
    Invoked = 1,
    Automatic = 2,
}

#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum NotebookCellKind {
    Markup = 1,
    Code = 2,
}

#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum PrepareSupportDefaultBehavior {
    Identifier = 1,
}
