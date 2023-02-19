// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.
use serde::{Deserialize, Serialize};
use serde_repr::*;

/// A set of predefined token types. This set is not fixed
/// an clients can specify additional token types via the
/// corresponding client capabilities.
///
/// @since 3.16.0
#[derive(Serialize, Deserialize, PartialEq, Debug)]
pub enum SemanticTokenTypes {
    #[serde(rename = "namespace")]
    Namespace,

    /// Represents a generic type. Acts as a fallback for types which can't be mapped to
    /// a specific type like class or enum.
    #[serde(rename = "type")]
    Type,

    #[serde(rename = "class")]
    Class,

    #[serde(rename = "enum")]
    Enum,

    #[serde(rename = "interface")]
    Interface,

    #[serde(rename = "struct")]
    Struct,

    #[serde(rename = "typeParameter")]
    TypeParameter,

    #[serde(rename = "parameter")]
    Parameter,

    #[serde(rename = "variable")]
    Variable,

    #[serde(rename = "property")]
    Property,

    #[serde(rename = "enumMember")]
    EnumMember,

    #[serde(rename = "event")]
    Event,

    #[serde(rename = "function")]
    Function,

    #[serde(rename = "method")]
    Method,

    #[serde(rename = "macro")]
    Macro,

    #[serde(rename = "keyword")]
    Keyword,

    #[serde(rename = "modifier")]
    Modifier,

    #[serde(rename = "comment")]
    Comment,

    #[serde(rename = "string")]
    String,

    #[serde(rename = "number")]
    Number,

    #[serde(rename = "regexp")]
    Regexp,

    #[serde(rename = "operator")]
    Operator,

    /// @since 3.17.0
    #[serde(rename = "decorator")]
    Decorator,
}

/// A set of predefined token modifiers. This set is not fixed
/// an clients can specify additional token types via the
/// corresponding client capabilities.
///
/// @since 3.16.0
#[derive(Serialize, Deserialize, PartialEq, Debug)]
pub enum SemanticTokenModifiers {
    #[serde(rename = "declaration")]
    Declaration,

    #[serde(rename = "definition")]
    Definition,

    #[serde(rename = "readonly")]
    Readonly,

    #[serde(rename = "static")]
    Static,

    #[serde(rename = "deprecated")]
    Deprecated,

    #[serde(rename = "abstract")]
    Abstract,

    #[serde(rename = "async")]
    Async,

    #[serde(rename = "modification")]
    Modification,

    #[serde(rename = "documentation")]
    Documentation,

    #[serde(rename = "defaultLibrary")]
    DefaultLibrary,
}

/// The document diagnostic report kinds.
///
/// @since 3.17.0
#[derive(Serialize, Deserialize, PartialEq, Debug)]
pub enum DocumentDiagnosticReportKind {
    /// A diagnostic report with a full
    /// set of problems.
    #[serde(rename = "full")]
    Full,

    /// A report indicating that the last
    /// returned report is still accurate.
    #[serde(rename = "unchanged")]
    Unchanged,
}

/// Predefined error codes.
#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum ErrorCodes {
    ParseError = -32700,

    InvalidRequest = -32600,

    MethodNotFound = -32601,

    InvalidParams = -32602,

    InternalError = -32603,

    /// Error code indicating that a server received a notification or
    /// request before the server has received the `initialize` request.
    ServerNotInitialized = -32002,

    UnknownErrorCode = -32001,
}

#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum LSPErrorCodes {
    /// A request failed but it was syntactically correct, e.g the
    /// method name was known and the parameters were valid. The error
    /// message should contain human readable information about why
    /// the request failed.
    ///
    /// @since 3.17.0
    RequestFailed = -32803,

    /// The server cancelled the request. This error code should
    /// only be used for requests that explicitly support being
    /// server cancellable.
    ///
    /// @since 3.17.0
    ServerCancelled = -32802,

    /// The server detected that the content of a document got
    /// modified outside normal conditions. A server should
    /// NOT send this error code if it detects a content change
    /// in it unprocessed messages. The result even computed
    /// on an older state might still be useful for the client.
    ///
    /// If a client decides that a result is not of any use anymore
    /// the client should cancel the request.
    ContentModified = -32801,

    /// The client has canceled a request and a server as detected
    /// the cancel.
    RequestCancelled = -32800,
}

