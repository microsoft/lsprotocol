# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

# THIS IS A GENERATED FILE, DO NOT EDIT.
# Generator command:
# python ./generator ./generator/lsp.json ./lsprotocol/_types.py

import enum
from typing import Dict, List, Optional, Tuple, Union

import attrs

from . import validators


@enum.unique
class SemanticTokenTypes(enum.Enum):
    """A set of predefined token types. This set is not fixed an clients can
    specify additional token types via the corresponding client capabilities.

    @since 3.16.0
    """

    # Since: 3.16.0
    NAMESPACE = "namespace"
    TYPE = "type"
    """Represents a generic type. Acts as a fallback for types which can't be mapped to
    a specific type like class or enum."""
    CLASS = "class"
    ENUM = "enum"
    INTERFACE = "interface"
    STRUCT = "struct"
    TYPE_PARAMETER = "typeParameter"
    PARAMETER = "parameter"
    VARIABLE = "variable"
    PROPERTY = "property"
    ENUM_MEMBER = "enumMember"
    EVENT = "event"
    FUNCTION = "function"
    METHOD = "method"
    MACRO = "macro"
    KEYWORD = "keyword"
    MODIFIER = "modifier"
    COMMENT = "comment"
    STRING = "string"
    NUMBER = "number"
    REGEXP = "regexp"
    OPERATOR = "operator"
    DECORATOR = "decorator"
    """@since 3.17.0"""
    # Since: 3.17.0


@enum.unique
class SemanticTokenModifiers(enum.Enum):
    """A set of predefined token modifiers. This set is not fixed an clients
    can specify additional token types via the corresponding client
    capabilities.

    @since 3.16.0
    """

    # Since: 3.16.0
    DECLARATION = "declaration"
    DEFINITION = "definition"
    READONLY = "readonly"
    STATIC = "static"
    DEPRECATED = "deprecated"
    ABSTRACT = "abstract"
    ASYNC = "async"
    MODIFICATION = "modification"
    DOCUMENTATION = "documentation"
    DEFAULT_LIBRARY = "defaultLibrary"


class ErrorCodes(enum.Enum):
    """Predefined error codes."""

    PARSE_ERROR = -32700
    INVALID_REQUEST = -32600
    METHOD_NOT_FOUND = -32601
    INVALID_PARAMS = -32602
    INTERNAL_ERROR = -32603
    JSONRPC_RESERVED_ERROR_RANGE_START = -32099
    """This is the start range of JSON RPC reserved error codes.
    It doesn't denote a real error code. No application error codes should
    be defined between the start and end range. For backwards
    compatibility the `ServerNotInitialized` and the `UnknownErrorCode`
    are left in the range.
    
    @since 3.16.0"""
    # Since: 3.16.0
    SERVER_ERROR_START = -32099
    """@deprecated use  jsonrpcReservedErrorRangeStart"""
    SERVER_NOT_INITIALIZED = -32002
    """Error code indicating that a server received a notification or
    request before the server has received the `initialize` request."""
    UNKNOWN_ERROR_CODE = -32001
    JSONRPC_RESERVED_ERROR_RANGE_END = -32000
    """This is the end range of JSON RPC reserved error codes.
    It doesn't denote a real error code.
    
    @since 3.16.0"""
    # Since: 3.16.0
    SERVER_ERROR_END = -32000
    """@deprecated use  jsonrpcReservedErrorRangeEnd"""


class LSPErrorCodes(enum.Enum):
    LSP_RESERVED_ERROR_RANGE_START = -32899
    """This is the start range of LSP reserved error codes.
    It doesn't denote a real error code.
    
    @since 3.16.0"""
    # Since: 3.16.0
    REQUEST_FAILED = -32803
    """A request failed but it was syntactically correct, e.g the
    method name was known and the parameters were valid. The error
    message should contain human readable information about why
    the request failed.
    
    @since 3.17.0"""
    # Since: 3.17.0
    SERVER_CANCELLED = -32802
    """The server cancelled the request. This error code should
    only be used for requests that explicitly support being
    server cancellable.
    
    @since 3.17.0"""
    # Since: 3.17.0
    CONTENT_MODIFIED = -32801
    """The server detected that the content of a document got
    modified outside normal conditions. A server should
    NOT send this error code if it detects a content change
    in it unprocessed messages. The result even computed
    on an older state might still be useful for the client.
    
    If a client decides that a result is not of any use anymore
    the client should cancel the request."""
    REQUEST_CANCELLED = -32800
    """The client has canceled a request and a server as detected
    the cancel."""
    LSP_RESERVED_ERROR_RANGE_END = -32800
    """This is the end range of LSP reserved error codes.
    It doesn't denote a real error code.
    
    @since 3.16.0"""
    # Since: 3.16.0


@enum.unique
class FoldingRangeKind(enum.Enum):
    """A set of predefined range kinds."""

    COMMENT = "comment"
    """Folding range for a comment"""
    IMPORTS = "imports"
    """Folding range for an import or include"""
    REGION = "region"
    """Folding range for a region (e.g. `#region`)"""


@enum.unique
class SymbolKind(enum.Enum):
    """A symbol kind."""

    FILE = 1
    MODULE = 2
    NAMESPACE = 3
    PACKAGE = 4
    CLASS = 5
    METHOD = 6
    PROPERTY = 7
    FIELD = 8
    CONSTRUCTOR = 9
    ENUM = 10
    INTERFACE = 11
    FUNCTION = 12
    VARIABLE = 13
    CONSTANT = 14
    STRING = 15
    NUMBER = 16
    BOOLEAN = 17
    ARRAY = 18
    OBJECT = 19
    KEY = 20
    NULL = 21
    ENUM_MEMBER = 22
    STRUCT = 23
    EVENT = 24
    OPERATOR = 25
    TYPE_PARAMETER = 26


@enum.unique
class SymbolTag(enum.Enum):
    """Symbol tags are extra annotations that tweak the rendering of a symbol.

    @since 3.16
    """

    # Since: 3.16
    DEPRECATED = 1
    """Render a symbol as obsolete, usually using a strike-out."""


@enum.unique
class UniquenessLevel(enum.Enum):
    """Moniker uniqueness level to define scope of the moniker.

    @since 3.16.0
    """

    # Since: 3.16.0
    DOCUMENT = "document"
    """The moniker is only unique inside a document"""
    PROJECT = "project"
    """The moniker is unique inside a project for which a dump got created"""
    GROUP = "group"
    """The moniker is unique inside the group to which a project belongs"""
    SCHEME = "scheme"
    """The moniker is unique inside the moniker scheme."""
    GLOBAL = "global"
    """The moniker is globally unique"""


@enum.unique
class MonikerKind(enum.Enum):
    """The moniker kind.

    @since 3.16.0
    """

    # Since: 3.16.0
    IMPORT = "import"
    """The moniker represent a symbol that is imported into a project"""
    EXPORT = "export"
    """The moniker represents a symbol that is exported from a project"""
    LOCAL = "local"
    """The moniker represents a symbol that is local to a project (e.g. a local
    variable of a function, a class not visible outside the project, ...)"""


@enum.unique
class InlayHintKind(enum.Enum):
    """Inlay hint kinds.

    @since 3.17.0
    """

    # Since: 3.17.0
    TYPE = 1
    """An inlay hint that for a type annotation."""
    PARAMETER = 2
    """An inlay hint that is for a parameter."""


@enum.unique
class MessageType(enum.Enum):
    """The message type."""

    ERROR = 1
    """An error message."""
    WARNING = 2
    """A warning message."""
    INFO = 3
    """An information message."""
    LOG = 4
    """A log message."""


@enum.unique
class TextDocumentSyncKind(enum.Enum):
    """Defines how the host (editor) should sync document changes to the
    language server."""

    NONE = 0
    """Documents should not be synced at all."""
    FULL = 1
    """Documents are synced by always sending the full content
    of the document."""
    INCREMENTAL = 2
    """Documents are synced by sending the full content on open.
    After that only incremental updates to the document are
    send."""


@enum.unique
class TextDocumentSaveReason(enum.Enum):
    """Represents reasons why a text document is saved."""

    MANUAL = 1
    """Manually triggered, e.g. by the user pressing save, by starting debugging,
    or by an API call."""
    AFTER_DELAY = 2
    """Automatic after a delay."""
    FOCUS_OUT = 3
    """When the editor lost focus."""


@enum.unique
class CompletionItemKind(enum.Enum):
    """The kind of a completion entry."""

    TEXT = 1
    METHOD = 2
    FUNCTION = 3
    CONSTRUCTOR = 4
    FIELD = 5
    VARIABLE = 6
    CLASS = 7
    INTERFACE = 8
    MODULE = 9
    PROPERTY = 10
    UNIT = 11
    VALUE = 12
    ENUM = 13
    KEYWORD = 14
    SNIPPET = 15
    COLOR = 16
    FILE = 17
    REFERENCE = 18
    FOLDER = 19
    ENUM_MEMBER = 20
    CONSTANT = 21
    STRUCT = 22
    EVENT = 23
    OPERATOR = 24
    TYPE_PARAMETER = 25


@enum.unique
class CompletionItemTag(enum.Enum):
    """Completion item tags are extra annotations that tweak the rendering of a
    completion item.

    @since 3.15.0
    """

    # Since: 3.15.0
    DEPRECATED = 1
    """Render a completion as obsolete, usually using a strike-out."""


@enum.unique
class InsertTextFormat(enum.Enum):
    """Defines whether the insert text in a completion item should be
    interpreted as plain text or a snippet."""

    PLAIN_TEXT = 1
    """The primary text to be inserted is treated as a plain string."""
    SNIPPET = 2
    """The primary text to be inserted is treated as a snippet.
    
    A snippet can define tab stops and placeholders with `$1`, `$2`
    and `${3:foo}`. `$0` defines the final tab stop, it defaults to
    the end of the snippet. Placeholders with equal identifiers are linked,
    that is typing in one will update others too.
    
    See also: https://microsoft.github.io/language-server-protocol/specifications/specification-current/#snippet_syntax"""


@enum.unique
class InsertTextMode(enum.Enum):
    """How whitespace and indentation is handled during completion item
    insertion.

    @since 3.16.0
    """

    # Since: 3.16.0
    AS_IS = 1
    """The insertion or replace strings is taken as it is. If the
    value is multi line the lines below the cursor will be
    inserted using the indentation defined in the string value.
    The client will not apply any kind of adjustments to the
    string."""
    ADJUST_INDENTATION = 2
    """The editor adjusts leading whitespace of new lines so that
    they match the indentation up to the cursor of the line for
    which the item is accepted.
    
    Consider a line like this: <2tabs><cursor><3tabs>foo. Accepting a
    multi line completion item is indented using 2 tabs and all
    following lines inserted will be indented using 2 tabs as well."""


@enum.unique
class DocumentHighlightKind(enum.Enum):
    """A document highlight kind."""

    TEXT = 1
    """A textual occurrence."""
    READ = 2
    """Read-access of a symbol, like reading a variable."""
    WRITE = 3
    """Write-access of a symbol, like writing to a variable."""


@enum.unique
class CodeActionKind(enum.Enum):
    """A set of predefined code action kinds."""

    EMPTY = ""
    """Empty kind."""
    QUICK_FIX = "quickfix"
    """Base kind for quickfix actions: 'quickfix'"""
    REFACTOR = "refactor"
    """Base kind for refactoring actions: 'refactor'"""
    REFACTOR_EXTRACT = "refactor.extract"
    """Base kind for refactoring extraction actions: 'refactor.extract'
    
    Example extract actions:
    
    - Extract method
    - Extract function
    - Extract variable
    - Extract interface from class
    - ..."""
    REFACTOR_INLINE = "refactor.inline"
    """Base kind for refactoring inline actions: 'refactor.inline'
    
    Example inline actions:
    
    - Inline function
    - Inline variable
    - Inline constant
    - ..."""
    REFACTOR_REWRITE = "refactor.rewrite"
    """Base kind for refactoring rewrite actions: 'refactor.rewrite'
    
    Example rewrite actions:
    
    - Convert JavaScript function to class
    - Add or remove parameter
    - Encapsulate field
    - Make method static
    - Move method to base class
    - ..."""
    SOURCE = "source"
    """Base kind for source actions: `source`
    
    Source code actions apply to the entire file."""
    SOURCE_ORGANIZE_IMPORTS = "source.organizeImports"
    """Base kind for an organize imports source action: `source.organizeImports`"""
    SOURCE_FIX_ALL = "source.fixAll"
    """Base kind for auto-fix source actions: `source.fixAll`.
    
    Fix all actions automatically fix errors that have a clear fix that do not require user input.
    They should not suppress errors or perform unsafe fixes such as generating new types or classes.
    
    @since 3.15.0"""
    # Since: 3.15.0


@enum.unique
class TraceValues(enum.Enum):
    OFF = "off"
    """Turn tracing off."""
    MESSAGES = "messages"
    """Trace messages only."""
    VERBOSE = "verbose"
    """Verbose message tracing."""


@enum.unique
class MarkupKind(enum.Enum):
    """Describes the content type that a client supports in various result
    literals like `Hover`, `ParameterInfo` or `CompletionItem`.

    Please note that `MarkupKinds` must not start with a `$`. This kinds
    are reserved for internal usage.
    """

    PLAIN_TEXT = "plaintext"
    """Plain text is supported as a content format"""
    MARKDOWN = "markdown"
    """Markdown is supported as a content format"""


@enum.unique
class PositionEncodingKind(enum.Enum):
    """A set of predefined position encoding kinds.

    @since 3.17.0
    """

    # Since: 3.17.0
    UTF8 = "utf-8"
    """Character offsets count UTF-8 code units."""
    UTF16 = "utf-16"
    """Character offsets count UTF-16 code units.
    
    This is the default and must always be supported
    by servers"""
    UTF32 = "utf-32"
    """Character offsets count UTF-32 code units.
    
    Implementation note: these are the same as Unicode code points,
    so this `PositionEncodingKind` may also be used for an
    encoding-agnostic representation of character offsets."""


@enum.unique
class FileChangeType(enum.Enum):
    """The file event type."""

    CREATED = 1
    """The file got created."""
    CHANGED = 2
    """The file got changed."""
    DELETED = 3
    """The file got deleted."""


@enum.unique
class WatchKind(enum.Enum):
    CREATE = 1
    """Interested in create events."""
    CHANGE = 2
    """Interested in change events"""
    DELETE = 4
    """Interested in delete events"""


@enum.unique
class DiagnosticSeverity(enum.Enum):
    """The diagnostic's severity."""

    ERROR = 1
    """Reports an error."""
    WARNING = 2
    """Reports a warning."""
    INFORMATION = 3
    """Reports an information."""
    HINT = 4
    """Reports a hint."""


@enum.unique
class DiagnosticTag(enum.Enum):
    """The diagnostic tags.

    @since 3.15.0
    """

    # Since: 3.15.0
    UNNECESSARY = 1
    """Unused or unnecessary code.
    
    Clients are allowed to render diagnostics with this tag faded out instead of having
    an error squiggle."""
    DEPRECATED = 2
    """Deprecated or obsolete code.
    
    Clients are allowed to rendered diagnostics with this tag strike through."""


@enum.unique
class CompletionTriggerKind(enum.Enum):
    """How a completion was triggered."""

    INVOKED = 1
    """Completion was triggered by typing an identifier (24x7 code
    complete), manual invocation (e.g Ctrl+Space) or via API."""
    TRIGGER_CHARACTER = 2
    """Completion was triggered by a trigger character specified by
    the `triggerCharacters` properties of the `CompletionRegistrationOptions`."""
    TRIGGER_FOR_INCOMPLETE_COMPLETIONS = 3
    """Completion was re-triggered as current completion list is incomplete"""


@enum.unique
class SignatureHelpTriggerKind(enum.Enum):
    """How a signature help was triggered.

    @since 3.15.0
    """

    # Since: 3.15.0
    INVOKED = 1
    """Signature help was invoked manually by the user or by a command."""
    TRIGGER_CHARACTER = 2
    """Signature help was triggered by a trigger character."""
    CONTENT_CHANGE = 3
    """Signature help was triggered by the cursor moving or by the document content changing."""


@enum.unique
class CodeActionTriggerKind(enum.Enum):
    """The reason why code actions were requested.

    @since 3.17.0
    """

    # Since: 3.17.0
    INVOKED = 1
    """Code actions were explicitly requested by the user or by an extension."""
    AUTOMATIC = 2
    """Code actions were requested automatically.
    
    This typically happens when current selection in a file changes, but can
    also be triggered when file content changes."""


@enum.unique
class FileOperationPatternKind(enum.Enum):
    """A pattern kind describing if a glob pattern matches a file a folder or
    both.

    @since 3.16.0
    """

    # Since: 3.16.0
    FILE = "file"
    """The pattern matches a file only."""
    FOLDER = "folder"
    """The pattern matches a folder only."""


@enum.unique
class NotebookCellKind(enum.Enum):
    """A notebook cell kind.

    @since 3.17.0
    """

    # Since: 3.17.0
    MARKUP = 1
    """A markup-cell is formatted source that is used for display."""
    CODE = 2
    """A code-cell is source code."""


@enum.unique
class ResourceOperationKind(enum.Enum):
    CREATE = "create"
    """Supports creating new files and folders."""
    RENAME = "rename"
    """Supports renaming existing files and folders."""
    DELETE = "delete"
    """Supports deleting existing files and folders."""


@enum.unique
class FailureHandlingKind(enum.Enum):
    ABORT = "abort"
    """Applying the workspace change is simply aborted if one of the changes provided
    fails. All operations executed before the failing operation stay executed."""
    TRANSACTIONAL = "transactional"
    """All operations are executed transactional. That means they either all
    succeed or no changes at all are applied to the workspace."""
    TEXT_ONLY_TRANSACTIONAL = "textOnlyTransactional"
    """If the workspace edit contains only textual file changes they are executed transactional.
    If resource changes (create, rename or delete file) are part of the change the failure
    handling strategy is abort."""
    UNDO = "undo"
    """The client tries to undo the operations already executed. But there is no
    guarantee that this is succeeding."""


@enum.unique
class PrepareSupportDefaultBehavior(enum.Enum):
    IDENTIFIER = 1
    """The client's default behavior is to select the identifier
    according the to language's syntax rule."""


@enum.unique
class TokenFormat(enum.Enum):
    RELATIVE = "relative"


Definition = Union["Location", List["Location"]]
"""The definition of a symbol represented as one or many locations.
For most programming languages there is only one location at which a symbol is
defined.

Servers should prefer returning `DefinitionLink` over `Definition` if supported
by the client."""

DefinitionLink = "LocationLink"
"""Information about where a symbol is defined.

Provides additional metadata over normal location definitions, including the range of
the defining symbol"""

LSPArray = List["LSPAny"]
"""LSP arrays.
@since 3.17.0"""
# Since: 3.17.0

LSPAny = Union["LSPObject", "LSPArray", str, int, int, float, bool, None]
"""The LSP any type.
Please note that strictly speaking a property with the value `undefined`
can't be converted into JSON preserving the property name. However for
convenience it is allowed and assumed that all these properties are
optional as well.
@since 3.17.0"""
# Since: 3.17.0

Declaration = Union["Location", List["Location"]]
"""The declaration of a symbol representation as one or many locations."""

DeclarationLink = "LocationLink"
"""Information about where a symbol is declared.

Provides additional metadata over normal location declarations, including the range of
the declaring symbol.

Servers should prefer returning `DeclarationLink` over `Declaration` if supported
by the client."""

InlineValue = Union[
    "InlineValueText", "InlineValueVariableLookup", "InlineValueEvaluatableExpression"
]
"""Inline value information can be provided by different means:
- directly as a text value (class InlineValueText).
- as a name to use for a variable lookup (class InlineValueVariableLookup)
- as an evaluatable expression (class InlineValueEvaluatableExpression)
The InlineValue types combines all inline value types into one type.

@since 3.17.0"""
# Since: 3.17.0

DocumentDiagnosticReport = Union[
    "RelatedFullDocumentDiagnosticReport", "RelatedUnchangedDocumentDiagnosticReport"
]
"""The result of a document diagnostic pull request. A report can
either be a full report containing all diagnostics for the
requested document or an unchanged report indicating that nothing
has changed in terms of diagnostics in comparison to the last
pull request.

@since 3.17.0"""
# Since: 3.17.0


@attrs.define
class PrepareRenameResult_Type1:
    range: "Range" = attrs.field()
    placeholder: str = attrs.field(validator=attrs.validators.instance_of(str))


@attrs.define
class PrepareRenameResult_Type2:
    defaultBehavior: bool = attrs.field(validator=attrs.validators.instance_of(bool))


PrepareRenameResult = Union[
    "Range", "PrepareRenameResult_Type1", "PrepareRenameResult_Type2"
]

URI = str
"""A tagging type for string properties that are actually URIs

@since 3.16.0"""
# Since: 3.16.0

ProgressToken = Union[int, str]

DocumentSelector = List[Union[str, "DocumentFilter"]]
"""A document selector is the combination of one or many document filters.

@sample `let sel:DocumentSelector = [{ language: 'typescript' }, { language: 'json', pattern: '**/tsconfig.json' }]`;

The use of a string as a document filter is deprecated @since 3.16.0."""
# Since: 3.16.0.

ChangeAnnotationIdentifier = str
"""An identifier to refer to a change annotation stored with a workspace edit."""

WorkspaceDocumentDiagnosticReport = Union[
    "WorkspaceFullDocumentDiagnosticReport",
    "WorkspaceUnchangedDocumentDiagnosticReport",
]
"""A workspace diagnostic document report.

@since 3.17.0"""
# Since: 3.17.0


@attrs.define
class TextDocumentContentChangeEvent_Type1:
    range: "Range" = attrs.field()
    """The range of the document that changed."""
    text: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The new text for the provided range."""
    rangeLength: Optional[int] = attrs.field(
        validator=attrs.validators.optional(validators.uinteger_validator),
        default=None,
    )
    """The optional length of the range that got replaced.
    
    @deprecated use range instead."""


@attrs.define
class TextDocumentContentChangeEvent_Type2:
    text: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The new text of the whole document."""


TextDocumentContentChangeEvent = Union[
    "TextDocumentContentChangeEvent_Type1", "TextDocumentContentChangeEvent_Type2"
]
"""An event describing a change to a text document. If only a text is provided
it is considered to be the full content of the document."""


@attrs.define
class MarkedString_Type1:
    language: str = attrs.field(validator=attrs.validators.instance_of(str))
    value: str = attrs.field(validator=attrs.validators.instance_of(str))


MarkedString = Union[str, "MarkedString_Type1"]
"""MarkedString can be used to render human readable text. It is either a markdown string
or a code-block that provides a language and a code snippet. The language identifier
is semantically equal to the optional language identifier in fenced code blocks in GitHub
issues. See https://help.github.com/articles/creating-and-highlighting-code-blocks/#syntax-highlighting

The pair of a language and a value is an equivalent to markdown:
```${language}
${value}
```

Note that markdown strings will be sanitized - that means html will be escaped.
@deprecated use MarkupContent instead."""

DocumentFilter = Union["TextDocumentFilter", "NotebookCellTextDocumentFilter"]
"""A document filter describes a top level text document or
a notebook cell document.

@since 3.17.0 - proposed support for NotebookCellTextDocumentFilter."""
# Since: 3.17.0 - proposed support for NotebookCellTextDocumentFilter.

GlobPattern = Union["Pattern", "RelativePattern"]
"""The glob pattern. Either a string pattern or a relative pattern.

@since 3.17.0"""
# Since: 3.17.0


@attrs.define
class TextDocumentFilter_Type1:
    language: str = attrs.field(validator=attrs.validators.instance_of(str))
    """A language id, like `typescript`."""
    scheme: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """A Uri scheme, like `file` or `untitled`."""
    pattern: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """A glob pattern, like `*.{ts,js}`."""


@attrs.define
class TextDocumentFilter_Type2:
    scheme: str = attrs.field(validator=attrs.validators.instance_of(str))
    """A Uri scheme, like `file` or `untitled`."""
    language: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """A language id, like `typescript`."""
    pattern: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """A glob pattern, like `*.{ts,js}`."""


@attrs.define
class TextDocumentFilter_Type3:
    pattern: str = attrs.field(validator=attrs.validators.instance_of(str))
    """A glob pattern, like `*.{ts,js}`."""
    language: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """A language id, like `typescript`."""
    scheme: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """A Uri scheme, like `file` or `untitled`."""


TextDocumentFilter = Union[
    "TextDocumentFilter_Type1", "TextDocumentFilter_Type2", "TextDocumentFilter_Type3"
]
"""A document filter denotes a document by different properties like
the language, the scheme of
its resource, or a glob-pattern that is applied to the path.

Glob patterns can have the following syntax:
- `*` to match one or more characters in a path segment
- `?` to match on one character in a path segment
- `**` to match any number of path segments, including none
- `{}` to group sub patterns into an OR expression. (e.g. `**/*.{ts,js}` matches all TypeScript and JavaScript files)
- `[]` to declare a range of characters to match in a path segment (e.g., `example.[0-9]` to match on `example.0`, `example.1`, …)
- `[!...]` to negate a range of characters to match in a path segment (e.g., `example.[!0-9]` to match on `example.a`, `example.b`, but not `example.0`)

@sample A language filter that applies to typescript files on disk: `{ language: 'typescript', scheme: 'file' }`
@sample A language filter that applies to all package.json paths: `{ language: 'json', pattern: '**package.json' }`

@since 3.17.0"""
# Since: 3.17.0


@attrs.define
class NotebookDocumentFilter_Type1:
    notebookType: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The type of the enclosing notebook."""
    scheme: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """A Uri scheme, like `file` or `untitled`."""
    pattern: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """A glob pattern."""


@attrs.define
class NotebookDocumentFilter_Type2:
    scheme: str = attrs.field(validator=attrs.validators.instance_of(str))
    """A Uri scheme, like `file` or `untitled`."""
    notebookType: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The type of the enclosing notebook."""
    pattern: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """A glob pattern."""


@attrs.define
class NotebookDocumentFilter_Type3:
    pattern: str = attrs.field(validator=attrs.validators.instance_of(str))
    """A glob pattern."""
    notebookType: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The type of the enclosing notebook."""
    scheme: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """A Uri scheme, like `file` or `untitled`."""


NotebookDocumentFilter = Union[
    "NotebookDocumentFilter_Type1",
    "NotebookDocumentFilter_Type2",
    "NotebookDocumentFilter_Type3",
]
"""A notebook document filter denotes a notebook document by
different properties. The properties will be match
against the notebook's URI (same as with documents)

@since 3.17.0"""
# Since: 3.17.0

Pattern = str
"""The glob pattern to watch relative to the base path. Glob patterns can have the following syntax:
- `*` to match one or more characters in a path segment
- `?` to match on one character in a path segment
- `**` to match any number of path segments, including none
- `{}` to group conditions (e.g. `**/*.{ts,js}` matches all TypeScript and JavaScript files)
- `[]` to declare a range of characters to match in a path segment (e.g., `example.[0-9]` to match on `example.0`, `example.1`, …)
- `[!...]` to negate a range of characters to match in a path segment (e.g., `example.[!0-9]` to match on `example.a`, `example.b`, but not `example.0`)

@since 3.17.0"""
# Since: 3.17.0


@attrs.define
class TextDocumentPositionParams:
    """A parameter literal used in requests to pass a text document and a
    position inside that document."""

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    position: "Position" = attrs.field()
    """The position inside the text document."""


@attrs.define
class WorkDoneProgressParams:

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""


@attrs.define
class PartialResultParams:

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class ImplementationParams:

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    position: "Position" = attrs.field()
    """The position inside the text document."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class Location:
    """Represents a location inside a resource, such as a line inside a text
    file."""

    uri: str = attrs.field(validator=attrs.validators.instance_of(str))

    range: "Range" = attrs.field()


@attrs.define
class TextDocumentRegistrationOptions:
    """General text document registration options."""

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""


@attrs.define
class WorkDoneProgressOptions:

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class ImplementationOptions:

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class StaticRegistrationOptions:
    """Static registration options to be returned in the initialize request."""

    id: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The id used to register the request. The id can be used to deregister
    the request again. See also Registration#id."""


@attrs.define
class ImplementationRegistrationOptions:

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""

    id: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The id used to register the request. The id can be used to deregister
    the request again. See also Registration#id."""


@attrs.define
class TypeDefinitionParams:

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    position: "Position" = attrs.field()
    """The position inside the text document."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class TypeDefinitionOptions:

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class TypeDefinitionRegistrationOptions:

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""

    id: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The id used to register the request. The id can be used to deregister
    the request again. See also Registration#id."""


@attrs.define
class WorkspaceFolder:
    """A workspace folder inside a client."""

    uri: "URI" = attrs.field()
    """The associated URI for this workspace folder."""

    name: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The name of the workspace folder. Used to refer to this
    workspace folder in the user interface."""


@attrs.define
class DidChangeWorkspaceFoldersParams:
    """The parameters of a `workspace/didChangeWorkspaceFolders`
    notification."""

    event: "WorkspaceFoldersChangeEvent" = attrs.field()
    """The actual workspace folder change event."""


@attrs.define
class ConfigurationParams:
    """The parameters of a configuration request."""

    items: List["ConfigurationItem"] = attrs.field()


@attrs.define
class DocumentColorParams:
    """Parameters for a DocumentColorRequest."""

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class ColorInformation:
    """Represents a color range from a document."""

    range: "Range" = attrs.field()
    """The range in the document where this color appears."""

    color: "Color" = attrs.field()
    """The actual color value for this color range."""


@attrs.define
class DocumentColorOptions:

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class DocumentColorRegistrationOptions:

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""

    id: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The id used to register the request. The id can be used to deregister
    the request again. See also Registration#id."""


@attrs.define
class ColorPresentationParams:
    """Parameters for a ColorPresentationRequest."""

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    color: "Color" = attrs.field()
    """The color to request presentations for."""

    range: "Range" = attrs.field()
    """The range where the color would be inserted. Serves as a context."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class ColorPresentation:

    label: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The label of this color presentation. It will be shown on the color
    picker header. By default this is also the text that is inserted when selecting
    this color presentation."""

    textEdit: Optional["TextEdit"] = attrs.field(default=None)
    """An edit which is applied to a document when selecting
    this presentation for the color.  When `falsy` the label
    is used."""

    additionalTextEdits: Optional[List["TextEdit"]] = attrs.field(default=None)
    """An optional array of additional text edits that are applied when
    selecting this color presentation. Edits must not overlap with the main edit nor with themselves."""


@attrs.define
class FoldingRangeParams:
    """Parameters for a FoldingRangeRequest."""

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class FoldingRange:
    """Represents a folding range.

    To be valid, start and end line must be bigger than zero and smaller
    than the number of lines in the document. Clients are free to ignore
    invalid ranges.
    """

    startLine: int = attrs.field(validator=validators.uinteger_validator)
    """The zero-based start line of the range to fold. The folded area starts after the line's last character.
    To be valid, the end must be zero or larger and smaller than the number of lines in the document."""

    endLine: int = attrs.field(validator=validators.uinteger_validator)
    """The zero-based end line of the range to fold. The folded area ends with the line's last character.
    To be valid, the end must be zero or larger and smaller than the number of lines in the document."""

    startCharacter: Optional[int] = attrs.field(
        validator=attrs.validators.optional(validators.uinteger_validator),
        default=None,
    )
    """The zero-based character offset from where the folded range starts. If not defined, defaults to the length of the start line."""

    endCharacter: Optional[int] = attrs.field(
        validator=attrs.validators.optional(validators.uinteger_validator),
        default=None,
    )
    """The zero-based character offset before the folded range ends. If not defined, defaults to the length of the end line."""

    kind: Optional["FoldingRangeKind"] = attrs.field(default=None)
    """Describes the kind of the folding range such as `comment' or 'region'. The kind
    is used to categorize folding ranges and used by commands like 'Fold all comments'.
    See FoldingRangeKind for an enumeration of standardized kinds."""

    collapsedText: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The text that the client should show when the specified range is
    collapsed. If not defined or not supported by the client, a default
    will be chosen by the client.
    
    @since 3.17.0"""
    # Since: 3.17.0


@attrs.define
class FoldingRangeOptions:

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class FoldingRangeRegistrationOptions:

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""

    id: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The id used to register the request. The id can be used to deregister
    the request again. See also Registration#id."""


@attrs.define
class DeclarationParams:

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    position: "Position" = attrs.field()
    """The position inside the text document."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class DeclarationOptions:

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class DeclarationRegistrationOptions:

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""

    id: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The id used to register the request. The id can be used to deregister
    the request again. See also Registration#id."""


@attrs.define
class SelectionRangeParams:
    """A parameter literal used in selection range requests."""

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    positions: List["Position"] = attrs.field()
    """The positions inside the text document."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class SelectionRange:
    """A selection range represents a part of a selection hierarchy.

    A selection range may have a parent selection range that contains
    it.
    """

    range: "Range" = attrs.field()
    """The range of this selection range."""

    parent: Optional["SelectionRange"] = attrs.field(default=None)
    """The parent selection range containing this range. Therefore `parent.range` must contain `this.range`."""


@attrs.define
class SelectionRangeOptions:

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class SelectionRangeRegistrationOptions:

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""

    id: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The id used to register the request. The id can be used to deregister
    the request again. See also Registration#id."""


@attrs.define
class WorkDoneProgressCreateParams:

    token: "ProgressToken" = attrs.field()
    """The token to be used to report progress."""


@attrs.define
class WorkDoneProgressCancelParams:

    token: "ProgressToken" = attrs.field()
    """The token to be used to report progress."""


@attrs.define
class CallHierarchyPrepareParams:
    """The parameter of a `textDocument/prepareCallHierarchy` request.

    @since 3.16.0
    """

    # Since: 3.16.0

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    position: "Position" = attrs.field()
    """The position inside the text document."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""


@attrs.define
class CallHierarchyItem:
    """Represents programming constructs like functions or constructors in the
    context of call hierarchy.

    @since 3.16.0
    """

    # Since: 3.16.0

    name: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The name of this item."""

    kind: "SymbolKind" = attrs.field()
    """The kind of this item."""

    uri: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The resource identifier of this item."""

    range: "Range" = attrs.field()
    """The range enclosing this symbol not including leading/trailing whitespace but everything else, e.g. comments and code."""

    selectionRange: "Range" = attrs.field()
    """The range that should be selected and revealed when this symbol is being picked, e.g. the name of a function.
    Must be contained by the [`range`](#CallHierarchyItem.range)."""

    tags: Optional[List["SymbolTag"]] = attrs.field(default=None)
    """Tags for this item."""

    detail: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """More detail for this item, e.g. the signature of a function."""

    data: Optional["LSPAny"] = attrs.field(default=None)
    """A data entry field that is preserved between a call hierarchy prepare and
    incoming calls or outgoing calls requests."""


@attrs.define
class CallHierarchyOptions:
    """Call hierarchy options used during static registration.

    @since 3.16.0
    """

    # Since: 3.16.0

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class CallHierarchyRegistrationOptions:
    """Call hierarchy options used during static or dynamic registration.

    @since 3.16.0
    """

    # Since: 3.16.0

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""

    id: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The id used to register the request. The id can be used to deregister
    the request again. See also Registration#id."""


@attrs.define
class CallHierarchyIncomingCallsParams:
    """The parameter of a `callHierarchy/incomingCalls` request.

    @since 3.16.0
    """

    # Since: 3.16.0

    item: "CallHierarchyItem" = attrs.field()

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class CallHierarchyIncomingCall:
    """Represents an incoming call, e.g. a caller of a method or constructor.

    @since 3.16.0
    """

    # Since: 3.16.0

    from_: "CallHierarchyItem" = attrs.field()
    """The item that makes the call."""

    fromRanges: List["Range"] = attrs.field()
    """The ranges at which the calls appear. This is relative to the caller
    denoted by [`this.from`](#CallHierarchyIncomingCall.from)."""


@attrs.define
class CallHierarchyOutgoingCallsParams:
    """The parameter of a `callHierarchy/outgoingCalls` request.

    @since 3.16.0
    """

    # Since: 3.16.0

    item: "CallHierarchyItem" = attrs.field()

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class CallHierarchyOutgoingCall:
    """Represents an outgoing call, e.g. calling a getter from a method or a
    method from a constructor etc.

    @since 3.16.0
    """

    # Since: 3.16.0

    to: "CallHierarchyItem" = attrs.field()
    """The item that is called."""

    fromRanges: List["Range"] = attrs.field()
    """The range at which this item is called. This is the range relative to the caller, e.g the item
    passed to [`provideCallHierarchyOutgoingCalls`](#CallHierarchyItemProvider.provideCallHierarchyOutgoingCalls)
    and not [`this.to`](#CallHierarchyOutgoingCall.to)."""


@attrs.define
class SemanticTokensParams:
    """@since 3.16.0"""

    # Since: 3.16.0

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class SemanticTokens:
    """@since 3.16.0"""

    # Since: 3.16.0

    data: List[int] = attrs.field()
    """The actual tokens."""

    resultId: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """An optional result id. If provided and clients support delta updating
    the client will include the result id in the next semantic token request.
    A server can then instead of computing all semantic tokens again simply
    send a delta."""


@attrs.define
class SemanticTokensPartialResult:
    """@since 3.16.0"""

    # Since: 3.16.0

    data: List[int] = attrs.field()


@attrs.define
class SemanticTokensOptions:
    """@since 3.16.0"""

    # Since: 3.16.0

    legend: "SemanticTokensLegend" = attrs.field()
    """The legend used by the server"""

    range: Optional[Union[bool, "None"]] = attrs.field(default=None)
    """Server supports providing semantic tokens for a specific range
    of a document."""

    full: Optional[Union[bool, "None"]] = attrs.field(default=None)
    """Server supports providing semantic tokens for a full document."""

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class SemanticTokensRegistrationOptions:
    """@since 3.16.0"""

    # Since: 3.16.0

    legend: "SemanticTokensLegend" = attrs.field()
    """The legend used by the server"""

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""

    range: Optional[Union[bool, "None"]] = attrs.field(default=None)
    """Server supports providing semantic tokens for a specific range
    of a document."""

    full: Optional[Union[bool, "None"]] = attrs.field(default=None)
    """Server supports providing semantic tokens for a full document."""

    id: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The id used to register the request. The id can be used to deregister
    the request again. See also Registration#id."""


@attrs.define
class SemanticTokensDeltaParams:
    """@since 3.16.0"""

    # Since: 3.16.0

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    previousResultId: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The result id of a previous response. The result Id can either point to a full response
    or a delta response depending on what was received last."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class SemanticTokensDelta:
    """@since 3.16.0"""

    # Since: 3.16.0

    edits: List["SemanticTokensEdit"] = attrs.field()
    """The semantic token edits to transform a previous result into a new result."""

    resultId: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )


@attrs.define
class SemanticTokensDeltaPartialResult:
    """@since 3.16.0"""

    # Since: 3.16.0

    edits: List["SemanticTokensEdit"] = attrs.field()


@attrs.define
class SemanticTokensRangeParams:
    """@since 3.16.0"""

    # Since: 3.16.0

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    range: "Range" = attrs.field()
    """The range the semantic tokens are requested for."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class ShowDocumentParams:
    """Params to show a document.

    @since 3.16.0
    """

    # Since: 3.16.0

    uri: "URI" = attrs.field()
    """The document uri to show."""

    external: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Indicates to show the resource in an external program.
    To show for example `https://code.visualstudio.com/`
    in the default WEB browser set `external` to `true`."""

    takeFocus: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """An optional property to indicate whether the editor
    showing the document should take focus or not.
    Clients might ignore this property if an external
    program is started."""

    selection: Optional["Range"] = attrs.field(default=None)
    """An optional selection range if the document is a text
    document. Clients might ignore the property if an
    external program is started or the file is not a text
    file."""