/// A set of predefined range kinds.
#[derive(Serialize, Deserialize, PartialEq, Debug)]
pub enum FoldingRangeKind {
    /// Folding range for a comment
    #[serde(rename = "comment")]
    Comment,

    /// Folding range for an import or include
    #[serde(rename = "imports")]
    Imports,

    /// Folding range for a region (e.g. `#region`)
    #[serde(rename = "region")]
    Region,
}

/// A symbol kind.
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

/// Symbol tags are extra annotations that tweak the rendering of a symbol.
///
/// @since 3.16
#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum SymbolTag {
    /// Render a symbol as obsolete, usually using a strike-out.
    Deprecated = 1,
}

/// Moniker uniqueness level to define scope of the moniker.
///
/// @since 3.16.0
#[derive(Serialize, Deserialize, PartialEq, Debug)]
pub enum UniquenessLevel {
    /// The moniker is only unique inside a document
    #[serde(rename = "document")]
    Document,

    /// The moniker is unique inside a project for which a dump got created
    #[serde(rename = "project")]
    Project,

    /// The moniker is unique inside the group to which a project belongs
    #[serde(rename = "group")]
    Group,

    /// The moniker is unique inside the moniker scheme.
    #[serde(rename = "scheme")]
    Scheme,

    /// The moniker is globally unique
    #[serde(rename = "global")]
    Global,
}

/// The moniker kind.
///
/// @since 3.16.0
#[derive(Serialize, Deserialize, PartialEq, Debug)]
pub enum MonikerKind {
    /// The moniker represent a symbol that is imported into a project
    #[serde(rename = "import")]
    Import,

    /// The moniker represents a symbol that is exported from a project
    #[serde(rename = "export")]
    Export,

    /// The moniker represents a symbol that is local to a project (e.g. a local
    /// variable of a function, a class not visible outside the project, ...)
    #[serde(rename = "local")]
    Local,
}

/// Inlay hint kinds.
///
/// @since 3.17.0
#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum InlayHintKind {
    /// An inlay hint that for a type annotation.
    Type = 1,

    /// An inlay hint that is for a parameter.
    Parameter = 2,
}

/// The message type
#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum MessageType {
    /// An error message.
    Error = 1,

    /// A warning message.
    Warning = 2,

    /// An information message.
    Info = 3,

    /// A log message.
    Log = 4,
}

/// Defines how the host (editor) should sync
/// document changes to the language server.
#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum TextDocumentSyncKind {
    /// Documents should not be synced at all.
    None = 0,

    /// Documents are synced by always sending the full content
    /// of the document.
    Full = 1,

    /// Documents are synced by sending the full content on open.
    /// After that only incremental updates to the document are
    /// send.
    Incremental = 2,
}

/// Represents reasons why a text document is saved.
#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum TextDocumentSaveReason {
    /// Manually triggered, e.g. by the user pressing save, by starting debugging,
    /// or by an API call.
    Manual = 1,

    /// Automatic after a delay.
    AfterDelay = 2,

    /// When the editor lost focus.
    FocusOut = 3,
}

/// The kind of a completion entry.
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

/// Completion item tags are extra annotations that tweak the rendering of a completion
/// item.
///
/// @since 3.15.0
#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum CompletionItemTag {
    /// Render a completion as obsolete, usually using a strike-out.
    Deprecated = 1,
}

/// Defines whether the insert text in a completion item should be interpreted as
/// plain text or a snippet.
#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum InsertTextFormat {
    /// The primary text to be inserted is treated as a plain string.
    PlainText = 1,

    /// The primary text to be inserted is treated as a snippet.
    ///
    /// A snippet can define tab stops and placeholders with `$1`, `$2`
    /// and `${3:foo}`. `$0` defines the final tab stop, it defaults to
    /// the end of the snippet. Placeholders with equal identifiers are linked,
    /// that is typing in one will update others too.
    ///
    /// See also: https://microsoft.github.io/language-server-protocol/specifications/specification-current/#snippet_syntax
    Snippet = 2,
}

/// How whitespace and indentation is handled during completion
/// item insertion.
///
/// @since 3.16.0
#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum InsertTextMode {
    /// The insertion or replace strings is taken as it is. If the
    /// value is multi line the lines below the cursor will be
    /// inserted using the indentation defined in the string value.
    /// The client will not apply any kind of adjustments to the
    /// string.
    AsIs = 1,

    /// The editor adjusts leading whitespace of new lines so that
    /// they match the indentation up to the cursor of the line for
    /// which the item is accepted.
    ///
    /// Consider a line like this: <2tabs><cursor><3tabs>foo. Accepting a
    /// multi line completion item is indented using 2 tabs and all
    /// following lines inserted will be indented using 2 tabs as well.
    AdjustIndentation = 2,
}