@attrs.define
class ShowDocumentResult:
    """The result of a showDocument request.

    @since 3.16.0
    """

    # Since: 3.16.0

    success: bool = attrs.field(validator=attrs.validators.instance_of(bool))
    """A boolean indicating if the show was successful."""


@attrs.define
class LinkedEditingRangeParams:

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    position: "Position" = attrs.field()
    """The position inside the text document."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""


@attrs.define
class LinkedEditingRanges:
    """The result of a linked editing range request.

    @since 3.16.0
    """

    # Since: 3.16.0

    ranges: List["Range"] = attrs.field()
    """A list of ranges that can be edited together. The ranges must have
    identical length and contain identical text content. The ranges cannot overlap."""

    wordPattern: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """An optional word pattern (regular expression) that describes valid contents for
    the given ranges. If no pattern is provided, the client configuration's word
    pattern will be used."""


@attrs.define
class LinkedEditingRangeOptions:

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class LinkedEditingRangeRegistrationOptions:

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""

    id: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The id used to register the request. The id can be used to deregister
    the request again. See also Registration#id."""


@attrs.define
class CreateFilesParams:
    """The parameters sent in notifications/requests for user-initiated
    creation of files.

    @since 3.16.0
    """

    # Since: 3.16.0

    files: List["FileCreate"] = attrs.field()
    """An array of all files/folders created in this operation."""


@attrs.define
class WorkspaceEdit:
    """A workspace edit represents changes to many resources managed in the
    workspace. The edit should either provide `changes` or `documentChanges`.
    If documentChanges are present they are preferred over `changes` if the
    client can handle versioned document edits.

    Since version 3.13.0 a workspace edit can contain resource operations as well. If resource
    operations are present clients need to execute the operations in the order in which they
    are provided. So a workspace edit for example can consist of the following two changes:
    (1) a create file a.txt and (2) a text document edit which insert text into file a.txt.

    An invalid sequence (e.g. (1) delete file a.txt and (2) insert text into file a.txt) will
    cause failure of the operation. How the client recovers from the failure is described by
    the client capability: `workspace.workspaceEdit.failureHandling`
    """

    changes: Optional[Dict[str, List["TextEdit"]]] = attrs.field(default=None)
    """Holds changes to existing resources."""

    documentChanges: Optional[
        List[Union["TextDocumentEdit", "CreateFile", "RenameFile", "DeleteFile"]]
    ] = attrs.field(default=None)
    """Depending on the client capability `workspace.workspaceEdit.resourceOperations` document changes
    are either an array of `TextDocumentEdit`s to express changes to n different text documents
    where each text document edit addresses a specific version of a text document. Or it can contain
    above `TextDocumentEdit`s mixed with create, rename and delete file / folder operations.
    
    Whether a client supports versioned document edits is expressed via
    `workspace.workspaceEdit.documentChanges` client capability.
    
    If a client neither supports `documentChanges` nor `workspace.workspaceEdit.resourceOperations` then
    only plain `TextEdit`s using the `changes` property are supported."""

    changeAnnotations: Optional[
        Dict["ChangeAnnotationIdentifier", "ChangeAnnotation"]
    ] = attrs.field(default=None)
    """A map of change annotations that can be referenced in `AnnotatedTextEdit`s or create, rename and
    delete file / folder operations.
    
    Whether clients honor this property depends on the client capability `workspace.changeAnnotationSupport`.
    
    @since 3.16.0"""
    # Since: 3.16.0


@attrs.define
class FileOperationRegistrationOptions:
    """The options to register for file operations.

    @since 3.16.0
    """

    # Since: 3.16.0

    filters: List["FileOperationFilter"] = attrs.field()
    """The actual filters."""


@attrs.define
class RenameFilesParams:
    """The parameters sent in notifications/requests for user-initiated renames
    of files.

    @since 3.16.0
    """

    # Since: 3.16.0

    files: List["FileRename"] = attrs.field()
    """An array of all files/folders renamed in this operation. When a folder is renamed, only
    the folder will be included, and not its children."""


@attrs.define
class DeleteFilesParams:
    """The parameters sent in notifications/requests for user-initiated deletes
    of files.

    @since 3.16.0
    """

    # Since: 3.16.0

    files: List["FileDelete"] = attrs.field()
    """An array of all files/folders deleted in this operation."""


@attrs.define
class MonikerParams:

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    position: "Position" = attrs.field()
    """The position inside the text document."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class Moniker:
    """Moniker definition to match LSIF 0.5 moniker definition.

    @since 3.16.0
    """

    # Since: 3.16.0

    scheme: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The scheme of the moniker. For example tsc or .Net"""

    identifier: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The identifier of the moniker. The value is opaque in LSIF however
    schema owners are allowed to define the structure if they want."""

    unique: "UniquenessLevel" = attrs.field()
    """The scope in which the moniker is unique"""

    kind: Optional["MonikerKind"] = attrs.field(default=None)
    """The moniker kind if known."""


@attrs.define
class MonikerOptions:

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class MonikerRegistrationOptions:

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""


@attrs.define
class TypeHierarchyPrepareParams:
    """The parameter of a `textDocument/prepareTypeHierarchy` request.

    @since 3.17.0
    """

    # Since: 3.17.0

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    position: "Position" = attrs.field()
    """The position inside the text document."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""


@attrs.define
class TypeHierarchyItem:
    """@since 3.17.0"""

    # Since: 3.17.0

    name: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The name of this item."""

    kind: "SymbolKind" = attrs.field()
    """The kind of this item."""

    uri: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The resource identifier of this item."""

    range: "Range" = attrs.field()
    """The range enclosing this symbol not including leading/trailing whitespace
    but everything else, e.g. comments and code."""

    selectionRange: "Range" = attrs.field()
    """The range that should be selected and revealed when this symbol is being
    picked, e.g. the name of a function. Must be contained by the
    [`range`](#TypeHierarchyItem.range)."""

    tags: Optional[List["SymbolTag"]] = attrs.field(default=None)
    """Tags for this item."""

    detail: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """More detail for this item, e.g. the signature of a function."""

    data: Optional["LSPAny"] = attrs.field(default=None)
    """A data entry field that is preserved between a type hierarchy prepare and
    supertypes or subtypes requests. It could also be used to identify the
    type hierarchy in the server, helping improve the performance on
    resolving supertypes and subtypes."""


@attrs.define
class TypeHierarchyOptions:
    """Type hierarchy options used during static registration.

    @since 3.17.0
    """

    # Since: 3.17.0

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class TypeHierarchyRegistrationOptions:
    """Type hierarchy options used during static or dynamic registration.

    @since 3.17.0
    """

    # Since: 3.17.0

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""

    id: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The id used to register the request. The id can be used to deregister
    the request again. See also Registration#id."""


@attrs.define
class TypeHierarchySupertypesParams:
    """The parameter of a `typeHierarchy/supertypes` request.

    @since 3.17.0
    """

    # Since: 3.17.0

    item: "TypeHierarchyItem" = attrs.field()

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class TypeHierarchySubtypesParams:
    """The parameter of a `typeHierarchy/subtypes` request.

    @since 3.17.0
    """

    # Since: 3.17.0

    item: "TypeHierarchyItem" = attrs.field()

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class InlineValueParams:
    """A parameter literal used in inline value requests.

    @since 3.17.0
    """

    # Since: 3.17.0

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    range: "Range" = attrs.field()
    """The document range for which inline values should be computed."""

    context: "InlineValueContext" = attrs.field()
    """Additional information about the context in which inline values were
    requested."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""


@attrs.define
class InlineValueOptions:
    """Inline value options used during static registration.

    @since 3.17.0
    """

    # Since: 3.17.0

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class InlineValueRegistrationOptions:
    """Inline value options used during static or dynamic registration.

    @since 3.17.0
    """

    # Since: 3.17.0

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""

    id: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The id used to register the request. The id can be used to deregister
    the request again. See also Registration#id."""


@attrs.define
class InlayHintParams:
    """A parameter literal used in inlay hint requests.

    @since 3.17.0
    """

    # Since: 3.17.0

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    range: "Range" = attrs.field()
    """The document range for which inlay hints should be computed."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""


@attrs.define
class InlayHint:
    """Inlay hint information.

    @since 3.17.0
    """

    # Since: 3.17.0

    position: "Position" = attrs.field()
    """The position of this hint."""

    label: Union[str, List["InlayHintLabelPart"]] = attrs.field()
    """The label of this hint. A human readable string or an array of
    InlayHintLabelPart label parts.
    
    *Note* that neither the string nor the label part can be empty."""

    kind: Optional["InlayHintKind"] = attrs.field(default=None)
    """The kind of this hint. Can be omitted in which case the client
    should fall back to a reasonable default."""

    textEdits: Optional[List["TextEdit"]] = attrs.field(default=None)
    """Optional text edits that are performed when accepting this inlay hint.
    
    *Note* that edits are expected to change the document so that the inlay
    hint (or its nearest variant) is now part of the document and the inlay
    hint itself is now obsolete."""

    tooltip: Optional[Union[str, "MarkupContent"]] = attrs.field(default=None)
    """The tooltip text when you hover over this item."""

    paddingLeft: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Render padding before the hint.
    
    Note: Padding should use the editor's background color, not the
    background color of the hint itself. That means padding can be used
    to visually align/separate an inlay hint."""

    paddingRight: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Render padding after the hint.
    
    Note: Padding should use the editor's background color, not the
    background color of the hint itself. That means padding can be used
    to visually align/separate an inlay hint."""

    data: Optional["LSPAny"] = attrs.field(default=None)
    """A data entry field that is preserved on an inlay hint between
    a `textDocument/inlayHint` and a `inlayHint/resolve` request."""


@attrs.define
class InlayHintOptions:
    """Inlay hint options used during static registration.

    @since 3.17.0
    """

    # Since: 3.17.0

    resolveProvider: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The server provides support to resolve additional
    information for an inlay hint item."""

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class InlayHintRegistrationOptions:
    """Inlay hint options used during static or dynamic registration.

    @since 3.17.0
    """

    # Since: 3.17.0

    resolveProvider: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The server provides support to resolve additional
    information for an inlay hint item."""

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""

    id: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The id used to register the request. The id can be used to deregister
    the request again. See also Registration#id."""


@attrs.define
class DocumentDiagnosticParams:
    """Parameters of the document diagnostic request.

    @since 3.17.0
    """

    # Since: 3.17.0

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    identifier: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The additional identifier  provided during registration."""

    previousResultId: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The result id of a previous response if provided."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class DocumentDiagnosticReportPartialResult:
    """A partial result for a document diagnostic report.

    @since 3.17.0
    """

    # Since: 3.17.0

    relatedDocuments: Dict[
        str, Union["FullDocumentDiagnosticReport", "UnchangedDocumentDiagnosticReport"]
    ] = attrs.field()


@attrs.define
class DiagnosticServerCancellationData:
    """Cancellation data returned from a diagnostic request.

    @since 3.17.0
    """

    # Since: 3.17.0

    retriggerRequest: bool = attrs.field(validator=attrs.validators.instance_of(bool))


@attrs.define
class DiagnosticOptions:
    """Diagnostic options.

    @since 3.17.0
    """

    # Since: 3.17.0

    interFileDependencies: bool = attrs.field(
        validator=attrs.validators.instance_of(bool)
    )
    """Whether the language has inter file dependencies meaning that
    editing code in one file can result in a different diagnostic
    set in another file. Inter file dependencies are common for
    most programming languages and typically uncommon for linters."""

    workspaceDiagnostics: bool = attrs.field(
        validator=attrs.validators.instance_of(bool)
    )
    """The server provides support for workspace diagnostics as well."""

    identifier: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """An optional identifier under which the diagnostics are
    managed by the client."""

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class DiagnosticRegistrationOptions:
    """Diagnostic registration options.

    @since 3.17.0
    """

    # Since: 3.17.0

    interFileDependencies: bool = attrs.field(
        validator=attrs.validators.instance_of(bool)
    )
    """Whether the language has inter file dependencies meaning that
    editing code in one file can result in a different diagnostic
    set in another file. Inter file dependencies are common for
    most programming languages and typically uncommon for linters."""

    workspaceDiagnostics: bool = attrs.field(
        validator=attrs.validators.instance_of(bool)
    )
    """The server provides support for workspace diagnostics as well."""

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""

    identifier: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """An optional identifier under which the diagnostics are
    managed by the client."""

    id: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The id used to register the request. The id can be used to deregister
    the request again. See also Registration#id."""


@attrs.define
class WorkspaceDiagnosticParams:
    """Parameters of the workspace diagnostic request.

    @since 3.17.0
    """

    # Since: 3.17.0

    previousResultIds: List["PreviousResultId"] = attrs.field()
    """The currently known diagnostic reports with their
    previous result ids."""

    identifier: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The additional identifier provided during registration."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class WorkspaceDiagnosticReport:
    """A workspace diagnostic report.

    @since 3.17.0
    """

    # Since: 3.17.0

    items: List["WorkspaceDocumentDiagnosticReport"] = attrs.field()


@attrs.define
class WorkspaceDiagnosticReportPartialResult:
    """A partial result for a workspace diagnostic report.

    @since 3.17.0
    """

    # Since: 3.17.0

    items: List["WorkspaceDocumentDiagnosticReport"] = attrs.field()


@attrs.define
class DidOpenNotebookDocumentParams:
    """The params sent in an open notebook document notification.

    @since 3.17.0
    """

    # Since: 3.17.0

    notebookDocument: "NotebookDocument" = attrs.field()
    """The notebook document that got opened."""

    cellTextDocuments: List["TextDocumentItem"] = attrs.field()
    """The text documents that represent the content
    of a notebook cell."""


@attrs.define
class DidChangeNotebookDocumentParams:
    """The params sent in a change notebook document notification.

    @since 3.17.0
    """

    # Since: 3.17.0

    notebookDocument: "VersionedNotebookDocumentIdentifier" = attrs.field()
    """The notebook document that did change. The version number points
    to the version after all provided changes have been applied. If
    only the text document content of a cell changes the notebook version
    doesn't necessarily have to change."""

    change: "NotebookDocumentChangeEvent" = attrs.field()
    """The actual changes to the notebook document.
    
    The changes describe single state changes to the notebook document.
    So if there are two changes c1 (at array index 0) and c2 (at array
    index 1) for a notebook in state S then c1 moves the notebook from
    S to S' and c2 from S' to S''. So c1 is computed on the state S and
    c2 is computed on the state S'.
    
    To mirror the content of a notebook using change events use the following approach:
    - start with the same initial content
    - apply the 'notebookDocument/didChange' notifications in the order you receive them.
    - apply the `NotebookChangeEvent`s in a single notification in the order
      you receive them."""


@attrs.define
class DidSaveNotebookDocumentParams:
    """The params sent in a save notebook document notification.

    @since 3.17.0
    """

    # Since: 3.17.0

    notebookDocument: "NotebookDocumentIdentifier" = attrs.field()
    """The notebook document that got saved."""


@attrs.define
class DidCloseNotebookDocumentParams:
    """The params sent in a close notebook document notification.

    @since 3.17.0
    """

    # Since: 3.17.0

    notebookDocument: "NotebookDocumentIdentifier" = attrs.field()
    """The notebook document that got closed."""

    cellTextDocuments: List["TextDocumentIdentifier"] = attrs.field()
    """The text documents that represent the content
    of a notebook cell that got closed."""


@attrs.define
class RegistrationParams:

    registrations: List["Registration"] = attrs.field()


@attrs.define
class UnregistrationParams:

    unregisterations: List["Unregistration"] = attrs.field()