/// A document highlight kind.
#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum DocumentHighlightKind {
    /// A textual occurrence.
    Text = 1,

    /// Read-access of a symbol, like reading a variable.
    Read = 2,

    /// Write-access of a symbol, like writing to a variable.
    Write = 3,
}

/// A set of predefined code action kinds
#[derive(Serialize, Deserialize, PartialEq, Debug)]
pub enum CodeActionKind {
    /// Empty kind.
    #[serde(rename = "")]
    Empty,

    /// Base kind for quickfix actions: 'quickfix'
    #[serde(rename = "quickfix")]
    QuickFix,

    /// Base kind for refactoring actions: 'refactor'
    #[serde(rename = "refactor")]
    Refactor,

    /// Base kind for refactoring extraction actions: 'refactor.extract'
    ///
    /// Example extract actions:
    ///
    /// - Extract method
    /// - Extract function
    /// - Extract variable
    /// - Extract interface from class
    /// - ...
    #[serde(rename = "refactor.extract")]
    RefactorExtract,

    /// Base kind for refactoring inline actions: 'refactor.inline'
    ///
    /// Example inline actions:
    ///
    /// - Inline function
    /// - Inline variable
    /// - Inline constant
    /// - ...
    #[serde(rename = "refactor.inline")]
    RefactorInline,

    /// Base kind for refactoring rewrite actions: 'refactor.rewrite'
    ///
    /// Example rewrite actions:
    ///
    /// - Convert JavaScript function to class
    /// - Add or remove parameter
    /// - Encapsulate field
    /// - Make method static
    /// - Move method to base class
    /// - ...
    #[serde(rename = "refactor.rewrite")]
    RefactorRewrite,

    /// Base kind for source actions: `source`
    ///
    /// Source code actions apply to the entire file.
    #[serde(rename = "source")]
    Source,

    /// Base kind for an organize imports source action: `source.organizeImports`
    #[serde(rename = "source.organizeImports")]
    SourceOrganizeImports,

    /// Base kind for auto-fix source actions: `source.fixAll`.
    ///
    /// Fix all actions automatically fix errors that have a clear fix that do not require user input.
    /// They should not suppress errors or perform unsafe fixes such as generating new types or classes.
    ///
    /// @since 3.15.0
    #[serde(rename = "source.fixAll")]
    SourceFixAll,
}

#[derive(Serialize, Deserialize, PartialEq, Debug)]
pub enum TraceValues {
    /// Turn tracing off.
    #[serde(rename = "off")]
    Off,

    /// Trace messages only.
    #[serde(rename = "messages")]
    Messages,

    /// Verbose message tracing.
    #[serde(rename = "verbose")]
    Verbose,
}

/// Describes the content type that a client supports in various
/// result literals like `Hover`, `ParameterInfo` or `CompletionItem`.
///
/// Please note that `MarkupKinds` must not start with a `$`. This kinds
/// are reserved for internal usage.
#[derive(Serialize, Deserialize, PartialEq, Debug)]
pub enum MarkupKind {
    /// Plain text is supported as a content format
    #[serde(rename = "plaintext")]
    PlainText,

    /// Markdown is supported as a content format
    #[serde(rename = "markdown")]
    Markdown,
}

/// A set of predefined position encoding kinds.
///
/// @since 3.17.0
#[derive(Serialize, Deserialize, PartialEq, Debug)]
pub enum PositionEncodingKind {
    /// Character offsets count UTF-8 code units.
    #[serde(rename = "utf-8")]
    UTF8,

    /// Character offsets count UTF-16 code units.
    ///
    /// This is the default and must always be supported
    /// by servers
    #[serde(rename = "utf-16")]
    UTF16,

    /// Character offsets count UTF-32 code units.
    ///
    /// Implementation note: these are the same as Unicode code points,
    /// so this `PositionEncodingKind` may also be used for an
    /// encoding-agnostic representation of character offsets.
    #[serde(rename = "utf-32")]
    UTF32,
}

/// The file event type
#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum FileChangeType {
    /// The file got created.
    Created = 1,

    /// The file got changed.
    Changed = 2,

    /// The file got deleted.
    Deleted = 3,
}

#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum WatchKind {
    /// Interested in create events.
    Create = 1,

    /// Interested in change events
    Change = 2,

    /// Interested in delete events
    Delete = 4,
}

/// The diagnostic's severity.
#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum DiagnosticSeverity {
    /// Reports an error.
    Error = 1,

    /// Reports a warning.
    Warning = 2,

    /// Reports an information.
    Information = 3,

    /// Reports a hint.
    Hint = 4,
}

/// The diagnostic tags.
///
/// @since 3.15.0
#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum DiagnosticTag {
    /// Unused or unnecessary code.
    ///
    /// Clients are allowed to render diagnostics with this tag faded out instead of having
    /// an error squiggle.
    Unnecessary = 1,

    /// Deprecated or obsolete code.
    ///
    /// Clients are allowed to rendered diagnostics with this tag strike through.
    Deprecated = 2,
}

/// How a completion was triggered
#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum CompletionTriggerKind {
    /// Completion was triggered by typing an identifier (24x7 code
    /// complete), manual invocation (e.g Ctrl+Space) or via API.
    Invoked = 1,

    /// Completion was triggered by a trigger character specified by
    /// the `triggerCharacters` properties of the `CompletionRegistrationOptions`.
    TriggerCharacter = 2,

    /// Completion was re-triggered as current completion list is incomplete
    TriggerForIncompleteCompletions = 3,
}

/// How a signature help was triggered.
///
/// @since 3.15.0
#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum SignatureHelpTriggerKind {
    /// Signature help was invoked manually by the user or by a command.
    Invoked = 1,

    /// Signature help was triggered by a trigger character.
    TriggerCharacter = 2,

    /// Signature help was triggered by the cursor moving or by the document content changing.
    ContentChange = 3,
}

/// The reason why code actions were requested.
///
/// @since 3.17.0
#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum CodeActionTriggerKind {
    /// Code actions were explicitly requested by the user or by an extension.
    Invoked = 1,

    /// Code actions were requested automatically.
    ///
    /// This typically happens when current selection in a file changes, but can
    /// also be triggered when file content changes.
    Automatic = 2,
}

/// A pattern kind describing if a glob pattern matches a file a folder or
/// both.
///
/// @since 3.16.0
#[derive(Serialize, Deserialize, PartialEq, Debug)]
pub enum FileOperationPatternKind {
    /// The pattern matches a file only.
    #[serde(rename = "file")]
    File,

    /// The pattern matches a folder only.
    #[serde(rename = "folder")]
    Folder,
}

/// A notebook cell kind.
///
/// @since 3.17.0
#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum NotebookCellKind {
    /// A markup-cell is formatted source that is used for display.
    Markup = 1,

    /// A code-cell is source code.
    Code = 2,
}

#[derive(Serialize, Deserialize, PartialEq, Debug)]
pub enum ResourceOperationKind {
    /// Supports creating new files and folders.
    #[serde(rename = "create")]
    Create,

    /// Supports renaming existing files and folders.
    #[serde(rename = "rename")]
    Rename,

    /// Supports deleting existing files and folders.
    #[serde(rename = "delete")]
    Delete,
}

#[derive(Serialize, Deserialize, PartialEq, Debug)]
pub enum FailureHandlingKind {
    /// Applying the workspace change is simply aborted if one of the changes provided
    /// fails. All operations executed before the failing operation stay executed.
    #[serde(rename = "abort")]
    Abort,

    /// All operations are executed transactional. That means they either all
    /// succeed or no changes at all are applied to the workspace.
    #[serde(rename = "transactional")]
    Transactional,

    /// If the workspace edit contains only textual file changes they are executed transactional.
    /// If resource changes (create, rename or delete file) are part of the change the failure
    /// handling strategy is abort.
    #[serde(rename = "textOnlyTransactional")]
    TextOnlyTransactional,

    /// The client tries to undo the operations already executed. But there is no
    /// guarantee that this is succeeding.
    #[serde(rename = "undo")]
    Undo,
}

#[derive(Serialize_repr, Deserialize_repr, PartialEq, Debug)]
#[repr(i64)]
pub enum PrepareSupportDefaultBehavior {
    /// The client's default behavior is to select the identifier
    /// according the to language's syntax rule.
    Identifier = 1,
}

#[derive(Serialize, Deserialize, PartialEq, Debug)]
pub enum TokenFormat {
    #[serde(rename = "relative")]
    Relative,
}