@attrs.define
class _InitializeParams:
    """The initialize parameters."""

    capabilities: "ClientCapabilities" = attrs.field()
    """The capabilities provided by the client (editor or tool)"""

    processId: Optional[Union[int, None]] = attrs.field(default=None)
    """The process Id of the parent process that started
    the server.
    
    Is `null` if the process has not been started by another process.
    If the parent process is not alive then the server should exit."""

    clientInfo: Optional["None"] = attrs.field(default=None)
    """Information about the client
    
    @since 3.15.0"""
    # Since: 3.15.0

    locale: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The locale the client is currently showing the user interface
    in. This must not necessarily be the locale of the operating
    system.
    
    Uses IETF language tags as the value's syntax
    (See https://en.wikipedia.org/wiki/IETF_language_tag)
    
    @since 3.16.0"""
    # Since: 3.16.0

    rootPath: Optional[Union[str, None]] = attrs.field(default=None)
    """The rootPath of the workspace. Is null
    if no folder is open.
    
    @deprecated in favour of rootUri."""

    rootUri: Optional[Union[str, None]] = attrs.field(default=None)
    """The rootUri of the workspace. Is null if no
    folder is open. If both `rootPath` and `rootUri` are set
    `rootUri` wins.
    
    @deprecated in favour of workspaceFolders."""

    initializationOptions: Optional["LSPAny"] = attrs.field(default=None)
    """User provided initialization options."""

    trace: Optional[Union[str, str, str, str]] = attrs.field(default=None)
    """The initial trace setting. If omitted trace is disabled ('off')."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""


@attrs.define
class WorkspaceFoldersInitializeParams:

    workspaceFolders: Optional[Union[List["WorkspaceFolder"], None]] = attrs.field(
        default=None
    )
    """The workspace folders configured in the client when the server starts.
    
    This property is only available if the client supports workspace folders.
    It can be `null` if the client supports workspace folders but none are
    configured.
    
    @since 3.6.0"""
    # Since: 3.6.0


@attrs.define
class InitializeParams:

    capabilities: "ClientCapabilities" = attrs.field()
    """The capabilities provided by the client (editor or tool)"""

    processId: Optional[Union[int, None]] = attrs.field(default=None)
    """The process Id of the parent process that started
    the server.
    
    Is `null` if the process has not been started by another process.
    If the parent process is not alive then the server should exit."""

    clientInfo: Optional["None"] = attrs.field(default=None)
    """Information about the client
    
    @since 3.15.0"""
    # Since: 3.15.0

    locale: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The locale the client is currently showing the user interface
    in. This must not necessarily be the locale of the operating
    system.
    
    Uses IETF language tags as the value's syntax
    (See https://en.wikipedia.org/wiki/IETF_language_tag)
    
    @since 3.16.0"""
    # Since: 3.16.0

    rootPath: Optional[Union[str, None]] = attrs.field(default=None)
    """The rootPath of the workspace. Is null
    if no folder is open.
    
    @deprecated in favour of rootUri."""

    rootUri: Optional[Union[str, None]] = attrs.field(default=None)
    """The rootUri of the workspace. Is null if no
    folder is open. If both `rootPath` and `rootUri` are set
    `rootUri` wins.
    
    @deprecated in favour of workspaceFolders."""

    initializationOptions: Optional["LSPAny"] = attrs.field(default=None)
    """User provided initialization options."""

    trace: Optional[Union[str, str, str, str]] = attrs.field(default=None)
    """The initial trace setting. If omitted trace is disabled ('off')."""

    workspaceFolders: Optional[Union[List["WorkspaceFolder"], None]] = attrs.field(
        default=None
    )
    """The workspace folders configured in the client when the server starts.
    
    This property is only available if the client supports workspace folders.
    It can be `null` if the client supports workspace folders but none are
    configured.
    
    @since 3.6.0"""
    # Since: 3.6.0


@attrs.define
class InitializeResult:
    """The result returned from an initialize request."""

    capabilities: "ServerCapabilities" = attrs.field()
    """The capabilities the language server provides."""

    serverInfo: Optional["None"] = attrs.field(default=None)
    """Information about the server.
    
    @since 3.15.0"""
    # Since: 3.15.0


@attrs.define
class InitializeError:
    """The data type of the ResponseError if the initialize request fails."""

    retry: bool = attrs.field(validator=attrs.validators.instance_of(bool))
    """Indicates whether the client execute the following retry logic:
    (1) show the message provided by the ResponseError to the user
    (2) user selects retry or cancel
    (3) if user selected retry the initialize method is sent again."""


@attrs.define
class InitializedParams:

    pass


@attrs.define
class DidChangeConfigurationParams:
    """The parameters of a change configuration notification."""

    settings: "LSPAny" = attrs.field()
    """The actual changed settings"""


@attrs.define
class DidChangeConfigurationRegistrationOptions:

    section: Optional[Union[str, List[str]]] = attrs.field(default=None)


@attrs.define
class ShowMessageParams:
    """The parameters of a notification message."""

    type: "MessageType" = attrs.field()
    """The message type. See {@link MessageType}"""

    message: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The actual message."""


@attrs.define
class ShowMessageRequestParams:

    type: "MessageType" = attrs.field()
    """The message type. See {@link MessageType}"""

    message: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The actual message."""

    actions: Optional[List["MessageActionItem"]] = attrs.field(default=None)
    """The message action items to present."""


@attrs.define
class MessageActionItem:

    title: str = attrs.field(validator=attrs.validators.instance_of(str))
    """A short title like 'Retry', 'Open Log' etc."""


@attrs.define
class LogMessageParams:
    """The log message parameters."""

    type: "MessageType" = attrs.field()
    """The message type. See {@link MessageType}"""

    message: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The actual message."""


@attrs.define
class DidOpenTextDocumentParams:
    """The parameters sent in an open text document notification."""

    textDocument: "TextDocumentItem" = attrs.field()
    """The document that was opened."""


@attrs.define
class DidChangeTextDocumentParams:
    """The change text document notification's parameters."""

    textDocument: "VersionedTextDocumentIdentifier" = attrs.field()
    """The document that did change. The version number points
    to the version after all provided content changes have
    been applied."""

    contentChanges: List["TextDocumentContentChangeEvent"] = attrs.field()
    """The actual content changes. The content changes describe single state changes
    to the document. So if there are two content changes c1 (at array index 0) and
    c2 (at array index 1) for a document in state S then c1 moves the document from
    S to S' and c2 from S' to S''. So c1 is computed on the state S and c2 is computed
    on the state S'.
    
    To mirror the content of a document using change events use the following approach:
    - start with the same initial content
    - apply the 'textDocument/didChange' notifications in the order you receive them.
    - apply the `TextDocumentContentChangeEvent`s in a single notification in the order
      you receive them."""


@attrs.define
class TextDocumentChangeRegistrationOptions:
    """Describe options to be used when registered for text document change
    events."""

    syncKind: "TextDocumentSyncKind" = attrs.field()
    """How documents are synced to the server."""

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""


@attrs.define
class DidCloseTextDocumentParams:
    """The parameters sent in a close text document notification."""

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The document that was closed."""


@attrs.define
class DidSaveTextDocumentParams:
    """The parameters sent in a save text document notification."""

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The document that was saved."""

    text: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """Optional the content when saved. Depends on the includeText value
    when the save notification was requested."""


@attrs.define
class SaveOptions:
    """Save options."""

    includeText: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The client is supposed to include the content on save."""


@attrs.define
class TextDocumentSaveRegistrationOptions:
    """Save registration options."""

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""

    includeText: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The client is supposed to include the content on save."""


@attrs.define
class WillSaveTextDocumentParams:
    """The parameters sent in a will save text document notification."""

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The document that will be saved."""

    reason: "TextDocumentSaveReason" = attrs.field()
    """The 'TextDocumentSaveReason'."""


@attrs.define
class TextEdit:
    """A text edit applicable to a text document."""

    range: "Range" = attrs.field()
    """The range of the text document to be manipulated. To insert
    text into a document create a range where start === end."""

    newText: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The string to be inserted. For delete operations use an
    empty string."""


@attrs.define
class DidChangeWatchedFilesParams:
    """The watched files change notification's parameters."""

    changes: List["FileEvent"] = attrs.field()
    """The actual file events."""


@attrs.define
class DidChangeWatchedFilesRegistrationOptions:
    """Describe options to be used when registered for text document change
    events."""

    watchers: List["FileSystemWatcher"] = attrs.field()
    """The watchers to register."""


@attrs.define
class PublishDiagnosticsParams:
    """The publish diagnostic notification's parameters."""

    uri: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The URI for which diagnostic information is reported."""

    diagnostics: List["Diagnostic"] = attrs.field()
    """An array of diagnostic information items."""

    version: Optional[int] = attrs.field(
        validator=attrs.validators.optional(validators.integer_validator),
        default=None,
    )
    """Optional the version number of the document the diagnostics are published for.
    
    @since 3.15.0"""
    # Since: 3.15.0


@attrs.define
class CompletionParams:
    """Completion parameters."""

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    position: "Position" = attrs.field()
    """The position inside the text document."""

    context: Optional["CompletionContext"] = attrs.field(default=None)
    """The completion context. This is only available it the client specifies
    to send this using the client capability `textDocument.completion.contextSupport === true`"""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class CompletionItem:
    """A completion item represents a text snippet that is proposed to complete
    text that is being typed."""

    label: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The label of this completion item.
    
    The label property is also by default the text that
    is inserted when selecting this completion.
    
    If label details are provided the label itself should
    be an unqualified name of the completion item."""

    labelDetails: Optional["CompletionItemLabelDetails"] = attrs.field(default=None)
    """Additional details for the label
    
    @since 3.17.0"""
    # Since: 3.17.0

    kind: Optional["CompletionItemKind"] = attrs.field(default=None)
    """The kind of this completion item. Based of the kind
    an icon is chosen by the editor."""

    tags: Optional[List["CompletionItemTag"]] = attrs.field(default=None)
    """Tags for this completion item.
    
    @since 3.15.0"""
    # Since: 3.15.0

    detail: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """A human-readable string with additional information
    about this item, like type or symbol information."""

    documentation: Optional[Union[str, "MarkupContent"]] = attrs.field(default=None)
    """A human-readable string that represents a doc-comment."""

    deprecated: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Indicates if this item is deprecated.
    @deprecated Use `tags` instead."""

    preselect: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Select this item when showing.
    
    *Note* that only one completion item can be selected and that the
    tool / client decides which item that is. The rule is that the *first*
    item of those that match best is selected."""

    sortText: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """A string that should be used when comparing this item
    with other items. When `falsy` the label
    is used."""

    filterText: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """A string that should be used when filtering a set of
    completion items. When `falsy` the label
    is used."""

    insertText: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """A string that should be inserted into a document when selecting
    this completion. When `falsy` the label
    is used.
    
    The `insertText` is subject to interpretation by the client side.
    Some tools might not take the string literally. For example
    VS Code when code complete is requested in this example
    `con<cursor position>` and a completion item with an `insertText` of
    `console` is provided it will only insert `sole`. Therefore it is
    recommended to use `textEdit` instead since it avoids additional client
    side interpretation."""

    insertTextFormat: Optional["InsertTextFormat"] = attrs.field(default=None)
    """The format of the insert text. The format applies to both the
    `insertText` property and the `newText` property of a provided
    `textEdit`. If omitted defaults to `InsertTextFormat.PlainText`.
    
    Please note that the insertTextFormat doesn't apply to
    `additionalTextEdits`."""

    insertTextMode: Optional["InsertTextMode"] = attrs.field(default=None)
    """How whitespace and indentation is handled during completion
    item insertion. If not provided the clients default value depends on
    the `textDocument.completion.insertTextMode` client capability.
    
    @since 3.16.0"""
    # Since: 3.16.0

    textEdit: Optional[Union["TextEdit", "InsertReplaceEdit"]] = attrs.field(
        default=None
    )
    """An edit which is applied to a document when selecting
    this completion. When an edit is provided the value of
    insertText is ignored.
    
    Most editors support two different operations when accepting a completion
    item. One is to insert a completion text and the other is to replace an
    existing text with a completion text. Since this can usually not be
    predetermined by a server it can report both ranges. Clients need to
    signal support for `InsertReplaceEdits` via the
    `textDocument.completion.insertReplaceSupport` client capability
    property.
    
    *Note 1:* The text edit's range as well as both ranges from an insert
    replace edit must be a [single line] and they must contain the position
    at which completion has been requested.
    *Note 2:* If an `InsertReplaceEdit` is returned the edit's insert range
    must be a prefix of the edit's replace range, that means it must be
    contained and starting at the same position.
    
    @since 3.16.0 additional type `InsertReplaceEdit`"""
    # Since: 3.16.0 additional type `InsertReplaceEdit`

    textEditText: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The edit text used if the completion item is part of a CompletionList and
    CompletionList defines an item default for the text edit range.
    
    Clients will only honor this property if they opt into completion list
    item defaults using the capability `completionList.itemDefaults`.
    
    If not provided and a list's default range is provided the label
    property is used as a text.
    
    @since 3.17.0"""
    # Since: 3.17.0

    additionalTextEdits: Optional[List["TextEdit"]] = attrs.field(default=None)
    """An optional array of additional text edits that are applied when
    selecting this completion. Edits must not overlap (including the same insert position)
    with the main edit nor with themselves.
    
    Additional text edits should be used to change text unrelated to the current cursor position
    (for example adding an import statement at the top of the file if the completion item will
    insert an unqualified type)."""

    commitCharacters: Optional[List[str]] = attrs.field(default=None)
    """An optional set of characters that when pressed while this completion is active will accept it first and
    then type that character. *Note* that all commit characters should have `length=1` and that superfluous
    characters will be ignored."""

    command: Optional["Command"] = attrs.field(default=None)
    """An optional command that is executed *after* inserting this completion. *Note* that
    additional modifications to the current document should be described with the
    additionalTextEdits-property."""

    data: Optional["LSPAny"] = attrs.field(default=None)
    """A data entry field that is preserved on a completion item between a
    CompletionRequest and a CompletionResolveRequest."""


@attrs.define
class CompletionList:
    """Represents a collection of completion items to be presented in the
    editor."""

    isIncomplete: bool = attrs.field(validator=attrs.validators.instance_of(bool))
    """This list it not complete. Further typing results in recomputing this list.
    
    Recomputed lists have all their items replaced (not appended) in the
    incomplete completion sessions."""

    items: List["CompletionItem"] = attrs.field()
    """The completion items."""

    itemDefaults: Optional["None"] = attrs.field(default=None)
    """In many cases the items of an actual completion result share the same
    value for properties like `commitCharacters` or the range of a text
    edit. A completion list can therefore define item defaults which will
    be used if a completion item itself doesn't specify the value.
    
    If a completion list specifies a default value and a completion item
    also specifies a corresponding value the one from the item is used.
    
    Servers are only allowed to return default values if the client
    signals support for this via the `completionList.itemDefaults`
    capability.
    
    @since 3.17.0"""
    # Since: 3.17.0


@attrs.define
class CompletionOptions:
    """Completion options."""

    triggerCharacters: Optional[List[str]] = attrs.field(default=None)
    """Most tools trigger completion request automatically without explicitly requesting
    it using a keyboard shortcut (e.g. Ctrl+Space). Typically they do so when the user
    starts to type an identifier. For example if the user types `c` in a JavaScript file
    code complete will automatically pop up present `console` besides others as a
    completion item. Characters that make up identifiers don't need to be listed here.
    
    If code complete should automatically be trigger on characters not being valid inside
    an identifier (for example `.` in JavaScript) list them in `triggerCharacters`."""

    allCommitCharacters: Optional[List[str]] = attrs.field(default=None)
    """The list of all possible characters that commit a completion. This field can be used
    if clients don't support individual commit characters per completion item. See
    `ClientCapabilities.textDocument.completion.completionItem.commitCharactersSupport`
    
    If a server provides both `allCommitCharacters` and commit characters on an individual
    completion item the ones on the completion item win.
    
    @since 3.2.0"""
    # Since: 3.2.0

    resolveProvider: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The server provides support to resolve additional
    information for a completion item."""

    completionItem: Optional["None"] = attrs.field(default=None)
    """The server supports the following `CompletionItem` specific
    capabilities.
    
    @since 3.17.0"""
    # Since: 3.17.0

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class CompletionRegistrationOptions:
    """Registration options for a CompletionRequest."""

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""

    triggerCharacters: Optional[List[str]] = attrs.field(default=None)
    """Most tools trigger completion request automatically without explicitly requesting
    it using a keyboard shortcut (e.g. Ctrl+Space). Typically they do so when the user
    starts to type an identifier. For example if the user types `c` in a JavaScript file
    code complete will automatically pop up present `console` besides others as a
    completion item. Characters that make up identifiers don't need to be listed here.
    
    If code complete should automatically be trigger on characters not being valid inside
    an identifier (for example `.` in JavaScript) list them in `triggerCharacters`."""

    allCommitCharacters: Optional[List[str]] = attrs.field(default=None)
    """The list of all possible characters that commit a completion. This field can be used
    if clients don't support individual commit characters per completion item. See
    `ClientCapabilities.textDocument.completion.completionItem.commitCharactersSupport`
    
    If a server provides both `allCommitCharacters` and commit characters on an individual
    completion item the ones on the completion item win.
    
    @since 3.2.0"""
    # Since: 3.2.0

    resolveProvider: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The server provides support to resolve additional
    information for a completion item."""

    completionItem: Optional["None"] = attrs.field(default=None)
    """The server supports the following `CompletionItem` specific
    capabilities.
    
    @since 3.17.0"""
    # Since: 3.17.0


@attrs.define
class HoverParams:
    """Parameters for a HoverRequest."""

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    position: "Position" = attrs.field()
    """The position inside the text document."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""


@attrs.define
class Hover:
    """The result of a hover request."""

    contents: Union[
        "MarkupContent", "MarkedString", List["MarkedString"]
    ] = attrs.field()
    """The hover's content"""

    range: Optional["Range"] = attrs.field(default=None)
    """An optional range inside the text document that is used to
    visualize the hover, e.g. by changing the background color."""


@attrs.define
class HoverOptions:
    """Hover options."""

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class HoverRegistrationOptions:
    """Registration options for a HoverRequest."""

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""


@attrs.define
class SignatureHelpParams:
    """Parameters for a SignatureHelpRequest."""

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    position: "Position" = attrs.field()
    """The position inside the text document."""

    context: Optional["SignatureHelpContext"] = attrs.field(default=None)
    """The signature help context. This is only available if the client specifies
    to send this using the client capability `textDocument.signatureHelp.contextSupport === true`
    
    @since 3.15.0"""
    # Since: 3.15.0

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""


@attrs.define
class SignatureHelp:
    """Signature help represents the signature of something callable.

    There can be multiple signature but only one active and only one
    active parameter.
    """

    signatures: List["SignatureInformation"] = attrs.field()
    """One or more signatures."""

    activeSignature: Optional[int] = attrs.field(
        validator=attrs.validators.optional(validators.uinteger_validator),
        default=None,
    )
    """The active signature. If omitted or the value lies outside the
    range of `signatures` the value defaults to zero or is ignored if
    the `SignatureHelp` has no signatures.
    
    Whenever possible implementors should make an active decision about
    the active signature and shouldn't rely on a default value.
    
    In future version of the protocol this property might become
    mandatory to better express this."""

    activeParameter: Optional[int] = attrs.field(
        validator=attrs.validators.optional(validators.uinteger_validator),
        default=None,
    )
    """The active parameter of the active signature. If omitted or the value
    lies outside the range of `signatures[activeSignature].parameters`
    defaults to 0 if the active signature has parameters. If
    the active signature has no parameters it is ignored.
    In future version of the protocol this property might become
    mandatory to better express the active parameter if the
    active signature does have any."""


@attrs.define
class SignatureHelpOptions:
    """Server Capabilities for a SignatureHelpRequest."""

    triggerCharacters: Optional[List[str]] = attrs.field(default=None)
    """List of characters that trigger signature help automatically."""

    retriggerCharacters: Optional[List[str]] = attrs.field(default=None)
    """List of characters that re-trigger signature help.
    
    These trigger characters are only active when signature help is already showing. All trigger characters
    are also counted as re-trigger characters.
    
    @since 3.15.0"""
    # Since: 3.15.0

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class SignatureHelpRegistrationOptions:
    """Registration options for a SignatureHelpRequest."""

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""

    triggerCharacters: Optional[List[str]] = attrs.field(default=None)
    """List of characters that trigger signature help automatically."""

    retriggerCharacters: Optional[List[str]] = attrs.field(default=None)
    """List of characters that re-trigger signature help.
    
    These trigger characters are only active when signature help is already showing. All trigger characters
    are also counted as re-trigger characters.
    
    @since 3.15.0"""
    # Since: 3.15.0


@attrs.define
class DefinitionParams:
    """Parameters for a DefinitionRequest."""

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    position: "Position" = attrs.field()
    """The position inside the text document."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class DefinitionOptions:
    """Server Capabilities for a DefinitionRequest."""

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class DefinitionRegistrationOptions:
    """Registration options for a DefinitionRequest."""

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""


@attrs.define
class ReferenceParams:
    """Parameters for a ReferencesRequest."""

    context: "ReferenceContext" = attrs.field()

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    position: "Position" = attrs.field()
    """The position inside the text document."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class ReferenceOptions:
    """Reference options."""

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class ReferenceRegistrationOptions:
    """Registration options for a ReferencesRequest."""

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""


@attrs.define
class DocumentHighlightParams:
    """Parameters for a DocumentHighlightRequest."""

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    position: "Position" = attrs.field()
    """The position inside the text document."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class DocumentHighlight:
    """A document highlight is a range inside a text document which deserves
    special attention.

    Usually a document highlight is visualized by changing the
    background color of its range.
    """

    range: "Range" = attrs.field()
    """The range this highlight applies to."""

    kind: Optional["DocumentHighlightKind"] = attrs.field(default=None)
    """The highlight kind, default is text."""


@attrs.define
class DocumentHighlightOptions:
    """Provider options for a DocumentHighlightRequest."""

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class DocumentHighlightRegistrationOptions:
    """Registration options for a DocumentHighlightRequest."""

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""


@attrs.define
class DocumentSymbolParams:
    """Parameters for a DocumentSymbolRequest."""

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class BaseSymbolInformation:
    """A base for all symbol information."""

    name: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The name of this symbol."""

    kind: "SymbolKind" = attrs.field()
    """The kind of this symbol."""

    tags: Optional[List["SymbolTag"]] = attrs.field(default=None)
    """Tags for this symbol.
    
    @since 3.16.0"""
    # Since: 3.16.0

    containerName: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The name of the symbol containing this symbol. This information is for
    user interface purposes (e.g. to render a qualifier in the user interface
    if necessary). It can't be used to re-infer a hierarchy for the document
    symbols."""


@attrs.define
class SymbolInformation:
    """Represents information about programming constructs like variables,
    classes, interfaces etc."""

    location: "Location" = attrs.field()
    """The location of this symbol. The location's range is used by a tool
    to reveal the location in the editor. If the symbol is selected in the
    tool the range's start information is used to position the cursor. So
    the range usually spans more than the actual symbol's name and does
    normally include things like visibility modifiers.
    
    The range doesn't have to denote a node range in the sense of an abstract
    syntax tree. It can therefore not be used to re-construct a hierarchy of
    the symbols."""

    name: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The name of this symbol."""

    kind: "SymbolKind" = attrs.field()
    """The kind of this symbol."""

    deprecated: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Indicates if this symbol is deprecated.
    
    @deprecated Use tags instead"""

    tags: Optional[List["SymbolTag"]] = attrs.field(default=None)
    """Tags for this symbol.
    
    @since 3.16.0"""
    # Since: 3.16.0

    containerName: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The name of the symbol containing this symbol. This information is for
    user interface purposes (e.g. to render a qualifier in the user interface
    if necessary). It can't be used to re-infer a hierarchy for the document
    symbols."""


@attrs.define
class DocumentSymbol:
    """Represents programming constructs like variables, classes, interfaces
    etc.

    that appear in a document. Document symbols can be hierarchical and
    they have two ranges: one that encloses its definition and one that
    points to its most interesting range, e.g. the range of an
    identifier.
    """

    name: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The name of this symbol. Will be displayed in the user interface and therefore must not be
    an empty string or a string only consisting of white spaces."""

    kind: "SymbolKind" = attrs.field()
    """The kind of this symbol."""

    range: "Range" = attrs.field()
    """The range enclosing this symbol not including leading/trailing whitespace but everything else
    like comments. This information is typically used to determine if the clients cursor is
    inside the symbol to reveal in the symbol in the UI."""

    selectionRange: "Range" = attrs.field()
    """The range that should be selected and revealed when this symbol is being picked, e.g the name of a function.
    Must be contained by the `range`."""

    detail: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """More detail for this symbol, e.g the signature of a function."""

    tags: Optional[List["SymbolTag"]] = attrs.field(default=None)
    """Tags for this document symbol.
    
    @since 3.16.0"""
    # Since: 3.16.0

    deprecated: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Indicates if this symbol is deprecated.
    
    @deprecated Use tags instead"""

    children: Optional[List["DocumentSymbol"]] = attrs.field(default=None)
    """Children of this symbol, e.g. properties of a class."""


@attrs.define
class DocumentSymbolOptions:
    """Provider options for a DocumentSymbolRequest."""

    label: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """A human-readable string that is shown when multiple outlines trees
    are shown for the same document.
    
    @since 3.16.0"""
    # Since: 3.16.0

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class DocumentSymbolRegistrationOptions:
    """Registration options for a DocumentSymbolRequest."""

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""

    label: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """A human-readable string that is shown when multiple outlines trees
    are shown for the same document.
    
    @since 3.16.0"""
    # Since: 3.16.0


@attrs.define
class CodeActionParams:
    """The parameters of a CodeActionRequest."""

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The document in which the command was invoked."""

    range: "Range" = attrs.field()
    """The range for which the command was invoked."""

    context: "CodeActionContext" = attrs.field()
    """Context carrying additional information."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class Command:
    """Represents a reference to a command.

    Provides a title which will be used to represent a command in the UI
    and, optionally, an array of arguments which will be passed to the
    command handler function when invoked.
    """

    title: str = attrs.field(validator=attrs.validators.instance_of(str))
    """Title of the command, like `save`."""

    command: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The identifier of the actual command handler."""

    arguments: Optional[List["LSPAny"]] = attrs.field(default=None)
    """Arguments that the command handler should be
    invoked with."""


@attrs.define
class CodeAction:
    """A code action represents a change that can be performed in code, e.g. to
    fix a problem or to refactor code.

    A CodeAction must set either `edit` and/or a `command`. If both are
    supplied, the `edit` is applied first, then the `command` is
    executed.
    """

    title: str = attrs.field(validator=attrs.validators.instance_of(str))
    """A short, human-readable, title for this code action."""

    kind: Optional["CodeActionKind"] = attrs.field(default=None)
    """The kind of the code action.
    
    Used to filter code actions."""

    diagnostics: Optional[List["Diagnostic"]] = attrs.field(default=None)
    """The diagnostics that this code action resolves."""

    isPreferred: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Marks this as a preferred action. Preferred actions are used by the `auto fix` command and can be targeted
    by keybindings.
    
    A quick fix should be marked preferred if it properly addresses the underlying error.
    A refactoring should be marked preferred if it is the most reasonable choice of actions to take.
    
    @since 3.15.0"""
    # Since: 3.15.0

    disabled: Optional["None"] = attrs.field(default=None)
    """Marks that the code action cannot currently be applied.
    
    Clients should follow the following guidelines regarding disabled code actions:
    
      - Disabled code actions are not shown in automatic [lightbulbs](https://code.visualstudio.com/docs/editor/editingevolved#_code-action)
        code action menus.
    
      - Disabled actions are shown as faded out in the code action menu when the user requests a more specific type
        of code action, such as refactorings.
    
      - If the user has a [keybinding](https://code.visualstudio.com/docs/editor/refactoring#_keybindings-for-code-actions)
        that auto applies a code action and only disabled code actions are returned, the client should show the user an
        error message with `reason` in the editor.
    
    @since 3.16.0"""
    # Since: 3.16.0

    edit: Optional["WorkspaceEdit"] = attrs.field(default=None)
    """The workspace edit this code action performs."""

    command: Optional["Command"] = attrs.field(default=None)
    """A command this code action executes. If a code action
    provides an edit and a command, first the edit is
    executed and then the command."""

    data: Optional["LSPAny"] = attrs.field(default=None)
    """A data entry field that is preserved on a code action between
    a `textDocument/codeAction` and a `codeAction/resolve` request.
    
    @since 3.16.0"""
    # Since: 3.16.0


@attrs.define
class CodeActionOptions:
    """Provider options for a CodeActionRequest."""

    codeActionKinds: Optional[List["CodeActionKind"]] = attrs.field(default=None)
    """CodeActionKinds that this server may return.
    
    The list of kinds may be generic, such as `CodeActionKind.Refactor`, or the server
    may list out every specific kind they provide."""

    resolveProvider: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The server provides support to resolve additional
    information for a code action.
    
    @since 3.16.0"""
    # Since: 3.16.0

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class CodeActionRegistrationOptions:
    """Registration options for a CodeActionRequest."""

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""

    codeActionKinds: Optional[List["CodeActionKind"]] = attrs.field(default=None)
    """CodeActionKinds that this server may return.
    
    The list of kinds may be generic, such as `CodeActionKind.Refactor`, or the server
    may list out every specific kind they provide."""

    resolveProvider: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The server provides support to resolve additional
    information for a code action.
    
    @since 3.16.0"""
    # Since: 3.16.0


@attrs.define
class WorkspaceSymbolParams:
    """The parameters of a WorkspaceSymbolRequest."""

    query: str = attrs.field(validator=attrs.validators.instance_of(str))
    """A query string to filter symbols by. Clients may send an empty
    string here to request all symbols."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class WorkspaceSymbol:
    """A special workspace symbol that supports locations without a range.

    See also SymbolInformation.

    @since 3.17.0
    """

    # Since: 3.17.0

    location: Union["Location", "None"] = attrs.field()
    """The location of the symbol. Whether a server is allowed to
    return a location without a range depends on the client
    capability `workspace.symbol.resolveSupport`.
    
    See SymbolInformation#location for more details."""

    name: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The name of this symbol."""

    kind: "SymbolKind" = attrs.field()
    """The kind of this symbol."""

    data: Optional["LSPAny"] = attrs.field(default=None)
    """A data entry field that is preserved on a workspace symbol between a
    workspace symbol request and a workspace symbol resolve request."""

    tags: Optional[List["SymbolTag"]] = attrs.field(default=None)
    """Tags for this symbol.
    
    @since 3.16.0"""
    # Since: 3.16.0

    containerName: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The name of the symbol containing this symbol. This information is for
    user interface purposes (e.g. to render a qualifier in the user interface
    if necessary). It can't be used to re-infer a hierarchy for the document
    symbols."""


@attrs.define
class WorkspaceSymbolOptions:
    """Server capabilities for a WorkspaceSymbolRequest."""

    resolveProvider: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The server provides support to resolve additional
    information for a workspace symbol.
    
    @since 3.17.0"""
    # Since: 3.17.0

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class WorkspaceSymbolRegistrationOptions:
    """Registration options for a WorkspaceSymbolRequest."""

    resolveProvider: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The server provides support to resolve additional
    information for a workspace symbol.
    
    @since 3.17.0"""
    # Since: 3.17.0


@attrs.define
class CodeLensParams:
    """The parameters of a CodeLensRequest."""

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The document to request code lens for."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class CodeLens:
    """A code lens represents a command that should be shown along with source
    text, like the number of references, a way to run tests, etc.

    A code lens is _unresolved_ when no command is associated to it. For
    performance reasons the creation of a code lens and resolving should
    be done in two stages.
    """

    range: "Range" = attrs.field()
    """The range in which this code lens is valid. Should only span a single line."""

    command: Optional["Command"] = attrs.field(default=None)
    """The command this code lens represents."""

    data: Optional["LSPAny"] = attrs.field(default=None)
    """A data entry field that is preserved on a code lens item between
    a CodeLensRequest and a [CodeLensResolveRequest]
    (#CodeLensResolveRequest)"""


@attrs.define
class CodeLensOptions:
    """Code Lens provider options of a CodeLensRequest."""

    resolveProvider: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Code lens has a resolve provider as well."""

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class CodeLensRegistrationOptions:
    """Registration options for a CodeLensRequest."""

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""

    resolveProvider: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Code lens has a resolve provider as well."""


@attrs.define
class DocumentLinkParams:
    """The parameters of a DocumentLinkRequest."""

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The document to provide document links for."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class DocumentLink:
    """A document link is a range in a text document that links to an internal
    or external resource, like another text document or a web site."""

    range: "Range" = attrs.field()
    """The range this link applies to."""

    target: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The uri this link points to. If missing a resolve request is sent later."""

    tooltip: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The tooltip text when you hover over this link.
    
    If a tooltip is provided, is will be displayed in a string that includes instructions on how to
    trigger the link, such as `{0} (ctrl + click)`. The specific instructions vary depending on OS,
    user settings, and localization.
    
    @since 3.15.0"""
    # Since: 3.15.0

    data: Optional["LSPAny"] = attrs.field(default=None)
    """A data entry field that is preserved on a document link between a
    DocumentLinkRequest and a DocumentLinkResolveRequest."""


@attrs.define
class DocumentLinkOptions:
    """Provider options for a DocumentLinkRequest."""

    resolveProvider: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Document links have a resolve provider as well."""

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class DocumentLinkRegistrationOptions:
    """Registration options for a DocumentLinkRequest."""

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""

    resolveProvider: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Document links have a resolve provider as well."""


@attrs.define
class DocumentFormattingParams:
    """The parameters of a DocumentFormattingRequest."""

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The document to format."""

    options: "FormattingOptions" = attrs.field()
    """The format options."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""


@attrs.define
class DocumentFormattingOptions:
    """Provider options for a DocumentFormattingRequest."""

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class DocumentFormattingRegistrationOptions:
    """Registration options for a DocumentFormattingRequest."""

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""


@attrs.define
class DocumentRangeFormattingParams:
    """The parameters of a DocumentRangeFormattingRequest."""

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The document to format."""

    range: "Range" = attrs.field()
    """The range to format"""

    options: "FormattingOptions" = attrs.field()
    """The format options"""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""


@attrs.define
class DocumentRangeFormattingOptions:
    """Provider options for a DocumentRangeFormattingRequest."""

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class DocumentRangeFormattingRegistrationOptions:
    """Registration options for a DocumentRangeFormattingRequest."""

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""


@attrs.define
class DocumentOnTypeFormattingParams:
    """The parameters of a DocumentOnTypeFormattingRequest."""

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The document to format."""

    position: "Position" = attrs.field()
    """The position around which the on type formatting should happen.
    This is not necessarily the exact position where the character denoted
    by the property `ch` got typed."""

    ch: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The character that has been typed that triggered the formatting
    on type request. That is not necessarily the last character that
    got inserted into the document since the client could auto insert
    characters as well (e.g. like automatic brace completion)."""

    options: "FormattingOptions" = attrs.field()
    """The formatting options."""


@attrs.define
class DocumentOnTypeFormattingOptions:
    """Provider options for a DocumentOnTypeFormattingRequest."""

    firstTriggerCharacter: str = attrs.field(
        validator=attrs.validators.instance_of(str)
    )
    """A character on which formatting should be triggered, like `{`."""

    moreTriggerCharacter: Optional[List[str]] = attrs.field(default=None)
    """More trigger characters."""


@attrs.define
class DocumentOnTypeFormattingRegistrationOptions:
    """Registration options for a DocumentOnTypeFormattingRequest."""

    firstTriggerCharacter: str = attrs.field(
        validator=attrs.validators.instance_of(str)
    )
    """A character on which formatting should be triggered, like `{`."""

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""

    moreTriggerCharacter: Optional[List[str]] = attrs.field(default=None)
    """More trigger characters."""


@attrs.define
class RenameParams:
    """The parameters of a RenameRequest."""

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The document to rename."""

    position: "Position" = attrs.field()
    """The position at which this request was sent."""

    newName: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The new name of the symbol. If the given name is not valid the
    request must return a ResponseError with an
    appropriate message set."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""


@attrs.define
class RenameOptions:
    """Provider options for a RenameRequest."""

    prepareProvider: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Renames should be checked and tested before being executed.
    
    @since version 3.12.0"""
    # Since: version 3.12.0

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class RenameRegistrationOptions:
    """Registration options for a RenameRequest."""

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""

    prepareProvider: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Renames should be checked and tested before being executed.
    
    @since version 3.12.0"""
    # Since: version 3.12.0


@attrs.define
class PrepareRenameParams:

    textDocument: "TextDocumentIdentifier" = attrs.field()
    """The text document."""

    position: "Position" = attrs.field()
    """The position inside the text document."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""


@attrs.define
class ExecuteCommandParams:
    """The parameters of a ExecuteCommandRequest."""

    command: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The identifier of the actual command handler."""

    arguments: Optional[List["LSPAny"]] = attrs.field(default=None)
    """Arguments that the command should be invoked with."""

    workDoneToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report work done progress."""


@attrs.define
class ExecuteCommandOptions:
    """The server capabilities of a ExecuteCommandRequest."""

    commands: List[str] = attrs.field()
    """The commands to be executed on the server"""

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class ExecuteCommandRegistrationOptions:
    """Registration options for a ExecuteCommandRequest."""

    commands: List[str] = attrs.field()
    """The commands to be executed on the server"""


@attrs.define
class ApplyWorkspaceEditParams:
    """The parameters passed via a apply workspace edit request."""

    edit: "WorkspaceEdit" = attrs.field()
    """The edits to apply."""

    label: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """An optional label of the workspace edit. This label is
    presented in the user interface for example on an undo
    stack to undo the workspace edit."""


@attrs.define
class ApplyWorkspaceEditResult:
    """The result returned from the apply workspace edit request.

    @since 3.17 renamed from ApplyWorkspaceEditResponse
    """

    # Since: 3.17 renamed from ApplyWorkspaceEditResponse

    applied: bool = attrs.field(validator=attrs.validators.instance_of(bool))
    """Indicates whether the edit was applied or not."""

    failureReason: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """An optional textual description for why the edit was not applied.
    This may be used by the server for diagnostic logging or to provide
    a suitable error for a request that triggered the edit."""

    failedChange: Optional[int] = attrs.field(
        validator=attrs.validators.optional(validators.uinteger_validator),
        default=None,
    )
    """Depending on the client's failure handling strategy `failedChange` might
    contain the index of the change that failed. This property is only available
    if the client signals a `failureHandlingStrategy` in its client capabilities."""


@attrs.define
class WorkDoneProgressBegin:

    kind: str = attrs.field()

    title: str = attrs.field(validator=attrs.validators.instance_of(str))
    """Mandatory title of the progress operation. Used to briefly inform about
    the kind of operation being performed.
    
    Examples: "Indexing" or "Linking dependencies"."""

    cancellable: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Controls if a cancel button should show to allow the user to cancel the
    long running operation. Clients that don't support cancellation are allowed
    to ignore the setting."""

    message: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """Optional, more detailed associated progress message. Contains
    complementary information to the `title`.
    
    Examples: "3/25 files", "project/src/module2", "node_modules/some_dep".
    If unset, the previous progress message (if any) is still valid."""

    percentage: Optional[int] = attrs.field(
        validator=attrs.validators.optional(validators.uinteger_validator),
        default=None,
    )
    """Optional progress percentage to display (value 100 is considered 100%).
    If not provided infinite progress is assumed and clients are allowed
    to ignore the `percentage` value in subsequent in report notifications.
    
    The value should be steadily rising. Clients are free to ignore values
    that are not following this rule. The value range is [0, 100]."""


@attrs.define
class WorkDoneProgressReport:

    kind: str = attrs.field()

    cancellable: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Controls enablement state of a cancel button.
    
    Clients that don't support cancellation or don't support controlling the button's
    enablement state are allowed to ignore the property."""

    message: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """Optional, more detailed associated progress message. Contains
    complementary information to the `title`.
    
    Examples: "3/25 files", "project/src/module2", "node_modules/some_dep".
    If unset, the previous progress message (if any) is still valid."""

    percentage: Optional[int] = attrs.field(
        validator=attrs.validators.optional(validators.uinteger_validator),
        default=None,
    )
    """Optional progress percentage to display (value 100 is considered 100%).
    If not provided infinite progress is assumed and clients are allowed
    to ignore the `percentage` value in subsequent in report notifications.
    
    The value should be steadily rising. Clients are free to ignore values
    that are not following this rule. The value range is [0, 100]"""


@attrs.define
class WorkDoneProgressEnd:

    kind: str = attrs.field()

    message: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """Optional, a final message indicating to for example indicate the outcome
    of the operation."""


@attrs.define
class SetTraceParams:

    value: "TraceValues" = attrs.field()


@attrs.define
class LogTraceParams:

    message: str = attrs.field(validator=attrs.validators.instance_of(str))

    verbose: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )


@attrs.define
class CancelParams:

    id: Union[int, str] = attrs.field()
    """The request id to cancel."""


@attrs.define
class ProgressParams:

    token: "ProgressToken" = attrs.field()
    """The progress token provided by the client or server."""

    value: "LSPAny" = attrs.field()
    """The progress data."""


@attrs.define
class LocationLink:
    """Represents the connection of two locations.

    Provides additional metadata over normal locations, including an
    origin range.
    """

    targetUri: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The target resource identifier of this link."""

    targetRange: "Range" = attrs.field()
    """The full target range of this link. If the target for example is a symbol then target range is the
    range enclosing this symbol not including leading/trailing whitespace but everything else
    like comments. This information is typically used to highlight the range in the editor."""

    targetSelectionRange: "Range" = attrs.field()
    """The range that should be selected and revealed when this link is being followed, e.g the name of a function.
    Must be contained by the `targetRange`. See also `DocumentSymbol#range`"""

    originSelectionRange: Optional["Range"] = attrs.field(default=None)
    """Span of the origin of this link.
    
    Used as the underlined span for mouse interaction. Defaults to the word range at
    the definition position."""


@attrs.define
class Range:
    """A range in a text document expressed as (zero-based) start and end
    positions.

    If you want to specify a range that contains a line including the line ending
    character(s) then use an end position denoting the start of the next line.
    For example:
    ```ts
    {
        start: { line: 5, character: 23 }
        end : { line 6, character : 0 }
    }
    ```
    """

    start: "Position" = attrs.field()
    """The range's start position."""

    end: "Position" = attrs.field()
    """The range's end position."""


@attrs.define
class WorkspaceFoldersChangeEvent:
    """The workspace folder change event."""

    added: List["WorkspaceFolder"] = attrs.field()
    """The array of added workspace folders"""

    removed: List["WorkspaceFolder"] = attrs.field()
    """The array of the removed workspace folders"""


@attrs.define
class ConfigurationItem:

    scopeUri: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The scope to get the configuration section for."""

    section: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The configuration section asked for."""


@attrs.define
class TextDocumentIdentifier:
    """A literal to identify a text document in the client."""

    uri: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The text document's uri."""


@attrs.define
class Color:
    """Represents a color in RGBA space."""

    red: float = attrs.field(validator=attrs.validators.instance_of(float))
    """The red component of this color in the range [0-1]."""

    green: float = attrs.field(validator=attrs.validators.instance_of(float))
    """The green component of this color in the range [0-1]."""

    blue: float = attrs.field(validator=attrs.validators.instance_of(float))
    """The blue component of this color in the range [0-1]."""

    alpha: float = attrs.field(validator=attrs.validators.instance_of(float))
    """The alpha component of this color in the range [0-1]."""


@attrs.define
class Position:
    """Position in a text document expressed as zero-based line and character
    offset. Prior to 3.17 the offsets were always based on a UTF-16 string
    representation. So a string of the form `a𐐀b` the character offset of the
    character `a` is 0, the character offset of `𐐀` is 1 and the character
    offset of b is 3 since `𐐀` is represented using two code units in UTF-16.
    Since 3.17 clients and servers can agree on a different string encoding
    representation (e.g. UTF-8). The client announces it's supported encoding
    via the client capability
    [`general.positionEncodings`](#clientCapabilities). The value is an array
    of position encodings the client supports, with decreasing preference (e.g.
    the encoding at index `0` is the most preferred one). To stay backwards
    compatible the only mandatory encoding is UTF-16 represented via the string
    `utf-16`. The server can pick one of the encodings offered by the client
    and signals that encoding back to the client via the initialize result's
    property.

    [`capabilities.positionEncoding`](#serverCapabilities). If the string value
    `utf-16` is missing from the client's capability `general.positionEncodings`
    servers can safely assume that the client supports UTF-16. If the server
    omits the position encoding in its initialize result the encoding defaults
    to the string value `utf-16`. Implementation considerations: since the
    conversion from one encoding into another requires the content of the
    file / line the conversion is best done where the file is read which is
    usually on the server side.

    Positions are line end character agnostic. So you can not specify a position
    that denotes `\r|\n` or `\n|` where `|` represents the character offset.

    @since 3.17.0 - support for negotiated position encoding.
    """

    # Since: 3.17.0 - support for negotiated position encoding.

    line: int = attrs.field(validator=validators.uinteger_validator)
    """Line position in a document (zero-based).
    
    If a line number is greater than the number of lines in a document, it defaults back to the number of lines in the document.
    If a line number is negative, it defaults to 0."""

    character: int = attrs.field(validator=validators.uinteger_validator)
    """Character offset on a line in a document (zero-based).
    
    The meaning of this offset is determined by the negotiated
    `PositionEncodingKind`.
    
    If the character value is greater than the line length it defaults back to the
    line length."""


@attrs.define
class SemanticTokensEdit:
    """@since 3.16.0"""

    # Since: 3.16.0

    start: int = attrs.field(validator=validators.uinteger_validator)
    """The start offset of the edit."""

    deleteCount: int = attrs.field(validator=validators.uinteger_validator)
    """The count of elements to remove."""

    data: Optional[List[int]] = attrs.field(default=None)
    """The elements to insert."""


@attrs.define
class FileCreate:
    """Represents information on a file/folder create.

    @since 3.16.0
    """

    # Since: 3.16.0

    uri: str = attrs.field(validator=attrs.validators.instance_of(str))
    """A file:// URI for the location of the file/folder being created."""


@attrs.define
class TextDocumentEdit:
    """Describes textual changes on a text document.

    A TextDocumentEdit describes all changes on a document version Si
    and after they are applied move the document to version Si+1. So the
    creator of a TextDocumentEdit doesn't need to sort the array of
    edits or do any kind of ordering. However the edits must be non
    overlapping.
    """

    textDocument: "OptionalVersionedTextDocumentIdentifier" = attrs.field()
    """The text document to change."""

    edits: List[Union["TextEdit", "AnnotatedTextEdit"]] = attrs.field()
    """The edits to be applied.
    
    @since 3.16.0 - support for AnnotatedTextEdit. This is guarded using a
    client capability."""
    # Since: 3.16.0 - support for AnnotatedTextEdit. This is guarded using aclient capability.


@attrs.define
class ResourceOperation:
    """A generic resource operation."""

    kind: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The resource operation kind."""

    annotationId: Optional["ChangeAnnotationIdentifier"] = attrs.field(default=None)
    """An optional annotation identifier describing the operation.
    
    @since 3.16.0"""
    # Since: 3.16.0


@attrs.define
class CreateFile:
    """Create file operation."""

    kind: str = attrs.field()
    """A create"""

    uri: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The resource to create."""

    kind: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The resource operation kind."""

    options: Optional["CreateFileOptions"] = attrs.field(default=None)
    """Additional options"""

    annotationId: Optional["ChangeAnnotationIdentifier"] = attrs.field(default=None)
    """An optional annotation identifier describing the operation.
    
    @since 3.16.0"""
    # Since: 3.16.0


@attrs.define
class RenameFile:
    """Rename file operation."""

    kind: str = attrs.field()
    """A rename"""

    oldUri: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The old (existing) location."""

    newUri: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The new location."""

    kind: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The resource operation kind."""

    options: Optional["RenameFileOptions"] = attrs.field(default=None)
    """Rename options."""

    annotationId: Optional["ChangeAnnotationIdentifier"] = attrs.field(default=None)
    """An optional annotation identifier describing the operation.
    
    @since 3.16.0"""
    # Since: 3.16.0


@attrs.define
class DeleteFile:
    """Delete file operation."""

    kind: str = attrs.field()
    """A delete"""

    uri: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The file to delete."""

    kind: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The resource operation kind."""

    options: Optional["DeleteFileOptions"] = attrs.field(default=None)
    """Delete options."""

    annotationId: Optional["ChangeAnnotationIdentifier"] = attrs.field(default=None)
    """An optional annotation identifier describing the operation.
    
    @since 3.16.0"""
    # Since: 3.16.0


@attrs.define
class ChangeAnnotation:
    """Additional information that describes document changes.

    @since 3.16.0
    """

    # Since: 3.16.0

    label: str = attrs.field(validator=attrs.validators.instance_of(str))
    """A human-readable string describing the actual change. The string
    is rendered prominent in the user interface."""

    needsConfirmation: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """A flag which indicates that user confirmation is needed
    before applying the change."""

    description: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """A human-readable string which is rendered less prominent in
    the user interface."""


@attrs.define
class FileOperationFilter:
    """A filter to describe in which file operation requests or notifications
    the server is interested in receiving.

    @since 3.16.0
    """

    # Since: 3.16.0

    pattern: "FileOperationPattern" = attrs.field()
    """The actual file operation pattern."""

    scheme: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """A Uri scheme like `file` or `untitled`."""


@attrs.define
class FileRename:
    """Represents information on a file/folder rename.

    @since 3.16.0
    """

    # Since: 3.16.0

    oldUri: str = attrs.field(validator=attrs.validators.instance_of(str))
    """A file:// URI for the original location of the file/folder being renamed."""

    newUri: str = attrs.field(validator=attrs.validators.instance_of(str))
    """A file:// URI for the new location of the file/folder being renamed."""


@attrs.define
class FileDelete:
    """Represents information on a file/folder delete.

    @since 3.16.0
    """

    # Since: 3.16.0

    uri: str = attrs.field(validator=attrs.validators.instance_of(str))
    """A file:// URI for the location of the file/folder being deleted."""


@attrs.define
class InlineValueContext:
    """@since 3.17.0"""

    # Since: 3.17.0

    frameId: int = attrs.field(validator=validators.integer_validator)
    """The stack frame (as a DAP Id) where the execution has stopped."""

    stoppedLocation: "Range" = attrs.field()
    """The document range where execution has stopped.
    Typically the end position of the range denotes the line where the inline values are shown."""


@attrs.define
class InlineValueText:
    """Provide inline value as text.

    @since 3.17.0
    """

    # Since: 3.17.0

    range: "Range" = attrs.field()
    """The document range for which the inline value applies."""

    text: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The text of the inline value."""


@attrs.define
class InlineValueVariableLookup:
    """Provide inline value through a variable lookup. If only a range is
    specified, the variable name will be extracted from the underlying
    document. An optional variable name can be used to override the extracted
    name.

    @since 3.17.0
    """

    # Since: 3.17.0

    range: "Range" = attrs.field()
    """The document range for which the inline value applies.
    The range is used to extract the variable name from the underlying document."""

    caseSensitiveLookup: bool = attrs.field(
        validator=attrs.validators.instance_of(bool)
    )
    """How to perform the lookup."""

    variableName: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """If specified the name of the variable to look up."""


@attrs.define
class InlineValueEvaluatableExpression:
    """Provide an inline value through an expression evaluation. If only a
    range is specified, the expression will be extracted from the underlying
    document. An optional expression can be used to override the extracted
    expression.

    @since 3.17.0
    """

    # Since: 3.17.0

    range: "Range" = attrs.field()
    """The document range for which the inline value applies.
    The range is used to extract the evaluatable expression from the underlying document."""

    expression: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """If specified the expression overrides the extracted expression."""


@attrs.define
class InlayHintLabelPart:
    """An inlay hint label part allows for interactive and composite labels of
    inlay hints.

    @since 3.17.0
    """

    # Since: 3.17.0

    value: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The value of this label part."""

    tooltip: Optional[Union[str, "MarkupContent"]] = attrs.field(default=None)
    """The tooltip text when you hover over this label part. Depending on
    the client capability `inlayHint.resolveSupport` clients might resolve
    this property late using the resolve request."""

    location: Optional["Location"] = attrs.field(default=None)
    """An optional source code location that represents this
    label part.
    
    The editor will use this location for the hover and for code navigation
    features: This part will become a clickable link that resolves to the
    definition of the symbol at the given location (not necessarily the
    location itself), it shows the hover that shows at the given location,
    and it shows a context menu with further code navigation commands.
    
    Depending on the client capability `inlayHint.resolveSupport` clients
    might resolve this property late using the resolve request."""

    command: Optional["Command"] = attrs.field(default=None)
    """An optional command for this label part.
    
    Depending on the client capability `inlayHint.resolveSupport` clients
    might resolve this property late using the resolve request."""


@attrs.define
class MarkupContent:
    """A `MarkupContent` literal represents a string value which content is
    interpreted base on its kind flag. Currently the protocol supports
    `plaintext` and `markdown` as markup kinds.

    If the kind is `markdown` then the value can contain fenced code blocks like in GitHub issues.
    See https://help.github.com/articles/creating-and-highlighting-code-blocks/#syntax-highlighting

    Here is an example how such a string can be constructed using JavaScript / TypeScript:
    ```ts
    let markdown: MarkdownContent = {
     kind: MarkupKind.Markdown,
     value: [
       '# Header',
       'Some text',
       '```typescript',
       'someCode();',
       '```'
     ].join('\n')
    };
    ```

    *Please Note* that clients might sanitize the return markdown. A client could decide to
    remove HTML from the markdown to avoid script execution.
    """

    kind: "MarkupKind" = attrs.field()
    """The type of the Markup"""

    value: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The content itself"""


@attrs.define
class FullDocumentDiagnosticReport:
    """A diagnostic report with a full set of problems.

    @since 3.17.0
    """

    # Since: 3.17.0

    kind: str = attrs.field()
    """A full document diagnostic report."""

    items: List["Diagnostic"] = attrs.field()
    """The actual items."""

    resultId: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """An optional result id. If provided it will
    be sent on the next diagnostic request for the
    same document."""


@attrs.define
class RelatedFullDocumentDiagnosticReport:
    """A full diagnostic report with a set of related documents.

    @since 3.17.0
    """

    # Since: 3.17.0

    kind: str = attrs.field()
    """A full document diagnostic report."""

    items: List["Diagnostic"] = attrs.field()
    """The actual items."""

    relatedDocuments: Optional[
        Dict[
            str,
            Union["FullDocumentDiagnosticReport", "UnchangedDocumentDiagnosticReport"],
        ]
    ] = attrs.field(default=None)
    """Diagnostics of related documents. This information is useful
    in programming languages where code in a file A can generate
    diagnostics in a file B which A depends on. An example of
    such a language is C/C++ where marco definitions in a file
    a.cpp and result in errors in a header file b.hpp.
    
    @since 3.17.0"""
    # Since: 3.17.0

    resultId: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """An optional result id. If provided it will
    be sent on the next diagnostic request for the
    same document."""


@attrs.define
class UnchangedDocumentDiagnosticReport:
    """A diagnostic report indicating that the last returned report is still
    accurate.

    @since 3.17.0
    """

    # Since: 3.17.0

    kind: str = attrs.field()
    """A document diagnostic report indicating
    no changes to the last result. A server can
    only return `unchanged` if result ids are
    provided."""

    resultId: str = attrs.field(validator=attrs.validators.instance_of(str))
    """A result id which will be sent on the next
    diagnostic request for the same document."""


@attrs.define
class RelatedUnchangedDocumentDiagnosticReport:
    """An unchanged diagnostic report with a set of related documents.

    @since 3.17.0
    """

    # Since: 3.17.0

    kind: str = attrs.field()
    """A document diagnostic report indicating
    no changes to the last result. A server can
    only return `unchanged` if result ids are
    provided."""

    resultId: str = attrs.field(validator=attrs.validators.instance_of(str))
    """A result id which will be sent on the next
    diagnostic request for the same document."""

    relatedDocuments: Optional[
        Dict[
            str,
            Union["FullDocumentDiagnosticReport", "UnchangedDocumentDiagnosticReport"],
        ]
    ] = attrs.field(default=None)
    """Diagnostics of related documents. This information is useful
    in programming languages where code in a file A can generate
    diagnostics in a file B which A depends on. An example of
    such a language is C/C++ where marco definitions in a file
    a.cpp and result in errors in a header file b.hpp.
    
    @since 3.17.0"""
    # Since: 3.17.0


@attrs.define
class PreviousResultId:
    """A previous result id in a workspace pull request.

    @since 3.17.0
    """

    # Since: 3.17.0

    uri: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The URI for which the client knowns a
    result id."""

    value: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The value of the previous result id."""


@attrs.define
class NotebookDocument:
    """A notebook document.

    @since 3.17.0
    """

    # Since: 3.17.0

    uri: "URI" = attrs.field()
    """The notebook document's uri."""

    notebookType: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The type of the notebook."""

    version: int = attrs.field(validator=validators.integer_validator)
    """The version number of this document (it will increase after each
    change, including undo/redo)."""

    cells: List["NotebookCell"] = attrs.field()
    """The cells of a notebook."""

    metadata: Optional["LSPObject"] = attrs.field(default=None)
    """Additional metadata stored with the notebook
    document.
    
    Note: should always be an object literal (e.g. LSPObject)"""


@attrs.define
class TextDocumentItem:
    """An item to transfer a text document from the client to the server."""

    uri: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The text document's uri."""

    languageId: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The text document's language identifier."""

    version: int = attrs.field(validator=validators.integer_validator)
    """The version number of this document (it will increase after each
    change, including undo/redo)."""

    text: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The content of the opened text document."""


@attrs.define
class VersionedNotebookDocumentIdentifier:
    """A versioned notebook document identifier.

    @since 3.17.0
    """

    # Since: 3.17.0

    version: int = attrs.field(validator=validators.integer_validator)
    """The version number of this notebook document."""

    uri: "URI" = attrs.field()
    """The notebook document's uri."""


@attrs.define
class NotebookDocumentChangeEvent:
    """A change event for a notebook document.

    @since 3.17.0
    """

    # Since: 3.17.0

    metadata: Optional["LSPObject"] = attrs.field(default=None)
    """The changed meta data if any.
    
    Note: should always be an object literal (e.g. LSPObject)"""

    cells: Optional["None"] = attrs.field(default=None)
    """Changes to cells"""


@attrs.define
class NotebookDocumentIdentifier:
    """A literal to identify a notebook document in the client.

    @since 3.17.0
    """

    # Since: 3.17.0

    uri: "URI" = attrs.field()
    """The notebook document's uri."""


@attrs.define
class Registration:
    """General parameters to to register for an notification or to register a
    provider."""

    id: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The id used to register the request. The id can be used to deregister
    the request again."""

    method: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The method / capability to register for."""

    registerOptions: Optional["LSPAny"] = attrs.field(default=None)
    """Options necessary for the registration."""


@attrs.define
class Unregistration:
    """General parameters to unregister a request or notification."""

    id: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The id used to unregister the request or notification. Usually an id
    provided during the register request."""

    method: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The method to unregister for."""


@attrs.define
class ServerCapabilities:
    """Defines the capabilities provided by a language server."""

    positionEncoding: Optional["PositionEncodingKind"] = attrs.field(default=None)
    """The position encoding the server picked from the encodings offered
    by the client via the client capability `general.positionEncodings`.
    
    If the client didn't provide any position encodings the only valid
    value that a server can return is 'utf-16'.
    
    If omitted it defaults to 'utf-16'.
    
    @since 3.17.0"""
    # Since: 3.17.0

    textDocumentSync: Optional[
        Union["TextDocumentSyncOptions", "TextDocumentSyncKind"]
    ] = attrs.field(default=None)
    """Defines how text documents are synced. Is either a detailed structure
    defining each notification or for backwards compatibility the
    TextDocumentSyncKind number."""

    notebookDocumentSync: Optional[
        Union["NotebookDocumentSyncOptions", "NotebookDocumentSyncRegistrationOptions"]
    ] = attrs.field(default=None)
    """Defines how notebook documents are synced.
    
    @since 3.17.0"""
    # Since: 3.17.0

    completionProvider: Optional["CompletionOptions"] = attrs.field(default=None)
    """The server provides completion support."""

    hoverProvider: Optional[Union[bool, "HoverOptions"]] = attrs.field(default=None)
    """The server provides hover support."""

    signatureHelpProvider: Optional["SignatureHelpOptions"] = attrs.field(default=None)
    """The server provides signature help support."""

    declarationProvider: Optional[
        Union[bool, "DeclarationOptions", "DeclarationRegistrationOptions"]
    ] = attrs.field(default=None)
    """The server provides Goto Declaration support."""

    definitionProvider: Optional[Union[bool, "DefinitionOptions"]] = attrs.field(
        default=None
    )
    """The server provides goto definition support."""

    typeDefinitionProvider: Optional[
        Union[bool, "TypeDefinitionOptions", "TypeDefinitionRegistrationOptions"]
    ] = attrs.field(default=None)
    """The server provides Goto Type Definition support."""

    implementationProvider: Optional[
        Union[bool, "ImplementationOptions", "ImplementationRegistrationOptions"]
    ] = attrs.field(default=None)
    """The server provides Goto Implementation support."""

    referencesProvider: Optional[Union[bool, "ReferenceOptions"]] = attrs.field(
        default=None
    )
    """The server provides find references support."""

    documentHighlightProvider: Optional[
        Union[bool, "DocumentHighlightOptions"]
    ] = attrs.field(default=None)
    """The server provides document highlight support."""

    documentSymbolProvider: Optional[
        Union[bool, "DocumentSymbolOptions"]
    ] = attrs.field(default=None)
    """The server provides document symbol support."""

    codeActionProvider: Optional[Union[bool, "CodeActionOptions"]] = attrs.field(
        default=None
    )
    """The server provides code actions. CodeActionOptions may only be
    specified if the client states that it supports
    `codeActionLiteralSupport` in its initial `initialize` request."""

    codeLensProvider: Optional["CodeLensOptions"] = attrs.field(default=None)
    """The server provides code lens."""

    documentLinkProvider: Optional["DocumentLinkOptions"] = attrs.field(default=None)
    """The server provides document link support."""

    colorProvider: Optional[
        Union[bool, "DocumentColorOptions", "DocumentColorRegistrationOptions"]
    ] = attrs.field(default=None)
    """The server provides color provider support."""

    workspaceSymbolProvider: Optional[
        Union[bool, "WorkspaceSymbolOptions"]
    ] = attrs.field(default=None)
    """The server provides workspace symbol support."""

    documentFormattingProvider: Optional[
        Union[bool, "DocumentFormattingOptions"]
    ] = attrs.field(default=None)
    """The server provides document formatting."""

    documentRangeFormattingProvider: Optional[
        Union[bool, "DocumentRangeFormattingOptions"]
    ] = attrs.field(default=None)
    """The server provides document range formatting."""

    documentOnTypeFormattingProvider: Optional[
        "DocumentOnTypeFormattingOptions"
    ] = attrs.field(default=None)
    """The server provides document formatting on typing."""

    renameProvider: Optional[Union[bool, "RenameOptions"]] = attrs.field(default=None)
    """The server provides rename support. RenameOptions may only be
    specified if the client states that it supports
    `prepareSupport` in its initial `initialize` request."""

    foldingRangeProvider: Optional[
        Union[bool, "FoldingRangeOptions", "FoldingRangeRegistrationOptions"]
    ] = attrs.field(default=None)
    """The server provides folding provider support."""

    selectionRangeProvider: Optional[
        Union[bool, "SelectionRangeOptions", "SelectionRangeRegistrationOptions"]
    ] = attrs.field(default=None)
    """The server provides selection range support."""

    executeCommandProvider: Optional["ExecuteCommandOptions"] = attrs.field(
        default=None
    )
    """The server provides execute command support."""

    callHierarchyProvider: Optional[
        Union[bool, "CallHierarchyOptions", "CallHierarchyRegistrationOptions"]
    ] = attrs.field(default=None)
    """The server provides call hierarchy support.
    
    @since 3.16.0"""
    # Since: 3.16.0

    linkedEditingRangeProvider: Optional[
        Union[
            bool, "LinkedEditingRangeOptions", "LinkedEditingRangeRegistrationOptions"
        ]
    ] = attrs.field(default=None)
    """The server provides linked editing range support.
    
    @since 3.16.0"""
    # Since: 3.16.0

    semanticTokensProvider: Optional[
        Union["SemanticTokensOptions", "SemanticTokensRegistrationOptions"]
    ] = attrs.field(default=None)
    """The server provides semantic tokens support.
    
    @since 3.16.0"""
    # Since: 3.16.0

    monikerProvider: Optional[
        Union[bool, "MonikerOptions", "MonikerRegistrationOptions"]
    ] = attrs.field(default=None)
    """The server provides moniker support.
    
    @since 3.16.0"""
    # Since: 3.16.0

    typeHierarchyProvider: Optional[
        Union[bool, "TypeHierarchyOptions", "TypeHierarchyRegistrationOptions"]
    ] = attrs.field(default=None)
    """The server provides type hierarchy support.
    
    @since 3.17.0"""
    # Since: 3.17.0

    inlineValueProvider: Optional[
        Union[bool, "InlineValueOptions", "InlineValueRegistrationOptions"]
    ] = attrs.field(default=None)
    """The server provides inline values.
    
    @since 3.17.0"""
    # Since: 3.17.0

    inlayHintProvider: Optional[
        Union[bool, "InlayHintOptions", "InlayHintRegistrationOptions"]
    ] = attrs.field(default=None)
    """The server provides inlay hints.
    
    @since 3.17.0"""
    # Since: 3.17.0

    diagnosticProvider: Optional[
        Union["DiagnosticOptions", "DiagnosticRegistrationOptions"]
    ] = attrs.field(default=None)
    """The server has support for pull model diagnostics.
    
    @since 3.17.0"""
    # Since: 3.17.0

    workspace: Optional["None"] = attrs.field(default=None)
    """Workspace specific server capabilities."""

    experimental: Optional["LSPAny"] = attrs.field(default=None)
    """Experimental server capabilities."""


@attrs.define
class VersionedTextDocumentIdentifier:
    """A text document identifier to denote a specific version of a text
    document."""

    version: int = attrs.field(validator=validators.integer_validator)
    """The version number of this document."""

    uri: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The text document's uri."""


@attrs.define
class FileEvent:
    """An event describing a file change."""

    uri: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The file's uri."""

    type: "FileChangeType" = attrs.field()
    """The change type."""


@attrs.define
class FileSystemWatcher:

    globPattern: "GlobPattern" = attrs.field()
    """The glob pattern to watch. See {@link GlobPattern glob pattern} for more detail.
    
    @since 3.17.0 support for relative patterns."""
    # Since: 3.17.0 support for relative patterns.

    kind: Optional["WatchKind"] = attrs.field(default=None)
    """The kind of events of interest. If omitted it defaults
    to WatchKind.Create | WatchKind.Change | WatchKind.Delete
    which is 7."""


@attrs.define
class Diagnostic:
    """Represents a diagnostic, such as a compiler error or warning.

    Diagnostic objects are only valid in the scope of a resource.
    """

    range: "Range" = attrs.field()
    """The range at which the message applies"""

    message: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The diagnostic's message. It usually appears in the user interface"""

    severity: Optional["DiagnosticSeverity"] = attrs.field(default=None)
    """The diagnostic's severity. Can be omitted. If omitted it is up to the
    client to interpret diagnostics as error, warning, info or hint."""

    code: Optional[Union[int, str]] = attrs.field(default=None)
    """The diagnostic's code, which usually appear in the user interface."""

    codeDescription: Optional["CodeDescription"] = attrs.field(default=None)
    """An optional property to describe the error code.
    Requires the code field (above) to be present/not null.
    
    @since 3.16.0"""
    # Since: 3.16.0

    source: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """A human-readable string describing the source of this
    diagnostic, e.g. 'typescript' or 'super lint'. It usually
    appears in the user interface."""

    tags: Optional[List["DiagnosticTag"]] = attrs.field(default=None)
    """Additional metadata about the diagnostic.
    
    @since 3.15.0"""
    # Since: 3.15.0

    relatedInformation: Optional[List["DiagnosticRelatedInformation"]] = attrs.field(
        default=None
    )
    """An array of related diagnostic information, e.g. when symbol-names within
    a scope collide all definitions can be marked via this property."""

    data: Optional["LSPAny"] = attrs.field(default=None)
    """A data entry field that is preserved between a `textDocument/publishDiagnostics`
    notification and `textDocument/codeAction` request.
    
    @since 3.16.0"""
    # Since: 3.16.0


@attrs.define
class CompletionContext:
    """Contains additional information about the context in which a completion
    request is triggered."""

    triggerKind: "CompletionTriggerKind" = attrs.field()
    """How the completion was triggered."""

    triggerCharacter: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The trigger character (a single character) that has trigger code complete.
    Is undefined if `triggerKind !== CompletionTriggerKind.TriggerCharacter`"""


@attrs.define
class CompletionItemLabelDetails:
    """Additional details for a completion item label.

    @since 3.17.0
    """

    # Since: 3.17.0

    detail: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """An optional string which is rendered less prominently directly after {@link CompletionItem.label label},
    without any spacing. Should be used for function signatures and type annotations."""

    description: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """An optional string which is rendered less prominently after {@link CompletionItem.detail}. Should be used
    for fully qualified names and file paths."""


@attrs.define
class InsertReplaceEdit:
    """A special text edit to provide an insert and a replace operation.

    @since 3.16.0
    """

    # Since: 3.16.0

    newText: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The string to be inserted."""

    insert: "Range" = attrs.field()
    """The range if the insert is requested"""

    replace: "Range" = attrs.field()
    """The range if the replace is requested."""


@attrs.define
class SignatureHelpContext:
    """Additional information about the context in which a signature help
    request was triggered.

    @since 3.15.0
    """

    # Since: 3.15.0

    triggerKind: "SignatureHelpTriggerKind" = attrs.field()
    """Action that caused signature help to be triggered."""

    isRetrigger: bool = attrs.field(validator=attrs.validators.instance_of(bool))
    """`true` if signature help was already showing when it was triggered.
    
    Retriggers occurs when the signature help is already active and can be caused by actions such as
    typing a trigger character, a cursor move, or document content changes."""

    triggerCharacter: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """Character that caused signature help to be triggered.
    
    This is undefined when `triggerKind !== SignatureHelpTriggerKind.TriggerCharacter`"""

    activeSignatureHelp: Optional["SignatureHelp"] = attrs.field(default=None)
    """The currently active `SignatureHelp`.
    
    The `activeSignatureHelp` has its `SignatureHelp.activeSignature` field updated based on
    the user navigating through available signatures."""


@attrs.define
class SignatureInformation:
    """Represents the signature of something callable.

    A signature can have a label, like a function-name, a doc-comment,
    and a set of parameters.
    """

    label: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The label of this signature. Will be shown in
    the UI."""

    documentation: Optional[Union[str, "MarkupContent"]] = attrs.field(default=None)
    """The human-readable doc-comment of this signature. Will be shown
    in the UI but can be omitted."""

    parameters: Optional[List["ParameterInformation"]] = attrs.field(default=None)
    """The parameters of this signature."""

    activeParameter: Optional[int] = attrs.field(
        validator=attrs.validators.optional(validators.uinteger_validator),
        default=None,
    )
    """The index of the active parameter.
    
    If provided, this is used in place of `SignatureHelp.activeParameter`.
    
    @since 3.16.0"""
    # Since: 3.16.0


@attrs.define
class ReferenceContext:
    """Value-object that contains additional information when requesting
    references."""

    includeDeclaration: bool = attrs.field(validator=attrs.validators.instance_of(bool))
    """Include the declaration of the current symbol."""


@attrs.define
class CodeActionContext:
    """Contains additional diagnostic information about the context in which a
    code action is run."""

    diagnostics: List["Diagnostic"] = attrs.field()
    """An array of diagnostics known on the client side overlapping the range provided to the
    `textDocument/codeAction` request. They are provided so that the server knows which
    errors are currently presented to the user for the given range. There is no guarantee
    that these accurately reflect the error state of the resource. The primary parameter
    to compute code actions is the provided range."""

    only: Optional[List["CodeActionKind"]] = attrs.field(default=None)
    """Requested kind of actions to return.
    
    Actions not of this kind are filtered out by the client before being shown. So servers
    can omit computing them."""

    triggerKind: Optional["CodeActionTriggerKind"] = attrs.field(default=None)
    """The reason why code actions were requested.
    
    @since 3.17.0"""
    # Since: 3.17.0


@attrs.define
class FormattingOptions:
    """Value-object describing what options formatting should use."""

    tabSize: int = attrs.field(validator=validators.uinteger_validator)
    """Size of a tab in spaces."""

    insertSpaces: bool = attrs.field(validator=attrs.validators.instance_of(bool))
    """Prefer spaces over tabs."""

    trimTrailingWhitespace: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Trim trailing whitespace on a line.
    
    @since 3.15.0"""
    # Since: 3.15.0

    insertFinalNewline: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Insert a newline character at the end of the file if one does not exist.
    
    @since 3.15.0"""
    # Since: 3.15.0

    trimFinalNewlines: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Trim all newlines after the final newline at the end of the file.
    
    @since 3.15.0"""
    # Since: 3.15.0


@attrs.define
class SemanticTokensLegend:
    """@since 3.16.0"""

    # Since: 3.16.0

    tokenTypes: List[str] = attrs.field()
    """The token types a server uses."""

    tokenModifiers: List[str] = attrs.field()
    """The token modifiers a server uses."""


@attrs.define
class OptionalVersionedTextDocumentIdentifier:
    """A text document identifier to optionally denote a specific version of a
    text document."""

    uri: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The text document's uri."""

    version: Optional[Union[int, None]] = attrs.field(default=None)
    """The version number of this document. If a versioned text document identifier
    is sent from the server to the client and the file is not open in the editor
    (the server has not received an open notification before) the server can send
    `null` to indicate that the version is unknown and the content on disk is the
    truth (as specified with document content ownership)."""


@attrs.define
class AnnotatedTextEdit:
    """A special text edit with an additional change annotation.

    @since 3.16.0.
    """

    # Since: 3.16.0.

    annotationId: "ChangeAnnotationIdentifier" = attrs.field()
    """The actual identifier of the change annotation"""

    range: "Range" = attrs.field()
    """The range of the text document to be manipulated. To insert
    text into a document create a range where start === end."""

    newText: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The string to be inserted. For delete operations use an
    empty string."""


@attrs.define
class CreateFileOptions:
    """Options to create a file."""

    overwrite: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Overwrite existing file. Overwrite wins over `ignoreIfExists`"""

    ignoreIfExists: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Ignore if exists."""


@attrs.define
class RenameFileOptions:
    """Rename file options."""

    overwrite: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Overwrite target if existing. Overwrite wins over `ignoreIfExists`"""

    ignoreIfExists: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Ignores if target exists."""


@attrs.define
class DeleteFileOptions:
    """Delete file options."""

    recursive: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Delete the content recursively if a folder is denoted."""

    ignoreIfNotExists: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Ignore the operation if the file doesn't exist."""


@attrs.define
class FileOperationPattern:
    """A pattern to describe in which file operation requests or notifications
    the server is interested in receiving.

    @since 3.16.0
    """

    # Since: 3.16.0

    glob: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The glob pattern to match. Glob patterns can have the following syntax:
    - `*` to match one or more characters in a path segment
    - `?` to match on one character in a path segment
    - `**` to match any number of path segments, including none
    - `{}` to group sub patterns into an OR expression. (e.g. `**/*.{ts,js}` matches all TypeScript and JavaScript files)
    - `[]` to declare a range of characters to match in a path segment (e.g., `example.[0-9]` to match on `example.0`, `example.1`, …)
    - `[!...]` to negate a range of characters to match in a path segment (e.g., `example.[!0-9]` to match on `example.a`, `example.b`, but not `example.0`)"""

    matches: Optional["FileOperationPatternKind"] = attrs.field(default=None)
    """Whether to match files or folders with this pattern.
    
    Matches both if undefined."""

    options: Optional["FileOperationPatternOptions"] = attrs.field(default=None)
    """Additional options used during matching."""


@attrs.define
class WorkspaceFullDocumentDiagnosticReport:
    """A full document diagnostic report for a workspace diagnostic result.

    @since 3.17.0
    """

    # Since: 3.17.0

    uri: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The URI for which diagnostic information is reported."""

    kind: str = attrs.field()
    """A full document diagnostic report."""

    items: List["Diagnostic"] = attrs.field()
    """The actual items."""

    version: Optional[Union[int, None]] = attrs.field(default=None)
    """The version number for which the diagnostics are reported.
    If the document is not marked as open `null` can be provided."""

    resultId: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """An optional result id. If provided it will
    be sent on the next diagnostic request for the
    same document."""


@attrs.define
class WorkspaceUnchangedDocumentDiagnosticReport:
    """An unchanged document diagnostic report for a workspace diagnostic
    result.

    @since 3.17.0
    """

    # Since: 3.17.0

    uri: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The URI for which diagnostic information is reported."""

    kind: str = attrs.field()
    """A document diagnostic report indicating
    no changes to the last result. A server can
    only return `unchanged` if result ids are
    provided."""

    resultId: str = attrs.field(validator=attrs.validators.instance_of(str))
    """A result id which will be sent on the next
    diagnostic request for the same document."""

    version: Optional[Union[int, None]] = attrs.field(default=None)
    """The version number for which the diagnostics are reported.
    If the document is not marked as open `null` can be provided."""


class LSPObject:
    """LSP object definition.

    @since 3.17.0
    """

    # Since: 3.17.0

    pass


@attrs.define
class NotebookCell:
    """A notebook cell.

    A cell's document URI must be unique across ALL notebook
    cells and can therefore be used to uniquely identify a
    notebook cell or the cell's text document.

    @since 3.17.0
    """

    # Since: 3.17.0

    kind: "NotebookCellKind" = attrs.field()
    """The cell's kind"""

    document: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The URI of the cell's text document
    content."""

    metadata: Optional["LSPObject"] = attrs.field(default=None)
    """Additional metadata stored with the cell.
    
    Note: should always be an object literal (e.g. LSPObject)"""

    executionSummary: Optional["ExecutionSummary"] = attrs.field(default=None)
    """Additional execution summary information
    if supported by the client."""


@attrs.define
class NotebookCellArrayChange:
    """A change describing how to move a `NotebookCell` array from state S to
    S'.

    @since 3.17.0
    """

    # Since: 3.17.0

    start: int = attrs.field(validator=validators.uinteger_validator)
    """The start oftest of the cell that changed."""

    deleteCount: int = attrs.field(validator=validators.uinteger_validator)
    """The deleted cells"""

    cells: Optional[List["NotebookCell"]] = attrs.field(default=None)
    """The new cells, if any"""


@attrs.define
class ClientCapabilities:
    """Defines the capabilities provided by the client."""

    workspace: Optional["WorkspaceClientCapabilities"] = attrs.field(default=None)
    """Workspace specific client capabilities."""

    textDocument: Optional["TextDocumentClientCapabilities"] = attrs.field(default=None)
    """Text document specific client capabilities."""

    notebookDocument: Optional["NotebookDocumentClientCapabilities"] = attrs.field(
        default=None
    )
    """Capabilities specific to the notebook document support.
    
    @since 3.17.0"""
    # Since: 3.17.0

    window: Optional["WindowClientCapabilities"] = attrs.field(default=None)
    """Window specific client capabilities."""

    general: Optional["GeneralClientCapabilities"] = attrs.field(default=None)
    """General client capabilities.
    
    @since 3.16.0"""
    # Since: 3.16.0

    experimental: Optional["LSPAny"] = attrs.field(default=None)
    """Experimental client capabilities."""


@attrs.define
class TextDocumentSyncOptions:

    openClose: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Open and close notifications are sent to the server. If omitted open close notification should not
    be sent."""

    change: Optional["TextDocumentSyncKind"] = attrs.field(default=None)
    """Change notifications are sent to the server. See TextDocumentSyncKind.None, TextDocumentSyncKind.Full
    and TextDocumentSyncKind.Incremental. If omitted it defaults to TextDocumentSyncKind.None."""

    willSave: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """If present will save notifications are sent to the server. If omitted the notification should not be
    sent."""

    willSaveWaitUntil: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """If present will save wait until requests are sent to the server. If omitted the request should not be
    sent."""

    save: Optional[Union[bool, "SaveOptions"]] = attrs.field(default=None)
    """If present save notifications are sent to the server. If omitted the notification should not be
    sent."""


@attrs.define
class NotebookDocumentSyncOptions:
    """Options specific to a notebook plus its cells to be synced to the
    server.

    If a selector provides a notebook document
    filter but no cell selector all cells of a
    matching notebook document will be synced.

    If a selector provides no notebook document
    filter but only a cell selector all notebook
    document that contain at least one matching
    cell will be synced.

    @since 3.17.0
    """

    # Since: 3.17.0

    notebookSelector: List[Union["None", "None"]] = attrs.field()
    """The notebooks to be synced"""

    save: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether save notification should be forwarded to
    the server. Will only be honored if mode === `notebook`."""


@attrs.define
class NotebookDocumentSyncRegistrationOptions:
    """Registration options specific to a notebook.

    @since 3.17.0
    """

    # Since: 3.17.0

    notebookSelector: List[Union["None", "None"]] = attrs.field()
    """The notebooks to be synced"""

    save: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether save notification should be forwarded to
    the server. Will only be honored if mode === `notebook`."""

    id: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The id used to register the request. The id can be used to deregister
    the request again. See also Registration#id."""


@attrs.define
class WorkspaceFoldersServerCapabilities:

    supported: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The server has support for workspace folders"""

    changeNotifications: Optional[Union[str, bool]] = attrs.field(default=None)
    """Whether the server wants to receive workspace folder
    change notifications.
    
    If a string is provided the string is treated as an ID
    under which the notification is registered on the client
    side. The ID can be used to unregister for these events
    using the `client/unregisterCapability` request."""


@attrs.define
class FileOperationOptions:
    """Options for notifications/requests for user operations on files.

    @since 3.16.0
    """

    # Since: 3.16.0

    didCreate: Optional["FileOperationRegistrationOptions"] = attrs.field(default=None)
    """The server is interested in receiving didCreateFiles notifications."""

    willCreate: Optional["FileOperationRegistrationOptions"] = attrs.field(default=None)
    """The server is interested in receiving willCreateFiles requests."""

    didRename: Optional["FileOperationRegistrationOptions"] = attrs.field(default=None)
    """The server is interested in receiving didRenameFiles notifications."""

    willRename: Optional["FileOperationRegistrationOptions"] = attrs.field(default=None)
    """The server is interested in receiving willRenameFiles requests."""

    didDelete: Optional["FileOperationRegistrationOptions"] = attrs.field(default=None)
    """The server is interested in receiving didDeleteFiles file notifications."""

    willDelete: Optional["FileOperationRegistrationOptions"] = attrs.field(default=None)
    """The server is interested in receiving willDeleteFiles file requests."""


@attrs.define
class CodeDescription:
    """Structure to capture a description for an error code.

    @since 3.16.0
    """

    # Since: 3.16.0

    href: "URI" = attrs.field()
    """An URI to open with more information about the diagnostic error."""


@attrs.define
class DiagnosticRelatedInformation:
    """Represents a related message and source code location for a diagnostic.

    This should be used to point to code locations that cause or related
    to a diagnostics, e.g when duplicating a symbol in a scope.
    """

    location: "Location" = attrs.field()
    """The location of this related diagnostic information."""

    message: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The message of this related diagnostic information."""


@attrs.define
class ParameterInformation:
    """Represents a parameter of a callable-signature.

    A parameter can have a label and a doc-comment.
    """

    label: Union[str, Tuple[int, int]] = attrs.field()
    """The label of this parameter information.
    
    Either a string or an inclusive start and exclusive end offsets within its containing
    signature label. (see SignatureInformation.label). The offsets are based on a UTF-16
    string representation as `Position` and `Range` does.
    
    *Note*: a label of type string should be a substring of its containing signature label.
    Its intended use case is to highlight the parameter label part in the `SignatureInformation.label`."""

    documentation: Optional[Union[str, "MarkupContent"]] = attrs.field(default=None)
    """The human-readable doc-comment of this parameter. Will be shown
    in the UI but can be omitted."""


@attrs.define
class NotebookCellTextDocumentFilter:
    """A notebook cell text document filter denotes a cell text document by
    different properties.

    @since 3.17.0
    """

    # Since: 3.17.0

    notebook: Union[str, "NotebookDocumentFilter"] = attrs.field()
    """A filter that matches against the notebook
    containing the notebook cell. If a string
    value is provided it matches against the
    notebook type. '*' matches every notebook."""

    language: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """A language id like `python`.
    
    Will be matched against the language id of the
    notebook cell document. '*' matches every language."""


@attrs.define
class FileOperationPatternOptions:
    """Matching options for the file operation pattern.

    @since 3.16.0
    """

    # Since: 3.16.0

    ignoreCase: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The pattern should be matched ignoring casing."""


@attrs.define
class ExecutionSummary:

    executionOrder: int = attrs.field(validator=validators.uinteger_validator)
    """A strict monotonically increasing value
    indicating the execution order of a cell
    inside a notebook."""

    success: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether the execution was successful or
    not if known by the client."""


@attrs.define
class WorkspaceClientCapabilities:
    """Workspace specific client capabilities."""

    applyEdit: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The client supports applying batch edits
    to the workspace by supporting the request
    'workspace/applyEdit'"""

    workspaceEdit: Optional["WorkspaceEditClientCapabilities"] = attrs.field(
        default=None
    )
    """Capabilities specific to `WorkspaceEdit`s."""

    didChangeConfiguration: Optional[
        "DidChangeConfigurationClientCapabilities"
    ] = attrs.field(default=None)
    """Capabilities specific to the `workspace/didChangeConfiguration` notification."""

    didChangeWatchedFiles: Optional[
        "DidChangeWatchedFilesClientCapabilities"
    ] = attrs.field(default=None)
    """Capabilities specific to the `workspace/didChangeWatchedFiles` notification."""

    symbol: Optional["WorkspaceSymbolClientCapabilities"] = attrs.field(default=None)
    """Capabilities specific to the `workspace/symbol` request."""

    executeCommand: Optional["ExecuteCommandClientCapabilities"] = attrs.field(
        default=None
    )
    """Capabilities specific to the `workspace/executeCommand` request."""

    workspaceFolders: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The client has support for workspace folders.
    
    @since 3.6.0"""
    # Since: 3.6.0

    configuration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The client supports `workspace/configuration` requests.
    
    @since 3.6.0"""
    # Since: 3.6.0

    semanticTokens: Optional["SemanticTokensWorkspaceClientCapabilities"] = attrs.field(
        default=None
    )
    """Capabilities specific to the semantic token requests scoped to the
    workspace.
    
    @since 3.16.0."""
    # Since: 3.16.0.

    codeLens: Optional["CodeLensWorkspaceClientCapabilities"] = attrs.field(
        default=None
    )
    """Capabilities specific to the code lens requests scoped to the
    workspace.
    
    @since 3.16.0."""
    # Since: 3.16.0.

    fileOperations: Optional["FileOperationClientCapabilities"] = attrs.field(
        default=None
    )
    """The client has support for file notifications/requests for user operations on files.
    
    Since 3.16.0"""

    inlineValue: Optional["InlineValueWorkspaceClientCapabilities"] = attrs.field(
        default=None
    )
    """Capabilities specific to the inline values requests scoped to the
    workspace.
    
    @since 3.17.0."""
    # Since: 3.17.0.

    inlayHint: Optional["InlayHintWorkspaceClientCapabilities"] = attrs.field(
        default=None
    )
    """Capabilities specific to the inlay hint requests scoped to the
    workspace.
    
    @since 3.17.0."""
    # Since: 3.17.0.

    diagnostics: Optional["DiagnosticWorkspaceClientCapabilities"] = attrs.field(
        default=None
    )
    """Capabilities specific to the diagnostic requests scoped to the
    workspace.
    
    @since 3.17.0."""
    # Since: 3.17.0.


@attrs.define
class TextDocumentClientCapabilities:
    """Text document specific client capabilities."""

    synchronization: Optional["TextDocumentSyncClientCapabilities"] = attrs.field(
        default=None
    )
    """Defines which synchronization capabilities the client supports."""

    completion: Optional["CompletionClientCapabilities"] = attrs.field(default=None)
    """Capabilities specific to the `textDocument/completion` request."""

    hover: Optional["HoverClientCapabilities"] = attrs.field(default=None)
    """Capabilities specific to the `textDocument/hover` request."""

    signatureHelp: Optional["SignatureHelpClientCapabilities"] = attrs.field(
        default=None
    )
    """Capabilities specific to the `textDocument/signatureHelp` request."""

    declaration: Optional["DeclarationClientCapabilities"] = attrs.field(default=None)
    """Capabilities specific to the `textDocument/declaration` request.
    
    @since 3.14.0"""
    # Since: 3.14.0

    definition: Optional["DefinitionClientCapabilities"] = attrs.field(default=None)
    """Capabilities specific to the `textDocument/definition` request."""

    typeDefinition: Optional["TypeDefinitionClientCapabilities"] = attrs.field(
        default=None
    )
    """Capabilities specific to the `textDocument/typeDefinition` request.
    
    @since 3.6.0"""
    # Since: 3.6.0

    implementation: Optional["ImplementationClientCapabilities"] = attrs.field(
        default=None
    )
    """Capabilities specific to the `textDocument/implementation` request.
    
    @since 3.6.0"""
    # Since: 3.6.0

    references: Optional["ReferenceClientCapabilities"] = attrs.field(default=None)
    """Capabilities specific to the `textDocument/references` request."""

    documentHighlight: Optional["DocumentHighlightClientCapabilities"] = attrs.field(
        default=None
    )
    """Capabilities specific to the `textDocument/documentHighlight` request."""

    documentSymbol: Optional["DocumentSymbolClientCapabilities"] = attrs.field(
        default=None
    )
    """Capabilities specific to the `textDocument/documentSymbol` request."""

    codeAction: Optional["CodeActionClientCapabilities"] = attrs.field(default=None)
    """Capabilities specific to the `textDocument/codeAction` request."""

    codeLens: Optional["CodeLensClientCapabilities"] = attrs.field(default=None)
    """Capabilities specific to the `textDocument/codeLens` request."""

    documentLink: Optional["DocumentLinkClientCapabilities"] = attrs.field(default=None)
    """Capabilities specific to the `textDocument/documentLink` request."""

    colorProvider: Optional["DocumentColorClientCapabilities"] = attrs.field(
        default=None
    )
    """Capabilities specific to the `textDocument/documentColor` and the
    `textDocument/colorPresentation` request.
    
    @since 3.6.0"""
    # Since: 3.6.0

    formatting: Optional["DocumentFormattingClientCapabilities"] = attrs.field(
        default=None
    )
    """Capabilities specific to the `textDocument/formatting` request."""

    rangeFormatting: Optional[
        "DocumentRangeFormattingClientCapabilities"
    ] = attrs.field(default=None)
    """Capabilities specific to the `textDocument/rangeFormatting` request."""

    onTypeFormatting: Optional[
        "DocumentOnTypeFormattingClientCapabilities"
    ] = attrs.field(default=None)
    """Capabilities specific to the `textDocument/onTypeFormatting` request."""

    rename: Optional["RenameClientCapabilities"] = attrs.field(default=None)
    """Capabilities specific to the `textDocument/rename` request."""

    foldingRange: Optional["FoldingRangeClientCapabilities"] = attrs.field(default=None)
    """Capabilities specific to the `textDocument/foldingRange` request.
    
    @since 3.10.0"""
    # Since: 3.10.0

    selectionRange: Optional["SelectionRangeClientCapabilities"] = attrs.field(
        default=None
    )
    """Capabilities specific to the `textDocument/selectionRange` request.
    
    @since 3.15.0"""
    # Since: 3.15.0

    publishDiagnostics: Optional["PublishDiagnosticsClientCapabilities"] = attrs.field(
        default=None
    )
    """Capabilities specific to the `textDocument/publishDiagnostics` notification."""

    callHierarchy: Optional["CallHierarchyClientCapabilities"] = attrs.field(
        default=None
    )
    """Capabilities specific to the various call hierarchy requests.
    
    @since 3.16.0"""
    # Since: 3.16.0

    semanticTokens: Optional["SemanticTokensClientCapabilities"] = attrs.field(
        default=None
    )
    """Capabilities specific to the various semantic token request.
    
    @since 3.16.0"""
    # Since: 3.16.0

    linkedEditingRange: Optional["LinkedEditingRangeClientCapabilities"] = attrs.field(
        default=None
    )
    """Capabilities specific to the `textDocument/linkedEditingRange` request.
    
    @since 3.16.0"""
    # Since: 3.16.0

    moniker: Optional["MonikerClientCapabilities"] = attrs.field(default=None)
    """Client capabilities specific to the `textDocument/moniker` request.
    
    @since 3.16.0"""
    # Since: 3.16.0

    typeHierarchy: Optional["TypeHierarchyClientCapabilities"] = attrs.field(
        default=None
    )
    """Capabilities specific to the various type hierarchy requests.
    
    @since 3.17.0"""
    # Since: 3.17.0

    inlineValue: Optional["InlineValueClientCapabilities"] = attrs.field(default=None)
    """Capabilities specific to the `textDocument/inlineValue` request.
    
    @since 3.17.0"""
    # Since: 3.17.0

    inlayHint: Optional["InlayHintClientCapabilities"] = attrs.field(default=None)
    """Capabilities specific to the `textDocument/inlayHint` request.
    
    @since 3.17.0"""
    # Since: 3.17.0

    diagnostic: Optional["DiagnosticClientCapabilities"] = attrs.field(default=None)
    """Capabilities specific to the diagnostic pull model.
    
    @since 3.17.0"""
    # Since: 3.17.0


@attrs.define
class NotebookDocumentClientCapabilities:
    """Capabilities specific to the notebook document support.

    @since 3.17.0
    """

    # Since: 3.17.0

    synchronization: "NotebookDocumentSyncClientCapabilities" = attrs.field()
    """Capabilities specific to notebook document synchronization
    
    @since 3.17.0"""
    # Since: 3.17.0


@attrs.define
class WindowClientCapabilities:

    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """It indicates whether the client supports server initiated
    progress using the `window/workDoneProgress/create` request.
    
    The capability also controls Whether client supports handling
    of progress notifications. If set servers are allowed to report a
    `workDoneProgress` property in the request specific server
    capabilities.
    
    @since 3.15.0"""
    # Since: 3.15.0

    showMessage: Optional["ShowMessageRequestClientCapabilities"] = attrs.field(
        default=None
    )
    """Capabilities specific to the showMessage request.
    
    @since 3.16.0"""
    # Since: 3.16.0

    showDocument: Optional["ShowDocumentClientCapabilities"] = attrs.field(default=None)
    """Capabilities specific to the showDocument request.
    
    @since 3.16.0"""
    # Since: 3.16.0


@attrs.define
class GeneralClientCapabilities:
    """General client capabilities.

    @since 3.16.0
    """

    # Since: 3.16.0

    staleRequestSupport: Optional["None"] = attrs.field(default=None)
    """Client capability that signals how the client
    handles stale requests (e.g. a request
    for which the client will not process the response
    anymore since the information is outdated).
    
    @since 3.17.0"""
    # Since: 3.17.0

    regularExpressions: Optional["RegularExpressionsClientCapabilities"] = attrs.field(
        default=None
    )
    """Client capabilities specific to regular expressions.
    
    @since 3.16.0"""
    # Since: 3.16.0

    markdown: Optional["MarkdownClientCapabilities"] = attrs.field(default=None)
    """Client capabilities specific to the client's markdown parser.
    
    @since 3.16.0"""
    # Since: 3.16.0

    positionEncodings: Optional[List["PositionEncodingKind"]] = attrs.field(
        default=None
    )
    """The position encodings supported by the client. Client and server
    have to agree on the same position encoding to ensure that offsets
    (e.g. character position in a line) are interpreted the same on both
    sides.
    
    To keep the protocol backwards compatible the following applies: if
    the value 'utf-16' is missing from the array of position encodings
    servers can assume that the client supports UTF-16. UTF-16 is
    therefore a mandatory encoding.
    
    If omitted it defaults to ['utf-16'].
    
    Implementation considerations: since the conversion from one encoding
    into another requires the content of the file / line the conversion
    is best done where the file is read which is usually on the server
    side.
    
    @since 3.17.0"""
    # Since: 3.17.0


@attrs.define
class RelativePattern:
    """A relative pattern is a helper to construct glob patterns that are
    matched relatively to a base URI. The common value for a `baseUri` is a
    workspace folder root, but it can be another absolute URI as well.

    @since 3.17.0
    """

    # Since: 3.17.0

    baseUri: Union["WorkspaceFolder", "URI"] = attrs.field()
    """A workspace folder or a base URI to which this pattern will be matched
    against relatively."""

    pattern: "Pattern" = attrs.field()
    """The actual glob pattern;"""


@attrs.define
class WorkspaceEditClientCapabilities:

    documentChanges: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The client supports versioned document changes in `WorkspaceEdit`s"""

    resourceOperations: Optional[List["ResourceOperationKind"]] = attrs.field(
        default=None
    )
    """The resource operations the client supports. Clients should at least
    support 'create', 'rename' and 'delete' files and folders.
    
    @since 3.13.0"""
    # Since: 3.13.0

    failureHandling: Optional["FailureHandlingKind"] = attrs.field(default=None)
    """The failure handling strategy of a client if applying the workspace edit
    fails.
    
    @since 3.13.0"""
    # Since: 3.13.0

    normalizesLineEndings: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether the client normalizes line endings to the client specific
    setting.
    If set to `true` the client will normalize line ending characters
    in a workspace edit to the client-specified new line
    character.
    
    @since 3.16.0"""
    # Since: 3.16.0

    changeAnnotationSupport: Optional["None"] = attrs.field(default=None)
    """Whether the client in general supports change annotations on text edits,
    create file, rename file and delete file changes.
    
    @since 3.16.0"""
    # Since: 3.16.0


@attrs.define
class DidChangeConfigurationClientCapabilities:

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Did change configuration notification supports dynamic registration."""


@attrs.define
class DidChangeWatchedFilesClientCapabilities:

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Did change watched files notification supports dynamic registration. Please note
    that the current protocol doesn't support static configuration for file changes
    from the server side."""

    relativePatternSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether the client has support for {@link  RelativePattern relative pattern}
    or not.
    
    @since 3.17.0"""
    # Since: 3.17.0


@attrs.define
class WorkspaceSymbolClientCapabilities:
    """Client capabilities for a WorkspaceSymbolRequest."""

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Symbol request supports dynamic registration."""

    symbolKind: Optional["None"] = attrs.field(default=None)
    """Specific capabilities for the `SymbolKind` in the `workspace/symbol` request."""

    tagSupport: Optional["None"] = attrs.field(default=None)
    """The client supports tags on `SymbolInformation`.
    Clients supporting tags have to handle unknown tags gracefully.
    
    @since 3.16.0"""
    # Since: 3.16.0

    resolveSupport: Optional["None"] = attrs.field(default=None)
    """The client support partial workspace symbols. The client will send the
    request `workspaceSymbol/resolve` to the server to resolve additional
    properties.
    
    @since 3.17.0"""
    # Since: 3.17.0


@attrs.define
class ExecuteCommandClientCapabilities:
    """The client capabilities of a ExecuteCommandRequest."""

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Execute command supports dynamic registration."""


@attrs.define
class SemanticTokensWorkspaceClientCapabilities:
    """@since 3.16.0"""

    # Since: 3.16.0

    refreshSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether the client implementation supports a refresh request sent from
    the server to the client.
    
    Note that this event is global and will force the client to refresh all
    semantic tokens currently shown. It should be used with absolute care
    and is useful for situation where a server for example detects a project
    wide change that requires such a calculation."""


@attrs.define
class CodeLensWorkspaceClientCapabilities:
    """@since 3.16.0"""

    # Since: 3.16.0

    refreshSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether the client implementation supports a refresh request sent from the
    server to the client.
    
    Note that this event is global and will force the client to refresh all
    code lenses currently shown. It should be used with absolute care and is
    useful for situation where a server for example detect a project wide
    change that requires such a calculation."""


@attrs.define
class FileOperationClientCapabilities:
    """Capabilities relating to events from file operations by the user in the
    client.

    These events do not come from the file system, they come from user operations
    like renaming a file in the UI.

    @since 3.16.0
    """

    # Since: 3.16.0

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether the client supports dynamic registration for file requests/notifications."""

    didCreate: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The client has support for sending didCreateFiles notifications."""

    willCreate: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The client has support for sending willCreateFiles requests."""

    didRename: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The client has support for sending didRenameFiles notifications."""

    willRename: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The client has support for sending willRenameFiles requests."""

    didDelete: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The client has support for sending didDeleteFiles notifications."""

    willDelete: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The client has support for sending willDeleteFiles requests."""


@attrs.define
class InlineValueWorkspaceClientCapabilities:
    """Client workspace capabilities specific to inline values.

    @since 3.17.0
    """

    # Since: 3.17.0

    refreshSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether the client implementation supports a refresh request sent from the
    server to the client.
    
    Note that this event is global and will force the client to refresh all
    inline values currently shown. It should be used with absolute care and is
    useful for situation where a server for example detects a project wide
    change that requires such a calculation."""


@attrs.define
class InlayHintWorkspaceClientCapabilities:
    """Client workspace capabilities specific to inlay hints.

    @since 3.17.0
    """

    # Since: 3.17.0

    refreshSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether the client implementation supports a refresh request sent from
    the server to the client.
    
    Note that this event is global and will force the client to refresh all
    inlay hints currently shown. It should be used with absolute care and
    is useful for situation where a server for example detects a project wide
    change that requires such a calculation."""


@attrs.define
class DiagnosticWorkspaceClientCapabilities:
    """Workspace client capabilities specific to diagnostic pull requests.

    @since 3.17.0
    """

    # Since: 3.17.0

    refreshSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether the client implementation supports a refresh request sent from
    the server to the client.
    
    Note that this event is global and will force the client to refresh all
    pulled diagnostics currently shown. It should be used with absolute care and
    is useful for situation where a server for example detects a project wide
    change that requires such a calculation."""


@attrs.define
class TextDocumentSyncClientCapabilities:

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether text document synchronization supports dynamic registration."""

    willSave: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The client supports sending will save notifications."""

    willSaveWaitUntil: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The client supports sending a will save request and
    waits for a response providing text edits which will
    be applied to the document before it is saved."""

    didSave: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The client supports did save notifications."""


@attrs.define
class CompletionClientCapabilities:
    """Completion client capabilities."""

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether completion supports dynamic registration."""

    completionItem: Optional["None"] = attrs.field(default=None)
    """The client supports the following `CompletionItem` specific
    capabilities."""

    completionItemKind: Optional["None"] = attrs.field(default=None)

    insertTextMode: Optional["InsertTextMode"] = attrs.field(default=None)
    """Defines how the client handles whitespace and indentation
    when accepting a completion item that uses multi line
    text in either `insertText` or `textEdit`.
    
    @since 3.17.0"""
    # Since: 3.17.0

    contextSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The client supports to send additional context information for a
    `textDocument/completion` request."""

    completionList: Optional["None"] = attrs.field(default=None)
    """The client supports the following `CompletionList` specific
    capabilities.
    
    @since 3.17.0"""
    # Since: 3.17.0


@attrs.define
class HoverClientCapabilities:

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether hover supports dynamic registration."""

    contentFormat: Optional[List["MarkupKind"]] = attrs.field(default=None)
    """Client supports the following content formats for the content
    property. The order describes the preferred format of the client."""


@attrs.define
class SignatureHelpClientCapabilities:
    """Client Capabilities for a SignatureHelpRequest."""

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether signature help supports dynamic registration."""

    signatureInformation: Optional["None"] = attrs.field(default=None)
    """The client supports the following `SignatureInformation`
    specific properties."""

    contextSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The client supports to send additional context information for a
    `textDocument/signatureHelp` request. A client that opts into
    contextSupport will also support the `retriggerCharacters` on
    `SignatureHelpOptions`.
    
    @since 3.15.0"""
    # Since: 3.15.0


@attrs.define
class DeclarationClientCapabilities:
    """@since 3.14.0"""

    # Since: 3.14.0

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether declaration supports dynamic registration. If this is set to `true`
    the client supports the new `DeclarationRegistrationOptions` return value
    for the corresponding server capability as well."""

    linkSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The client supports additional metadata in the form of declaration links."""


@attrs.define
class DefinitionClientCapabilities:
    """Client Capabilities for a DefinitionRequest."""

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether definition supports dynamic registration."""

    linkSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The client supports additional metadata in the form of definition links.
    
    @since 3.14.0"""
    # Since: 3.14.0


@attrs.define
class TypeDefinitionClientCapabilities:
    """Since 3.6.0."""

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether implementation supports dynamic registration. If this is set to `true`
    the client supports the new `TypeDefinitionRegistrationOptions` return value
    for the corresponding server capability as well."""

    linkSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The client supports additional metadata in the form of definition links.
    
    Since 3.14.0"""


@attrs.define
class ImplementationClientCapabilities:
    """@since 3.6.0"""

    # Since: 3.6.0

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether implementation supports dynamic registration. If this is set to `true`
    the client supports the new `ImplementationRegistrationOptions` return value
    for the corresponding server capability as well."""

    linkSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The client supports additional metadata in the form of definition links.
    
    @since 3.14.0"""
    # Since: 3.14.0


@attrs.define
class ReferenceClientCapabilities:
    """Client Capabilities for a ReferencesRequest."""

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether references supports dynamic registration."""


@attrs.define
class DocumentHighlightClientCapabilities:
    """Client Capabilities for a DocumentHighlightRequest."""

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether document highlight supports dynamic registration."""


@attrs.define
class DocumentSymbolClientCapabilities:
    """Client Capabilities for a DocumentSymbolRequest."""

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether document symbol supports dynamic registration."""

    symbolKind: Optional["None"] = attrs.field(default=None)
    """Specific capabilities for the `SymbolKind` in the
    `textDocument/documentSymbol` request."""

    hierarchicalDocumentSymbolSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The client supports hierarchical document symbols."""

    tagSupport: Optional["None"] = attrs.field(default=None)
    """The client supports tags on `SymbolInformation`. Tags are supported on
    `DocumentSymbol` if `hierarchicalDocumentSymbolSupport` is set to true.
    Clients supporting tags have to handle unknown tags gracefully.
    
    @since 3.16.0"""
    # Since: 3.16.0

    labelSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The client supports an additional label presented in the UI when
    registering a document symbol provider.
    
    @since 3.16.0"""
    # Since: 3.16.0


@attrs.define
class CodeActionClientCapabilities:
    """The Client Capabilities of a CodeActionRequest."""

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether code action supports dynamic registration."""

    codeActionLiteralSupport: Optional["None"] = attrs.field(default=None)
    """The client support code action literals of type `CodeAction` as a valid
    response of the `textDocument/codeAction` request. If the property is not
    set the request can only return `Command` literals.
    
    @since 3.8.0"""
    # Since: 3.8.0

    isPreferredSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether code action supports the `isPreferred` property.
    
    @since 3.15.0"""
    # Since: 3.15.0

    disabledSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether code action supports the `disabled` property.
    
    @since 3.16.0"""
    # Since: 3.16.0

    dataSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether code action supports the `data` property which is
    preserved between a `textDocument/codeAction` and a
    `codeAction/resolve` request.
    
    @since 3.16.0"""
    # Since: 3.16.0

    resolveSupport: Optional["None"] = attrs.field(default=None)
    """Whether the client supports resolving additional code action
    properties via a separate `codeAction/resolve` request.
    
    @since 3.16.0"""
    # Since: 3.16.0

    honorsChangeAnnotations: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether the client honors the change annotations in
    text edits and resource operations returned via the
    `CodeAction#edit` property by for example presenting
    the workspace edit in the user interface and asking
    for confirmation.
    
    @since 3.16.0"""
    # Since: 3.16.0


@attrs.define
class CodeLensClientCapabilities:
    """The client capabilities  of a CodeLensRequest."""

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether code lens supports dynamic registration."""


@attrs.define
class DocumentLinkClientCapabilities:
    """The client capabilities of a DocumentLinkRequest."""

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether document link supports dynamic registration."""

    tooltipSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether the client supports the `tooltip` property on `DocumentLink`.
    
    @since 3.15.0"""
    # Since: 3.15.0


@attrs.define
class DocumentColorClientCapabilities:

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether implementation supports dynamic registration. If this is set to `true`
    the client supports the new `DocumentColorRegistrationOptions` return value
    for the corresponding server capability as well."""


@attrs.define
class DocumentFormattingClientCapabilities:
    """Client capabilities of a DocumentFormattingRequest."""

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether formatting supports dynamic registration."""


@attrs.define
class DocumentRangeFormattingClientCapabilities:
    """Client capabilities of a DocumentRangeFormattingRequest."""

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether range formatting supports dynamic registration."""


@attrs.define
class DocumentOnTypeFormattingClientCapabilities:
    """Client capabilities of a DocumentOnTypeFormattingRequest."""

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether on type formatting supports dynamic registration."""


@attrs.define
class RenameClientCapabilities:

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether rename supports dynamic registration."""

    prepareSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Client supports testing for validity of rename operations
    before execution.
    
    @since 3.12.0"""
    # Since: 3.12.0

    prepareSupportDefaultBehavior: Optional[
        "PrepareSupportDefaultBehavior"
    ] = attrs.field(default=None)
    """Client supports the default behavior result.
    
    The value indicates the default behavior used by the
    client.
    
    @since 3.16.0"""
    # Since: 3.16.0

    honorsChangeAnnotations: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether the client honors the change annotations in
    text edits and resource operations returned via the
    rename request's workspace edit by for example presenting
    the workspace edit in the user interface and asking
    for confirmation.
    
    @since 3.16.0"""
    # Since: 3.16.0


@attrs.define
class FoldingRangeClientCapabilities:

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether implementation supports dynamic registration for folding range
    providers. If this is set to `true` the client supports the new
    `FoldingRangeRegistrationOptions` return value for the corresponding
    server capability as well."""

    rangeLimit: Optional[int] = attrs.field(
        validator=attrs.validators.optional(validators.uinteger_validator),
        default=None,
    )
    """The maximum number of folding ranges that the client prefers to receive
    per document. The value serves as a hint, servers are free to follow the
    limit."""

    lineFoldingOnly: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """If set, the client signals that it only supports folding complete lines.
    If set, client will ignore specified `startCharacter` and `endCharacter`
    properties in a FoldingRange."""

    foldingRangeKind: Optional["None"] = attrs.field(default=None)
    """Specific options for the folding range kind.
    
    @since 3.17.0"""
    # Since: 3.17.0

    foldingRange: Optional["None"] = attrs.field(default=None)
    """Specific options for the folding range.
    
    @since 3.17.0"""
    # Since: 3.17.0


@attrs.define
class SelectionRangeClientCapabilities:

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether implementation supports dynamic registration for selection range providers. If this is set to `true`
    the client supports the new `SelectionRangeRegistrationOptions` return value for the corresponding server
    capability as well."""


@attrs.define
class PublishDiagnosticsClientCapabilities:
    """The publish diagnostic client capabilities."""

    relatedInformation: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether the clients accepts diagnostics with related information."""

    tagSupport: Optional["None"] = attrs.field(default=None)
    """Client supports the tag property to provide meta data about a diagnostic.
    Clients supporting tags have to handle unknown tags gracefully.
    
    @since 3.15.0"""
    # Since: 3.15.0

    versionSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether the client interprets the version property of the
    `textDocument/publishDiagnostics` notification's parameter.
    
    @since 3.15.0"""
    # Since: 3.15.0

    codeDescriptionSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Client supports a codeDescription property
    
    @since 3.16.0"""
    # Since: 3.16.0

    dataSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether code action supports the `data` property which is
    preserved between a `textDocument/publishDiagnostics` and
    `textDocument/codeAction` request.
    
    @since 3.16.0"""
    # Since: 3.16.0


@attrs.define
class CallHierarchyClientCapabilities:
    """@since 3.16.0"""

    # Since: 3.16.0

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether implementation supports dynamic registration. If this is set to `true`
    the client supports the new `(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
    return value for the corresponding server capability as well."""


@attrs.define
class SemanticTokensClientCapabilities:
    """@since 3.16.0"""

    # Since: 3.16.0

    requests: "None" = attrs.field()
    """Which requests the client supports and might send to the server
    depending on the server's capability. Please note that clients might not
    show semantic tokens or degrade some of the user experience if a range
    or full request is advertised by the client but not provided by the
    server. If for example the client capability `requests.full` and
    `request.range` are both set to true but the server only provides a
    range provider the client might not render a minimap correctly or might
    even decide to not show any semantic tokens at all."""

    tokenTypes: List[str] = attrs.field()
    """The token types that the client supports."""

    tokenModifiers: List[str] = attrs.field()
    """The token modifiers that the client supports."""

    formats: List["TokenFormat"] = attrs.field()
    """The token formats the clients supports."""

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether implementation supports dynamic registration. If this is set to `true`
    the client supports the new `(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
    return value for the corresponding server capability as well."""

    overlappingTokenSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether the client supports tokens that can overlap each other."""

    multilineTokenSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether the client supports tokens that can span multiple lines."""

    serverCancelSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether the client allows the server to actively cancel a
    semantic token request, e.g. supports returning
    LSPErrorCodes.ServerCancelled. If a server does the client
    needs to retrigger the request.
    
    @since 3.17.0"""
    # Since: 3.17.0

    augmentsSyntaxTokens: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether the client uses semantic tokens to augment existing
    syntax tokens. If set to `true` client side created syntax
    tokens and semantic tokens are both used for colorization. If
    set to `false` the client only uses the returned semantic tokens
    for colorization.
    
    If the value is `undefined` then the client behavior is not
    specified.
    
    @since 3.17.0"""
    # Since: 3.17.0


@attrs.define
class LinkedEditingRangeClientCapabilities:
    """Client capabilities for the linked editing range request.

    @since 3.16.0
    """

    # Since: 3.16.0

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether implementation supports dynamic registration. If this is set to `true`
    the client supports the new `(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
    return value for the corresponding server capability as well."""


@attrs.define
class MonikerClientCapabilities:
    """Client capabilities specific to the moniker request.

    @since 3.16.0
    """

    # Since: 3.16.0

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether moniker supports dynamic registration. If this is set to `true`
    the client supports the new `MonikerRegistrationOptions` return value
    for the corresponding server capability as well."""


@attrs.define
class TypeHierarchyClientCapabilities:
    """@since 3.17.0"""

    # Since: 3.17.0

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether implementation supports dynamic registration. If this is set to `true`
    the client supports the new `(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
    return value for the corresponding server capability as well."""


@attrs.define
class InlineValueClientCapabilities:
    """Client capabilities specific to inline values.

    @since 3.17.0
    """

    # Since: 3.17.0

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether implementation supports dynamic registration for inline value providers."""


@attrs.define
class InlayHintClientCapabilities:
    """Inlay hint client capabilities.

    @since 3.17.0
    """

    # Since: 3.17.0

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether inlay hints support dynamic registration."""

    resolveSupport: Optional["None"] = attrs.field(default=None)
    """Indicates which properties a client can resolve lazily on an inlay
    hint."""


@attrs.define
class DiagnosticClientCapabilities:
    """Client capabilities specific to diagnostic pull requests.

    @since 3.17.0
    """

    # Since: 3.17.0

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether implementation supports dynamic registration. If this is set to `true`
    the client supports the new `(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
    return value for the corresponding server capability as well."""

    relatedDocumentSupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether the clients supports related documents for document diagnostic pulls."""


@attrs.define
class NotebookDocumentSyncClientCapabilities:
    """Notebook specific client capabilities.

    @since 3.17.0
    """

    # Since: 3.17.0

    dynamicRegistration: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """Whether implementation supports dynamic registration. If this is
    set to `true` the client supports the new
    `(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
    return value for the corresponding server capability as well."""

    executionSummarySupport: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    """The client supports sending execution summary data per cell."""


@attrs.define
class ShowMessageRequestClientCapabilities:
    """Show message request client capabilities."""

    messageActionItem: Optional["None"] = attrs.field(default=None)
    """Capabilities specific to the `MessageActionItem` type."""


@attrs.define
class ShowDocumentClientCapabilities:
    """Client capabilities for the showDocument request.

    @since 3.16.0
    """

    # Since: 3.16.0

    support: bool = attrs.field(validator=attrs.validators.instance_of(bool))
    """The client has support for the showDocument
    request."""


@attrs.define
class RegularExpressionsClientCapabilities:
    """Client capabilities specific to regular expressions.

    @since 3.16.0
    """

    # Since: 3.16.0

    engine: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The engine's name."""

    version: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The engine's version."""


@attrs.define
class MarkdownClientCapabilities:
    """Client capabilities specific to the used markdown parser.

    @since 3.16.0
    """

    # Since: 3.16.0

    parser: str = attrs.field(validator=attrs.validators.instance_of(str))
    """The name of the parser."""

    version: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    """The version of the parser."""

    allowedTags: Optional[List[str]] = attrs.field(default=None)
    """A list of HTML tags that the client allows / supports in
    Markdown.
    
    @since 3.17.0"""
    # Since: 3.17.0


@attrs.define
class WorkspaceConfigurationParams:
    items: List["ConfigurationItem"] = attrs.field()

    partialResultToken: Optional["ProgressToken"] = attrs.field(default=None)
    """An optional token that a server can use to report partial results (e.g. streaming) to
    the client."""


@attrs.define
class TextDocumentColorPresentationOptions:
    workDoneProgress: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )

    documentSelector: Optional[Union["DocumentSelector", None]] = attrs.field(
        default=None
    )
    """A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used."""


@attrs.define
class ResponseError:
    code: int = attrs.field(validator=validators.integer_validator)
    """A number indicating the error type that occurred."""

    message: str = attrs.field(validator=attrs.validators.instance_of(str))
    """A string providing a short description of the error."""

    data: Optional[LSPAny] = attrs.field(default=None)
    """A primitive or structured value that contains additional information
    about the error. Can be omitted."""


@attrs.define
class ResponseErrorMessage:
    id: Optional[Union[int, str]] = attrs.field(default=None)
    """The request id where the error occurred."""
    error: Optional[ResponseError] = attrs.field(default=None)
    """The error object in case a request fails."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentImplementationRequest:
    """A request to resolve the implementation locations of a symbol at a given
    text document position.

    The request's parameter is of type [TextDocumentPositionParams]
    (#TextDocumentPositionParams) the response is of type Definition or
    a Thenable that resolves to such.
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "ImplementationParams" = attrs.field()
    method: str = "textDocument/implementation"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentImplementationResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union["Definition", List["DefinitionLink"], None] = attrs.field(
        default=None
    )
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentTypeDefinitionRequest:
    """A request to resolve the type definition locations of a symbol at a
    given text document position.

    The request's parameter is of type [TextDocumentPositioParams]
    (#TextDocumentPositionParams) the response is of type Definition or
    a Thenable that resolves to such.
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "TypeDefinitionParams" = attrs.field()
    method: str = "textDocument/typeDefinition"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentTypeDefinitionResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union["Definition", List["DefinitionLink"], None] = attrs.field(
        default=None
    )
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceWorkspaceFoldersRequest:
    """The `workspace/workspaceFolders` is sent from the server to the client
    to fetch the open workspace folders."""

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: Optional[None] = attrs.field(default=None)
    method: str = "workspace/workspaceFolders"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceWorkspaceFoldersResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union[List["WorkspaceFolder"], None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceConfigurationRequest:
    """The 'workspace/configuration' request is sent from the server to the
    client to fetch a certain configuration setting.

    This pull model replaces the old push model were the client signaled
    configuration change via an event. If the server still needs to
    react to configuration changes (since the server caches the result
    of `workspace/configuration` requests) the server should register
    for an empty configuration change event and empty the cache if such
    an event is received.
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: WorkspaceConfigurationParams = attrs.field()
    method: str = "workspace/configuration"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceConfigurationResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: List["LSPAny"] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentDocumentColorRequest:
    """A request to list all color symbols found in a given text document.

    The request's parameter is of type DocumentColorParams the response
    is of type ColorInformation[] or a Thenable that resolves to such.
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "DocumentColorParams" = attrs.field()
    method: str = "textDocument/documentColor"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentDocumentColorResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: List["ColorInformation"] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentColorPresentationRequest:
    """A request to list all presentation for a color.

    The request's parameter is of type ColorPresentationParams the
    response is of type ColorInformation[] or a Thenable that resolves
    to such.
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "ColorPresentationParams" = attrs.field()
    method: str = "textDocument/colorPresentation"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentColorPresentationResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: List["ColorPresentation"] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentFoldingRangeRequest:
    """A request to provide folding ranges in a document.

    The request's parameter is of type FoldingRangeParams, the response
    is of type FoldingRangeList or a Thenable that resolves to such.
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "FoldingRangeParams" = attrs.field()
    method: str = "textDocument/foldingRange"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentFoldingRangeResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union[List["FoldingRange"], None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentDeclarationRequest:
    """A request to resolve the type definition locations of a symbol at a
    given text document position.

    The request's parameter is of type [TextDocumentPositionParams]
    (#TextDocumentPositionParams) the response is of type Declaration or
    a typed array of DeclarationLink or a Thenable that resolves to
    such.
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "DeclarationParams" = attrs.field()
    method: str = "textDocument/declaration"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentDeclarationResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union["Declaration", List["DeclarationLink"], None] = attrs.field(
        default=None
    )
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentSelectionRangeRequest:
    """A request to provide selection ranges in a document.

    The request's parameter is of type SelectionRangeParams, the
    response is of type [SelectionRange[]](#SelectionRange[]) or a
    Thenable that resolves to such.
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "SelectionRangeParams" = attrs.field()
    method: str = "textDocument/selectionRange"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentSelectionRangeResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union[List["SelectionRange"], None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WindowWorkDoneProgressCreateRequest:
    """The `window/workDoneProgress/create` request is sent from the server to
    the client to initiate progress reporting from the server."""

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "WorkDoneProgressCreateParams" = attrs.field()
    method: str = "window/workDoneProgress/create"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WindowWorkDoneProgressCreateResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: None = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentPrepareCallHierarchyRequest:
    """A request to result a `CallHierarchyItem` in a document at a given
    position. Can be used as an input to an incoming or outgoing call
    hierarchy.

    @since 3.16.0
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "CallHierarchyPrepareParams" = attrs.field()
    method: str = "textDocument/prepareCallHierarchy"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentPrepareCallHierarchyResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union[List["CallHierarchyItem"], None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class CallHierarchyIncomingCallsRequest:
    """A request to resolve the incoming calls for a given `CallHierarchyItem`.

    @since 3.16.0
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "CallHierarchyIncomingCallsParams" = attrs.field()
    method: str = "callHierarchy/incomingCalls"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class CallHierarchyIncomingCallsResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union[List["CallHierarchyIncomingCall"], None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class CallHierarchyOutgoingCallsRequest:
    """A request to resolve the outgoing calls for a given `CallHierarchyItem`.

    @since 3.16.0
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "CallHierarchyOutgoingCallsParams" = attrs.field()
    method: str = "callHierarchy/outgoingCalls"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class CallHierarchyOutgoingCallsResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union[List["CallHierarchyOutgoingCall"], None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentSemanticTokensFullRequest:
    """@since 3.16.0"""

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "SemanticTokensParams" = attrs.field()
    method: str = "textDocument/semanticTokens/full"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentSemanticTokensFullResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union["SemanticTokens", None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentSemanticTokensFullDeltaRequest:
    """@since 3.16.0"""

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "SemanticTokensDeltaParams" = attrs.field()
    method: str = "textDocument/semanticTokens/full/delta"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentSemanticTokensFullDeltaResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union["SemanticTokens", "SemanticTokensDelta", None] = attrs.field(
        default=None
    )
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentSemanticTokensRangeRequest:
    """@since 3.16.0"""

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "SemanticTokensRangeParams" = attrs.field()
    method: str = "textDocument/semanticTokens/range"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentSemanticTokensRangeResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union["SemanticTokens", None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceSemanticTokensRefreshRequest:
    """@since 3.16.0"""

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: Optional[None] = attrs.field(default=None)
    method: str = "workspace/semanticTokens/refresh"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceSemanticTokensRefreshResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: None = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WindowShowDocumentRequest:
    """A request to show a document. This request might open an external
    program depending on the value of the URI to open. For example a request to
    open `https://code.visualstudio.com/` will very likely open the URI in a
    WEB browser.

    @since 3.16.0
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "ShowDocumentParams" = attrs.field()
    method: str = "window/showDocument"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WindowShowDocumentResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: "ShowDocumentResult" = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentLinkedEditingRangeRequest:
    """A request to provide ranges that can be edited together.

    @since 3.16.0
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "LinkedEditingRangeParams" = attrs.field()
    method: str = "textDocument/linkedEditingRange"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentLinkedEditingRangeResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union["LinkedEditingRanges", None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceWillCreateFilesRequest:
    """The will create files request is sent from the client to the server
    before files are actually created as long as the creation is triggered from
    within the client.

    @since 3.16.0
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "CreateFilesParams" = attrs.field()
    method: str = "workspace/willCreateFiles"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceWillCreateFilesResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union["WorkspaceEdit", None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceWillRenameFilesRequest:
    """The will rename files request is sent from the client to the server
    before files are actually renamed as long as the rename is triggered from
    within the client.

    @since 3.16.0
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "RenameFilesParams" = attrs.field()
    method: str = "workspace/willRenameFiles"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceWillRenameFilesResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union["WorkspaceEdit", None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceWillDeleteFilesRequest:
    """The did delete files notification is sent from the client to the server
    when files were deleted from within the client.

    @since 3.16.0
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "DeleteFilesParams" = attrs.field()
    method: str = "workspace/willDeleteFiles"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceWillDeleteFilesResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union["WorkspaceEdit", None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentMonikerRequest:
    """A request to get the moniker of a symbol at a given text document
    position.

    The request parameter is of type TextDocumentPositionParams. The
    response is of type [Moniker[]](#Moniker[]) or `null`.
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "MonikerParams" = attrs.field()
    method: str = "textDocument/moniker"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentMonikerResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union[List["Moniker"], None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentPrepareTypeHierarchyRequest:
    """A request to result a `TypeHierarchyItem` in a document at a given
    position. Can be used as an input to a subtypes or supertypes type
    hierarchy.

    @since 3.17.0
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "TypeHierarchyPrepareParams" = attrs.field()
    method: str = "textDocument/prepareTypeHierarchy"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentPrepareTypeHierarchyResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union[List["TypeHierarchyItem"], None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TypeHierarchySupertypesRequest:
    """A request to resolve the supertypes for a given `TypeHierarchyItem`.

    @since 3.17.0
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "TypeHierarchySupertypesParams" = attrs.field()
    method: str = "typeHierarchy/supertypes"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TypeHierarchySupertypesResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union[List["TypeHierarchyItem"], None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TypeHierarchySubtypesRequest:
    """A request to resolve the subtypes for a given `TypeHierarchyItem`.

    @since 3.17.0
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "TypeHierarchySubtypesParams" = attrs.field()
    method: str = "typeHierarchy/subtypes"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TypeHierarchySubtypesResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union[List["TypeHierarchyItem"], None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentInlineValueRequest:
    """A request to provide inline values in a document. The request's
    parameter is of type InlineValueParams, the response is of type.

    [InlineValue[]](#InlineValue[]) or a Thenable that resolves to such.

    @since 3.17.0
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "InlineValueParams" = attrs.field()
    method: str = "textDocument/inlineValue"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentInlineValueResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union[List["InlineValue"], None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceInlineValueRefreshRequest:
    """@since 3.17.0"""

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: Optional[None] = attrs.field(default=None)
    method: str = "workspace/inlineValue/refresh"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceInlineValueRefreshResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: None = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentInlayHintRequest:
    """A request to provide inlay hints in a document. The request's parameter
    is of type InlayHintsParams, the response is of type.

    [InlayHint[]](#InlayHint[]) or a Thenable that resolves to such.

    @since 3.17.0
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "InlayHintParams" = attrs.field()
    method: str = "textDocument/inlayHint"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentInlayHintResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union[List["InlayHint"], None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class InlayHintResolveRequest:
    """A request to resolve additional properties for an inlay hint. The
    request's parameter is of type InlayHint, the response is of type InlayHint
    or a Thenable that resolves to such.

    @since 3.17.0
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "InlayHint" = attrs.field()
    method: str = "inlayHint/resolve"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class InlayHintResolveResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: "InlayHint" = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceInlayHintRefreshRequest:
    """@since 3.17.0"""

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: Optional[None] = attrs.field(default=None)
    method: str = "workspace/inlayHint/refresh"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceInlayHintRefreshResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: None = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentDiagnosticRequest:
    """The document diagnostic request definition.

    @since 3.17.0
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "DocumentDiagnosticParams" = attrs.field()
    method: str = "textDocument/diagnostic"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentDiagnosticResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: "DocumentDiagnosticReport" = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceDiagnosticRequest:
    """The workspace diagnostic request definition.

    @since 3.17.0
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "WorkspaceDiagnosticParams" = attrs.field()
    method: str = "workspace/diagnostic"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceDiagnosticResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: "WorkspaceDiagnosticReport" = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceDiagnosticRefreshRequest:
    """The diagnostic refresh request definition.

    @since 3.17.0
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: Optional[None] = attrs.field(default=None)
    method: str = "workspace/diagnostic/refresh"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceDiagnosticRefreshResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: None = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class ClientRegisterCapabilityRequest:
    """The `client/registerCapability` request is sent from the server to the
    client to register a new capability handler on the client side."""

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "RegistrationParams" = attrs.field()
    method: str = "client/registerCapability"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class ClientRegisterCapabilityResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: None = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class ClientUnregisterCapabilityRequest:
    """The `client/unregisterCapability` request is sent from the server to the
    client to unregister a previously registered capability handler on the
    client side."""

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "UnregistrationParams" = attrs.field()
    method: str = "client/unregisterCapability"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class ClientUnregisterCapabilityResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: None = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class InitializeRequest:
    """The initialize request is sent from the client to the server.

    It is sent once as the request after starting up the server. The
    requests parameter is of type InitializeParams the response if of
    type InitializeResult of a Thenable that resolves to such.
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "InitializeParams" = attrs.field()
    method: str = "initialize"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class InitializeResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: "InitializeResult" = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class ShutdownRequest:
    """A shutdown request is sent from the client to the server.

    It is sent once when the client decides to shutdown the server. The
    only notification that is sent after a shutdown request is the exit
    event.
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: Optional[None] = attrs.field(default=None)
    method: str = "shutdown"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class ShutdownResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: None = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WindowShowMessageRequestRequest:
    """The show message request is sent from the server to the client to show a
    message and a set of options actions to the user."""

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "ShowMessageRequestParams" = attrs.field()
    method: str = "window/showMessageRequest"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WindowShowMessageRequestResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union["MessageActionItem", None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentWillSaveWaitUntilRequest:
    """A document will save request is sent from the client to the server
    before the document is actually saved.

    The request can return an array of TextEdits which will be applied
    to the text document before it is saved. Please note that clients
    might drop results if computing the text edits took too long or if a
    server constantly fails on this request. This is done to keep the
    save fast and reliable.
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "WillSaveTextDocumentParams" = attrs.field()
    method: str = "textDocument/willSaveWaitUntil"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentWillSaveWaitUntilResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union[List["TextEdit"], None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentCompletionRequest:
    """Request to request completion at a given text document position. The
    request's parameter is of type TextDocumentPosition the response is of type
    CompletionItem[] or CompletionList or a Thenable that resolves to such.

    The request can delay the computation of the
    [`detail`](#CompletionItem.detail) and
    [`documentation`](#CompletionItem.documentation) properties to the
    `completionItem/resolve` request. However, properties that are
    needed for the initial sorting and filtering, like `sortText`,
    `filterText`, `insertText`, and `textEdit`, must not be changed
    during resolve.
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "CompletionParams" = attrs.field()
    method: str = "textDocument/completion"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentCompletionResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union[List["CompletionItem"], "CompletionList", None] = attrs.field(
        default=None
    )
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class CompletionItemResolveRequest:
    """Request to resolve additional information for a given completion
    item.The request's parameter is of type CompletionItem the response is of
    type CompletionItem or a Thenable that resolves to such."""

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "CompletionItem" = attrs.field()
    method: str = "completionItem/resolve"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class CompletionItemResolveResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: "CompletionItem" = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentHoverRequest:
    """Request to request hover information at a given text document position.

    The request's parameter is of type TextDocumentPosition the response
    is of type Hover or a Thenable that resolves to such.
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "HoverParams" = attrs.field()
    method: str = "textDocument/hover"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentHoverResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union["Hover", None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentSignatureHelpRequest:

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "SignatureHelpParams" = attrs.field()
    method: str = "textDocument/signatureHelp"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentSignatureHelpResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union["SignatureHelp", None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentDefinitionRequest:
    """A request to resolve the definition location of a symbol at a given text
    document position.

    The request's parameter is of type [TextDocumentPosition]
    (#TextDocumentPosition) the response is of either type Definition or
    a typed array of DefinitionLink or a Thenable that resolves to such.
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "DefinitionParams" = attrs.field()
    method: str = "textDocument/definition"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentDefinitionResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union["Definition", List["DefinitionLink"], None] = attrs.field(
        default=None
    )
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentReferencesRequest:
    """A request to resolve project-wide references for the symbol denoted by
    the given text document position.

    The request's parameter is of type ReferenceParams the response is
    of type Location[] or a Thenable that resolves to such.
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "ReferenceParams" = attrs.field()
    method: str = "textDocument/references"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentReferencesResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union[List["Location"], None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentDocumentHighlightRequest:
    """Request to resolve a DocumentHighlight for a given text document
    position.

    The request's parameter is of type [TextDocumentPosition]
    (#TextDocumentPosition) the request response is of type
    [DocumentHighlight[]] (#DocumentHighlight) or a Thenable that
    resolves to such.
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "DocumentHighlightParams" = attrs.field()
    method: str = "textDocument/documentHighlight"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentDocumentHighlightResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union[List["DocumentHighlight"], None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentDocumentSymbolRequest:
    """A request to list all symbols found in a given text document.

    The request's parameter is of type TextDocumentIdentifier the
    response is of type SymbolInformation[] or a Thenable that resolves
    to such.
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "DocumentSymbolParams" = attrs.field()
    method: str = "textDocument/documentSymbol"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentDocumentSymbolResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union[
        List["SymbolInformation"], List["DocumentSymbol"], None
    ] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentCodeActionRequest:
    """A request to provide commands for the given text document and range."""

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "CodeActionParams" = attrs.field()
    method: str = "textDocument/codeAction"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentCodeActionResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union[List[Union["Command", "CodeAction"]], None] = attrs.field(
        default=None
    )
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class CodeActionResolveRequest:
    """Request to resolve additional information for a given code action.The
    request's parameter is of type CodeAction the response is of type
    CodeAction or a Thenable that resolves to such."""

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "CodeAction" = attrs.field()
    method: str = "codeAction/resolve"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class CodeActionResolveResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: "CodeAction" = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceSymbolRequest:
    """A request to list project-wide symbols matching the query string given
    by the WorkspaceSymbolParams. The response is of type SymbolInformation[]
    or a Thenable that resolves to such.

    @since 3.17.0 - support for WorkspaceSymbol in the returned data. Clients
     need to advertise support for WorkspaceSymbols via the client capability
     `workspace.symbol.resolveSupport`.
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "WorkspaceSymbolParams" = attrs.field()
    method: str = "workspace/symbol"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceSymbolResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union[
        List["SymbolInformation"], List["WorkspaceSymbol"], None
    ] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceSymbolResolveRequest:
    """A request to resolve the range inside the workspace symbol's location.

    @since 3.17.0
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "WorkspaceSymbol" = attrs.field()
    method: str = "workspaceSymbol/resolve"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceSymbolResolveResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: "WorkspaceSymbol" = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentCodeLensRequest:
    """A request to provide code lens for the given text document."""

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "CodeLensParams" = attrs.field()
    method: str = "textDocument/codeLens"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentCodeLensResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union[List["CodeLens"], None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class CodeLensResolveRequest:
    """A request to resolve a command for a given code lens."""

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "CodeLens" = attrs.field()
    method: str = "codeLens/resolve"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class CodeLensResolveResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: "CodeLens" = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceCodeLensRefreshRequest:
    """A request to refresh all code actions.

    @since 3.16.0
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: Optional[None] = attrs.field(default=None)
    method: str = "workspace/codeLens/refresh"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceCodeLensRefreshResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: None = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentDocumentLinkRequest:
    """A request to provide document links."""

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "DocumentLinkParams" = attrs.field()
    method: str = "textDocument/documentLink"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentDocumentLinkResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union[List["DocumentLink"], None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class DocumentLinkResolveRequest:
    """Request to resolve additional information for a given document link.

    The request's parameter is of type DocumentLink the response is of
    type DocumentLink or a Thenable that resolves to such.
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "DocumentLink" = attrs.field()
    method: str = "documentLink/resolve"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class DocumentLinkResolveResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: "DocumentLink" = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentFormattingRequest:
    """A request to to format a whole document."""

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "DocumentFormattingParams" = attrs.field()
    method: str = "textDocument/formatting"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentFormattingResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union[List["TextEdit"], None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentRangeFormattingRequest:
    """A request to to format a range in a document."""

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "DocumentRangeFormattingParams" = attrs.field()
    method: str = "textDocument/rangeFormatting"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentRangeFormattingResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union[List["TextEdit"], None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentOnTypeFormattingRequest:
    """A request to format a document on type."""

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "DocumentOnTypeFormattingParams" = attrs.field()
    method: str = "textDocument/onTypeFormatting"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentOnTypeFormattingResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union[List["TextEdit"], None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentRenameRequest:
    """A request to rename a symbol."""

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "RenameParams" = attrs.field()
    method: str = "textDocument/rename"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentRenameResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union["WorkspaceEdit", None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentPrepareRenameRequest:
    """A request to test and perform the setup necessary for a rename.

    @since 3.16 - support for default behavior
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "PrepareRenameParams" = attrs.field()
    method: str = "textDocument/prepareRename"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentPrepareRenameResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union["PrepareRenameResult", None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceExecuteCommandRequest:
    """A request send from the client to the server to execute a command.

    The request might return a workspace edit which the client will
    apply to the workspace.
    """

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "ExecuteCommandParams" = attrs.field()
    method: str = "workspace/executeCommand"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceExecuteCommandResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: Union["LSPAny", None] = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceApplyEditRequest:
    """A request sent from the server to the client to modified certain
    resources."""

    id: Union[int, str] = attrs.field()
    """The request id."""
    params: "ApplyWorkspaceEditParams" = attrs.field()
    method: str = "workspace/applyEdit"
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceApplyEditResponse:
    id: Optional[Union[int, str]] = attrs.field()
    """The request id."""
    result: "ApplyWorkspaceEditResult" = attrs.field(default=None)
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceDidChangeWorkspaceFoldersNotification:
    """The `workspace/didChangeWorkspaceFolders` notification is sent from the
    client to the server when the workspace folder configuration changes."""

    params: "DidChangeWorkspaceFoldersParams" = attrs.field()
    method: str = attrs.field(
        validator=attrs.validators.in_(["workspace/didChangeWorkspaceFolders"]),
        default="workspace/didChangeWorkspaceFolders",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WindowWorkDoneProgressCancelNotification:
    """The `window/workDoneProgress/cancel` notification is sent from  the
    client to the server to cancel a progress initiated on the server side."""

    params: "WorkDoneProgressCancelParams" = attrs.field()
    method: str = attrs.field(
        validator=attrs.validators.in_(["window/workDoneProgress/cancel"]),
        default="window/workDoneProgress/cancel",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceDidCreateFilesNotification:
    """The did create files notification is sent from the client to the server
    when files were created from within the client.

    @since 3.16.0
    """

    params: "CreateFilesParams" = attrs.field()
    method: str = attrs.field(
        validator=attrs.validators.in_(["workspace/didCreateFiles"]),
        default="workspace/didCreateFiles",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceDidRenameFilesNotification:
    """The did rename files notification is sent from the client to the server
    when files were renamed from within the client.

    @since 3.16.0
    """

    params: "RenameFilesParams" = attrs.field()
    method: str = attrs.field(
        validator=attrs.validators.in_(["workspace/didRenameFiles"]),
        default="workspace/didRenameFiles",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceDidDeleteFilesNotification:
    """The will delete files request is sent from the client to the server
    before files are actually deleted as long as the deletion is triggered from
    within the client.

    @since 3.16.0
    """

    params: "DeleteFilesParams" = attrs.field()
    method: str = attrs.field(
        validator=attrs.validators.in_(["workspace/didDeleteFiles"]),
        default="workspace/didDeleteFiles",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class NotebookDocumentDidOpenNotification:
    """A notification sent when a notebook opens.

    @since 3.17.0
    """

    params: "DidOpenNotebookDocumentParams" = attrs.field()
    method: str = attrs.field(
        validator=attrs.validators.in_(["notebookDocument/didOpen"]),
        default="notebookDocument/didOpen",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class NotebookDocumentDidChangeNotification:

    params: "DidChangeNotebookDocumentParams" = attrs.field()
    method: str = attrs.field(
        validator=attrs.validators.in_(["notebookDocument/didChange"]),
        default="notebookDocument/didChange",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class NotebookDocumentDidSaveNotification:
    """A notification sent when a notebook document is saved.

    @since 3.17.0
    """

    params: "DidSaveNotebookDocumentParams" = attrs.field()
    method: str = attrs.field(
        validator=attrs.validators.in_(["notebookDocument/didSave"]),
        default="notebookDocument/didSave",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class NotebookDocumentDidCloseNotification:
    """A notification sent when a notebook closes.

    @since 3.17.0
    """

    params: "DidCloseNotebookDocumentParams" = attrs.field()
    method: str = attrs.field(
        validator=attrs.validators.in_(["notebookDocument/didClose"]),
        default="notebookDocument/didClose",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class InitializedNotification:
    """The initialized notification is sent from the client to the server after
    the client is fully initialized and the server is allowed to send requests
    from the server to the client."""

    params: "InitializedParams" = attrs.field()
    method: str = attrs.field(
        validator=attrs.validators.in_(["initialized"]),
        default="initialized",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class ExitNotification:
    """The exit event is sent from the client to the server to ask the server
    to exit its process."""

    params: Optional[None] = attrs.field(default=None)
    method: str = attrs.field(
        validator=attrs.validators.in_(["exit"]),
        default="exit",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceDidChangeConfigurationNotification:
    """The configuration change notification is sent from the client to the
    server when the client's configuration has changed.

    The notification contains the changed configuration as defined by
    the language client.
    """

    params: "DidChangeConfigurationParams" = attrs.field()
    method: str = attrs.field(
        validator=attrs.validators.in_(["workspace/didChangeConfiguration"]),
        default="workspace/didChangeConfiguration",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WindowShowMessageNotification:
    """The show message notification is sent from a server to a client to ask
    the client to display a particular message in the user interface."""

    params: "ShowMessageParams" = attrs.field()
    method: str = attrs.field(
        validator=attrs.validators.in_(["window/showMessage"]),
        default="window/showMessage",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WindowLogMessageNotification:
    """The log message notification is sent from the server to the client to
    ask the client to log a particular message."""

    params: "LogMessageParams" = attrs.field()
    method: str = attrs.field(
        validator=attrs.validators.in_(["window/logMessage"]),
        default="window/logMessage",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TelemetryEventNotification:
    """The telemetry event notification is sent from the server to the client
    to ask the client to log telemetry data."""

    params: "LSPAny" = attrs.field()
    method: str = attrs.field(
        validator=attrs.validators.in_(["telemetry/event"]),
        default="telemetry/event",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentDidOpenNotification:
    """The document open notification is sent from the client to the server to
    signal newly opened text documents.

    The document's truth is now managed by the client and the server
    must not try to read the document's truth using the document's uri.
    Open in this sense means it is managed by the client. It doesn't
    necessarily mean that its content is presented in an editor. An open
    notification must not be sent more than once without a corresponding
    close notification send before. This means open and close
    notification must be balanced and the max open count is one.
    """

    params: "DidOpenTextDocumentParams" = attrs.field()
    method: str = attrs.field(
        validator=attrs.validators.in_(["textDocument/didOpen"]),
        default="textDocument/didOpen",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentDidChangeNotification:
    """The document change notification is sent from the client to the server
    to signal changes to a text document."""

    params: "DidChangeTextDocumentParams" = attrs.field()
    method: str = attrs.field(
        validator=attrs.validators.in_(["textDocument/didChange"]),
        default="textDocument/didChange",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentDidCloseNotification:
    """The document close notification is sent from the client to the server
    when the document got closed in the client.

    The document's truth now exists where the document's uri points to
    (e.g. if the document's uri is a file uri the truth now exists on
    disk). As with the open notification the close notification is about
    managing the document's content. Receiving a close notification
    doesn't mean that the document was open in an editor before. A close
    notification requires a previous open notification to be sent.
    """

    params: "DidCloseTextDocumentParams" = attrs.field()
    method: str = attrs.field(
        validator=attrs.validators.in_(["textDocument/didClose"]),
        default="textDocument/didClose",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentDidSaveNotification:
    """The document save notification is sent from the client to the server
    when the document got saved in the client."""

    params: "DidSaveTextDocumentParams" = attrs.field()
    method: str = attrs.field(
        validator=attrs.validators.in_(["textDocument/didSave"]),
        default="textDocument/didSave",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentWillSaveNotification:
    """A document will save notification is sent from the client to the server
    before the document is actually saved."""

    params: "WillSaveTextDocumentParams" = attrs.field()
    method: str = attrs.field(
        validator=attrs.validators.in_(["textDocument/willSave"]),
        default="textDocument/willSave",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class WorkspaceDidChangeWatchedFilesNotification:
    """The watched files notification is sent from the client to the server
    when the client detects changes to file watched by the language client."""

    params: "DidChangeWatchedFilesParams" = attrs.field()
    method: str = attrs.field(
        validator=attrs.validators.in_(["workspace/didChangeWatchedFiles"]),
        default="workspace/didChangeWatchedFiles",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class TextDocumentPublishDiagnosticsNotification:
    """Diagnostics notification are sent from the server to the client to
    signal results of validation runs."""

    params: "PublishDiagnosticsParams" = attrs.field()
    method: str = attrs.field(
        validator=attrs.validators.in_(["textDocument/publishDiagnostics"]),
        default="textDocument/publishDiagnostics",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class SetTraceNotification:

    params: "SetTraceParams" = attrs.field()
    method: str = attrs.field(
        validator=attrs.validators.in_(["$/setTrace"]),
        default="$/setTrace",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class LogTraceNotification:

    params: "LogTraceParams" = attrs.field()
    method: str = attrs.field(
        validator=attrs.validators.in_(["$/logTrace"]),
        default="$/logTrace",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class CancelRequestNotification:

    params: "CancelParams" = attrs.field()
    method: str = attrs.field(
        validator=attrs.validators.in_(["$/cancelRequest"]),
        default="$/cancelRequest",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


@attrs.define
class ProgressNotification:

    params: "ProgressParams" = attrs.field()
    method: str = attrs.field(
        validator=attrs.validators.in_(["$/progress"]),
        default="$/progress",
    )
    """The method to be invoked."""
    jsonrpc: str = attrs.field(default="2.0")


METHOD_TO_TYPES = {
    "textDocument/implementation": (
        TextDocumentImplementationRequest,
        TextDocumentImplementationResponse,
        ImplementationParams,
        ImplementationRegistrationOptions,
    ),
    "textDocument/typeDefinition": (
        TextDocumentTypeDefinitionRequest,
        TextDocumentTypeDefinitionResponse,
        TypeDefinitionParams,
        TypeDefinitionRegistrationOptions,
    ),
    "workspace/workspaceFolders": (
        WorkspaceWorkspaceFoldersRequest,
        WorkspaceWorkspaceFoldersResponse,
        None,
        None,
    ),
    "workspace/configuration": (
        WorkspaceConfigurationRequest,
        WorkspaceConfigurationResponse,
        WorkspaceConfigurationParams,
        None,
    ),
    "textDocument/documentColor": (
        TextDocumentDocumentColorRequest,
        TextDocumentDocumentColorResponse,
        DocumentColorParams,
        DocumentColorRegistrationOptions,
    ),
    "textDocument/colorPresentation": (
        TextDocumentColorPresentationRequest,
        TextDocumentColorPresentationResponse,
        ColorPresentationParams,
        TextDocumentColorPresentationOptions,
    ),
    "textDocument/foldingRange": (
        TextDocumentFoldingRangeRequest,
        TextDocumentFoldingRangeResponse,
        FoldingRangeParams,
        FoldingRangeRegistrationOptions,
    ),
    "textDocument/declaration": (
        TextDocumentDeclarationRequest,
        TextDocumentDeclarationResponse,
        DeclarationParams,
        DeclarationRegistrationOptions,
    ),
    "textDocument/selectionRange": (
        TextDocumentSelectionRangeRequest,
        TextDocumentSelectionRangeResponse,
        SelectionRangeParams,
        SelectionRangeRegistrationOptions,
    ),
    "window/workDoneProgress/create": (
        WindowWorkDoneProgressCreateRequest,
        WindowWorkDoneProgressCreateResponse,
        WorkDoneProgressCreateParams,
        None,
    ),
    "textDocument/prepareCallHierarchy": (
        TextDocumentPrepareCallHierarchyRequest,
        TextDocumentPrepareCallHierarchyResponse,
        CallHierarchyPrepareParams,
        CallHierarchyRegistrationOptions,
    ),
    "callHierarchy/incomingCalls": (
        CallHierarchyIncomingCallsRequest,
        CallHierarchyIncomingCallsResponse,
        CallHierarchyIncomingCallsParams,
        None,
    ),
    "callHierarchy/outgoingCalls": (
        CallHierarchyOutgoingCallsRequest,
        CallHierarchyOutgoingCallsResponse,
        CallHierarchyOutgoingCallsParams,
        None,
    ),
    "textDocument/semanticTokens/full": (
        TextDocumentSemanticTokensFullRequest,
        TextDocumentSemanticTokensFullResponse,
        SemanticTokensParams,
        SemanticTokensRegistrationOptions,
    ),
    "textDocument/semanticTokens/full/delta": (
        TextDocumentSemanticTokensFullDeltaRequest,
        TextDocumentSemanticTokensFullDeltaResponse,
        SemanticTokensDeltaParams,
        SemanticTokensRegistrationOptions,
    ),
    "textDocument/semanticTokens/range": (
        TextDocumentSemanticTokensRangeRequest,
        TextDocumentSemanticTokensRangeResponse,
        SemanticTokensRangeParams,
        None,
    ),
    "workspace/semanticTokens/refresh": (
        WorkspaceSemanticTokensRefreshRequest,
        WorkspaceSemanticTokensRefreshResponse,
        None,
        None,
    ),
    "window/showDocument": (
        WindowShowDocumentRequest,
        WindowShowDocumentResponse,
        ShowDocumentParams,
        None,
    ),
    "textDocument/linkedEditingRange": (
        TextDocumentLinkedEditingRangeRequest,
        TextDocumentLinkedEditingRangeResponse,
        LinkedEditingRangeParams,
        LinkedEditingRangeRegistrationOptions,
    ),
    "workspace/willCreateFiles": (
        WorkspaceWillCreateFilesRequest,
        WorkspaceWillCreateFilesResponse,
        CreateFilesParams,
        FileOperationRegistrationOptions,
    ),
    "workspace/willRenameFiles": (
        WorkspaceWillRenameFilesRequest,
        WorkspaceWillRenameFilesResponse,
        RenameFilesParams,
        FileOperationRegistrationOptions,
    ),
    "workspace/willDeleteFiles": (
        WorkspaceWillDeleteFilesRequest,
        WorkspaceWillDeleteFilesResponse,
        DeleteFilesParams,
        FileOperationRegistrationOptions,
    ),
    "textDocument/moniker": (
        TextDocumentMonikerRequest,
        TextDocumentMonikerResponse,
        MonikerParams,
        MonikerRegistrationOptions,
    ),
    "textDocument/prepareTypeHierarchy": (
        TextDocumentPrepareTypeHierarchyRequest,
        TextDocumentPrepareTypeHierarchyResponse,
        TypeHierarchyPrepareParams,
        TypeHierarchyRegistrationOptions,
    ),
    "typeHierarchy/supertypes": (
        TypeHierarchySupertypesRequest,
        TypeHierarchySupertypesResponse,
        TypeHierarchySupertypesParams,
        None,
    ),
    "typeHierarchy/subtypes": (
        TypeHierarchySubtypesRequest,
        TypeHierarchySubtypesResponse,
        TypeHierarchySubtypesParams,
        None,
    ),
    "textDocument/inlineValue": (
        TextDocumentInlineValueRequest,
        TextDocumentInlineValueResponse,
        InlineValueParams,
        InlineValueRegistrationOptions,
    ),
    "workspace/inlineValue/refresh": (
        WorkspaceInlineValueRefreshRequest,
        WorkspaceInlineValueRefreshResponse,
        None,
        None,
    ),
    "textDocument/inlayHint": (
        TextDocumentInlayHintRequest,
        TextDocumentInlayHintResponse,
        InlayHintParams,
        InlayHintRegistrationOptions,
    ),
    "inlayHint/resolve": (
        InlayHintResolveRequest,
        InlayHintResolveResponse,
        InlayHint,
        None,
    ),
    "workspace/inlayHint/refresh": (
        WorkspaceInlayHintRefreshRequest,
        WorkspaceInlayHintRefreshResponse,
        None,
        None,
    ),
    "textDocument/diagnostic": (
        TextDocumentDiagnosticRequest,
        TextDocumentDiagnosticResponse,
        DocumentDiagnosticParams,
        DiagnosticRegistrationOptions,
    ),
    "workspace/diagnostic": (
        WorkspaceDiagnosticRequest,
        WorkspaceDiagnosticResponse,
        WorkspaceDiagnosticParams,
        None,
    ),
    "workspace/diagnostic/refresh": (
        WorkspaceDiagnosticRefreshRequest,
        WorkspaceDiagnosticRefreshResponse,
        None,
        None,
    ),
    "client/registerCapability": (
        ClientRegisterCapabilityRequest,
        ClientRegisterCapabilityResponse,
        RegistrationParams,
        None,
    ),
    "client/unregisterCapability": (
        ClientUnregisterCapabilityRequest,
        ClientUnregisterCapabilityResponse,
        UnregistrationParams,
        None,
    ),
    "initialize": (InitializeRequest, InitializeResponse, InitializeParams, None),
    "shutdown": (ShutdownRequest, ShutdownResponse, None, None),
    "window/showMessageRequest": (
        WindowShowMessageRequestRequest,
        WindowShowMessageRequestResponse,
        ShowMessageRequestParams,
        None,
    ),
    "textDocument/willSaveWaitUntil": (
        TextDocumentWillSaveWaitUntilRequest,
        TextDocumentWillSaveWaitUntilResponse,
        WillSaveTextDocumentParams,
        TextDocumentRegistrationOptions,
    ),
    "textDocument/completion": (
        TextDocumentCompletionRequest,
        TextDocumentCompletionResponse,
        CompletionParams,
        CompletionRegistrationOptions,
    ),
    "completionItem/resolve": (
        CompletionItemResolveRequest,
        CompletionItemResolveResponse,
        CompletionItem,
        None,
    ),
    "textDocument/hover": (
        TextDocumentHoverRequest,
        TextDocumentHoverResponse,
        HoverParams,
        HoverRegistrationOptions,
    ),
    "textDocument/signatureHelp": (
        TextDocumentSignatureHelpRequest,
        TextDocumentSignatureHelpResponse,
        SignatureHelpParams,
        SignatureHelpRegistrationOptions,
    ),
    "textDocument/definition": (
        TextDocumentDefinitionRequest,
        TextDocumentDefinitionResponse,
        DefinitionParams,
        DefinitionRegistrationOptions,
    ),
    "textDocument/references": (
        TextDocumentReferencesRequest,
        TextDocumentReferencesResponse,
        ReferenceParams,
        ReferenceRegistrationOptions,
    ),
    "textDocument/documentHighlight": (
        TextDocumentDocumentHighlightRequest,
        TextDocumentDocumentHighlightResponse,
        DocumentHighlightParams,
        DocumentHighlightRegistrationOptions,
    ),
    "textDocument/documentSymbol": (
        TextDocumentDocumentSymbolRequest,
        TextDocumentDocumentSymbolResponse,
        DocumentSymbolParams,
        DocumentSymbolRegistrationOptions,
    ),
    "textDocument/codeAction": (
        TextDocumentCodeActionRequest,
        TextDocumentCodeActionResponse,
        CodeActionParams,
        CodeActionRegistrationOptions,
    ),
    "codeAction/resolve": (
        CodeActionResolveRequest,
        CodeActionResolveResponse,
        CodeAction,
        None,
    ),
    "workspace/symbol": (
        WorkspaceSymbolRequest,
        WorkspaceSymbolResponse,
        WorkspaceSymbolParams,
        WorkspaceSymbolRegistrationOptions,
    ),
    "workspaceSymbol/resolve": (
        WorkspaceSymbolResolveRequest,
        WorkspaceSymbolResolveResponse,
        WorkspaceSymbol,
        None,
    ),
    "textDocument/codeLens": (
        TextDocumentCodeLensRequest,
        TextDocumentCodeLensResponse,
        CodeLensParams,
        CodeLensRegistrationOptions,
    ),
    "codeLens/resolve": (
        CodeLensResolveRequest,
        CodeLensResolveResponse,
        CodeLens,
        None,
    ),
    "workspace/codeLens/refresh": (
        WorkspaceCodeLensRefreshRequest,
        WorkspaceCodeLensRefreshResponse,
        None,
        None,
    ),
    "textDocument/documentLink": (
        TextDocumentDocumentLinkRequest,
        TextDocumentDocumentLinkResponse,
        DocumentLinkParams,
        DocumentLinkRegistrationOptions,
    ),
    "documentLink/resolve": (
        DocumentLinkResolveRequest,
        DocumentLinkResolveResponse,
        DocumentLink,
        None,
    ),
    "textDocument/formatting": (
        TextDocumentFormattingRequest,
        TextDocumentFormattingResponse,
        DocumentFormattingParams,
        DocumentFormattingRegistrationOptions,
    ),
    "textDocument/rangeFormatting": (
        TextDocumentRangeFormattingRequest,
        TextDocumentRangeFormattingResponse,
        DocumentRangeFormattingParams,
        DocumentRangeFormattingRegistrationOptions,
    ),
    "textDocument/onTypeFormatting": (
        TextDocumentOnTypeFormattingRequest,
        TextDocumentOnTypeFormattingResponse,
        DocumentOnTypeFormattingParams,
        DocumentOnTypeFormattingRegistrationOptions,
    ),
    "textDocument/rename": (
        TextDocumentRenameRequest,
        TextDocumentRenameResponse,
        RenameParams,
        RenameRegistrationOptions,
    ),
    "textDocument/prepareRename": (
        TextDocumentPrepareRenameRequest,
        TextDocumentPrepareRenameResponse,
        PrepareRenameParams,
        None,
    ),
    "workspace/executeCommand": (
        WorkspaceExecuteCommandRequest,
        WorkspaceExecuteCommandResponse,
        ExecuteCommandParams,
        ExecuteCommandRegistrationOptions,
    ),
    "workspace/applyEdit": (
        WorkspaceApplyEditRequest,
        WorkspaceApplyEditResponse,
        ApplyWorkspaceEditParams,
        None,
    ),
    "workspace/didChangeWorkspaceFolders": (
        WorkspaceDidChangeWorkspaceFoldersNotification,
        None,
        DidChangeWorkspaceFoldersParams,
        None,
    ),
    "window/workDoneProgress/cancel": (
        WindowWorkDoneProgressCancelNotification,
        None,
        WorkDoneProgressCancelParams,
        None,
    ),
    "workspace/didCreateFiles": (
        WorkspaceDidCreateFilesNotification,
        None,
        CreateFilesParams,
        FileOperationRegistrationOptions,
    ),
    "workspace/didRenameFiles": (
        WorkspaceDidRenameFilesNotification,
        None,
        RenameFilesParams,
        FileOperationRegistrationOptions,
    ),
    "workspace/didDeleteFiles": (
        WorkspaceDidDeleteFilesNotification,
        None,
        DeleteFilesParams,
        FileOperationRegistrationOptions,
    ),
    "notebookDocument/didOpen": (
        NotebookDocumentDidOpenNotification,
        None,
        DidOpenNotebookDocumentParams,
        None,
    ),
    "notebookDocument/didChange": (
        NotebookDocumentDidChangeNotification,
        None,
        DidChangeNotebookDocumentParams,
        None,
    ),
    "notebookDocument/didSave": (
        NotebookDocumentDidSaveNotification,
        None,
        DidSaveNotebookDocumentParams,
        None,
    ),
    "notebookDocument/didClose": (
        NotebookDocumentDidCloseNotification,
        None,
        DidCloseNotebookDocumentParams,
        None,
    ),
    "initialized": (InitializedNotification, None, InitializedParams, None),
    "exit": (ExitNotification, None, None, None),
    "workspace/didChangeConfiguration": (
        WorkspaceDidChangeConfigurationNotification,
        None,
        DidChangeConfigurationParams,
        DidChangeConfigurationRegistrationOptions,
    ),
    "window/showMessage": (
        WindowShowMessageNotification,
        None,
        ShowMessageParams,
        None,
    ),
    "window/logMessage": (WindowLogMessageNotification, None, LogMessageParams, None),
    "telemetry/event": (TelemetryEventNotification, None, LSPAny, None),
    "textDocument/didOpen": (
        TextDocumentDidOpenNotification,
        None,
        DidOpenTextDocumentParams,
        TextDocumentRegistrationOptions,
    ),
    "textDocument/didChange": (
        TextDocumentDidChangeNotification,
        None,
        DidChangeTextDocumentParams,
        TextDocumentChangeRegistrationOptions,
    ),
    "textDocument/didClose": (
        TextDocumentDidCloseNotification,
        None,
        DidCloseTextDocumentParams,
        TextDocumentRegistrationOptions,
    ),
    "textDocument/didSave": (
        TextDocumentDidSaveNotification,
        None,
        DidSaveTextDocumentParams,
        TextDocumentSaveRegistrationOptions,
    ),
    "textDocument/willSave": (
        TextDocumentWillSaveNotification,
        None,
        WillSaveTextDocumentParams,
        TextDocumentRegistrationOptions,
    ),
    "workspace/didChangeWatchedFiles": (
        WorkspaceDidChangeWatchedFilesNotification,
        None,
        DidChangeWatchedFilesParams,
        DidChangeWatchedFilesRegistrationOptions,
    ),
    "textDocument/publishDiagnostics": (
        TextDocumentPublishDiagnosticsNotification,
        None,
        PublishDiagnosticsParams,
        None,
    ),
    "$/setTrace": (SetTraceNotification, None, SetTraceParams, None),
    "$/logTrace": (LogTraceNotification, None, LogTraceParams, None),
    "$/cancelRequest": (CancelRequestNotification, None, CancelParams, None),
    "$/progress": (ProgressNotification, None, ProgressParams, None),
}

REQUESTS = Union[
    TextDocumentImplementationRequest,
    TextDocumentTypeDefinitionRequest,
    WorkspaceWorkspaceFoldersRequest,
    WorkspaceConfigurationRequest,
    TextDocumentDocumentColorRequest,
    TextDocumentColorPresentationRequest,
    TextDocumentFoldingRangeRequest,
    TextDocumentDeclarationRequest,
    TextDocumentSelectionRangeRequest,
    WindowWorkDoneProgressCreateRequest,
    TextDocumentPrepareCallHierarchyRequest,
    CallHierarchyIncomingCallsRequest,
    CallHierarchyOutgoingCallsRequest,
    TextDocumentSemanticTokensFullRequest,
    TextDocumentSemanticTokensFullDeltaRequest,
    TextDocumentSemanticTokensRangeRequest,
    WorkspaceSemanticTokensRefreshRequest,
    WindowShowDocumentRequest,
    TextDocumentLinkedEditingRangeRequest,
    WorkspaceWillCreateFilesRequest,
    WorkspaceWillRenameFilesRequest,
    WorkspaceWillDeleteFilesRequest,
    TextDocumentMonikerRequest,
    TextDocumentPrepareTypeHierarchyRequest,
    TypeHierarchySupertypesRequest,
    TypeHierarchySubtypesRequest,
    TextDocumentInlineValueRequest,
    WorkspaceInlineValueRefreshRequest,
    TextDocumentInlayHintRequest,
    InlayHintResolveRequest,
    WorkspaceInlayHintRefreshRequest,
    TextDocumentDiagnosticRequest,
    WorkspaceDiagnosticRequest,
    WorkspaceDiagnosticRefreshRequest,
    ClientRegisterCapabilityRequest,
    ClientUnregisterCapabilityRequest,
    InitializeRequest,
    ShutdownRequest,
    WindowShowMessageRequestRequest,
    TextDocumentWillSaveWaitUntilRequest,
    TextDocumentCompletionRequest,
    CompletionItemResolveRequest,
    TextDocumentHoverRequest,
    TextDocumentSignatureHelpRequest,
    TextDocumentDefinitionRequest,
    TextDocumentReferencesRequest,
    TextDocumentDocumentHighlightRequest,
    TextDocumentDocumentSymbolRequest,
    TextDocumentCodeActionRequest,
    CodeActionResolveRequest,
    WorkspaceSymbolRequest,
    WorkspaceSymbolResolveRequest,
    TextDocumentCodeLensRequest,
    CodeLensResolveRequest,
    WorkspaceCodeLensRefreshRequest,
    TextDocumentDocumentLinkRequest,
    DocumentLinkResolveRequest,
    TextDocumentFormattingRequest,
    TextDocumentRangeFormattingRequest,
    TextDocumentOnTypeFormattingRequest,
    TextDocumentRenameRequest,
    TextDocumentPrepareRenameRequest,
    WorkspaceExecuteCommandRequest,
    WorkspaceApplyEditRequest,
]
RESPONSES = Union[
    TextDocumentImplementationResponse,
    TextDocumentTypeDefinitionResponse,
    WorkspaceWorkspaceFoldersResponse,
    WorkspaceConfigurationResponse,
    TextDocumentDocumentColorResponse,
    TextDocumentColorPresentationResponse,
    TextDocumentFoldingRangeResponse,
    TextDocumentDeclarationResponse,
    TextDocumentSelectionRangeResponse,
    WindowWorkDoneProgressCreateResponse,
    TextDocumentPrepareCallHierarchyResponse,
    CallHierarchyIncomingCallsResponse,
    CallHierarchyOutgoingCallsResponse,
    TextDocumentSemanticTokensFullResponse,
    TextDocumentSemanticTokensFullDeltaResponse,
    TextDocumentSemanticTokensRangeResponse,
    WorkspaceSemanticTokensRefreshResponse,
    WindowShowDocumentResponse,
    TextDocumentLinkedEditingRangeResponse,
    WorkspaceWillCreateFilesResponse,
    WorkspaceWillRenameFilesResponse,
    WorkspaceWillDeleteFilesResponse,
    TextDocumentMonikerResponse,
    TextDocumentPrepareTypeHierarchyResponse,
    TypeHierarchySupertypesResponse,
    TypeHierarchySubtypesResponse,
    TextDocumentInlineValueResponse,
    WorkspaceInlineValueRefreshResponse,
    TextDocumentInlayHintResponse,
    InlayHintResolveResponse,
    WorkspaceInlayHintRefreshResponse,
    TextDocumentDiagnosticResponse,
    WorkspaceDiagnosticResponse,
    WorkspaceDiagnosticRefreshResponse,
    ClientRegisterCapabilityResponse,
    ClientUnregisterCapabilityResponse,
    InitializeResponse,
    ShutdownResponse,
    WindowShowMessageRequestResponse,
    TextDocumentWillSaveWaitUntilResponse,
    TextDocumentCompletionResponse,
    CompletionItemResolveResponse,
    TextDocumentHoverResponse,
    TextDocumentSignatureHelpResponse,
    TextDocumentDefinitionResponse,
    TextDocumentReferencesResponse,
    TextDocumentDocumentHighlightResponse,
    TextDocumentDocumentSymbolResponse,
    TextDocumentCodeActionResponse,
    CodeActionResolveResponse,
    WorkspaceSymbolResponse,
    WorkspaceSymbolResolveResponse,
    TextDocumentCodeLensResponse,
    CodeLensResolveResponse,
    WorkspaceCodeLensRefreshResponse,
    TextDocumentDocumentLinkResponse,
    DocumentLinkResolveResponse,
    TextDocumentFormattingResponse,
    TextDocumentRangeFormattingResponse,
    TextDocumentOnTypeFormattingResponse,
    TextDocumentRenameResponse,
    TextDocumentPrepareRenameResponse,
    WorkspaceExecuteCommandResponse,
    WorkspaceApplyEditResponse,
]
NOTIFICATIONS = Union[
    WorkspaceDidChangeWorkspaceFoldersNotification,
    WindowWorkDoneProgressCancelNotification,
    WorkspaceDidCreateFilesNotification,
    WorkspaceDidRenameFilesNotification,
    WorkspaceDidDeleteFilesNotification,
    NotebookDocumentDidOpenNotification,
    NotebookDocumentDidChangeNotification,
    NotebookDocumentDidSaveNotification,
    NotebookDocumentDidCloseNotification,
    InitializedNotification,
    ExitNotification,
    WorkspaceDidChangeConfigurationNotification,
    WindowShowMessageNotification,
    WindowLogMessageNotification,
    TelemetryEventNotification,
    TextDocumentDidOpenNotification,
    TextDocumentDidChangeNotification,
    TextDocumentDidCloseNotification,
    TextDocumentDidSaveNotification,
    TextDocumentWillSaveNotification,
    WorkspaceDidChangeWatchedFilesNotification,
    TextDocumentPublishDiagnosticsNotification,
    SetTraceNotification,
    LogTraceNotification,
    CancelRequestNotification,
    ProgressNotification,
]
MESSAGE_TYPES = Union[REQUESTS, RESPONSES, NOTIFICATIONS, ResponseErrorMessage]

_KEYWORD_CLASSES = [CallHierarchyIncomingCall]


def is_keyword_class(cls) -> bool:
    """Returns true if the class has a property that may be python keyword."""
    return any([cls is c for c in _KEYWORD_CLASSES])


_SPECIAL_CLASSES = [
    TextDocumentRegistrationOptions,
    ImplementationRegistrationOptions,
    TypeDefinitionRegistrationOptions,
    DocumentColorRegistrationOptions,
    FoldingRangeRegistrationOptions,
    DeclarationRegistrationOptions,
    SelectionRangeRegistrationOptions,
    CallHierarchyRegistrationOptions,
    SemanticTokensRegistrationOptions,
    LinkedEditingRangeRegistrationOptions,
    MonikerRegistrationOptions,
    TypeHierarchyRegistrationOptions,
    InlineValueRegistrationOptions,
    InlayHintRegistrationOptions,
    DiagnosticRegistrationOptions,
    _InitializeParams,
    WorkspaceFoldersInitializeParams,
    InitializeParams,
    TextDocumentChangeRegistrationOptions,
    TextDocumentSaveRegistrationOptions,
    CompletionRegistrationOptions,
    HoverRegistrationOptions,
    SignatureHelpRegistrationOptions,
    DefinitionRegistrationOptions,
    ReferenceRegistrationOptions,
    DocumentHighlightRegistrationOptions,
    DocumentSymbolRegistrationOptions,
    CodeActionRegistrationOptions,
    CodeLensRegistrationOptions,
    DocumentLinkRegistrationOptions,
    DocumentFormattingRegistrationOptions,
    DocumentRangeFormattingRegistrationOptions,
    DocumentOnTypeFormattingRegistrationOptions,
    RenameRegistrationOptions,
    OptionalVersionedTextDocumentIdentifier,
    WorkspaceFullDocumentDiagnosticReport,
    WorkspaceUnchangedDocumentDiagnosticReport,
    TextDocumentColorPresentationOptions,
    ResponseErrorMessage,
    TextDocumentImplementationRequest,
    TextDocumentImplementationResponse,
    TextDocumentTypeDefinitionRequest,
    TextDocumentTypeDefinitionResponse,
    WorkspaceWorkspaceFoldersRequest,
    WorkspaceWorkspaceFoldersResponse,
    WorkspaceConfigurationRequest,
    WorkspaceConfigurationResponse,
    TextDocumentDocumentColorRequest,
    TextDocumentDocumentColorResponse,
    TextDocumentColorPresentationRequest,
    TextDocumentColorPresentationResponse,
    TextDocumentFoldingRangeRequest,
    TextDocumentFoldingRangeResponse,
    TextDocumentDeclarationRequest,
    TextDocumentDeclarationResponse,
    TextDocumentSelectionRangeRequest,
    TextDocumentSelectionRangeResponse,
    WindowWorkDoneProgressCreateRequest,
    WindowWorkDoneProgressCreateResponse,
    TextDocumentPrepareCallHierarchyRequest,
    TextDocumentPrepareCallHierarchyResponse,
    CallHierarchyIncomingCallsRequest,
    CallHierarchyIncomingCallsResponse,
    CallHierarchyOutgoingCallsRequest,
    CallHierarchyOutgoingCallsResponse,
    TextDocumentSemanticTokensFullRequest,
    TextDocumentSemanticTokensFullResponse,
    TextDocumentSemanticTokensFullDeltaRequest,
    TextDocumentSemanticTokensFullDeltaResponse,
    TextDocumentSemanticTokensRangeRequest,
    TextDocumentSemanticTokensRangeResponse,
    WorkspaceSemanticTokensRefreshRequest,
    WorkspaceSemanticTokensRefreshResponse,
    WindowShowDocumentRequest,
    WindowShowDocumentResponse,
    TextDocumentLinkedEditingRangeRequest,
    TextDocumentLinkedEditingRangeResponse,
    WorkspaceWillCreateFilesRequest,
    WorkspaceWillCreateFilesResponse,
    WorkspaceWillRenameFilesRequest,
    WorkspaceWillRenameFilesResponse,
    WorkspaceWillDeleteFilesRequest,
    WorkspaceWillDeleteFilesResponse,
    TextDocumentMonikerRequest,
    TextDocumentMonikerResponse,
    TextDocumentPrepareTypeHierarchyRequest,
    TextDocumentPrepareTypeHierarchyResponse,
    TypeHierarchySupertypesRequest,
    TypeHierarchySupertypesResponse,
    TypeHierarchySubtypesRequest,
    TypeHierarchySubtypesResponse,
    TextDocumentInlineValueRequest,
    TextDocumentInlineValueResponse,
    WorkspaceInlineValueRefreshRequest,
    WorkspaceInlineValueRefreshResponse,
    TextDocumentInlayHintRequest,
    TextDocumentInlayHintResponse,
    InlayHintResolveRequest,
    InlayHintResolveResponse,
    WorkspaceInlayHintRefreshRequest,
    WorkspaceInlayHintRefreshResponse,
    TextDocumentDiagnosticRequest,
    TextDocumentDiagnosticResponse,
    WorkspaceDiagnosticRequest,
    WorkspaceDiagnosticResponse,
    WorkspaceDiagnosticRefreshRequest,
    WorkspaceDiagnosticRefreshResponse,
    ClientRegisterCapabilityRequest,
    ClientRegisterCapabilityResponse,
    ClientUnregisterCapabilityRequest,
    ClientUnregisterCapabilityResponse,
    InitializeRequest,
    InitializeResponse,
    ShutdownRequest,
    ShutdownResponse,
    WindowShowMessageRequestRequest,
    WindowShowMessageRequestResponse,
    TextDocumentWillSaveWaitUntilRequest,
    TextDocumentWillSaveWaitUntilResponse,
    TextDocumentCompletionRequest,
    TextDocumentCompletionResponse,
    CompletionItemResolveRequest,
    CompletionItemResolveResponse,
    TextDocumentHoverRequest,
    TextDocumentHoverResponse,
    TextDocumentSignatureHelpRequest,
    TextDocumentSignatureHelpResponse,
    TextDocumentDefinitionRequest,
    TextDocumentDefinitionResponse,
    TextDocumentReferencesRequest,
    TextDocumentReferencesResponse,
    TextDocumentDocumentHighlightRequest,
    TextDocumentDocumentHighlightResponse,
    TextDocumentDocumentSymbolRequest,
    TextDocumentDocumentSymbolResponse,
    TextDocumentCodeActionRequest,
    TextDocumentCodeActionResponse,
    CodeActionResolveRequest,
    CodeActionResolveResponse,
    WorkspaceSymbolRequest,
    WorkspaceSymbolResponse,
    WorkspaceSymbolResolveRequest,
    WorkspaceSymbolResolveResponse,
    TextDocumentCodeLensRequest,
    TextDocumentCodeLensResponse,
    CodeLensResolveRequest,
    CodeLensResolveResponse,
    WorkspaceCodeLensRefreshRequest,
    WorkspaceCodeLensRefreshResponse,
    TextDocumentDocumentLinkRequest,
    TextDocumentDocumentLinkResponse,
    DocumentLinkResolveRequest,
    DocumentLinkResolveResponse,
    TextDocumentFormattingRequest,
    TextDocumentFormattingResponse,
    TextDocumentRangeFormattingRequest,
    TextDocumentRangeFormattingResponse,
    TextDocumentOnTypeFormattingRequest,
    TextDocumentOnTypeFormattingResponse,
    TextDocumentRenameRequest,
    TextDocumentRenameResponse,
    TextDocumentPrepareRenameRequest,
    TextDocumentPrepareRenameResponse,
    WorkspaceExecuteCommandRequest,
    WorkspaceExecuteCommandResponse,
    WorkspaceApplyEditRequest,
    WorkspaceApplyEditResponse,
    WorkspaceDidChangeWorkspaceFoldersNotification,
    WindowWorkDoneProgressCancelNotification,
    WorkspaceDidCreateFilesNotification,
    WorkspaceDidRenameFilesNotification,
    WorkspaceDidDeleteFilesNotification,
    NotebookDocumentDidOpenNotification,
    NotebookDocumentDidChangeNotification,
    NotebookDocumentDidSaveNotification,
    NotebookDocumentDidCloseNotification,
    InitializedNotification,
    ExitNotification,
    WorkspaceDidChangeConfigurationNotification,
    WindowShowMessageNotification,
    WindowLogMessageNotification,
    TelemetryEventNotification,
    TextDocumentDidOpenNotification,
    TextDocumentDidChangeNotification,
    TextDocumentDidCloseNotification,
    TextDocumentDidSaveNotification,
    TextDocumentWillSaveNotification,
    WorkspaceDidChangeWatchedFilesNotification,
    TextDocumentPublishDiagnosticsNotification,
    SetTraceNotification,
    LogTraceNotification,
    CancelRequestNotification,
    ProgressNotification,
]


def is_special_class(cls) -> bool:
    """Returns true if the class or its properties require special handling."""
    return any([cls is c for c in _SPECIAL_CLASSES])


_SPECIAL_PROPERTIES = [
    "TextDocumentRegistrationOptions.documentSelector",
    "ImplementationRegistrationOptions.documentSelector",
    "TypeDefinitionRegistrationOptions.documentSelector",
    "DocumentColorRegistrationOptions.documentSelector",
    "FoldingRangeRegistrationOptions.documentSelector",
    "DeclarationRegistrationOptions.documentSelector",
    "SelectionRangeRegistrationOptions.documentSelector",
    "CallHierarchyRegistrationOptions.documentSelector",
    "SemanticTokensRegistrationOptions.documentSelector",
    "LinkedEditingRangeRegistrationOptions.documentSelector",
    "MonikerRegistrationOptions.documentSelector",
    "TypeHierarchyRegistrationOptions.documentSelector",
    "InlineValueRegistrationOptions.documentSelector",
    "InlayHintRegistrationOptions.documentSelector",
    "DiagnosticRegistrationOptions.documentSelector",
    "_InitializeParams.processId",
    "_InitializeParams.rootPath",
    "_InitializeParams.rootUri",
    "WorkspaceFoldersInitializeParams.workspaceFolders",
    "InitializeParams.processId",
    "InitializeParams.rootPath",
    "InitializeParams.rootUri",
    "InitializeParams.workspaceFolders",
    "TextDocumentChangeRegistrationOptions.documentSelector",
    "TextDocumentSaveRegistrationOptions.documentSelector",
    "CompletionRegistrationOptions.documentSelector",
    "HoverRegistrationOptions.documentSelector",
    "SignatureHelpRegistrationOptions.documentSelector",
    "DefinitionRegistrationOptions.documentSelector",
    "ReferenceRegistrationOptions.documentSelector",
    "DocumentHighlightRegistrationOptions.documentSelector",
    "DocumentSymbolRegistrationOptions.documentSelector",
    "CodeActionRegistrationOptions.documentSelector",
    "CodeLensRegistrationOptions.documentSelector",
    "DocumentLinkRegistrationOptions.documentSelector",
    "DocumentFormattingRegistrationOptions.documentSelector",
    "DocumentRangeFormattingRegistrationOptions.documentSelector",
    "DocumentOnTypeFormattingRegistrationOptions.documentSelector",
    "RenameRegistrationOptions.documentSelector",
    "OptionalVersionedTextDocumentIdentifier.version",
    "WorkspaceFullDocumentDiagnosticReport.version",
    "WorkspaceUnchangedDocumentDiagnosticReport.version",
    "TextDocumentColorPresentationOptions.documentSelector",
    "ResponseErrorMessage.error",
    "ResponseErrorMessage.jsonrpc",
    "TextDocumentImplementationRequest.method",
    "TextDocumentImplementationRequest.jsonrpc",
    "TextDocumentImplementationResponse.result",
    "TextDocumentImplementationResponse.jsonrpc",
    "TextDocumentTypeDefinitionRequest.method",
    "TextDocumentTypeDefinitionRequest.jsonrpc",
    "TextDocumentTypeDefinitionResponse.result",
    "TextDocumentTypeDefinitionResponse.jsonrpc",
    "WorkspaceWorkspaceFoldersRequest.method",
    "WorkspaceWorkspaceFoldersRequest.jsonrpc",
    "WorkspaceWorkspaceFoldersResponse.result",
    "WorkspaceWorkspaceFoldersResponse.jsonrpc",
    "WorkspaceConfigurationRequest.method",
    "WorkspaceConfigurationRequest.jsonrpc",
    "WorkspaceConfigurationResponse.result",
    "WorkspaceConfigurationResponse.jsonrpc",
    "TextDocumentDocumentColorRequest.method",
    "TextDocumentDocumentColorRequest.jsonrpc",
    "TextDocumentDocumentColorResponse.result",
    "TextDocumentDocumentColorResponse.jsonrpc",
    "TextDocumentColorPresentationRequest.method",
    "TextDocumentColorPresentationRequest.jsonrpc",
    "TextDocumentColorPresentationResponse.result",
    "TextDocumentColorPresentationResponse.jsonrpc",
    "TextDocumentFoldingRangeRequest.method",
    "TextDocumentFoldingRangeRequest.jsonrpc",
    "TextDocumentFoldingRangeResponse.result",
    "TextDocumentFoldingRangeResponse.jsonrpc",
    "TextDocumentDeclarationRequest.method",
    "TextDocumentDeclarationRequest.jsonrpc",
    "TextDocumentDeclarationResponse.result",
    "TextDocumentDeclarationResponse.jsonrpc",
    "TextDocumentSelectionRangeRequest.method",
    "TextDocumentSelectionRangeRequest.jsonrpc",
    "TextDocumentSelectionRangeResponse.result",
    "TextDocumentSelectionRangeResponse.jsonrpc",
    "WindowWorkDoneProgressCreateRequest.method",
    "WindowWorkDoneProgressCreateRequest.jsonrpc",
    "WindowWorkDoneProgressCreateResponse.result",
    "WindowWorkDoneProgressCreateResponse.jsonrpc",
    "TextDocumentPrepareCallHierarchyRequest.method",
    "TextDocumentPrepareCallHierarchyRequest.jsonrpc",
    "TextDocumentPrepareCallHierarchyResponse.result",
    "TextDocumentPrepareCallHierarchyResponse.jsonrpc",
    "CallHierarchyIncomingCallsRequest.method",
    "CallHierarchyIncomingCallsRequest.jsonrpc",
    "CallHierarchyIncomingCallsResponse.result",
    "CallHierarchyIncomingCallsResponse.jsonrpc",
    "CallHierarchyOutgoingCallsRequest.method",
    "CallHierarchyOutgoingCallsRequest.jsonrpc",
    "CallHierarchyOutgoingCallsResponse.result",
    "CallHierarchyOutgoingCallsResponse.jsonrpc",
    "TextDocumentSemanticTokensFullRequest.method",
    "TextDocumentSemanticTokensFullRequest.jsonrpc",
    "TextDocumentSemanticTokensFullResponse.result",
    "TextDocumentSemanticTokensFullResponse.jsonrpc",
    "TextDocumentSemanticTokensFullDeltaRequest.method",
    "TextDocumentSemanticTokensFullDeltaRequest.jsonrpc",
    "TextDocumentSemanticTokensFullDeltaResponse.result",
    "TextDocumentSemanticTokensFullDeltaResponse.jsonrpc",
    "TextDocumentSemanticTokensRangeRequest.method",
    "TextDocumentSemanticTokensRangeRequest.jsonrpc",
    "TextDocumentSemanticTokensRangeResponse.result",
    "TextDocumentSemanticTokensRangeResponse.jsonrpc",
    "WorkspaceSemanticTokensRefreshRequest.method",
    "WorkspaceSemanticTokensRefreshRequest.jsonrpc",
    "WorkspaceSemanticTokensRefreshResponse.result",
    "WorkspaceSemanticTokensRefreshResponse.jsonrpc",
    "WindowShowDocumentRequest.method",
    "WindowShowDocumentRequest.jsonrpc",
    "WindowShowDocumentResponse.result",
    "WindowShowDocumentResponse.jsonrpc",
    "TextDocumentLinkedEditingRangeRequest.method",
    "TextDocumentLinkedEditingRangeRequest.jsonrpc",
    "TextDocumentLinkedEditingRangeResponse.result",
    "TextDocumentLinkedEditingRangeResponse.jsonrpc",
    "WorkspaceWillCreateFilesRequest.method",
    "WorkspaceWillCreateFilesRequest.jsonrpc",
    "WorkspaceWillCreateFilesResponse.result",
    "WorkspaceWillCreateFilesResponse.jsonrpc",
    "WorkspaceWillRenameFilesRequest.method",
    "WorkspaceWillRenameFilesRequest.jsonrpc",
    "WorkspaceWillRenameFilesResponse.result",
    "WorkspaceWillRenameFilesResponse.jsonrpc",
    "WorkspaceWillDeleteFilesRequest.method",
    "WorkspaceWillDeleteFilesRequest.jsonrpc",
    "WorkspaceWillDeleteFilesResponse.result",
    "WorkspaceWillDeleteFilesResponse.jsonrpc",
    "TextDocumentMonikerRequest.method",
    "TextDocumentMonikerRequest.jsonrpc",
    "TextDocumentMonikerResponse.result",
    "TextDocumentMonikerResponse.jsonrpc",
    "TextDocumentPrepareTypeHierarchyRequest.method",
    "TextDocumentPrepareTypeHierarchyRequest.jsonrpc",
    "TextDocumentPrepareTypeHierarchyResponse.result",
    "TextDocumentPrepareTypeHierarchyResponse.jsonrpc",
    "TypeHierarchySupertypesRequest.method",
    "TypeHierarchySupertypesRequest.jsonrpc",
    "TypeHierarchySupertypesResponse.result",
    "TypeHierarchySupertypesResponse.jsonrpc",
    "TypeHierarchySubtypesRequest.method",
    "TypeHierarchySubtypesRequest.jsonrpc",
    "TypeHierarchySubtypesResponse.result",
    "TypeHierarchySubtypesResponse.jsonrpc",
    "TextDocumentInlineValueRequest.method",
    "TextDocumentInlineValueRequest.jsonrpc",
    "TextDocumentInlineValueResponse.result",
    "TextDocumentInlineValueResponse.jsonrpc",
    "WorkspaceInlineValueRefreshRequest.method",
    "WorkspaceInlineValueRefreshRequest.jsonrpc",
    "WorkspaceInlineValueRefreshResponse.result",
    "WorkspaceInlineValueRefreshResponse.jsonrpc",
    "TextDocumentInlayHintRequest.method",
    "TextDocumentInlayHintRequest.jsonrpc",
    "TextDocumentInlayHintResponse.result",
    "TextDocumentInlayHintResponse.jsonrpc",
    "InlayHintResolveRequest.method",
    "InlayHintResolveRequest.jsonrpc",
    "InlayHintResolveResponse.result",
    "InlayHintResolveResponse.jsonrpc",
    "WorkspaceInlayHintRefreshRequest.method",
    "WorkspaceInlayHintRefreshRequest.jsonrpc",
    "WorkspaceInlayHintRefreshResponse.result",
    "WorkspaceInlayHintRefreshResponse.jsonrpc",
    "TextDocumentDiagnosticRequest.method",
    "TextDocumentDiagnosticRequest.jsonrpc",
    "TextDocumentDiagnosticResponse.result",
    "TextDocumentDiagnosticResponse.jsonrpc",
    "WorkspaceDiagnosticRequest.method",
    "WorkspaceDiagnosticRequest.jsonrpc",
    "WorkspaceDiagnosticResponse.result",
    "WorkspaceDiagnosticResponse.jsonrpc",
    "WorkspaceDiagnosticRefreshRequest.method",
    "WorkspaceDiagnosticRefreshRequest.jsonrpc",
    "WorkspaceDiagnosticRefreshResponse.result",
    "WorkspaceDiagnosticRefreshResponse.jsonrpc",
    "ClientRegisterCapabilityRequest.method",
    "ClientRegisterCapabilityRequest.jsonrpc",
    "ClientRegisterCapabilityResponse.result",
    "ClientRegisterCapabilityResponse.jsonrpc",
    "ClientUnregisterCapabilityRequest.method",
    "ClientUnregisterCapabilityRequest.jsonrpc",
    "ClientUnregisterCapabilityResponse.result",
    "ClientUnregisterCapabilityResponse.jsonrpc",
    "InitializeRequest.method",
    "InitializeRequest.jsonrpc",
    "InitializeResponse.result",
    "InitializeResponse.jsonrpc",
    "ShutdownRequest.method",
    "ShutdownRequest.jsonrpc",
    "ShutdownResponse.result",
    "ShutdownResponse.jsonrpc",
    "WindowShowMessageRequestRequest.method",
    "WindowShowMessageRequestRequest.jsonrpc",
    "WindowShowMessageRequestResponse.result",
    "WindowShowMessageRequestResponse.jsonrpc",
    "TextDocumentWillSaveWaitUntilRequest.method",
    "TextDocumentWillSaveWaitUntilRequest.jsonrpc",
    "TextDocumentWillSaveWaitUntilResponse.result",
    "TextDocumentWillSaveWaitUntilResponse.jsonrpc",
    "TextDocumentCompletionRequest.method",
    "TextDocumentCompletionRequest.jsonrpc",
    "TextDocumentCompletionResponse.result",
    "TextDocumentCompletionResponse.jsonrpc",
    "CompletionItemResolveRequest.method",
    "CompletionItemResolveRequest.jsonrpc",
    "CompletionItemResolveResponse.result",
    "CompletionItemResolveResponse.jsonrpc",
    "TextDocumentHoverRequest.method",
    "TextDocumentHoverRequest.jsonrpc",
    "TextDocumentHoverResponse.result",
    "TextDocumentHoverResponse.jsonrpc",
    "TextDocumentSignatureHelpRequest.method",
    "TextDocumentSignatureHelpRequest.jsonrpc",
    "TextDocumentSignatureHelpResponse.result",
    "TextDocumentSignatureHelpResponse.jsonrpc",
    "TextDocumentDefinitionRequest.method",
    "TextDocumentDefinitionRequest.jsonrpc",
    "TextDocumentDefinitionResponse.result",
    "TextDocumentDefinitionResponse.jsonrpc",
    "TextDocumentReferencesRequest.method",
    "TextDocumentReferencesRequest.jsonrpc",
    "TextDocumentReferencesResponse.result",
    "TextDocumentReferencesResponse.jsonrpc",
    "TextDocumentDocumentHighlightRequest.method",
    "TextDocumentDocumentHighlightRequest.jsonrpc",
    "TextDocumentDocumentHighlightResponse.result",
    "TextDocumentDocumentHighlightResponse.jsonrpc",
    "TextDocumentDocumentSymbolRequest.method",
    "TextDocumentDocumentSymbolRequest.jsonrpc",
    "TextDocumentDocumentSymbolResponse.result",
    "TextDocumentDocumentSymbolResponse.jsonrpc",
    "TextDocumentCodeActionRequest.method",
    "TextDocumentCodeActionRequest.jsonrpc",
    "TextDocumentCodeActionResponse.result",
    "TextDocumentCodeActionResponse.jsonrpc",
    "CodeActionResolveRequest.method",
    "CodeActionResolveRequest.jsonrpc",
    "CodeActionResolveResponse.result",
    "CodeActionResolveResponse.jsonrpc",
    "WorkspaceSymbolRequest.method",
    "WorkspaceSymbolRequest.jsonrpc",
    "WorkspaceSymbolResponse.result",
    "WorkspaceSymbolResponse.jsonrpc",
    "WorkspaceSymbolResolveRequest.method",
    "WorkspaceSymbolResolveRequest.jsonrpc",
    "WorkspaceSymbolResolveResponse.result",
    "WorkspaceSymbolResolveResponse.jsonrpc",
    "TextDocumentCodeLensRequest.method",
    "TextDocumentCodeLensRequest.jsonrpc",
    "TextDocumentCodeLensResponse.result",
    "TextDocumentCodeLensResponse.jsonrpc",
    "CodeLensResolveRequest.method",
    "CodeLensResolveRequest.jsonrpc",
    "CodeLensResolveResponse.result",
    "CodeLensResolveResponse.jsonrpc",
    "WorkspaceCodeLensRefreshRequest.method",
    "WorkspaceCodeLensRefreshRequest.jsonrpc",
    "WorkspaceCodeLensRefreshResponse.result",
    "WorkspaceCodeLensRefreshResponse.jsonrpc",
    "TextDocumentDocumentLinkRequest.method",
    "TextDocumentDocumentLinkRequest.jsonrpc",
    "TextDocumentDocumentLinkResponse.result",
    "TextDocumentDocumentLinkResponse.jsonrpc",
    "DocumentLinkResolveRequest.method",
    "DocumentLinkResolveRequest.jsonrpc",
    "DocumentLinkResolveResponse.result",
    "DocumentLinkResolveResponse.jsonrpc",
    "TextDocumentFormattingRequest.method",
    "TextDocumentFormattingRequest.jsonrpc",
    "TextDocumentFormattingResponse.result",
    "TextDocumentFormattingResponse.jsonrpc",
    "TextDocumentRangeFormattingRequest.method",
    "TextDocumentRangeFormattingRequest.jsonrpc",
    "TextDocumentRangeFormattingResponse.result",
    "TextDocumentRangeFormattingResponse.jsonrpc",
    "TextDocumentOnTypeFormattingRequest.method",
    "TextDocumentOnTypeFormattingRequest.jsonrpc",
    "TextDocumentOnTypeFormattingResponse.result",
    "TextDocumentOnTypeFormattingResponse.jsonrpc",
    "TextDocumentRenameRequest.method",
    "TextDocumentRenameRequest.jsonrpc",
    "TextDocumentRenameResponse.result",
    "TextDocumentRenameResponse.jsonrpc",
    "TextDocumentPrepareRenameRequest.method",
    "TextDocumentPrepareRenameRequest.jsonrpc",
    "TextDocumentPrepareRenameResponse.result",
    "TextDocumentPrepareRenameResponse.jsonrpc",
    "WorkspaceExecuteCommandRequest.method",
    "WorkspaceExecuteCommandRequest.jsonrpc",
    "WorkspaceExecuteCommandResponse.result",
    "WorkspaceExecuteCommandResponse.jsonrpc",
    "WorkspaceApplyEditRequest.method",
    "WorkspaceApplyEditRequest.jsonrpc",
    "WorkspaceApplyEditResponse.result",
    "WorkspaceApplyEditResponse.jsonrpc",
    "WorkspaceDidChangeWorkspaceFoldersNotification.method",
    "WorkspaceDidChangeWorkspaceFoldersNotification.jsonrpc",
    "WindowWorkDoneProgressCancelNotification.method",
    "WindowWorkDoneProgressCancelNotification.jsonrpc",
    "WorkspaceDidCreateFilesNotification.method",
    "WorkspaceDidCreateFilesNotification.jsonrpc",
    "WorkspaceDidRenameFilesNotification.method",
    "WorkspaceDidRenameFilesNotification.jsonrpc",
    "WorkspaceDidDeleteFilesNotification.method",
    "WorkspaceDidDeleteFilesNotification.jsonrpc",
    "NotebookDocumentDidOpenNotification.method",
    "NotebookDocumentDidOpenNotification.jsonrpc",
    "NotebookDocumentDidChangeNotification.method",
    "NotebookDocumentDidChangeNotification.jsonrpc",
    "NotebookDocumentDidSaveNotification.method",
    "NotebookDocumentDidSaveNotification.jsonrpc",
    "NotebookDocumentDidCloseNotification.method",
    "NotebookDocumentDidCloseNotification.jsonrpc",
    "InitializedNotification.method",
    "InitializedNotification.jsonrpc",
    "ExitNotification.method",
    "ExitNotification.jsonrpc",
    "WorkspaceDidChangeConfigurationNotification.method",
    "WorkspaceDidChangeConfigurationNotification.jsonrpc",
    "WindowShowMessageNotification.method",
    "WindowShowMessageNotification.jsonrpc",
    "WindowLogMessageNotification.method",
    "WindowLogMessageNotification.jsonrpc",
    "TelemetryEventNotification.method",
    "TelemetryEventNotification.jsonrpc",
    "TextDocumentDidOpenNotification.method",
    "TextDocumentDidOpenNotification.jsonrpc",
    "TextDocumentDidChangeNotification.method",
    "TextDocumentDidChangeNotification.jsonrpc",
    "TextDocumentDidCloseNotification.method",
    "TextDocumentDidCloseNotification.jsonrpc",
    "TextDocumentDidSaveNotification.method",
    "TextDocumentDidSaveNotification.jsonrpc",
    "TextDocumentWillSaveNotification.method",
    "TextDocumentWillSaveNotification.jsonrpc",
    "WorkspaceDidChangeWatchedFilesNotification.method",
    "WorkspaceDidChangeWatchedFilesNotification.jsonrpc",
    "TextDocumentPublishDiagnosticsNotification.method",
    "TextDocumentPublishDiagnosticsNotification.jsonrpc",
    "SetTraceNotification.method",
    "SetTraceNotification.jsonrpc",
    "LogTraceNotification.method",
    "LogTraceNotification.jsonrpc",
    "CancelRequestNotification.method",
    "CancelRequestNotification.jsonrpc",
    "ProgressNotification.method",
    "ProgressNotification.jsonrpc",
]


def is_special_property(cls, property_name) -> bool:
    """Returns true if the class or its properties require special handling.
    Example:
      Consider RenameRegistrationOptions
        * documentSelector property:
            When you set `documentSelector` to None in python it has to be preserved when
            serializing it. Since the serialized JSON value `{"documentSelector": null}`
            means use the Clients document selector. Omitting it might throw error.
        * prepareProvider property
            This property does NOT need special handling, since omitting it or using
            `{"prepareProvider": null}` in JSON has the same meaning."""
    qualified_name = f"{cls.__name__}.{property_name}"
    return qualified_name in _SPECIAL_PROPERTIES


ALL_TYPES_MAP = {
    "SemanticTokenTypes": SemanticTokenTypes,
    "SemanticTokenModifiers": SemanticTokenModifiers,
    "ErrorCodes": ErrorCodes,
    "LSPErrorCodes": LSPErrorCodes,
    "FoldingRangeKind": FoldingRangeKind,
    "SymbolKind": SymbolKind,
    "SymbolTag": SymbolTag,
    "UniquenessLevel": UniquenessLevel,
    "MonikerKind": MonikerKind,
    "InlayHintKind": InlayHintKind,
    "MessageType": MessageType,
    "TextDocumentSyncKind": TextDocumentSyncKind,
    "TextDocumentSaveReason": TextDocumentSaveReason,
    "CompletionItemKind": CompletionItemKind,
    "CompletionItemTag": CompletionItemTag,
    "InsertTextFormat": InsertTextFormat,
    "InsertTextMode": InsertTextMode,
    "DocumentHighlightKind": DocumentHighlightKind,
    "CodeActionKind": CodeActionKind,
    "TraceValues": TraceValues,
    "MarkupKind": MarkupKind,
    "PositionEncodingKind": PositionEncodingKind,
    "FileChangeType": FileChangeType,
    "WatchKind": WatchKind,
    "DiagnosticSeverity": DiagnosticSeverity,
    "DiagnosticTag": DiagnosticTag,
    "CompletionTriggerKind": CompletionTriggerKind,
    "SignatureHelpTriggerKind": SignatureHelpTriggerKind,
    "CodeActionTriggerKind": CodeActionTriggerKind,
    "FileOperationPatternKind": FileOperationPatternKind,
    "NotebookCellKind": NotebookCellKind,
    "ResourceOperationKind": ResourceOperationKind,
    "FailureHandlingKind": FailureHandlingKind,
    "PrepareSupportDefaultBehavior": PrepareSupportDefaultBehavior,
    "TokenFormat": TokenFormat,
    "Definition": Definition,
    "DefinitionLink": DefinitionLink,
    "LSPArray": LSPArray,
    "LSPAny": LSPAny,
    "Declaration": Declaration,
    "DeclarationLink": DeclarationLink,
    "InlineValue": InlineValue,
    "DocumentDiagnosticReport": DocumentDiagnosticReport,
    "PrepareRenameResult_Type1": PrepareRenameResult_Type1,
    "PrepareRenameResult_Type2": PrepareRenameResult_Type2,
    "PrepareRenameResult": PrepareRenameResult,
    "URI": URI,
    "ProgressToken": ProgressToken,
    "DocumentSelector": DocumentSelector,
    "ChangeAnnotationIdentifier": ChangeAnnotationIdentifier,
    "WorkspaceDocumentDiagnosticReport": WorkspaceDocumentDiagnosticReport,
    "TextDocumentContentChangeEvent_Type1": TextDocumentContentChangeEvent_Type1,
    "TextDocumentContentChangeEvent_Type2": TextDocumentContentChangeEvent_Type2,
    "TextDocumentContentChangeEvent": TextDocumentContentChangeEvent,
    "MarkedString_Type1": MarkedString_Type1,
    "MarkedString": MarkedString,
    "DocumentFilter": DocumentFilter,
    "GlobPattern": GlobPattern,
    "TextDocumentFilter_Type1": TextDocumentFilter_Type1,
    "TextDocumentFilter_Type2": TextDocumentFilter_Type2,
    "TextDocumentFilter_Type3": TextDocumentFilter_Type3,
    "TextDocumentFilter": TextDocumentFilter,
    "NotebookDocumentFilter_Type1": NotebookDocumentFilter_Type1,
    "NotebookDocumentFilter_Type2": NotebookDocumentFilter_Type2,
    "NotebookDocumentFilter_Type3": NotebookDocumentFilter_Type3,
    "NotebookDocumentFilter": NotebookDocumentFilter,
    "Pattern": Pattern,
    "TextDocumentPositionParams": TextDocumentPositionParams,
    "WorkDoneProgressParams": WorkDoneProgressParams,
    "PartialResultParams": PartialResultParams,
    "ImplementationParams": ImplementationParams,
    "Location": Location,
    "TextDocumentRegistrationOptions": TextDocumentRegistrationOptions,
    "WorkDoneProgressOptions": WorkDoneProgressOptions,
    "ImplementationOptions": ImplementationOptions,
    "StaticRegistrationOptions": StaticRegistrationOptions,
    "ImplementationRegistrationOptions": ImplementationRegistrationOptions,
    "TypeDefinitionParams": TypeDefinitionParams,
    "TypeDefinitionOptions": TypeDefinitionOptions,
    "TypeDefinitionRegistrationOptions": TypeDefinitionRegistrationOptions,
    "WorkspaceFolder": WorkspaceFolder,
    "DidChangeWorkspaceFoldersParams": DidChangeWorkspaceFoldersParams,
    "ConfigurationParams": ConfigurationParams,
    "DocumentColorParams": DocumentColorParams,
    "ColorInformation": ColorInformation,
    "DocumentColorOptions": DocumentColorOptions,
    "DocumentColorRegistrationOptions": DocumentColorRegistrationOptions,
    "ColorPresentationParams": ColorPresentationParams,
    "ColorPresentation": ColorPresentation,
    "FoldingRangeParams": FoldingRangeParams,
    "FoldingRange": FoldingRange,
    "FoldingRangeOptions": FoldingRangeOptions,
    "FoldingRangeRegistrationOptions": FoldingRangeRegistrationOptions,
    "DeclarationParams": DeclarationParams,
    "DeclarationOptions": DeclarationOptions,
    "DeclarationRegistrationOptions": DeclarationRegistrationOptions,
    "SelectionRangeParams": SelectionRangeParams,
    "SelectionRange": SelectionRange,
    "SelectionRangeOptions": SelectionRangeOptions,
    "SelectionRangeRegistrationOptions": SelectionRangeRegistrationOptions,
    "WorkDoneProgressCreateParams": WorkDoneProgressCreateParams,
    "WorkDoneProgressCancelParams": WorkDoneProgressCancelParams,
    "CallHierarchyPrepareParams": CallHierarchyPrepareParams,
    "CallHierarchyItem": CallHierarchyItem,
    "CallHierarchyOptions": CallHierarchyOptions,
    "CallHierarchyRegistrationOptions": CallHierarchyRegistrationOptions,
    "CallHierarchyIncomingCallsParams": CallHierarchyIncomingCallsParams,
    "CallHierarchyIncomingCall": CallHierarchyIncomingCall,
    "CallHierarchyOutgoingCallsParams": CallHierarchyOutgoingCallsParams,
    "CallHierarchyOutgoingCall": CallHierarchyOutgoingCall,
    "SemanticTokensParams": SemanticTokensParams,
    "SemanticTokens": SemanticTokens,
    "SemanticTokensPartialResult": SemanticTokensPartialResult,
    "SemanticTokensOptions": SemanticTokensOptions,
    "SemanticTokensRegistrationOptions": SemanticTokensRegistrationOptions,
    "SemanticTokensDeltaParams": SemanticTokensDeltaParams,
    "SemanticTokensDelta": SemanticTokensDelta,
    "SemanticTokensDeltaPartialResult": SemanticTokensDeltaPartialResult,
    "SemanticTokensRangeParams": SemanticTokensRangeParams,
    "ShowDocumentParams": ShowDocumentParams,
    "ShowDocumentResult": ShowDocumentResult,
    "LinkedEditingRangeParams": LinkedEditingRangeParams,
    "LinkedEditingRanges": LinkedEditingRanges,
    "LinkedEditingRangeOptions": LinkedEditingRangeOptions,
    "LinkedEditingRangeRegistrationOptions": LinkedEditingRangeRegistrationOptions,
    "CreateFilesParams": CreateFilesParams,
    "WorkspaceEdit": WorkspaceEdit,
    "FileOperationRegistrationOptions": FileOperationRegistrationOptions,
    "RenameFilesParams": RenameFilesParams,
    "DeleteFilesParams": DeleteFilesParams,
    "MonikerParams": MonikerParams,
    "Moniker": Moniker,
    "MonikerOptions": MonikerOptions,
    "MonikerRegistrationOptions": MonikerRegistrationOptions,
    "TypeHierarchyPrepareParams": TypeHierarchyPrepareParams,
    "TypeHierarchyItem": TypeHierarchyItem,
    "TypeHierarchyOptions": TypeHierarchyOptions,
    "TypeHierarchyRegistrationOptions": TypeHierarchyRegistrationOptions,
    "TypeHierarchySupertypesParams": TypeHierarchySupertypesParams,
    "TypeHierarchySubtypesParams": TypeHierarchySubtypesParams,
    "InlineValueParams": InlineValueParams,
    "InlineValueOptions": InlineValueOptions,
    "InlineValueRegistrationOptions": InlineValueRegistrationOptions,
    "InlayHintParams": InlayHintParams,
    "InlayHint": InlayHint,
    "InlayHintOptions": InlayHintOptions,
    "InlayHintRegistrationOptions": InlayHintRegistrationOptions,
    "DocumentDiagnosticParams": DocumentDiagnosticParams,
    "DocumentDiagnosticReportPartialResult": DocumentDiagnosticReportPartialResult,
    "DiagnosticServerCancellationData": DiagnosticServerCancellationData,
    "DiagnosticOptions": DiagnosticOptions,
    "DiagnosticRegistrationOptions": DiagnosticRegistrationOptions,
    "WorkspaceDiagnosticParams": WorkspaceDiagnosticParams,
    "WorkspaceDiagnosticReport": WorkspaceDiagnosticReport,
    "WorkspaceDiagnosticReportPartialResult": WorkspaceDiagnosticReportPartialResult,
    "DidOpenNotebookDocumentParams": DidOpenNotebookDocumentParams,
    "DidChangeNotebookDocumentParams": DidChangeNotebookDocumentParams,
    "DidSaveNotebookDocumentParams": DidSaveNotebookDocumentParams,
    "DidCloseNotebookDocumentParams": DidCloseNotebookDocumentParams,
    "RegistrationParams": RegistrationParams,
    "UnregistrationParams": UnregistrationParams,
    "_InitializeParams": _InitializeParams,
    "WorkspaceFoldersInitializeParams": WorkspaceFoldersInitializeParams,
    "InitializeParams": InitializeParams,
    "InitializeResult": InitializeResult,
    "InitializeError": InitializeError,
    "InitializedParams": InitializedParams,
    "DidChangeConfigurationParams": DidChangeConfigurationParams,
    "DidChangeConfigurationRegistrationOptions": DidChangeConfigurationRegistrationOptions,
    "ShowMessageParams": ShowMessageParams,
    "ShowMessageRequestParams": ShowMessageRequestParams,
    "MessageActionItem": MessageActionItem,
    "LogMessageParams": LogMessageParams,
    "DidOpenTextDocumentParams": DidOpenTextDocumentParams,
    "DidChangeTextDocumentParams": DidChangeTextDocumentParams,
    "TextDocumentChangeRegistrationOptions": TextDocumentChangeRegistrationOptions,
    "DidCloseTextDocumentParams": DidCloseTextDocumentParams,
    "DidSaveTextDocumentParams": DidSaveTextDocumentParams,
    "SaveOptions": SaveOptions,
    "TextDocumentSaveRegistrationOptions": TextDocumentSaveRegistrationOptions,
    "WillSaveTextDocumentParams": WillSaveTextDocumentParams,
    "TextEdit": TextEdit,
    "DidChangeWatchedFilesParams": DidChangeWatchedFilesParams,
    "DidChangeWatchedFilesRegistrationOptions": DidChangeWatchedFilesRegistrationOptions,
    "PublishDiagnosticsParams": PublishDiagnosticsParams,
    "CompletionParams": CompletionParams,
    "CompletionItem": CompletionItem,
    "CompletionList": CompletionList,
    "CompletionOptions": CompletionOptions,
    "CompletionRegistrationOptions": CompletionRegistrationOptions,
    "HoverParams": HoverParams,
    "Hover": Hover,
    "HoverOptions": HoverOptions,
    "HoverRegistrationOptions": HoverRegistrationOptions,
    "SignatureHelpParams": SignatureHelpParams,
    "SignatureHelp": SignatureHelp,
    "SignatureHelpOptions": SignatureHelpOptions,
    "SignatureHelpRegistrationOptions": SignatureHelpRegistrationOptions,
    "DefinitionParams": DefinitionParams,
    "DefinitionOptions": DefinitionOptions,
    "DefinitionRegistrationOptions": DefinitionRegistrationOptions,
    "ReferenceParams": ReferenceParams,
    "ReferenceOptions": ReferenceOptions,
    "ReferenceRegistrationOptions": ReferenceRegistrationOptions,
    "DocumentHighlightParams": DocumentHighlightParams,
    "DocumentHighlight": DocumentHighlight,
    "DocumentHighlightOptions": DocumentHighlightOptions,
    "DocumentHighlightRegistrationOptions": DocumentHighlightRegistrationOptions,
    "DocumentSymbolParams": DocumentSymbolParams,
    "BaseSymbolInformation": BaseSymbolInformation,
    "SymbolInformation": SymbolInformation,
    "DocumentSymbol": DocumentSymbol,
    "DocumentSymbolOptions": DocumentSymbolOptions,
    "DocumentSymbolRegistrationOptions": DocumentSymbolRegistrationOptions,
    "CodeActionParams": CodeActionParams,
    "Command": Command,
    "CodeAction": CodeAction,
    "CodeActionOptions": CodeActionOptions,
    "CodeActionRegistrationOptions": CodeActionRegistrationOptions,
    "WorkspaceSymbolParams": WorkspaceSymbolParams,
    "WorkspaceSymbol": WorkspaceSymbol,
    "WorkspaceSymbolOptions": WorkspaceSymbolOptions,
    "WorkspaceSymbolRegistrationOptions": WorkspaceSymbolRegistrationOptions,
    "CodeLensParams": CodeLensParams,
    "CodeLens": CodeLens,
    "CodeLensOptions": CodeLensOptions,
    "CodeLensRegistrationOptions": CodeLensRegistrationOptions,
    "DocumentLinkParams": DocumentLinkParams,
    "DocumentLink": DocumentLink,
    "DocumentLinkOptions": DocumentLinkOptions,
    "DocumentLinkRegistrationOptions": DocumentLinkRegistrationOptions,
    "DocumentFormattingParams": DocumentFormattingParams,
    "DocumentFormattingOptions": DocumentFormattingOptions,
    "DocumentFormattingRegistrationOptions": DocumentFormattingRegistrationOptions,
    "DocumentRangeFormattingParams": DocumentRangeFormattingParams,
    "DocumentRangeFormattingOptions": DocumentRangeFormattingOptions,
    "DocumentRangeFormattingRegistrationOptions": DocumentRangeFormattingRegistrationOptions,
    "DocumentOnTypeFormattingParams": DocumentOnTypeFormattingParams,
    "DocumentOnTypeFormattingOptions": DocumentOnTypeFormattingOptions,
    "DocumentOnTypeFormattingRegistrationOptions": DocumentOnTypeFormattingRegistrationOptions,
    "RenameParams": RenameParams,
    "RenameOptions": RenameOptions,
    "RenameRegistrationOptions": RenameRegistrationOptions,
    "PrepareRenameParams": PrepareRenameParams,
    "ExecuteCommandParams": ExecuteCommandParams,
    "ExecuteCommandOptions": ExecuteCommandOptions,
    "ExecuteCommandRegistrationOptions": ExecuteCommandRegistrationOptions,
    "ApplyWorkspaceEditParams": ApplyWorkspaceEditParams,
    "ApplyWorkspaceEditResult": ApplyWorkspaceEditResult,
    "WorkDoneProgressBegin": WorkDoneProgressBegin,
    "WorkDoneProgressReport": WorkDoneProgressReport,
    "WorkDoneProgressEnd": WorkDoneProgressEnd,
    "SetTraceParams": SetTraceParams,
    "LogTraceParams": LogTraceParams,
    "CancelParams": CancelParams,
    "ProgressParams": ProgressParams,
    "LocationLink": LocationLink,
    "Range": Range,
    "WorkspaceFoldersChangeEvent": WorkspaceFoldersChangeEvent,
    "ConfigurationItem": ConfigurationItem,
    "TextDocumentIdentifier": TextDocumentIdentifier,
    "Color": Color,
    "Position": Position,
    "SemanticTokensEdit": SemanticTokensEdit,
    "FileCreate": FileCreate,
    "TextDocumentEdit": TextDocumentEdit,
    "ResourceOperation": ResourceOperation,
    "CreateFile": CreateFile,
    "RenameFile": RenameFile,
    "DeleteFile": DeleteFile,
    "ChangeAnnotation": ChangeAnnotation,
    "FileOperationFilter": FileOperationFilter,
    "FileRename": FileRename,
    "FileDelete": FileDelete,
    "InlineValueContext": InlineValueContext,
    "InlineValueText": InlineValueText,
    "InlineValueVariableLookup": InlineValueVariableLookup,
    "InlineValueEvaluatableExpression": InlineValueEvaluatableExpression,
    "InlayHintLabelPart": InlayHintLabelPart,
    "MarkupContent": MarkupContent,
    "FullDocumentDiagnosticReport": FullDocumentDiagnosticReport,
    "RelatedFullDocumentDiagnosticReport": RelatedFullDocumentDiagnosticReport,
    "UnchangedDocumentDiagnosticReport": UnchangedDocumentDiagnosticReport,
    "RelatedUnchangedDocumentDiagnosticReport": RelatedUnchangedDocumentDiagnosticReport,
    "PreviousResultId": PreviousResultId,
    "NotebookDocument": NotebookDocument,
    "TextDocumentItem": TextDocumentItem,
    "VersionedNotebookDocumentIdentifier": VersionedNotebookDocumentIdentifier,
    "NotebookDocumentChangeEvent": NotebookDocumentChangeEvent,
    "NotebookDocumentIdentifier": NotebookDocumentIdentifier,
    "Registration": Registration,
    "Unregistration": Unregistration,
    "ServerCapabilities": ServerCapabilities,
    "VersionedTextDocumentIdentifier": VersionedTextDocumentIdentifier,
    "FileEvent": FileEvent,
    "FileSystemWatcher": FileSystemWatcher,
    "Diagnostic": Diagnostic,
    "CompletionContext": CompletionContext,
    "CompletionItemLabelDetails": CompletionItemLabelDetails,
    "InsertReplaceEdit": InsertReplaceEdit,
    "SignatureHelpContext": SignatureHelpContext,
    "SignatureInformation": SignatureInformation,
    "ReferenceContext": ReferenceContext,
    "CodeActionContext": CodeActionContext,
    "FormattingOptions": FormattingOptions,
    "SemanticTokensLegend": SemanticTokensLegend,
    "OptionalVersionedTextDocumentIdentifier": OptionalVersionedTextDocumentIdentifier,
    "AnnotatedTextEdit": AnnotatedTextEdit,
    "CreateFileOptions": CreateFileOptions,
    "RenameFileOptions": RenameFileOptions,
    "DeleteFileOptions": DeleteFileOptions,
    "FileOperationPattern": FileOperationPattern,
    "WorkspaceFullDocumentDiagnosticReport": WorkspaceFullDocumentDiagnosticReport,
    "WorkspaceUnchangedDocumentDiagnosticReport": WorkspaceUnchangedDocumentDiagnosticReport,
    "LSPObject": LSPObject,
    "NotebookCell": NotebookCell,
    "NotebookCellArrayChange": NotebookCellArrayChange,
    "ClientCapabilities": ClientCapabilities,
    "TextDocumentSyncOptions": TextDocumentSyncOptions,
    "NotebookDocumentSyncOptions": NotebookDocumentSyncOptions,
    "NotebookDocumentSyncRegistrationOptions": NotebookDocumentSyncRegistrationOptions,
    "WorkspaceFoldersServerCapabilities": WorkspaceFoldersServerCapabilities,
    "FileOperationOptions": FileOperationOptions,
    "CodeDescription": CodeDescription,
    "DiagnosticRelatedInformation": DiagnosticRelatedInformation,
    "ParameterInformation": ParameterInformation,
    "NotebookCellTextDocumentFilter": NotebookCellTextDocumentFilter,
    "FileOperationPatternOptions": FileOperationPatternOptions,
    "ExecutionSummary": ExecutionSummary,
    "WorkspaceClientCapabilities": WorkspaceClientCapabilities,
    "TextDocumentClientCapabilities": TextDocumentClientCapabilities,
    "NotebookDocumentClientCapabilities": NotebookDocumentClientCapabilities,
    "WindowClientCapabilities": WindowClientCapabilities,
    "GeneralClientCapabilities": GeneralClientCapabilities,
    "RelativePattern": RelativePattern,
    "WorkspaceEditClientCapabilities": WorkspaceEditClientCapabilities,
    "DidChangeConfigurationClientCapabilities": DidChangeConfigurationClientCapabilities,
    "DidChangeWatchedFilesClientCapabilities": DidChangeWatchedFilesClientCapabilities,
    "WorkspaceSymbolClientCapabilities": WorkspaceSymbolClientCapabilities,
    "ExecuteCommandClientCapabilities": ExecuteCommandClientCapabilities,
    "SemanticTokensWorkspaceClientCapabilities": SemanticTokensWorkspaceClientCapabilities,
    "CodeLensWorkspaceClientCapabilities": CodeLensWorkspaceClientCapabilities,
    "FileOperationClientCapabilities": FileOperationClientCapabilities,
    "InlineValueWorkspaceClientCapabilities": InlineValueWorkspaceClientCapabilities,
    "InlayHintWorkspaceClientCapabilities": InlayHintWorkspaceClientCapabilities,
    "DiagnosticWorkspaceClientCapabilities": DiagnosticWorkspaceClientCapabilities,
    "TextDocumentSyncClientCapabilities": TextDocumentSyncClientCapabilities,
    "CompletionClientCapabilities": CompletionClientCapabilities,
    "HoverClientCapabilities": HoverClientCapabilities,
    "SignatureHelpClientCapabilities": SignatureHelpClientCapabilities,
    "DeclarationClientCapabilities": DeclarationClientCapabilities,
    "DefinitionClientCapabilities": DefinitionClientCapabilities,
    "TypeDefinitionClientCapabilities": TypeDefinitionClientCapabilities,
    "ImplementationClientCapabilities": ImplementationClientCapabilities,
    "ReferenceClientCapabilities": ReferenceClientCapabilities,
    "DocumentHighlightClientCapabilities": DocumentHighlightClientCapabilities,
    "DocumentSymbolClientCapabilities": DocumentSymbolClientCapabilities,
    "CodeActionClientCapabilities": CodeActionClientCapabilities,
    "CodeLensClientCapabilities": CodeLensClientCapabilities,
    "DocumentLinkClientCapabilities": DocumentLinkClientCapabilities,
    "DocumentColorClientCapabilities": DocumentColorClientCapabilities,
    "DocumentFormattingClientCapabilities": DocumentFormattingClientCapabilities,
    "DocumentRangeFormattingClientCapabilities": DocumentRangeFormattingClientCapabilities,
    "DocumentOnTypeFormattingClientCapabilities": DocumentOnTypeFormattingClientCapabilities,
    "RenameClientCapabilities": RenameClientCapabilities,
    "FoldingRangeClientCapabilities": FoldingRangeClientCapabilities,
    "SelectionRangeClientCapabilities": SelectionRangeClientCapabilities,
    "PublishDiagnosticsClientCapabilities": PublishDiagnosticsClientCapabilities,
    "CallHierarchyClientCapabilities": CallHierarchyClientCapabilities,
    "SemanticTokensClientCapabilities": SemanticTokensClientCapabilities,
    "LinkedEditingRangeClientCapabilities": LinkedEditingRangeClientCapabilities,
    "MonikerClientCapabilities": MonikerClientCapabilities,
    "TypeHierarchyClientCapabilities": TypeHierarchyClientCapabilities,
    "InlineValueClientCapabilities": InlineValueClientCapabilities,
    "InlayHintClientCapabilities": InlayHintClientCapabilities,
    "DiagnosticClientCapabilities": DiagnosticClientCapabilities,
    "NotebookDocumentSyncClientCapabilities": NotebookDocumentSyncClientCapabilities,
    "ShowMessageRequestClientCapabilities": ShowMessageRequestClientCapabilities,
    "ShowDocumentClientCapabilities": ShowDocumentClientCapabilities,
    "RegularExpressionsClientCapabilities": RegularExpressionsClientCapabilities,
    "MarkdownClientCapabilities": MarkdownClientCapabilities,
    "WorkspaceConfigurationParams": WorkspaceConfigurationParams,
    "TextDocumentColorPresentationOptions": TextDocumentColorPresentationOptions,
    "ResponseErrorMessage": ResponseErrorMessage,
    "TextDocumentImplementationRequest": TextDocumentImplementationRequest,
    "TextDocumentImplementationResponse": TextDocumentImplementationResponse,
    "TextDocumentTypeDefinitionRequest": TextDocumentTypeDefinitionRequest,
    "TextDocumentTypeDefinitionResponse": TextDocumentTypeDefinitionResponse,
    "WorkspaceWorkspaceFoldersRequest": WorkspaceWorkspaceFoldersRequest,
    "WorkspaceWorkspaceFoldersResponse": WorkspaceWorkspaceFoldersResponse,
    "WorkspaceConfigurationRequest": WorkspaceConfigurationRequest,
    "WorkspaceConfigurationResponse": WorkspaceConfigurationResponse,
    "TextDocumentDocumentColorRequest": TextDocumentDocumentColorRequest,
    "TextDocumentDocumentColorResponse": TextDocumentDocumentColorResponse,
    "TextDocumentColorPresentationRequest": TextDocumentColorPresentationRequest,
    "TextDocumentColorPresentationResponse": TextDocumentColorPresentationResponse,
    "TextDocumentFoldingRangeRequest": TextDocumentFoldingRangeRequest,
    "TextDocumentFoldingRangeResponse": TextDocumentFoldingRangeResponse,
    "TextDocumentDeclarationRequest": TextDocumentDeclarationRequest,
    "TextDocumentDeclarationResponse": TextDocumentDeclarationResponse,
    "TextDocumentSelectionRangeRequest": TextDocumentSelectionRangeRequest,
    "TextDocumentSelectionRangeResponse": TextDocumentSelectionRangeResponse,
    "WindowWorkDoneProgressCreateRequest": WindowWorkDoneProgressCreateRequest,
    "WindowWorkDoneProgressCreateResponse": WindowWorkDoneProgressCreateResponse,
    "TextDocumentPrepareCallHierarchyRequest": TextDocumentPrepareCallHierarchyRequest,
    "TextDocumentPrepareCallHierarchyResponse": TextDocumentPrepareCallHierarchyResponse,
    "CallHierarchyIncomingCallsRequest": CallHierarchyIncomingCallsRequest,
    "CallHierarchyIncomingCallsResponse": CallHierarchyIncomingCallsResponse,
    "CallHierarchyOutgoingCallsRequest": CallHierarchyOutgoingCallsRequest,
    "CallHierarchyOutgoingCallsResponse": CallHierarchyOutgoingCallsResponse,
    "TextDocumentSemanticTokensFullRequest": TextDocumentSemanticTokensFullRequest,
    "TextDocumentSemanticTokensFullResponse": TextDocumentSemanticTokensFullResponse,
    "TextDocumentSemanticTokensFullDeltaRequest": TextDocumentSemanticTokensFullDeltaRequest,
    "TextDocumentSemanticTokensFullDeltaResponse": TextDocumentSemanticTokensFullDeltaResponse,
    "TextDocumentSemanticTokensRangeRequest": TextDocumentSemanticTokensRangeRequest,
    "TextDocumentSemanticTokensRangeResponse": TextDocumentSemanticTokensRangeResponse,
    "WorkspaceSemanticTokensRefreshRequest": WorkspaceSemanticTokensRefreshRequest,
    "WorkspaceSemanticTokensRefreshResponse": WorkspaceSemanticTokensRefreshResponse,
    "WindowShowDocumentRequest": WindowShowDocumentRequest,
    "WindowShowDocumentResponse": WindowShowDocumentResponse,
    "TextDocumentLinkedEditingRangeRequest": TextDocumentLinkedEditingRangeRequest,
    "TextDocumentLinkedEditingRangeResponse": TextDocumentLinkedEditingRangeResponse,
    "WorkspaceWillCreateFilesRequest": WorkspaceWillCreateFilesRequest,
    "WorkspaceWillCreateFilesResponse": WorkspaceWillCreateFilesResponse,
    "WorkspaceWillRenameFilesRequest": WorkspaceWillRenameFilesRequest,
    "WorkspaceWillRenameFilesResponse": WorkspaceWillRenameFilesResponse,
    "WorkspaceWillDeleteFilesRequest": WorkspaceWillDeleteFilesRequest,
    "WorkspaceWillDeleteFilesResponse": WorkspaceWillDeleteFilesResponse,
    "TextDocumentMonikerRequest": TextDocumentMonikerRequest,
    "TextDocumentMonikerResponse": TextDocumentMonikerResponse,
    "TextDocumentPrepareTypeHierarchyRequest": TextDocumentPrepareTypeHierarchyRequest,
    "TextDocumentPrepareTypeHierarchyResponse": TextDocumentPrepareTypeHierarchyResponse,
    "TypeHierarchySupertypesRequest": TypeHierarchySupertypesRequest,
    "TypeHierarchySupertypesResponse": TypeHierarchySupertypesResponse,
    "TypeHierarchySubtypesRequest": TypeHierarchySubtypesRequest,
    "TypeHierarchySubtypesResponse": TypeHierarchySubtypesResponse,
    "TextDocumentInlineValueRequest": TextDocumentInlineValueRequest,
    "TextDocumentInlineValueResponse": TextDocumentInlineValueResponse,
    "WorkspaceInlineValueRefreshRequest": WorkspaceInlineValueRefreshRequest,
    "WorkspaceInlineValueRefreshResponse": WorkspaceInlineValueRefreshResponse,
    "TextDocumentInlayHintRequest": TextDocumentInlayHintRequest,
    "TextDocumentInlayHintResponse": TextDocumentInlayHintResponse,
    "InlayHintResolveRequest": InlayHintResolveRequest,
    "InlayHintResolveResponse": InlayHintResolveResponse,
    "WorkspaceInlayHintRefreshRequest": WorkspaceInlayHintRefreshRequest,
    "WorkspaceInlayHintRefreshResponse": WorkspaceInlayHintRefreshResponse,
    "TextDocumentDiagnosticRequest": TextDocumentDiagnosticRequest,
    "TextDocumentDiagnosticResponse": TextDocumentDiagnosticResponse,
    "WorkspaceDiagnosticRequest": WorkspaceDiagnosticRequest,
    "WorkspaceDiagnosticResponse": WorkspaceDiagnosticResponse,
    "WorkspaceDiagnosticRefreshRequest": WorkspaceDiagnosticRefreshRequest,
    "WorkspaceDiagnosticRefreshResponse": WorkspaceDiagnosticRefreshResponse,
    "ClientRegisterCapabilityRequest": ClientRegisterCapabilityRequest,
    "ClientRegisterCapabilityResponse": ClientRegisterCapabilityResponse,
    "ClientUnregisterCapabilityRequest": ClientUnregisterCapabilityRequest,
    "ClientUnregisterCapabilityResponse": ClientUnregisterCapabilityResponse,
    "InitializeRequest": InitializeRequest,
    "InitializeResponse": InitializeResponse,
    "ShutdownRequest": ShutdownRequest,
    "ShutdownResponse": ShutdownResponse,
    "WindowShowMessageRequestRequest": WindowShowMessageRequestRequest,
    "WindowShowMessageRequestResponse": WindowShowMessageRequestResponse,
    "TextDocumentWillSaveWaitUntilRequest": TextDocumentWillSaveWaitUntilRequest,
    "TextDocumentWillSaveWaitUntilResponse": TextDocumentWillSaveWaitUntilResponse,
    "TextDocumentCompletionRequest": TextDocumentCompletionRequest,
    "TextDocumentCompletionResponse": TextDocumentCompletionResponse,
    "CompletionItemResolveRequest": CompletionItemResolveRequest,
    "CompletionItemResolveResponse": CompletionItemResolveResponse,
    "TextDocumentHoverRequest": TextDocumentHoverRequest,
    "TextDocumentHoverResponse": TextDocumentHoverResponse,
    "TextDocumentSignatureHelpRequest": TextDocumentSignatureHelpRequest,
    "TextDocumentSignatureHelpResponse": TextDocumentSignatureHelpResponse,
    "TextDocumentDefinitionRequest": TextDocumentDefinitionRequest,
    "TextDocumentDefinitionResponse": TextDocumentDefinitionResponse,
    "TextDocumentReferencesRequest": TextDocumentReferencesRequest,
    "TextDocumentReferencesResponse": TextDocumentReferencesResponse,
    "TextDocumentDocumentHighlightRequest": TextDocumentDocumentHighlightRequest,
    "TextDocumentDocumentHighlightResponse": TextDocumentDocumentHighlightResponse,
    "TextDocumentDocumentSymbolRequest": TextDocumentDocumentSymbolRequest,
    "TextDocumentDocumentSymbolResponse": TextDocumentDocumentSymbolResponse,
    "TextDocumentCodeActionRequest": TextDocumentCodeActionRequest,
    "TextDocumentCodeActionResponse": TextDocumentCodeActionResponse,
    "CodeActionResolveRequest": CodeActionResolveRequest,
    "CodeActionResolveResponse": CodeActionResolveResponse,
    "WorkspaceSymbolRequest": WorkspaceSymbolRequest,
    "WorkspaceSymbolResponse": WorkspaceSymbolResponse,
    "WorkspaceSymbolResolveRequest": WorkspaceSymbolResolveRequest,
    "WorkspaceSymbolResolveResponse": WorkspaceSymbolResolveResponse,
    "TextDocumentCodeLensRequest": TextDocumentCodeLensRequest,
    "TextDocumentCodeLensResponse": TextDocumentCodeLensResponse,
    "CodeLensResolveRequest": CodeLensResolveRequest,
    "CodeLensResolveResponse": CodeLensResolveResponse,
    "WorkspaceCodeLensRefreshRequest": WorkspaceCodeLensRefreshRequest,
    "WorkspaceCodeLensRefreshResponse": WorkspaceCodeLensRefreshResponse,
    "TextDocumentDocumentLinkRequest": TextDocumentDocumentLinkRequest,
    "TextDocumentDocumentLinkResponse": TextDocumentDocumentLinkResponse,
    "DocumentLinkResolveRequest": DocumentLinkResolveRequest,
    "DocumentLinkResolveResponse": DocumentLinkResolveResponse,
    "TextDocumentFormattingRequest": TextDocumentFormattingRequest,
    "TextDocumentFormattingResponse": TextDocumentFormattingResponse,
    "TextDocumentRangeFormattingRequest": TextDocumentRangeFormattingRequest,
    "TextDocumentRangeFormattingResponse": TextDocumentRangeFormattingResponse,
    "TextDocumentOnTypeFormattingRequest": TextDocumentOnTypeFormattingRequest,
    "TextDocumentOnTypeFormattingResponse": TextDocumentOnTypeFormattingResponse,
    "TextDocumentRenameRequest": TextDocumentRenameRequest,
    "TextDocumentRenameResponse": TextDocumentRenameResponse,
    "TextDocumentPrepareRenameRequest": TextDocumentPrepareRenameRequest,
    "TextDocumentPrepareRenameResponse": TextDocumentPrepareRenameResponse,
    "WorkspaceExecuteCommandRequest": WorkspaceExecuteCommandRequest,
    "WorkspaceExecuteCommandResponse": WorkspaceExecuteCommandResponse,
    "WorkspaceApplyEditRequest": WorkspaceApplyEditRequest,
    "WorkspaceApplyEditResponse": WorkspaceApplyEditResponse,
    "WorkspaceDidChangeWorkspaceFoldersNotification": WorkspaceDidChangeWorkspaceFoldersNotification,
    "WindowWorkDoneProgressCancelNotification": WindowWorkDoneProgressCancelNotification,
    "WorkspaceDidCreateFilesNotification": WorkspaceDidCreateFilesNotification,
    "WorkspaceDidRenameFilesNotification": WorkspaceDidRenameFilesNotification,
    "WorkspaceDidDeleteFilesNotification": WorkspaceDidDeleteFilesNotification,
    "NotebookDocumentDidOpenNotification": NotebookDocumentDidOpenNotification,
    "NotebookDocumentDidChangeNotification": NotebookDocumentDidChangeNotification,
    "NotebookDocumentDidSaveNotification": NotebookDocumentDidSaveNotification,
    "NotebookDocumentDidCloseNotification": NotebookDocumentDidCloseNotification,
    "InitializedNotification": InitializedNotification,
    "ExitNotification": ExitNotification,
    "WorkspaceDidChangeConfigurationNotification": WorkspaceDidChangeConfigurationNotification,
    "WindowShowMessageNotification": WindowShowMessageNotification,
    "WindowLogMessageNotification": WindowLogMessageNotification,
    "TelemetryEventNotification": TelemetryEventNotification,
    "TextDocumentDidOpenNotification": TextDocumentDidOpenNotification,
    "TextDocumentDidChangeNotification": TextDocumentDidChangeNotification,
    "TextDocumentDidCloseNotification": TextDocumentDidCloseNotification,
    "TextDocumentDidSaveNotification": TextDocumentDidSaveNotification,
    "TextDocumentWillSaveNotification": TextDocumentWillSaveNotification,
    "WorkspaceDidChangeWatchedFilesNotification": WorkspaceDidChangeWatchedFilesNotification,
    "TextDocumentPublishDiagnosticsNotification": TextDocumentPublishDiagnosticsNotification,
    "SetTraceNotification": SetTraceNotification,
    "LogTraceNotification": LogTraceNotification,
    "CancelRequestNotification": CancelRequestNotification,
    "ProgressNotification": ProgressNotification,
    "ImplementationParams": ImplementationParams,
    "ImplementationRegistrationOptions": ImplementationRegistrationOptions,
    "TextDocumentImplementationRequest": TextDocumentImplementationRequest,
    "TextDocumentImplementationResponse": TextDocumentImplementationResponse,
    "TypeDefinitionParams": TypeDefinitionParams,
    "TypeDefinitionRegistrationOptions": TypeDefinitionRegistrationOptions,
    "TextDocumentTypeDefinitionRequest": TextDocumentTypeDefinitionRequest,
    "TextDocumentTypeDefinitionResponse": TextDocumentTypeDefinitionResponse,
    "WorkspaceWorkspaceFoldersRequest": WorkspaceWorkspaceFoldersRequest,
    "WorkspaceWorkspaceFoldersResponse": WorkspaceWorkspaceFoldersResponse,
    "WorkspaceConfigurationParams": WorkspaceConfigurationParams,
    "WorkspaceConfigurationRequest": WorkspaceConfigurationRequest,
    "WorkspaceConfigurationResponse": WorkspaceConfigurationResponse,
    "DocumentColorParams": DocumentColorParams,
    "DocumentColorRegistrationOptions": DocumentColorRegistrationOptions,
    "TextDocumentDocumentColorRequest": TextDocumentDocumentColorRequest,
    "TextDocumentDocumentColorResponse": TextDocumentDocumentColorResponse,
    "ColorPresentationParams": ColorPresentationParams,
    "TextDocumentColorPresentationOptions": TextDocumentColorPresentationOptions,
    "TextDocumentColorPresentationRequest": TextDocumentColorPresentationRequest,
    "TextDocumentColorPresentationResponse": TextDocumentColorPresentationResponse,
    "FoldingRangeParams": FoldingRangeParams,
    "FoldingRangeRegistrationOptions": FoldingRangeRegistrationOptions,
    "TextDocumentFoldingRangeRequest": TextDocumentFoldingRangeRequest,
    "TextDocumentFoldingRangeResponse": TextDocumentFoldingRangeResponse,
    "DeclarationParams": DeclarationParams,
    "DeclarationRegistrationOptions": DeclarationRegistrationOptions,
    "TextDocumentDeclarationRequest": TextDocumentDeclarationRequest,
    "TextDocumentDeclarationResponse": TextDocumentDeclarationResponse,
    "SelectionRangeParams": SelectionRangeParams,
    "SelectionRangeRegistrationOptions": SelectionRangeRegistrationOptions,
    "TextDocumentSelectionRangeRequest": TextDocumentSelectionRangeRequest,
    "TextDocumentSelectionRangeResponse": TextDocumentSelectionRangeResponse,
    "WorkDoneProgressCreateParams": WorkDoneProgressCreateParams,
    "WindowWorkDoneProgressCreateRequest": WindowWorkDoneProgressCreateRequest,
    "WindowWorkDoneProgressCreateResponse": WindowWorkDoneProgressCreateResponse,
    "CallHierarchyPrepareParams": CallHierarchyPrepareParams,
    "CallHierarchyRegistrationOptions": CallHierarchyRegistrationOptions,
    "TextDocumentPrepareCallHierarchyRequest": TextDocumentPrepareCallHierarchyRequest,
    "TextDocumentPrepareCallHierarchyResponse": TextDocumentPrepareCallHierarchyResponse,
    "CallHierarchyIncomingCallsParams": CallHierarchyIncomingCallsParams,
    "CallHierarchyIncomingCallsRequest": CallHierarchyIncomingCallsRequest,
    "CallHierarchyIncomingCallsResponse": CallHierarchyIncomingCallsResponse,
    "CallHierarchyOutgoingCallsParams": CallHierarchyOutgoingCallsParams,
    "CallHierarchyOutgoingCallsRequest": CallHierarchyOutgoingCallsRequest,
    "CallHierarchyOutgoingCallsResponse": CallHierarchyOutgoingCallsResponse,
    "SemanticTokensParams": SemanticTokensParams,
    "SemanticTokensRegistrationOptions": SemanticTokensRegistrationOptions,
    "TextDocumentSemanticTokensFullRequest": TextDocumentSemanticTokensFullRequest,
    "TextDocumentSemanticTokensFullResponse": TextDocumentSemanticTokensFullResponse,
    "SemanticTokensDeltaParams": SemanticTokensDeltaParams,
    "SemanticTokensRegistrationOptions": SemanticTokensRegistrationOptions,
    "TextDocumentSemanticTokensFullDeltaRequest": TextDocumentSemanticTokensFullDeltaRequest,
    "TextDocumentSemanticTokensFullDeltaResponse": TextDocumentSemanticTokensFullDeltaResponse,
    "SemanticTokensRangeParams": SemanticTokensRangeParams,
    "TextDocumentSemanticTokensRangeRequest": TextDocumentSemanticTokensRangeRequest,
    "TextDocumentSemanticTokensRangeResponse": TextDocumentSemanticTokensRangeResponse,
    "WorkspaceSemanticTokensRefreshRequest": WorkspaceSemanticTokensRefreshRequest,
    "WorkspaceSemanticTokensRefreshResponse": WorkspaceSemanticTokensRefreshResponse,
    "ShowDocumentParams": ShowDocumentParams,
    "WindowShowDocumentRequest": WindowShowDocumentRequest,
    "WindowShowDocumentResponse": WindowShowDocumentResponse,
    "LinkedEditingRangeParams": LinkedEditingRangeParams,
    "LinkedEditingRangeRegistrationOptions": LinkedEditingRangeRegistrationOptions,
    "TextDocumentLinkedEditingRangeRequest": TextDocumentLinkedEditingRangeRequest,
    "TextDocumentLinkedEditingRangeResponse": TextDocumentLinkedEditingRangeResponse,
    "CreateFilesParams": CreateFilesParams,
    "FileOperationRegistrationOptions": FileOperationRegistrationOptions,
    "WorkspaceWillCreateFilesRequest": WorkspaceWillCreateFilesRequest,
    "WorkspaceWillCreateFilesResponse": WorkspaceWillCreateFilesResponse,
    "RenameFilesParams": RenameFilesParams,
    "FileOperationRegistrationOptions": FileOperationRegistrationOptions,
    "WorkspaceWillRenameFilesRequest": WorkspaceWillRenameFilesRequest,
    "WorkspaceWillRenameFilesResponse": WorkspaceWillRenameFilesResponse,
    "DeleteFilesParams": DeleteFilesParams,
    "FileOperationRegistrationOptions": FileOperationRegistrationOptions,
    "WorkspaceWillDeleteFilesRequest": WorkspaceWillDeleteFilesRequest,
    "WorkspaceWillDeleteFilesResponse": WorkspaceWillDeleteFilesResponse,
    "MonikerParams": MonikerParams,
    "MonikerRegistrationOptions": MonikerRegistrationOptions,
    "TextDocumentMonikerRequest": TextDocumentMonikerRequest,
    "TextDocumentMonikerResponse": TextDocumentMonikerResponse,
    "TypeHierarchyPrepareParams": TypeHierarchyPrepareParams,
    "TypeHierarchyRegistrationOptions": TypeHierarchyRegistrationOptions,
    "TextDocumentPrepareTypeHierarchyRequest": TextDocumentPrepareTypeHierarchyRequest,
    "TextDocumentPrepareTypeHierarchyResponse": TextDocumentPrepareTypeHierarchyResponse,
    "TypeHierarchySupertypesParams": TypeHierarchySupertypesParams,
    "TypeHierarchySupertypesRequest": TypeHierarchySupertypesRequest,
    "TypeHierarchySupertypesResponse": TypeHierarchySupertypesResponse,
    "TypeHierarchySubtypesParams": TypeHierarchySubtypesParams,
    "TypeHierarchySubtypesRequest": TypeHierarchySubtypesRequest,
    "TypeHierarchySubtypesResponse": TypeHierarchySubtypesResponse,
    "InlineValueParams": InlineValueParams,
    "InlineValueRegistrationOptions": InlineValueRegistrationOptions,
    "TextDocumentInlineValueRequest": TextDocumentInlineValueRequest,
    "TextDocumentInlineValueResponse": TextDocumentInlineValueResponse,
    "WorkspaceInlineValueRefreshRequest": WorkspaceInlineValueRefreshRequest,
    "WorkspaceInlineValueRefreshResponse": WorkspaceInlineValueRefreshResponse,
    "InlayHintParams": InlayHintParams,
    "InlayHintRegistrationOptions": InlayHintRegistrationOptions,
    "TextDocumentInlayHintRequest": TextDocumentInlayHintRequest,
    "TextDocumentInlayHintResponse": TextDocumentInlayHintResponse,
    "InlayHint": InlayHint,
    "InlayHintResolveRequest": InlayHintResolveRequest,
    "InlayHintResolveResponse": InlayHintResolveResponse,
    "WorkspaceInlayHintRefreshRequest": WorkspaceInlayHintRefreshRequest,
    "WorkspaceInlayHintRefreshResponse": WorkspaceInlayHintRefreshResponse,
    "DocumentDiagnosticParams": DocumentDiagnosticParams,
    "DiagnosticRegistrationOptions": DiagnosticRegistrationOptions,
    "TextDocumentDiagnosticRequest": TextDocumentDiagnosticRequest,
    "TextDocumentDiagnosticResponse": TextDocumentDiagnosticResponse,
    "WorkspaceDiagnosticParams": WorkspaceDiagnosticParams,
    "WorkspaceDiagnosticRequest": WorkspaceDiagnosticRequest,
    "WorkspaceDiagnosticResponse": WorkspaceDiagnosticResponse,
    "WorkspaceDiagnosticRefreshRequest": WorkspaceDiagnosticRefreshRequest,
    "WorkspaceDiagnosticRefreshResponse": WorkspaceDiagnosticRefreshResponse,
    "RegistrationParams": RegistrationParams,
    "ClientRegisterCapabilityRequest": ClientRegisterCapabilityRequest,
    "ClientRegisterCapabilityResponse": ClientRegisterCapabilityResponse,
    "UnregistrationParams": UnregistrationParams,
    "ClientUnregisterCapabilityRequest": ClientUnregisterCapabilityRequest,
    "ClientUnregisterCapabilityResponse": ClientUnregisterCapabilityResponse,
    "InitializeParams": InitializeParams,
    "InitializeRequest": InitializeRequest,
    "InitializeResponse": InitializeResponse,
    "ShutdownRequest": ShutdownRequest,
    "ShutdownResponse": ShutdownResponse,
    "ShowMessageRequestParams": ShowMessageRequestParams,
    "WindowShowMessageRequestRequest": WindowShowMessageRequestRequest,
    "WindowShowMessageRequestResponse": WindowShowMessageRequestResponse,
    "WillSaveTextDocumentParams": WillSaveTextDocumentParams,
    "TextDocumentRegistrationOptions": TextDocumentRegistrationOptions,
    "TextDocumentWillSaveWaitUntilRequest": TextDocumentWillSaveWaitUntilRequest,
    "TextDocumentWillSaveWaitUntilResponse": TextDocumentWillSaveWaitUntilResponse,
    "CompletionParams": CompletionParams,
    "CompletionRegistrationOptions": CompletionRegistrationOptions,
    "TextDocumentCompletionRequest": TextDocumentCompletionRequest,
    "TextDocumentCompletionResponse": TextDocumentCompletionResponse,
    "CompletionItem": CompletionItem,
    "CompletionItemResolveRequest": CompletionItemResolveRequest,
    "CompletionItemResolveResponse": CompletionItemResolveResponse,
    "HoverParams": HoverParams,
    "HoverRegistrationOptions": HoverRegistrationOptions,
    "TextDocumentHoverRequest": TextDocumentHoverRequest,
    "TextDocumentHoverResponse": TextDocumentHoverResponse,
    "SignatureHelpParams": SignatureHelpParams,
    "SignatureHelpRegistrationOptions": SignatureHelpRegistrationOptions,
    "TextDocumentSignatureHelpRequest": TextDocumentSignatureHelpRequest,
    "TextDocumentSignatureHelpResponse": TextDocumentSignatureHelpResponse,
    "DefinitionParams": DefinitionParams,
    "DefinitionRegistrationOptions": DefinitionRegistrationOptions,
    "TextDocumentDefinitionRequest": TextDocumentDefinitionRequest,
    "TextDocumentDefinitionResponse": TextDocumentDefinitionResponse,
    "ReferenceParams": ReferenceParams,
    "ReferenceRegistrationOptions": ReferenceRegistrationOptions,
    "TextDocumentReferencesRequest": TextDocumentReferencesRequest,
    "TextDocumentReferencesResponse": TextDocumentReferencesResponse,
    "DocumentHighlightParams": DocumentHighlightParams,
    "DocumentHighlightRegistrationOptions": DocumentHighlightRegistrationOptions,
    "TextDocumentDocumentHighlightRequest": TextDocumentDocumentHighlightRequest,
    "TextDocumentDocumentHighlightResponse": TextDocumentDocumentHighlightResponse,
    "DocumentSymbolParams": DocumentSymbolParams,
    "DocumentSymbolRegistrationOptions": DocumentSymbolRegistrationOptions,
    "TextDocumentDocumentSymbolRequest": TextDocumentDocumentSymbolRequest,
    "TextDocumentDocumentSymbolResponse": TextDocumentDocumentSymbolResponse,
    "CodeActionParams": CodeActionParams,
    "CodeActionRegistrationOptions": CodeActionRegistrationOptions,
    "TextDocumentCodeActionRequest": TextDocumentCodeActionRequest,
    "TextDocumentCodeActionResponse": TextDocumentCodeActionResponse,
    "CodeAction": CodeAction,
    "CodeActionResolveRequest": CodeActionResolveRequest,
    "CodeActionResolveResponse": CodeActionResolveResponse,
    "WorkspaceSymbolParams": WorkspaceSymbolParams,
    "WorkspaceSymbolRegistrationOptions": WorkspaceSymbolRegistrationOptions,
    "WorkspaceSymbolRequest": WorkspaceSymbolRequest,
    "WorkspaceSymbolResponse": WorkspaceSymbolResponse,
    "WorkspaceSymbol": WorkspaceSymbol,
    "WorkspaceSymbolResolveRequest": WorkspaceSymbolResolveRequest,
    "WorkspaceSymbolResolveResponse": WorkspaceSymbolResolveResponse,
    "CodeLensParams": CodeLensParams,
    "CodeLensRegistrationOptions": CodeLensRegistrationOptions,
    "TextDocumentCodeLensRequest": TextDocumentCodeLensRequest,
    "TextDocumentCodeLensResponse": TextDocumentCodeLensResponse,
    "CodeLens": CodeLens,
    "CodeLensResolveRequest": CodeLensResolveRequest,
    "CodeLensResolveResponse": CodeLensResolveResponse,
    "WorkspaceCodeLensRefreshRequest": WorkspaceCodeLensRefreshRequest,
    "WorkspaceCodeLensRefreshResponse": WorkspaceCodeLensRefreshResponse,
    "DocumentLinkParams": DocumentLinkParams,
    "DocumentLinkRegistrationOptions": DocumentLinkRegistrationOptions,
    "TextDocumentDocumentLinkRequest": TextDocumentDocumentLinkRequest,
    "TextDocumentDocumentLinkResponse": TextDocumentDocumentLinkResponse,
    "DocumentLink": DocumentLink,
    "DocumentLinkResolveRequest": DocumentLinkResolveRequest,
    "DocumentLinkResolveResponse": DocumentLinkResolveResponse,
    "DocumentFormattingParams": DocumentFormattingParams,
    "DocumentFormattingRegistrationOptions": DocumentFormattingRegistrationOptions,
    "TextDocumentFormattingRequest": TextDocumentFormattingRequest,
    "TextDocumentFormattingResponse": TextDocumentFormattingResponse,
    "DocumentRangeFormattingParams": DocumentRangeFormattingParams,
    "DocumentRangeFormattingRegistrationOptions": DocumentRangeFormattingRegistrationOptions,
    "TextDocumentRangeFormattingRequest": TextDocumentRangeFormattingRequest,
    "TextDocumentRangeFormattingResponse": TextDocumentRangeFormattingResponse,
    "DocumentOnTypeFormattingParams": DocumentOnTypeFormattingParams,
    "DocumentOnTypeFormattingRegistrationOptions": DocumentOnTypeFormattingRegistrationOptions,
    "TextDocumentOnTypeFormattingRequest": TextDocumentOnTypeFormattingRequest,
    "TextDocumentOnTypeFormattingResponse": TextDocumentOnTypeFormattingResponse,
    "RenameParams": RenameParams,
    "RenameRegistrationOptions": RenameRegistrationOptions,
    "TextDocumentRenameRequest": TextDocumentRenameRequest,
    "TextDocumentRenameResponse": TextDocumentRenameResponse,
    "PrepareRenameParams": PrepareRenameParams,
    "TextDocumentPrepareRenameRequest": TextDocumentPrepareRenameRequest,
    "TextDocumentPrepareRenameResponse": TextDocumentPrepareRenameResponse,
    "ExecuteCommandParams": ExecuteCommandParams,
    "ExecuteCommandRegistrationOptions": ExecuteCommandRegistrationOptions,
    "WorkspaceExecuteCommandRequest": WorkspaceExecuteCommandRequest,
    "WorkspaceExecuteCommandResponse": WorkspaceExecuteCommandResponse,
    "ApplyWorkspaceEditParams": ApplyWorkspaceEditParams,
    "WorkspaceApplyEditRequest": WorkspaceApplyEditRequest,
    "WorkspaceApplyEditResponse": WorkspaceApplyEditResponse,
    "DidChangeWorkspaceFoldersParams": DidChangeWorkspaceFoldersParams,
    "WorkspaceDidChangeWorkspaceFoldersNotification": WorkspaceDidChangeWorkspaceFoldersNotification,
    "WorkDoneProgressCancelParams": WorkDoneProgressCancelParams,
    "WindowWorkDoneProgressCancelNotification": WindowWorkDoneProgressCancelNotification,
    "CreateFilesParams": CreateFilesParams,
    "FileOperationRegistrationOptions": FileOperationRegistrationOptions,
    "WorkspaceDidCreateFilesNotification": WorkspaceDidCreateFilesNotification,
    "RenameFilesParams": RenameFilesParams,
    "FileOperationRegistrationOptions": FileOperationRegistrationOptions,
    "WorkspaceDidRenameFilesNotification": WorkspaceDidRenameFilesNotification,
    "DeleteFilesParams": DeleteFilesParams,
    "FileOperationRegistrationOptions": FileOperationRegistrationOptions,
    "WorkspaceDidDeleteFilesNotification": WorkspaceDidDeleteFilesNotification,
    "DidOpenNotebookDocumentParams": DidOpenNotebookDocumentParams,
    "NotebookDocumentDidOpenNotification": NotebookDocumentDidOpenNotification,
    "DidChangeNotebookDocumentParams": DidChangeNotebookDocumentParams,
    "NotebookDocumentDidChangeNotification": NotebookDocumentDidChangeNotification,
    "DidSaveNotebookDocumentParams": DidSaveNotebookDocumentParams,
    "NotebookDocumentDidSaveNotification": NotebookDocumentDidSaveNotification,
    "DidCloseNotebookDocumentParams": DidCloseNotebookDocumentParams,
    "NotebookDocumentDidCloseNotification": NotebookDocumentDidCloseNotification,
    "InitializedParams": InitializedParams,
    "InitializedNotification": InitializedNotification,
    "ExitNotification": ExitNotification,
    "DidChangeConfigurationParams": DidChangeConfigurationParams,
    "DidChangeConfigurationRegistrationOptions": DidChangeConfigurationRegistrationOptions,
    "WorkspaceDidChangeConfigurationNotification": WorkspaceDidChangeConfigurationNotification,
    "ShowMessageParams": ShowMessageParams,
    "WindowShowMessageNotification": WindowShowMessageNotification,
    "LogMessageParams": LogMessageParams,
    "WindowLogMessageNotification": WindowLogMessageNotification,
    "LSPAny": LSPAny,
    "TelemetryEventNotification": TelemetryEventNotification,
    "DidOpenTextDocumentParams": DidOpenTextDocumentParams,
    "TextDocumentRegistrationOptions": TextDocumentRegistrationOptions,
    "TextDocumentDidOpenNotification": TextDocumentDidOpenNotification,
    "DidChangeTextDocumentParams": DidChangeTextDocumentParams,
    "TextDocumentChangeRegistrationOptions": TextDocumentChangeRegistrationOptions,
    "TextDocumentDidChangeNotification": TextDocumentDidChangeNotification,
    "DidCloseTextDocumentParams": DidCloseTextDocumentParams,
    "TextDocumentRegistrationOptions": TextDocumentRegistrationOptions,
    "TextDocumentDidCloseNotification": TextDocumentDidCloseNotification,
    "DidSaveTextDocumentParams": DidSaveTextDocumentParams,
    "TextDocumentSaveRegistrationOptions": TextDocumentSaveRegistrationOptions,
    "TextDocumentDidSaveNotification": TextDocumentDidSaveNotification,
    "WillSaveTextDocumentParams": WillSaveTextDocumentParams,
    "TextDocumentRegistrationOptions": TextDocumentRegistrationOptions,
    "TextDocumentWillSaveNotification": TextDocumentWillSaveNotification,
    "DidChangeWatchedFilesParams": DidChangeWatchedFilesParams,
    "DidChangeWatchedFilesRegistrationOptions": DidChangeWatchedFilesRegistrationOptions,
    "WorkspaceDidChangeWatchedFilesNotification": WorkspaceDidChangeWatchedFilesNotification,
    "PublishDiagnosticsParams": PublishDiagnosticsParams,
    "TextDocumentPublishDiagnosticsNotification": TextDocumentPublishDiagnosticsNotification,
    "SetTraceParams": SetTraceParams,
    "SetTraceNotification": SetTraceNotification,
    "LogTraceParams": LogTraceParams,
    "LogTraceNotification": LogTraceNotification,
    "CancelParams": CancelParams,
    "CancelRequestNotification": CancelRequestNotification,
    "ProgressParams": ProgressParams,
    "ProgressNotification": ProgressNotification,
}
