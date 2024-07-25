# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

# ****** THIS IS A GENERATED FILE, DO NOT EDIT. ******
# Steps to generate:
# 1. Checkout https://github.com/microsoft/lsprotocol
# 2. Install nox: `python -m pip install nox`
# 3. Run command: `python -m nox --session build_lsp`

module LSProtocol
  LSP_VERSION = "3.17.0"

  # A parameter literal used in requests to pass a text document and a position inside that
  # document.
  class TextDocumentPositionParams
    include JSON::Serializable

    property position : Position

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    def initialize(
      @position : Position,
      @text_document : TextDocumentIdentifier,
    )
    end
  end

  class WorkDoneProgressParams
    include JSON::Serializable

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  class PartialResultParams
    include JSON::Serializable

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?

    def initialize(
      @partial_result_token : ProgressToken? = nil,
    )
    end
  end

  class ImplementationParams
    include JSON::Serializable

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?
    property position : Position

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @position : Position,
      @text_document : TextDocumentIdentifier,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Represents a location inside a resource, such as a line
  # inside a text file.
  class Location
    include JSON::Serializable

    property range : Range
    property uri : String

    def initialize(
      @range : Range,
      @uri : String,
    )
    end
  end

  # General text document registration options.
  class TextDocumentRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?

    def initialize(
      @document_selector : DocumentSelector,
    )
    end
  end

  class WorkDoneProgressOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class ImplementationOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Static registration options to be returned in the initialize
  # request.
  class StaticRegistrationOptions
    include JSON::Serializable

    property id : String?

    def initialize(
      @id : String? = nil,
    )
    end
  end

  class ImplementationRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?
    property id : String?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @id : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class TypeDefinitionParams
    include JSON::Serializable

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?
    property position : Position

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @position : Position,
      @text_document : TextDocumentIdentifier,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  class TypeDefinitionOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class TypeDefinitionRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?
    property id : String?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @id : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # A workspace folder inside a client.
  class WorkspaceFolder
    include JSON::Serializable

    property name : String
    property uri : String

    def initialize(
      @name : String,
      @uri : String,
    )
    end
  end

  # The parameters of a `workspace/didChangeWorkspaceFolders` notification.
  class DidChangeWorkspaceFoldersParams
    include JSON::Serializable

    property event : WorkspaceFoldersChangeEvent

    def initialize(
      @event : WorkspaceFoldersChangeEvent,
    )
    end
  end

  # The parameters of a configuration request.
  class ConfigurationParams
    include JSON::Serializable

    property items : Array(ConfigurationItem)

    def initialize(
      @items : Array(ConfigurationItem),
    )
    end
  end

  # Parameters for a {@link DocumentColorRequest}.
  class DocumentColorParams
    include JSON::Serializable

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @text_document : TextDocumentIdentifier,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Represents a color range from a document.
  class ColorInformation
    include JSON::Serializable

    property color : Color
    property range : Range

    def initialize(
      @color : Color,
      @range : Range,
    )
    end
  end

  class DocumentColorOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class DocumentColorRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?
    property id : String?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @id : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Parameters for a {@link ColorPresentationRequest}.
  class ColorPresentationParams
    include JSON::Serializable

    property color : Color

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?
    property range : Range

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @color : Color,
      @range : Range,
      @text_document : TextDocumentIdentifier,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  class ColorPresentation
    include JSON::Serializable

    @[JSON::Field(key: "additionalTextEdits")]
    property additional_text_edits : Array(TextEdit)?
    property label : String

    @[JSON::Field(key: "textEdit")]
    property text_edit : TextEdit?

    def initialize(
      @label : String,
      @additional_text_edits : Array(TextEdit)? = nil,
      @text_edit : TextEdit? = nil,
    )
    end
  end

  # Parameters for a {@link FoldingRangeRequest}.
  class FoldingRangeParams
    include JSON::Serializable

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @text_document : TextDocumentIdentifier,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Represents a folding range. To be valid, start and end line must be bigger than zero and smaller
  # than the number of lines in the document. Clients are free to ignore invalid ranges.
  class FoldingRange
    include JSON::Serializable

    @[JSON::Field(key: "collapsedText")]
    property collapsed_text : String?

    @[JSON::Field(key: "endCharacter")]
    property end_character : UInt32?

    @[JSON::Field(key: "endLine")]
    property end_line : UInt32
    property kind : FoldingRangeKind | String?

    @[JSON::Field(key: "startCharacter")]
    property start_character : UInt32?

    @[JSON::Field(key: "startLine")]
    property start_line : UInt32

    def initialize(
      @end_line : UInt32,
      @start_line : UInt32,
      @collapsed_text : String? = nil,
      @end_character : UInt32? = nil,
      @kind : FoldingRangeKind | String? = nil,
      @start_character : UInt32? = nil,
    )
    end
  end

  class FoldingRangeOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class FoldingRangeRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?
    property id : String?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @id : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class DeclarationParams
    include JSON::Serializable

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?
    property position : Position

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @position : Position,
      @text_document : TextDocumentIdentifier,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  class DeclarationOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class DeclarationRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?
    property id : String?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @id : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # A parameter literal used in selection range requests.
  class SelectionRangeParams
    include JSON::Serializable

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?
    property positions : Array(Position)

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @positions : Array(Position),
      @text_document : TextDocumentIdentifier,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # A selection range represents a part of a selection hierarchy. A selection range
  # may have a parent selection range that contains it.
  class SelectionRange
    include JSON::Serializable

    property parent : SelectionRange?
    property range : Range

    def initialize(
      @range : Range,
      @parent : SelectionRange? = nil,
    )
    end
  end

  class SelectionRangeOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class SelectionRangeRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?
    property id : String?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @id : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class WorkDoneProgressCreateParams
    include JSON::Serializable

    property token : ProgressToken

    def initialize(
      @token : ProgressToken,
    )
    end
  end

  class WorkDoneProgressCancelParams
    include JSON::Serializable

    property token : ProgressToken

    def initialize(
      @token : ProgressToken,
    )
    end
  end

  # The parameter of a `textDocument/prepareCallHierarchy` request.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class CallHierarchyPrepareParams
    include JSON::Serializable

    property position : Position

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @position : Position,
      @text_document : TextDocumentIdentifier,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Represents programming constructs like functions or constructors in the context
  # of call hierarchy.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class CallHierarchyItem
    include JSON::Serializable

    property data : LSPAny?
    property detail : String?
    property kind : SymbolKind
    property name : String
    property range : Range

    @[JSON::Field(key: "selectionRange")]
    property selection_range : Range
    property tags : Array(SymbolTag)?
    property uri : String

    def initialize(
      @kind : SymbolKind,
      @name : String,
      @range : Range,
      @selection_range : Range,
      @uri : String,
      @data : LSPAny? = nil,
      @detail : String? = nil,
      @tags : Array(SymbolTag)? = nil,
    )
    end
  end

  # Call hierarchy options used during static registration.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class CallHierarchyOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Call hierarchy options used during static or dynamic registration.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class CallHierarchyRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?
    property id : String?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @id : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # The parameter of a `callHierarchy/incomingCalls` request.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class CallHierarchyIncomingCallsParams
    include JSON::Serializable

    property item : CallHierarchyItem

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @item : CallHierarchyItem,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Represents an incoming call, e.g. a caller of a method or constructor.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class CallHierarchyIncomingCall
    include JSON::Serializable

    @[JSON::Field(key: "from")]
    property from_ : CallHierarchyItem

    @[JSON::Field(key: "fromRanges")]
    property from_ranges : Array(Range)

    def initialize(
      @from_ : CallHierarchyItem,
      @from_ranges : Array(Range),
    )
    end
  end

  # The parameter of a `callHierarchy/outgoingCalls` request.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class CallHierarchyOutgoingCallsParams
    include JSON::Serializable

    property item : CallHierarchyItem

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @item : CallHierarchyItem,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Represents an outgoing call, e.g. calling a getter from a method or a method from a constructor etc.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class CallHierarchyOutgoingCall
    include JSON::Serializable

    @[JSON::Field(key: "fromRanges")]
    property from_ranges : Array(Range)
    property to : CallHierarchyItem

    def initialize(
      @from_ranges : Array(Range),
      @to : CallHierarchyItem,
    )
    end
  end

  # @since 3.16.0
  # Since: #3.16.0
  class SemanticTokensParams
    include JSON::Serializable

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @text_document : TextDocumentIdentifier,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # @since 3.16.0
  # Since: #3.16.0
  class SemanticTokens
    include JSON::Serializable

    property data : Array(UInt32)

    @[JSON::Field(key: "resultId")]
    property result_id : String?

    def initialize(
      @data : Array(UInt32),
      @result_id : String? = nil,
    )
    end
  end

  # @since 3.16.0
  # Since: #3.16.0
  class SemanticTokensPartialResult
    include JSON::Serializable

    property data : Array(UInt32)

    def initialize(
      @data : Array(UInt32),
    )
    end
  end

  # @since 3.16.0
  # Since: #3.16.0
  class SemanticTokensOptions
    include JSON::Serializable

    property full : Bool | SemanticTokensFullDelta?
    property legend : SemanticTokensLegend
    property range : Bool | JSON::Any??

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @legend : SemanticTokensLegend,
      @full : Bool | SemanticTokensFullDelta? = nil,
      @range : Bool | JSON::Any?? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # @since 3.16.0
  # Since: #3.16.0
  class SemanticTokensRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?
    property full : Bool | SemanticTokensFullDelta?
    property id : String?
    property legend : SemanticTokensLegend
    property range : Bool | JSON::Any??

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @legend : SemanticTokensLegend,
      @full : Bool | SemanticTokensFullDelta? = nil,
      @id : String? = nil,
      @range : Bool | JSON::Any?? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # @since 3.16.0
  # Since: #3.16.0
  class SemanticTokensDeltaParams
    include JSON::Serializable

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?

    @[JSON::Field(key: "previousResultId")]
    property previous_result_id : String

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @previous_result_id : String,
      @text_document : TextDocumentIdentifier,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # @since 3.16.0
  # Since: #3.16.0
  class SemanticTokensDelta
    include JSON::Serializable

    property edits : Array(SemanticTokensEdit)

    @[JSON::Field(key: "resultId")]
    property result_id : String?

    def initialize(
      @edits : Array(SemanticTokensEdit),
      @result_id : String? = nil,
    )
    end
  end

  # @since 3.16.0
  # Since: #3.16.0
  class SemanticTokensDeltaPartialResult
    include JSON::Serializable

    property edits : Array(SemanticTokensEdit)

    def initialize(
      @edits : Array(SemanticTokensEdit),
    )
    end
  end

  # @since 3.16.0
  # Since: #3.16.0
  class SemanticTokensRangeParams
    include JSON::Serializable

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?
    property range : Range

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @range : Range,
      @text_document : TextDocumentIdentifier,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Params to show a resource in the UI.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class ShowDocumentParams
    include JSON::Serializable

    property external : Bool?
    property selection : Range?

    @[JSON::Field(key: "takeFocus")]
    property take_focus : Bool?
    property uri : String

    def initialize(
      @uri : String,
      @external : Bool? = nil,
      @selection : Range? = nil,
      @take_focus : Bool? = nil,
    )
    end
  end

  # The result of a showDocument request.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class ShowDocumentResult
    include JSON::Serializable

    property success : Bool

    def initialize(
      @success : Bool,
    )
    end
  end

  class LinkedEditingRangeParams
    include JSON::Serializable

    property position : Position

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @position : Position,
      @text_document : TextDocumentIdentifier,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # The result of a linked editing range request.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class LinkedEditingRanges
    include JSON::Serializable

    property ranges : Array(Range)

    @[JSON::Field(key: "wordPattern")]
    property word_pattern : String?

    def initialize(
      @ranges : Array(Range),
      @word_pattern : String? = nil,
    )
    end
  end

  class LinkedEditingRangeOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class LinkedEditingRangeRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?
    property id : String?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @id : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # The parameters sent in notifications/requests for user-initiated creation of
  # files.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class CreateFilesParams
    include JSON::Serializable

    property files : Array(FileCreate)

    def initialize(
      @files : Array(FileCreate),
    )
    end
  end

  # A workspace edit represents changes to many resources managed in the workspace. The edit
  # should either provide `changes` or `documentChanges`. If documentChanges are present
  # they are preferred over `changes` if the client can handle versioned document edits.
  #
  # Since version 3.13.0 a workspace edit can contain resource operations as well. If resource
  # operations are present clients need to execute the operations in the order in which they
  # are provided. So a workspace edit for example can consist of the following two changes:
  # (1) a create file a.txt and (2) a text document edit which insert text into file a.txt.
  #
  # An invalid sequence (e.g. (1) delete file a.txt and (2) insert text into file a.txt) will
  # cause failure of the operation. How the client recovers from the failure is described by
  # the client capability: `workspace.workspaceEdit.failureHandling`
  class WorkspaceEdit
    include JSON::Serializable

    @[JSON::Field(key: "changeAnnotations")]
    property change_annotations : Hash(ChangeAnnotationIdentifier, ChangeAnnotation)?
    property changes : Hash(String, Array(TextEdit))?

    @[JSON::Field(key: "documentChanges")]
    property document_changes : Array(TextDocumentEdit | CreateFile | RenameFile | DeleteFile)?

    def initialize(
      @change_annotations : Hash(ChangeAnnotationIdentifier, ChangeAnnotation)? = nil,
      @changes : Hash(String, Array(TextEdit))? = nil,
      @document_changes : Array(TextDocumentEdit | CreateFile | RenameFile | DeleteFile)? = nil,
    )
    end
  end

  # The options to register for file operations.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class FileOperationRegistrationOptions
    include JSON::Serializable

    property filters : Array(FileOperationFilter)

    def initialize(
      @filters : Array(FileOperationFilter),
    )
    end
  end

  # The parameters sent in notifications/requests for user-initiated renames of
  # files.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class RenameFilesParams
    include JSON::Serializable

    property files : Array(FileRename)

    def initialize(
      @files : Array(FileRename),
    )
    end
  end

  # The parameters sent in notifications/requests for user-initiated deletes of
  # files.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class DeleteFilesParams
    include JSON::Serializable

    property files : Array(FileDelete)

    def initialize(
      @files : Array(FileDelete),
    )
    end
  end

  class MonikerParams
    include JSON::Serializable

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?
    property position : Position

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @position : Position,
      @text_document : TextDocumentIdentifier,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Moniker definition to match LSIF 0.5 moniker definition.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class Moniker
    include JSON::Serializable

    property identifier : String
    property kind : MonikerKind?
    property scheme : String
    property unique : UniquenessLevel

    def initialize(
      @identifier : String,
      @scheme : String,
      @unique : UniquenessLevel,
      @kind : MonikerKind? = nil,
    )
    end
  end

  class MonikerOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class MonikerRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # The parameter of a `textDocument/prepareTypeHierarchy` request.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class TypeHierarchyPrepareParams
    include JSON::Serializable

    property position : Position

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @position : Position,
      @text_document : TextDocumentIdentifier,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # @since 3.17.0
  # Since: #3.17.0
  class TypeHierarchyItem
    include JSON::Serializable

    property data : LSPAny?
    property detail : String?
    property kind : SymbolKind
    property name : String
    property range : Range

    @[JSON::Field(key: "selectionRange")]
    property selection_range : Range
    property tags : Array(SymbolTag)?
    property uri : String

    def initialize(
      @kind : SymbolKind,
      @name : String,
      @range : Range,
      @selection_range : Range,
      @uri : String,
      @data : LSPAny? = nil,
      @detail : String? = nil,
      @tags : Array(SymbolTag)? = nil,
    )
    end
  end

  # Type hierarchy options used during static registration.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class TypeHierarchyOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Type hierarchy options used during static or dynamic registration.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class TypeHierarchyRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?
    property id : String?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @id : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # The parameter of a `typeHierarchy/supertypes` request.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class TypeHierarchySupertypesParams
    include JSON::Serializable

    property item : TypeHierarchyItem

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @item : TypeHierarchyItem,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # The parameter of a `typeHierarchy/subtypes` request.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class TypeHierarchySubtypesParams
    include JSON::Serializable

    property item : TypeHierarchyItem

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @item : TypeHierarchyItem,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # A parameter literal used in inline value requests.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class InlineValueParams
    include JSON::Serializable

    property context : InlineValueContext
    property range : Range

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @context : InlineValueContext,
      @range : Range,
      @text_document : TextDocumentIdentifier,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Inline value options used during static registration.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class InlineValueOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Inline value options used during static or dynamic registration.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class InlineValueRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?
    property id : String?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @id : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # A parameter literal used in inlay hint requests.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class InlayHintParams
    include JSON::Serializable

    property range : Range

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @range : Range,
      @text_document : TextDocumentIdentifier,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Inlay hint information.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class InlayHint
    include JSON::Serializable

    property data : LSPAny?
    property kind : InlayHintKind?
    property label : String | Array(InlayHintLabelPart)

    @[JSON::Field(key: "paddingLeft")]
    property padding_left : Bool?

    @[JSON::Field(key: "paddingRight")]
    property padding_right : Bool?
    property position : Position

    @[JSON::Field(key: "textEdits")]
    property text_edits : Array(TextEdit)?
    property tooltip : String | MarkupContent?

    def initialize(
      @label : String | Array(InlayHintLabelPart),
      @position : Position,
      @data : LSPAny? = nil,
      @kind : InlayHintKind? = nil,
      @padding_left : Bool? = nil,
      @padding_right : Bool? = nil,
      @text_edits : Array(TextEdit)? = nil,
      @tooltip : String | MarkupContent? = nil,
    )
    end
  end

  # Inlay hint options used during static registration.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class InlayHintOptions
    include JSON::Serializable

    @[JSON::Field(key: "resolveProvider")]
    property resolve_provider : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @resolve_provider : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Inlay hint options used during static or dynamic registration.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class InlayHintRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?
    property id : String?

    @[JSON::Field(key: "resolveProvider")]
    property resolve_provider : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @id : String? = nil,
      @resolve_provider : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Parameters of the document diagnostic request.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class DocumentDiagnosticParams
    include JSON::Serializable

    property identifier : String?

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?

    @[JSON::Field(key: "previousResultId")]
    property previous_result_id : String?

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @text_document : TextDocumentIdentifier,
      @identifier : String? = nil,
      @partial_result_token : ProgressToken? = nil,
      @previous_result_id : String? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # A partial result for a document diagnostic report.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class DocumentDiagnosticReportPartialResult
    include JSON::Serializable

    @[JSON::Field(key: "relatedDocuments")]
    property related_documents : Hash(String, FullDocumentDiagnosticReport | UnchangedDocumentDiagnosticReport)

    def initialize(
      @related_documents : Hash(String, FullDocumentDiagnosticReport | UnchangedDocumentDiagnosticReport),
    )
    end
  end

  # Cancellation data returned from a diagnostic request.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class DiagnosticServerCancellationData
    include JSON::Serializable

    @[JSON::Field(key: "retriggerRequest")]
    property retrigger_request : Bool

    def initialize(
      @retrigger_request : Bool,
    )
    end
  end

  # Diagnostic options.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class DiagnosticOptions
    include JSON::Serializable

    property identifier : String?

    @[JSON::Field(key: "interFileDependencies")]
    property inter_file_dependencies : Bool

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    @[JSON::Field(key: "workspaceDiagnostics")]
    property workspace_diagnostics : Bool

    def initialize(
      @inter_file_dependencies : Bool,
      @workspace_diagnostics : Bool,
      @identifier : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Diagnostic registration options.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class DiagnosticRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?
    property id : String?
    property identifier : String?

    @[JSON::Field(key: "interFileDependencies")]
    property inter_file_dependencies : Bool

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    @[JSON::Field(key: "workspaceDiagnostics")]
    property workspace_diagnostics : Bool

    def initialize(
      @document_selector : DocumentSelector,
      @inter_file_dependencies : Bool,
      @workspace_diagnostics : Bool,
      @id : String? = nil,
      @identifier : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Parameters of the workspace diagnostic request.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class WorkspaceDiagnosticParams
    include JSON::Serializable

    property identifier : String?

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?

    @[JSON::Field(key: "previousResultIds")]
    property previous_result_ids : Array(PreviousResultId)

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @previous_result_ids : Array(PreviousResultId),
      @identifier : String? = nil,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # A workspace diagnostic report.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class WorkspaceDiagnosticReport
    include JSON::Serializable

    property items : Array(WorkspaceDocumentDiagnosticReport)

    def initialize(
      @items : Array(WorkspaceDocumentDiagnosticReport),
    )
    end
  end

  # A partial result for a workspace diagnostic report.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class WorkspaceDiagnosticReportPartialResult
    include JSON::Serializable

    property items : Array(WorkspaceDocumentDiagnosticReport)

    def initialize(
      @items : Array(WorkspaceDocumentDiagnosticReport),
    )
    end
  end

  # The params sent in an open notebook document notification.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class DidOpenNotebookDocumentParams
    include JSON::Serializable

    @[JSON::Field(key: "cellTextDocuments")]
    property cell_text_documents : Array(TextDocumentItem)

    @[JSON::Field(key: "notebookDocument")]
    property notebook_document : NotebookDocument

    def initialize(
      @cell_text_documents : Array(TextDocumentItem),
      @notebook_document : NotebookDocument,
    )
    end
  end

  # Options specific to a notebook plus its cells
  # to be synced to the server.
  #
  # If a selector provides a notebook document
  # filter but no cell selector all cells of a
  # matching notebook document will be synced.
  #
  # If a selector provides no notebook document
  # filter but only a cell selector all notebook
  # document that contain at least one matching
  # cell will be synced.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class NotebookDocumentSyncOptions
    include JSON::Serializable

    @[JSON::Field(key: "notebookSelector")]
    property notebook_selector : Array(NotebookDocumentFilterWithNotebook | NotebookDocumentFilterWithCells)
    property save : Bool?

    def initialize(
      @notebook_selector : Array(NotebookDocumentFilterWithNotebook | NotebookDocumentFilterWithCells),
      @save : Bool? = nil,
    )
    end
  end

  # Registration options specific to a notebook.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class NotebookDocumentSyncRegistrationOptions
    include JSON::Serializable

    property id : String?

    @[JSON::Field(key: "notebookSelector")]
    property notebook_selector : Array(NotebookDocumentFilterWithNotebook | NotebookDocumentFilterWithCells)
    property save : Bool?

    def initialize(
      @notebook_selector : Array(NotebookDocumentFilterWithNotebook | NotebookDocumentFilterWithCells),
      @id : String? = nil,
      @save : Bool? = nil,
    )
    end
  end

  # The params sent in a change notebook document notification.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class DidChangeNotebookDocumentParams
    include JSON::Serializable

    property change : NotebookDocumentChangeEvent

    @[JSON::Field(key: "notebookDocument")]
    property notebook_document : VersionedNotebookDocumentIdentifier

    def initialize(
      @change : NotebookDocumentChangeEvent,
      @notebook_document : VersionedNotebookDocumentIdentifier,
    )
    end
  end

  # The params sent in a save notebook document notification.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class DidSaveNotebookDocumentParams
    include JSON::Serializable

    @[JSON::Field(key: "notebookDocument")]
    property notebook_document : NotebookDocumentIdentifier

    def initialize(
      @notebook_document : NotebookDocumentIdentifier,
    )
    end
  end

  # The params sent in a close notebook document notification.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class DidCloseNotebookDocumentParams
    include JSON::Serializable

    @[JSON::Field(key: "cellTextDocuments")]
    property cell_text_documents : Array(TextDocumentIdentifier)

    @[JSON::Field(key: "notebookDocument")]
    property notebook_document : NotebookDocumentIdentifier

    def initialize(
      @cell_text_documents : Array(TextDocumentIdentifier),
      @notebook_document : NotebookDocumentIdentifier,
    )
    end
  end

  # A parameter literal used in inline completion requests.
  #
  # @since 3.18.0
  # @proposed
  # Since: #3.18.0
  # Proposed
  class InlineCompletionParams
    include JSON::Serializable

    property context : InlineCompletionContext
    property position : Position

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @context : InlineCompletionContext,
      @position : Position,
      @text_document : TextDocumentIdentifier,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Represents a collection of {@link InlineCompletionItem inline completion items} to be presented in the editor.
  #
  # @since 3.18.0
  # @proposed
  # Since: #3.18.0
  # Proposed
  class InlineCompletionList
    include JSON::Serializable

    property items : Array(InlineCompletionItem)

    def initialize(
      @items : Array(InlineCompletionItem),
    )
    end
  end

  # An inline completion item represents a text snippet that is proposed inline to complete text that is being typed.
  #
  # @since 3.18.0
  # @proposed
  # Since: #3.18.0
  # Proposed
  class InlineCompletionItem
    include JSON::Serializable

    property command : Command?

    @[JSON::Field(key: "filterText")]
    property filter_text : String?

    @[JSON::Field(key: "insertText")]
    property insert_text : String | StringValue
    property range : Range?

    def initialize(
      @insert_text : String | StringValue,
      @command : Command? = nil,
      @filter_text : String? = nil,
      @range : Range? = nil,
    )
    end
  end

  # Inline completion options used during static registration.
  #
  # @since 3.18.0
  # @proposed
  # Since: #3.18.0
  # Proposed
  class InlineCompletionOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Inline completion options used during static or dynamic registration.
  #
  # @since 3.18.0
  # @proposed
  # Since: #3.18.0
  # Proposed
  class InlineCompletionRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?
    property id : String?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @id : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class RegistrationParams
    include JSON::Serializable

    property registrations : Array(Registration)

    def initialize(
      @registrations : Array(Registration),
    )
    end
  end

  class UnregistrationParams
    include JSON::Serializable

    property unregisterations : Array(Unregistration)

    def initialize(
      @unregisterations : Array(Unregistration),
    )
    end
  end

  # The initialize parameters
  class InitializeParamsPrivate
    include JSON::Serializable

    property capabilities : ClientCapabilities

    @[JSON::Field(key: "clientInfo")]
    property client_info : ClientInfo?

    @[JSON::Field(key: "initializationOptions")]
    property initialization_options : LSPAny?
    property locale : String?

    @[JSON::Field(key: "processId")]
    property process_id : Int32?

    @[JSON::Field(key: "rootPath")]
    property root_path : String?

    @[JSON::Field(key: "rootUri")]
    property root_uri : String?
    property trace : TraceValue?

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @capabilities : ClientCapabilities,
      @process_id : Int32,
      @root_uri : String,
      @client_info : ClientInfo? = nil,
      @initialization_options : LSPAny? = nil,
      @locale : String? = nil,
      @root_path : String? = nil,
      @trace : TraceValue? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  class WorkspaceFoldersInitializeParams
    include JSON::Serializable

    @[JSON::Field(key: "workspaceFolders")]
    property workspace_folders : Array(WorkspaceFolder)?

    def initialize(
      @workspace_folders : Array(WorkspaceFolder)? = nil,
    )
    end
  end

  class InitializeParams
    include JSON::Serializable

    property capabilities : ClientCapabilities

    @[JSON::Field(key: "clientInfo")]
    property client_info : ClientInfo?

    @[JSON::Field(key: "initializationOptions")]
    property initialization_options : LSPAny?
    property locale : String?

    @[JSON::Field(key: "processId")]
    property process_id : Int32?

    @[JSON::Field(key: "rootPath")]
    property root_path : String?

    @[JSON::Field(key: "rootUri")]
    property root_uri : String?
    property trace : TraceValue?

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    @[JSON::Field(key: "workspaceFolders")]
    property workspace_folders : Array(WorkspaceFolder)?

    def initialize(
      @capabilities : ClientCapabilities,
      @process_id : Int32,
      @root_uri : String,
      @client_info : ClientInfo? = nil,
      @initialization_options : LSPAny? = nil,
      @locale : String? = nil,
      @root_path : String? = nil,
      @trace : TraceValue? = nil,
      @work_done_token : ProgressToken? = nil,
      @workspace_folders : Array(WorkspaceFolder)? = nil,
    )
    end
  end

  # The result returned from an initialize request.
  class InitializeResult
    include JSON::Serializable

    property capabilities : ServerCapabilities

    @[JSON::Field(key: "serverInfo")]
    property server_info : ServerInfo?

    def initialize(
      @capabilities : ServerCapabilities,
      @server_info : ServerInfo? = nil,
    )
    end
  end

  # The data type of the ResponseError if the
  # initialize request fails.
  class InitializeError
    include JSON::Serializable

    property retry : Bool

    def initialize(
      @retry : Bool,
    )
    end
  end

  class InitializedParams
    include JSON::Serializable

    def initialize
    end
  end

  # The parameters of a change configuration notification.
  class DidChangeConfigurationParams
    include JSON::Serializable

    property settings : LSPAny

    def initialize(
      @settings : LSPAny,
    )
    end
  end

  class DidChangeConfigurationRegistrationOptions
    include JSON::Serializable

    property section : String | Array(String)?

    def initialize(
      @section : String | Array(String)? = nil,
    )
    end
  end

  # The parameters of a notification message.
  class ShowMessageParams
    include JSON::Serializable

    property message : String
    property type : MessageType

    def initialize(
      @message : String,
      @type : MessageType,
    )
    end
  end

  class ShowMessageRequestParams
    include JSON::Serializable

    property actions : Array(MessageActionItem)?
    property message : String
    property type : MessageType

    def initialize(
      @message : String,
      @type : MessageType,
      @actions : Array(MessageActionItem)? = nil,
    )
    end
  end

  class MessageActionItem
    include JSON::Serializable

    property title : String

    def initialize(
      @title : String,
    )
    end
  end

  # The log message parameters.
  class LogMessageParams
    include JSON::Serializable

    property message : String
    property type : MessageType

    def initialize(
      @message : String,
      @type : MessageType,
    )
    end
  end

  # The parameters sent in an open text document notification
  class DidOpenTextDocumentParams
    include JSON::Serializable

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentItem

    def initialize(
      @text_document : TextDocumentItem,
    )
    end
  end

  # The change text document notification's parameters.
  class DidChangeTextDocumentParams
    include JSON::Serializable

    @[JSON::Field(key: "contentChanges")]
    property content_changes : Array(TextDocumentContentChangeEvent)

    @[JSON::Field(key: "textDocument")]
    property text_document : VersionedTextDocumentIdentifier

    def initialize(
      @content_changes : Array(TextDocumentContentChangeEvent),
      @text_document : VersionedTextDocumentIdentifier,
    )
    end
  end

  # Describe options to be used when registered for text document change events.
  class TextDocumentChangeRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?

    @[JSON::Field(key: "syncKind")]
    property sync_kind : TextDocumentSyncKind

    def initialize(
      @document_selector : DocumentSelector,
      @sync_kind : TextDocumentSyncKind,
    )
    end
  end

  # The parameters sent in a close text document notification
  class DidCloseTextDocumentParams
    include JSON::Serializable

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    def initialize(
      @text_document : TextDocumentIdentifier,
    )
    end
  end

  # The parameters sent in a save text document notification
  class DidSaveTextDocumentParams
    include JSON::Serializable

    property text : String?

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    def initialize(
      @text_document : TextDocumentIdentifier,
      @text : String? = nil,
    )
    end
  end

  # Save options.
  class SaveOptions
    include JSON::Serializable

    @[JSON::Field(key: "includeText")]
    property include_text : Bool?

    def initialize(
      @include_text : Bool? = nil,
    )
    end
  end

  # Save registration options.
  class TextDocumentSaveRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?

    @[JSON::Field(key: "includeText")]
    property include_text : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @include_text : Bool? = nil,
    )
    end
  end

  # The parameters sent in a will save text document notification.
  class WillSaveTextDocumentParams
    include JSON::Serializable

    property reason : TextDocumentSaveReason

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    def initialize(
      @reason : TextDocumentSaveReason,
      @text_document : TextDocumentIdentifier,
    )
    end
  end

  # A text edit applicable to a text document.
  class TextEdit
    include JSON::Serializable

    @[JSON::Field(key: "newText")]
    property new_text : String
    property range : Range

    def initialize(
      @new_text : String,
      @range : Range,
    )
    end
  end

  # The watched files change notification's parameters.
  class DidChangeWatchedFilesParams
    include JSON::Serializable

    property changes : Array(FileEvent)

    def initialize(
      @changes : Array(FileEvent),
    )
    end
  end

  # Describe options to be used when registered for text document change events.
  class DidChangeWatchedFilesRegistrationOptions
    include JSON::Serializable

    property watchers : Array(FileSystemWatcher)

    def initialize(
      @watchers : Array(FileSystemWatcher),
    )
    end
  end

  # The publish diagnostic notification's parameters.
  class PublishDiagnosticsParams
    include JSON::Serializable

    property diagnostics : Array(Diagnostic)
    property uri : String
    property version : Int32?

    def initialize(
      @diagnostics : Array(Diagnostic),
      @uri : String,
      @version : Int32? = nil,
    )
    end
  end

  # Completion parameters
  class CompletionParams
    include JSON::Serializable

    property context : CompletionContext?

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?
    property position : Position

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @position : Position,
      @text_document : TextDocumentIdentifier,
      @context : CompletionContext? = nil,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # A completion item represents a text snippet that is
  # proposed to complete text that is being typed.
  class CompletionItem
    include JSON::Serializable

    @[JSON::Field(key: "additionalTextEdits")]
    property additional_text_edits : Array(TextEdit)?
    property command : Command?

    @[JSON::Field(key: "commitCharacters")]
    property commit_characters : Array(String)?
    property data : LSPAny?
    property deprecated : Bool?
    property detail : String?
    property documentation : String | MarkupContent?

    @[JSON::Field(key: "filterText")]
    property filter_text : String?

    @[JSON::Field(key: "insertText")]
    property insert_text : String?

    @[JSON::Field(key: "insertTextFormat")]
    property insert_text_format : InsertTextFormat?

    @[JSON::Field(key: "insertTextMode")]
    property insert_text_mode : InsertTextMode?
    property kind : CompletionItemKind?
    property label : String

    @[JSON::Field(key: "labelDetails")]
    property label_details : CompletionItemLabelDetails?
    property preselect : Bool?

    @[JSON::Field(key: "sortText")]
    property sort_text : String?
    property tags : Array(CompletionItemTag)?

    @[JSON::Field(key: "textEdit")]
    property text_edit : TextEdit | InsertReplaceEdit?

    @[JSON::Field(key: "textEditText")]
    property text_edit_text : String?

    def initialize(
      @label : String,
      @additional_text_edits : Array(TextEdit)? = nil,
      @command : Command? = nil,
      @commit_characters : Array(String)? = nil,
      @data : LSPAny? = nil,
      @deprecated : Bool? = nil,
      @detail : String? = nil,
      @documentation : String | MarkupContent? = nil,
      @filter_text : String? = nil,
      @insert_text : String? = nil,
      @insert_text_format : InsertTextFormat? = nil,
      @insert_text_mode : InsertTextMode? = nil,
      @kind : CompletionItemKind? = nil,
      @label_details : CompletionItemLabelDetails? = nil,
      @preselect : Bool? = nil,
      @sort_text : String? = nil,
      @tags : Array(CompletionItemTag)? = nil,
      @text_edit : TextEdit | InsertReplaceEdit? = nil,
      @text_edit_text : String? = nil,
    )
    end
  end

  # Represents a collection of {@link CompletionItem completion items} to be presented
  # in the editor.
  class CompletionList
    include JSON::Serializable

    @[JSON::Field(key: "isIncomplete")]
    property is_incomplete : Bool

    @[JSON::Field(key: "itemDefaults")]
    property item_defaults : CompletionItemDefaults?
    property items : Array(CompletionItem)

    def initialize(
      @is_incomplete : Bool,
      @items : Array(CompletionItem),
      @item_defaults : CompletionItemDefaults? = nil,
    )
    end
  end

  # Completion options.
  class CompletionOptions
    include JSON::Serializable

    @[JSON::Field(key: "allCommitCharacters")]
    property all_commit_characters : Array(String)?

    @[JSON::Field(key: "completionItem")]
    property completion_item : ServerCompletionItemOptions?

    @[JSON::Field(key: "resolveProvider")]
    property resolve_provider : Bool?

    @[JSON::Field(key: "triggerCharacters")]
    property trigger_characters : Array(String)?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @all_commit_characters : Array(String)? = nil,
      @completion_item : ServerCompletionItemOptions? = nil,
      @resolve_provider : Bool? = nil,
      @trigger_characters : Array(String)? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a {@link CompletionRequest}.
  class CompletionRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "allCommitCharacters")]
    property all_commit_characters : Array(String)?

    @[JSON::Field(key: "completionItem")]
    property completion_item : ServerCompletionItemOptions?

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?

    @[JSON::Field(key: "resolveProvider")]
    property resolve_provider : Bool?

    @[JSON::Field(key: "triggerCharacters")]
    property trigger_characters : Array(String)?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @all_commit_characters : Array(String)? = nil,
      @completion_item : ServerCompletionItemOptions? = nil,
      @resolve_provider : Bool? = nil,
      @trigger_characters : Array(String)? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Parameters for a {@link HoverRequest}.
  class HoverParams
    include JSON::Serializable

    property position : Position

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @position : Position,
      @text_document : TextDocumentIdentifier,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # The result of a hover request.
  class Hover
    include JSON::Serializable

    property contents : MarkupContent | MarkedString | Array(MarkedString)
    property range : Range?

    def initialize(
      @contents : MarkupContent | MarkedString | Array(MarkedString),
      @range : Range? = nil,
    )
    end
  end

  # Hover options.
  class HoverOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a {@link HoverRequest}.
  class HoverRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Parameters for a {@link SignatureHelpRequest}.
  class SignatureHelpParams
    include JSON::Serializable

    property context : SignatureHelpContext?
    property position : Position

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @position : Position,
      @text_document : TextDocumentIdentifier,
      @context : SignatureHelpContext? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Signature help represents the signature of something
  # callable. There can be multiple signature but only one
  # active and only one active parameter.
  class SignatureHelp
    include JSON::Serializable

    @[JSON::Field(key: "activeParameter")]
    property active_parameter : UInt32?

    @[JSON::Field(key: "activeSignature")]
    property active_signature : UInt32?
    property signatures : Array(SignatureInformation)

    def initialize(
      @signatures : Array(SignatureInformation),
      @active_parameter : UInt32? = nil,
      @active_signature : UInt32? = nil,
    )
    end
  end

  # Server Capabilities for a {@link SignatureHelpRequest}.
  class SignatureHelpOptions
    include JSON::Serializable

    @[JSON::Field(key: "retriggerCharacters")]
    property retrigger_characters : Array(String)?

    @[JSON::Field(key: "triggerCharacters")]
    property trigger_characters : Array(String)?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @retrigger_characters : Array(String)? = nil,
      @trigger_characters : Array(String)? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a {@link SignatureHelpRequest}.
  class SignatureHelpRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?

    @[JSON::Field(key: "retriggerCharacters")]
    property retrigger_characters : Array(String)?

    @[JSON::Field(key: "triggerCharacters")]
    property trigger_characters : Array(String)?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @retrigger_characters : Array(String)? = nil,
      @trigger_characters : Array(String)? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Parameters for a {@link DefinitionRequest}.
  class DefinitionParams
    include JSON::Serializable

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?
    property position : Position

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @position : Position,
      @text_document : TextDocumentIdentifier,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Server Capabilities for a {@link DefinitionRequest}.
  class DefinitionOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a {@link DefinitionRequest}.
  class DefinitionRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Parameters for a {@link ReferencesRequest}.
  class ReferenceParams
    include JSON::Serializable

    property context : ReferenceContext

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?
    property position : Position

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @context : ReferenceContext,
      @position : Position,
      @text_document : TextDocumentIdentifier,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Reference options.
  class ReferenceOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a {@link ReferencesRequest}.
  class ReferenceRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Parameters for a {@link DocumentHighlightRequest}.
  class DocumentHighlightParams
    include JSON::Serializable

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?
    property position : Position

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @position : Position,
      @text_document : TextDocumentIdentifier,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # A document highlight is a range inside a text document which deserves
  # special attention. Usually a document highlight is visualized by changing
  # the background color of its range.
  class DocumentHighlight
    include JSON::Serializable

    property kind : DocumentHighlightKind?
    property range : Range

    def initialize(
      @range : Range,
      @kind : DocumentHighlightKind? = nil,
    )
    end
  end

  # Provider options for a {@link DocumentHighlightRequest}.
  class DocumentHighlightOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a {@link DocumentHighlightRequest}.
  class DocumentHighlightRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Parameters for a {@link DocumentSymbolRequest}.
  class DocumentSymbolParams
    include JSON::Serializable

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @text_document : TextDocumentIdentifier,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # A base for all symbol information.
  class BaseSymbolInformation
    include JSON::Serializable

    @[JSON::Field(key: "containerName")]
    property container_name : String?
    property kind : SymbolKind
    property name : String
    property tags : Array(SymbolTag)?

    def initialize(
      @kind : SymbolKind,
      @name : String,
      @container_name : String? = nil,
      @tags : Array(SymbolTag)? = nil,
    )
    end
  end

  # Represents information about programming constructs like variables, classes,
  # interfaces etc.
  class SymbolInformation
    include JSON::Serializable

    @[JSON::Field(key: "containerName")]
    property container_name : String?
    property deprecated : Bool?
    property kind : SymbolKind
    property location : Location
    property name : String
    property tags : Array(SymbolTag)?

    def initialize(
      @kind : SymbolKind,
      @location : Location,
      @name : String,
      @container_name : String? = nil,
      @deprecated : Bool? = nil,
      @tags : Array(SymbolTag)? = nil,
    )
    end
  end

  # Represents programming constructs like variables, classes, interfaces etc.
  # that appear in a document. Document symbols can be hierarchical and they
  # have two ranges: one that encloses its definition and one that points to
  # its most interesting range, e.g. the range of an identifier.
  class DocumentSymbol
    include JSON::Serializable

    property children : Array(DocumentSymbol)?
    property deprecated : Bool?
    property detail : String?
    property kind : SymbolKind
    property name : String
    property range : Range

    @[JSON::Field(key: "selectionRange")]
    property selection_range : Range
    property tags : Array(SymbolTag)?

    def initialize(
      @kind : SymbolKind,
      @name : String,
      @range : Range,
      @selection_range : Range,
      @children : Array(DocumentSymbol)? = nil,
      @deprecated : Bool? = nil,
      @detail : String? = nil,
      @tags : Array(SymbolTag)? = nil,
    )
    end
  end

  # Provider options for a {@link DocumentSymbolRequest}.
  class DocumentSymbolOptions
    include JSON::Serializable

    property label : String?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @label : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a {@link DocumentSymbolRequest}.
  class DocumentSymbolRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?
    property label : String?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @label : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # The parameters of a {@link CodeActionRequest}.
  class CodeActionParams
    include JSON::Serializable

    property context : CodeActionContext

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?
    property range : Range

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @context : CodeActionContext,
      @range : Range,
      @text_document : TextDocumentIdentifier,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Represents a reference to a command. Provides a title which
  # will be used to represent a command in the UI and, optionally,
  # an array of arguments which will be passed to the command handler
  # function when invoked.
  class Command
    include JSON::Serializable

    property arguments : Array(LSPAny)?
    property command : String
    property title : String
    property tooltip : String?

    def initialize(
      @command : String,
      @title : String,
      @arguments : Array(LSPAny)? = nil,
      @tooltip : String? = nil,
    )
    end
  end

  # A code action represents a change that can be performed in code, e.g. to fix a problem or
  # to refactor code.
  #
  # A CodeAction must set either `edit` and/or a `command`. If both are supplied, the `edit` is applied first, then the `command` is executed.
  class CodeAction
    include JSON::Serializable

    property command : Command?
    property data : LSPAny?
    property diagnostics : Array(Diagnostic)?
    property disabled : CodeActionDisabled?
    property edit : WorkspaceEdit?

    @[JSON::Field(key: "isPreferred")]
    property is_preferred : Bool?
    property kind : CodeActionKind | String?
    property title : String

    def initialize(
      @title : String,
      @command : Command? = nil,
      @data : LSPAny? = nil,
      @diagnostics : Array(Diagnostic)? = nil,
      @disabled : CodeActionDisabled? = nil,
      @edit : WorkspaceEdit? = nil,
      @is_preferred : Bool? = nil,
      @kind : CodeActionKind | String? = nil,
    )
    end
  end

  # Provider options for a {@link CodeActionRequest}.
  class CodeActionOptions
    include JSON::Serializable

    @[JSON::Field(key: "codeActionKinds")]
    property code_action_kinds : Array(CodeActionKind | String)?
    property documentation : Array(CodeActionKindDocumentation)?

    @[JSON::Field(key: "resolveProvider")]
    property resolve_provider : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @code_action_kinds : Array(CodeActionKind | String)? = nil,
      @documentation : Array(CodeActionKindDocumentation)? = nil,
      @resolve_provider : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a {@link CodeActionRequest}.
  class CodeActionRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "codeActionKinds")]
    property code_action_kinds : Array(CodeActionKind | String)?

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?
    property documentation : Array(CodeActionKindDocumentation)?

    @[JSON::Field(key: "resolveProvider")]
    property resolve_provider : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @code_action_kinds : Array(CodeActionKind | String)? = nil,
      @documentation : Array(CodeActionKindDocumentation)? = nil,
      @resolve_provider : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # The parameters of a {@link WorkspaceSymbolRequest}.
  class WorkspaceSymbolParams
    include JSON::Serializable

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?
    property query : String

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @query : String,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # A special workspace symbol that supports locations without a range.
  #
  # See also SymbolInformation.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class WorkspaceSymbol
    include JSON::Serializable

    @[JSON::Field(key: "containerName")]
    property container_name : String?
    property data : LSPAny?
    property kind : SymbolKind
    property location : Location | LocationUriOnly
    property name : String
    property tags : Array(SymbolTag)?

    def initialize(
      @kind : SymbolKind,
      @location : Location | LocationUriOnly,
      @name : String,
      @container_name : String? = nil,
      @data : LSPAny? = nil,
      @tags : Array(SymbolTag)? = nil,
    )
    end
  end

  # Server capabilities for a {@link WorkspaceSymbolRequest}.
  class WorkspaceSymbolOptions
    include JSON::Serializable

    @[JSON::Field(key: "resolveProvider")]
    property resolve_provider : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @resolve_provider : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a {@link WorkspaceSymbolRequest}.
  class WorkspaceSymbolRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "resolveProvider")]
    property resolve_provider : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @resolve_provider : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # The parameters of a {@link CodeLensRequest}.
  class CodeLensParams
    include JSON::Serializable

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @text_document : TextDocumentIdentifier,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # A code lens represents a {@link Command command} that should be shown along with
  # source text, like the number of references, a way to run tests, etc.
  #
  # A code lens is _unresolved_ when no command is associated to it. For performance
  # reasons the creation of a code lens and resolving should be done in two stages.
  class CodeLens
    include JSON::Serializable

    property command : Command?
    property data : LSPAny?
    property range : Range

    def initialize(
      @range : Range,
      @command : Command? = nil,
      @data : LSPAny? = nil,
    )
    end
  end

  # Code Lens provider options of a {@link CodeLensRequest}.
  class CodeLensOptions
    include JSON::Serializable

    @[JSON::Field(key: "resolveProvider")]
    property resolve_provider : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @resolve_provider : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a {@link CodeLensRequest}.
  class CodeLensRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?

    @[JSON::Field(key: "resolveProvider")]
    property resolve_provider : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @resolve_provider : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # The parameters of a {@link DocumentLinkRequest}.
  class DocumentLinkParams
    include JSON::Serializable

    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @text_document : TextDocumentIdentifier,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # A document link is a range in a text document that links to an internal or external resource, like another
  # text document or a web site.
  class DocumentLink
    include JSON::Serializable

    property data : LSPAny?
    property range : Range
    property target : String?
    property tooltip : String?

    def initialize(
      @range : Range,
      @data : LSPAny? = nil,
      @target : String? = nil,
      @tooltip : String? = nil,
    )
    end
  end

  # Provider options for a {@link DocumentLinkRequest}.
  class DocumentLinkOptions
    include JSON::Serializable

    @[JSON::Field(key: "resolveProvider")]
    property resolve_provider : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @resolve_provider : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a {@link DocumentLinkRequest}.
  class DocumentLinkRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?

    @[JSON::Field(key: "resolveProvider")]
    property resolve_provider : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @resolve_provider : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # The parameters of a {@link DocumentFormattingRequest}.
  class DocumentFormattingParams
    include JSON::Serializable

    property options : FormattingOptions

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @options : FormattingOptions,
      @text_document : TextDocumentIdentifier,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Provider options for a {@link DocumentFormattingRequest}.
  class DocumentFormattingOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a {@link DocumentFormattingRequest}.
  class DocumentFormattingRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # The parameters of a {@link DocumentRangeFormattingRequest}.
  class DocumentRangeFormattingParams
    include JSON::Serializable

    property options : FormattingOptions
    property range : Range

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @options : FormattingOptions,
      @range : Range,
      @text_document : TextDocumentIdentifier,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Provider options for a {@link DocumentRangeFormattingRequest}.
  class DocumentRangeFormattingOptions
    include JSON::Serializable

    @[JSON::Field(key: "rangesSupport")]
    property ranges_support : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @ranges_support : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a {@link DocumentRangeFormattingRequest}.
  class DocumentRangeFormattingRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?

    @[JSON::Field(key: "rangesSupport")]
    property ranges_support : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @ranges_support : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # The parameters of a {@link DocumentRangesFormattingRequest}.
  #
  # @since 3.18.0
  # @proposed
  # Since: #3.18.0
  # Proposed
  class DocumentRangesFormattingParams
    include JSON::Serializable

    property options : FormattingOptions
    property ranges : Array(Range)

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @options : FormattingOptions,
      @ranges : Array(Range),
      @text_document : TextDocumentIdentifier,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # The parameters of a {@link DocumentOnTypeFormattingRequest}.
  class DocumentOnTypeFormattingParams
    include JSON::Serializable

    property ch : String
    property options : FormattingOptions
    property position : Position

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    def initialize(
      @ch : String,
      @options : FormattingOptions,
      @position : Position,
      @text_document : TextDocumentIdentifier,
    )
    end
  end

  # Provider options for a {@link DocumentOnTypeFormattingRequest}.
  class DocumentOnTypeFormattingOptions
    include JSON::Serializable

    @[JSON::Field(key: "firstTriggerCharacter")]
    property first_trigger_character : String

    @[JSON::Field(key: "moreTriggerCharacter")]
    property more_trigger_character : Array(String)?

    def initialize(
      @first_trigger_character : String,
      @more_trigger_character : Array(String)? = nil,
    )
    end
  end

  # Registration options for a {@link DocumentOnTypeFormattingRequest}.
  class DocumentOnTypeFormattingRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?

    @[JSON::Field(key: "firstTriggerCharacter")]
    property first_trigger_character : String

    @[JSON::Field(key: "moreTriggerCharacter")]
    property more_trigger_character : Array(String)?

    def initialize(
      @document_selector : DocumentSelector,
      @first_trigger_character : String,
      @more_trigger_character : Array(String)? = nil,
    )
    end
  end

  # The parameters of a {@link RenameRequest}.
  class RenameParams
    include JSON::Serializable

    @[JSON::Field(key: "newName")]
    property new_name : String
    property position : Position

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @new_name : String,
      @position : Position,
      @text_document : TextDocumentIdentifier,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Provider options for a {@link RenameRequest}.
  class RenameOptions
    include JSON::Serializable

    @[JSON::Field(key: "prepareProvider")]
    property prepare_provider : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @prepare_provider : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a {@link RenameRequest}.
  class RenameRegistrationOptions
    include JSON::Serializable

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?

    @[JSON::Field(key: "prepareProvider")]
    property prepare_provider : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector,
      @prepare_provider : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class PrepareRenameParams
    include JSON::Serializable

    property position : Position

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @position : Position,
      @text_document : TextDocumentIdentifier,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # The parameters of a {@link ExecuteCommandRequest}.
  class ExecuteCommandParams
    include JSON::Serializable

    property arguments : Array(LSPAny)?
    property command : String

    @[JSON::Field(key: "workDoneToken")]
    property work_done_token : ProgressToken?

    def initialize(
      @command : String,
      @arguments : Array(LSPAny)? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # The server capabilities of a {@link ExecuteCommandRequest}.
  class ExecuteCommandOptions
    include JSON::Serializable

    property commands : Array(String)

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @commands : Array(String),
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a {@link ExecuteCommandRequest}.
  class ExecuteCommandRegistrationOptions
    include JSON::Serializable

    property commands : Array(String)

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @commands : Array(String),
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # The parameters passed via an apply workspace edit request.
  class ApplyWorkspaceEditParams
    include JSON::Serializable

    property edit : WorkspaceEdit
    property label : String?
    property metadata : WorkspaceEditMetadata?

    def initialize(
      @edit : WorkspaceEdit,
      @label : String? = nil,
      @metadata : WorkspaceEditMetadata? = nil,
    )
    end
  end

  # The result returned from the apply workspace edit request.
  #
  # @since 3.17 renamed from ApplyWorkspaceEditResponse
  # Since: #3.17 renamed from ApplyWorkspaceEditResponse
  class ApplyWorkspaceEditResult
    include JSON::Serializable

    property applied : Bool

    @[JSON::Field(key: "failedChange")]
    property failed_change : UInt32?

    @[JSON::Field(key: "failureReason")]
    property failure_reason : String?

    def initialize(
      @applied : Bool,
      @failed_change : UInt32? = nil,
      @failure_reason : String? = nil,
    )
    end
  end

  class WorkDoneProgressBegin
    include JSON::Serializable

    property cancellable : Bool?
    property kind : String
    property message : String?
    property percentage : UInt32?
    property title : String

    def initialize(
      @kind : String,
      @title : String,
      @cancellable : Bool? = nil,
      @message : String? = nil,
      @percentage : UInt32? = nil,
    )
    end
  end

  class WorkDoneProgressReport
    include JSON::Serializable

    property cancellable : Bool?
    property kind : String
    property message : String?
    property percentage : UInt32?

    def initialize(
      @kind : String,
      @cancellable : Bool? = nil,
      @message : String? = nil,
      @percentage : UInt32? = nil,
    )
    end
  end

  class WorkDoneProgressEnd
    include JSON::Serializable

    property kind : String
    property message : String?

    def initialize(
      @kind : String,
      @message : String? = nil,
    )
    end
  end

  class SetTraceParams
    include JSON::Serializable

    property value : TraceValue

    def initialize(
      @value : TraceValue,
    )
    end
  end

  class LogTraceParams
    include JSON::Serializable

    property message : String
    property verbose : String?

    def initialize(
      @message : String,
      @verbose : String? = nil,
    )
    end
  end

  class CancelParams
    include JSON::Serializable

    property id : Int32 | String

    def initialize(
      @id : Int32 | String,
    )
    end
  end

  class ProgressParams
    include JSON::Serializable

    property token : ProgressToken
    property value : LSPAny

    def initialize(
      @token : ProgressToken,
      @value : LSPAny,
    )
    end
  end

  # Represents the connection of two locations. Provides additional metadata over normal {@link Location locations},
  # including an origin range.
  class LocationLink
    include JSON::Serializable

    @[JSON::Field(key: "originSelectionRange")]
    property origin_selection_range : Range?

    @[JSON::Field(key: "targetRange")]
    property target_range : Range

    @[JSON::Field(key: "targetSelectionRange")]
    property target_selection_range : Range

    @[JSON::Field(key: "targetUri")]
    property target_uri : String

    def initialize(
      @target_range : Range,
      @target_selection_range : Range,
      @target_uri : String,
      @origin_selection_range : Range? = nil,
    )
    end
  end

  # A range in a text document expressed as (zero-based) start and end positions.
  #
  # If you want to specify a range that contains a line including the line ending
  # character(s) then use an end position denoting the start of the next line.
  # For example:
  # ```ts
  # {
  #     start: { line: 5, character: 23 }
  #     end : { line 6, character : 0 }
  # }
  # ```
  class Range
    include JSON::Serializable

    property end : Position
    property start : Position

    def initialize(
      @end : Position,
      @start : Position,
    )
    end
  end

  # The workspace folder change event.
  class WorkspaceFoldersChangeEvent
    include JSON::Serializable

    property added : Array(WorkspaceFolder)
    property removed : Array(WorkspaceFolder)

    def initialize(
      @added : Array(WorkspaceFolder),
      @removed : Array(WorkspaceFolder),
    )
    end
  end

  class ConfigurationItem
    include JSON::Serializable

    @[JSON::Field(key: "scopeUri")]
    property scope_uri : String?
    property section : String?

    def initialize(
      @scope_uri : String? = nil,
      @section : String? = nil,
    )
    end
  end

  # A literal to identify a text document in the client.
  class TextDocumentIdentifier
    include JSON::Serializable

    property uri : String

    def initialize(
      @uri : String,
    )
    end
  end

  # Represents a color in RGBA space.
  class Color
    include JSON::Serializable

    property alpha : Float32
    property blue : Float32
    property green : Float32
    property red : Float32

    def initialize(
      @alpha : Float32,
      @blue : Float32,
      @green : Float32,
      @red : Float32,
    )
    end
  end

  # Position in a text document expressed as zero-based line and character
  # offset. Prior to 3.17 the offsets were always based on a UTF-16 string
  # representation. So a string of the form `a𐐀b` the character offset of the
  # character `a` is 0, the character offset of `𐐀` is 1 and the character
  # offset of b is 3 since `𐐀` is represented using two code units in UTF-16.
  # Since 3.17 clients and servers can agree on a different string encoding
  # representation (e.g. UTF-8). The client announces it's supported encoding
  # via the client capability [`general.positionEncodings`](https://microsoft.github.io/language-server-protocol/specifications/specification-current/#clientCapabilities).
  # The value is an array of position encodings the client supports, with
  # decreasing preference (e.g. the encoding at index `0` is the most preferred
  # one). To stay backwards compatible the only mandatory encoding is UTF-16
  # represented via the string `utf-16`. The server can pick one of the
  # encodings offered by the client and signals that encoding back to the
  # client via the initialize result's property
  # [`capabilities.positionEncoding`](https://microsoft.github.io/language-server-protocol/specifications/specification-current/#serverCapabilities). If the string value
  # `utf-16` is missing from the client's capability `general.positionEncodings`
  # servers can safely assume that the client supports UTF-16. If the server
  # omits the position encoding in its initialize result the encoding defaults
  # to the string value `utf-16`. Implementation considerations: since the
  # conversion from one encoding into another requires the content of the
  # file / line the conversion is best done where the file is read which is
  # usually on the server side.
  #
  # Positions are line end character agnostic. So you can not specify a position
  # that denotes `\r|\n` or `\n|` where `|` represents the character offset.
  #
  # @since 3.17.0 - support for negotiated position encoding.
  # Since: #3.17.0 - support for negotiated position encoding.
  class Position
    include JSON::Serializable

    property character : UInt32
    property line : UInt32

    def initialize(
      @character : UInt32,
      @line : UInt32,
    )
    end
  end

  # @since 3.16.0
  # Since: #3.16.0
  class SemanticTokensEdit
    include JSON::Serializable

    property data : Array(UInt32)?

    @[JSON::Field(key: "deleteCount")]
    property delete_count : UInt32
    property start : UInt32

    def initialize(
      @delete_count : UInt32,
      @start : UInt32,
      @data : Array(UInt32)? = nil,
    )
    end
  end

  # Represents information on a file/folder create.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class FileCreate
    include JSON::Serializable

    property uri : String

    def initialize(
      @uri : String,
    )
    end
  end

  # Describes textual changes on a text document. A TextDocumentEdit describes all changes
  # on a document version Si and after they are applied move the document to version Si+1.
  # So the creator of a TextDocumentEdit doesn't need to sort the array of edits or do any
  # kind of ordering. However the edits must be non overlapping.
  class TextDocumentEdit
    include JSON::Serializable

    property edits : Array(TextEdit | AnnotatedTextEdit | SnippetTextEdit)

    @[JSON::Field(key: "textDocument")]
    property text_document : OptionalVersionedTextDocumentIdentifier

    def initialize(
      @edits : Array(TextEdit | AnnotatedTextEdit | SnippetTextEdit),
      @text_document : OptionalVersionedTextDocumentIdentifier,
    )
    end
  end

  # A generic resource operation.
  class ResourceOperation
    include JSON::Serializable

    @[JSON::Field(key: "annotationId")]
    property annotation_id : ChangeAnnotationIdentifier?
    property kind : String

    def initialize(
      @kind : String,
      @annotation_id : ChangeAnnotationIdentifier? = nil,
    )
    end
  end

  # Create file operation.
  class CreateFile
    include JSON::Serializable

    @[JSON::Field(key: "annotationId")]
    property annotation_id : ChangeAnnotationIdentifier?
    property kind : String
    property options : CreateFileOptions?
    property uri : String

    def initialize(
      @kind : String,
      @uri : String,
      @annotation_id : ChangeAnnotationIdentifier? = nil,
      @options : CreateFileOptions? = nil,
    )
    end
  end

  # Rename file operation
  class RenameFile
    include JSON::Serializable

    @[JSON::Field(key: "annotationId")]
    property annotation_id : ChangeAnnotationIdentifier?
    property kind : String

    @[JSON::Field(key: "newUri")]
    property new_uri : String

    @[JSON::Field(key: "oldUri")]
    property old_uri : String
    property options : RenameFileOptions?

    def initialize(
      @kind : String,
      @new_uri : String,
      @old_uri : String,
      @annotation_id : ChangeAnnotationIdentifier? = nil,
      @options : RenameFileOptions? = nil,
    )
    end
  end

  # Delete file operation
  class DeleteFile
    include JSON::Serializable

    @[JSON::Field(key: "annotationId")]
    property annotation_id : ChangeAnnotationIdentifier?
    property kind : String
    property options : DeleteFileOptions?
    property uri : String

    def initialize(
      @kind : String,
      @uri : String,
      @annotation_id : ChangeAnnotationIdentifier? = nil,
      @options : DeleteFileOptions? = nil,
    )
    end
  end

  # Additional information that describes document changes.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class ChangeAnnotation
    include JSON::Serializable

    property description : String?
    property label : String

    @[JSON::Field(key: "needsConfirmation")]
    property needs_confirmation : Bool?

    def initialize(
      @label : String,
      @description : String? = nil,
      @needs_confirmation : Bool? = nil,
    )
    end
  end

  # A filter to describe in which file operation requests or notifications
  # the server is interested in receiving.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class FileOperationFilter
    include JSON::Serializable

    property pattern : FileOperationPattern
    property scheme : String?

    def initialize(
      @pattern : FileOperationPattern,
      @scheme : String? = nil,
    )
    end
  end

  # Represents information on a file/folder rename.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class FileRename
    include JSON::Serializable

    @[JSON::Field(key: "newUri")]
    property new_uri : String

    @[JSON::Field(key: "oldUri")]
    property old_uri : String

    def initialize(
      @new_uri : String,
      @old_uri : String,
    )
    end
  end

  # Represents information on a file/folder delete.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class FileDelete
    include JSON::Serializable

    property uri : String

    def initialize(
      @uri : String,
    )
    end
  end

  # @since 3.17.0
  # Since: #3.17.0
  class InlineValueContext
    include JSON::Serializable

    @[JSON::Field(key: "frameId")]
    property frame_id : Int32

    @[JSON::Field(key: "stoppedLocation")]
    property stopped_location : Range

    def initialize(
      @frame_id : Int32,
      @stopped_location : Range,
    )
    end
  end

  # Provide inline value as text.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class InlineValueText
    include JSON::Serializable

    property range : Range
    property text : String

    def initialize(
      @range : Range,
      @text : String,
    )
    end
  end

  # Provide inline value through a variable lookup.
  # If only a range is specified, the variable name will be extracted from the underlying document.
  # An optional variable name can be used to override the extracted name.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class InlineValueVariableLookup
    include JSON::Serializable

    @[JSON::Field(key: "caseSensitiveLookup")]
    property case_sensitive_lookup : Bool
    property range : Range

    @[JSON::Field(key: "variableName")]
    property variable_name : String?

    def initialize(
      @case_sensitive_lookup : Bool,
      @range : Range,
      @variable_name : String? = nil,
    )
    end
  end

  # Provide an inline value through an expression evaluation.
  # If only a range is specified, the expression will be extracted from the underlying document.
  # An optional expression can be used to override the extracted expression.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class InlineValueEvaluatableExpression
    include JSON::Serializable

    property expression : String?
    property range : Range

    def initialize(
      @range : Range,
      @expression : String? = nil,
    )
    end
  end

  # An inlay hint label part allows for interactive and composite labels
  # of inlay hints.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class InlayHintLabelPart
    include JSON::Serializable

    property command : Command?
    property location : Location?
    property tooltip : String | MarkupContent?
    property value : String

    def initialize(
      @value : String,
      @command : Command? = nil,
      @location : Location? = nil,
      @tooltip : String | MarkupContent? = nil,
    )
    end
  end

  # A `MarkupContent` literal represents a string value which content is interpreted base on its
  # kind flag. Currently the protocol supports `plaintext` and `markdown` as markup kinds.
  #
  # If the kind is `markdown` then the value can contain fenced code blocks like in GitHub issues.
  # See https://help.github.com/articles/creating-and-highlighting-code-blocks/#syntax-highlighting
  #
  # Here is an example how such a string can be constructed using JavaScript / TypeScript:
  # ```ts
  # let markdown: MarkdownContent = {
  #  kind: MarkupKind.Markdown,
  #  value: [
  #    '# Header',
  #    'Some text',
  #    '```typescript',
  #    'someCode();',
  #    '```'
  #  ].join('\n')
  # };
  # ```
  #
  # *Please Note* that clients might sanitize the return markdown. A client could decide to
  # remove HTML from the markdown to avoid script execution.
  class MarkupContent
    include JSON::Serializable

    property kind : MarkupKind
    property value : String

    def initialize(
      @kind : MarkupKind,
      @value : String,
    )
    end
  end

  # A diagnostic report with a full set of problems.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class FullDocumentDiagnosticReport
    include JSON::Serializable

    property items : Array(Diagnostic)
    property kind : String

    @[JSON::Field(key: "resultId")]
    property result_id : String?

    def initialize(
      @items : Array(Diagnostic),
      @kind : String,
      @result_id : String? = nil,
    )
    end
  end

  # A full diagnostic report with a set of related documents.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class RelatedFullDocumentDiagnosticReport
    include JSON::Serializable

    property items : Array(Diagnostic)
    property kind : String

    @[JSON::Field(key: "relatedDocuments")]
    property related_documents : Hash(String, FullDocumentDiagnosticReport | UnchangedDocumentDiagnosticReport)?

    @[JSON::Field(key: "resultId")]
    property result_id : String?

    def initialize(
      @items : Array(Diagnostic),
      @kind : String,
      @related_documents : Hash(String, FullDocumentDiagnosticReport | UnchangedDocumentDiagnosticReport)? = nil,
      @result_id : String? = nil,
    )
    end
  end

  # A diagnostic report indicating that the last returned
  # report is still accurate.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class UnchangedDocumentDiagnosticReport
    include JSON::Serializable

    property kind : String

    @[JSON::Field(key: "resultId")]
    property result_id : String

    def initialize(
      @kind : String,
      @result_id : String,
    )
    end
  end

  # An unchanged diagnostic report with a set of related documents.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class RelatedUnchangedDocumentDiagnosticReport
    include JSON::Serializable

    property kind : String

    @[JSON::Field(key: "relatedDocuments")]
    property related_documents : Hash(String, FullDocumentDiagnosticReport | UnchangedDocumentDiagnosticReport)?

    @[JSON::Field(key: "resultId")]
    property result_id : String

    def initialize(
      @kind : String,
      @result_id : String,
      @related_documents : Hash(String, FullDocumentDiagnosticReport | UnchangedDocumentDiagnosticReport)? = nil,
    )
    end
  end

  # A previous result id in a workspace pull request.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class PreviousResultId
    include JSON::Serializable

    property uri : String
    property value : String

    def initialize(
      @uri : String,
      @value : String,
    )
    end
  end

  # A notebook document.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class NotebookDocument
    include JSON::Serializable

    property cells : Array(NotebookCell)
    property metadata : LSPObject?

    @[JSON::Field(key: "notebookType")]
    property notebook_type : String
    property uri : String
    property version : Int32

    def initialize(
      @cells : Array(NotebookCell),
      @notebook_type : String,
      @uri : String,
      @version : Int32,
      @metadata : LSPObject? = nil,
    )
    end
  end

  # An item to transfer a text document from the client to the
  # server.
  class TextDocumentItem
    include JSON::Serializable

    @[JSON::Field(key: "languageId")]
    property language_id : LanguageKind | String
    property text : String
    property uri : String
    property version : Int32

    def initialize(
      @language_id : LanguageKind | String,
      @text : String,
      @uri : String,
      @version : Int32,
    )
    end
  end

  # A versioned notebook document identifier.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class VersionedNotebookDocumentIdentifier
    include JSON::Serializable

    property uri : String
    property version : Int32

    def initialize(
      @uri : String,
      @version : Int32,
    )
    end
  end

  # A change event for a notebook document.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class NotebookDocumentChangeEvent
    include JSON::Serializable

    property cells : NotebookDocumentCellChanges?
    property metadata : LSPObject?

    def initialize(
      @cells : NotebookDocumentCellChanges? = nil,
      @metadata : LSPObject? = nil,
    )
    end
  end

  # A literal to identify a notebook document in the client.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class NotebookDocumentIdentifier
    include JSON::Serializable

    property uri : String

    def initialize(
      @uri : String,
    )
    end
  end

  # Provides information about the context in which an inline completion was requested.
  #
  # @since 3.18.0
  # @proposed
  # Since: #3.18.0
  # Proposed
  class InlineCompletionContext
    include JSON::Serializable

    @[JSON::Field(key: "selectedCompletionInfo")]
    property selected_completion_info : SelectedCompletionInfo?

    @[JSON::Field(key: "triggerKind")]
    property trigger_kind : InlineCompletionTriggerKind

    def initialize(
      @trigger_kind : InlineCompletionTriggerKind,
      @selected_completion_info : SelectedCompletionInfo? = nil,
    )
    end
  end

  # A string value used as a snippet is a template which allows to insert text
  # and to control the editor cursor when insertion happens.
  #
  # A snippet can define tab stops and placeholders with `$1`, `$2`
  # and `${3:foo}`. `$0` defines the final tab stop, it defaults to
  # the end of the snippet. Variables are defined with `$name` and
  # `${name:default value}`.
  #
  # @since 3.18.0
  # @proposed
  # Since: #3.18.0
  # Proposed
  class StringValue
    include JSON::Serializable

    property kind : String
    property value : String

    def initialize(
      @kind : String,
      @value : String,
    )
    end
  end

  # General parameters to register for a notification or to register a provider.
  class Registration
    include JSON::Serializable

    property id : String
    property method : String

    @[JSON::Field(key: "registerOptions")]
    property register_options : LSPAny?

    def initialize(
      @id : String,
      @method : String,
      @register_options : LSPAny? = nil,
    )
    end
  end

  # General parameters to unregister a request or notification.
  class Unregistration
    include JSON::Serializable

    property id : String
    property method : String

    def initialize(
      @id : String,
      @method : String,
    )
    end
  end

  # Defines the capabilities provided by a language
  # server.
  class ServerCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "callHierarchyProvider")]
    property call_hierarchy_provider : Bool | CallHierarchyOptions | CallHierarchyRegistrationOptions?

    @[JSON::Field(key: "codeActionProvider")]
    property code_action_provider : Bool | CodeActionOptions?

    @[JSON::Field(key: "codeLensProvider")]
    property code_lens_provider : CodeLensOptions?

    @[JSON::Field(key: "colorProvider")]
    property color_provider : Bool | DocumentColorOptions | DocumentColorRegistrationOptions?

    @[JSON::Field(key: "completionProvider")]
    property completion_provider : CompletionOptions?

    @[JSON::Field(key: "declarationProvider")]
    property declaration_provider : Bool | DeclarationOptions | DeclarationRegistrationOptions?

    @[JSON::Field(key: "definitionProvider")]
    property definition_provider : Bool | DefinitionOptions?

    @[JSON::Field(key: "diagnosticProvider")]
    property diagnostic_provider : DiagnosticOptions | DiagnosticRegistrationOptions?

    @[JSON::Field(key: "documentFormattingProvider")]
    property document_formatting_provider : Bool | DocumentFormattingOptions?

    @[JSON::Field(key: "documentHighlightProvider")]
    property document_highlight_provider : Bool | DocumentHighlightOptions?

    @[JSON::Field(key: "documentLinkProvider")]
    property document_link_provider : DocumentLinkOptions?

    @[JSON::Field(key: "documentOnTypeFormattingProvider")]
    property document_on_type_formatting_provider : DocumentOnTypeFormattingOptions?

    @[JSON::Field(key: "documentRangeFormattingProvider")]
    property document_range_formatting_provider : Bool | DocumentRangeFormattingOptions?

    @[JSON::Field(key: "documentSymbolProvider")]
    property document_symbol_provider : Bool | DocumentSymbolOptions?

    @[JSON::Field(key: "executeCommandProvider")]
    property execute_command_provider : ExecuteCommandOptions?
    property experimental : LSPAny?

    @[JSON::Field(key: "foldingRangeProvider")]
    property folding_range_provider : Bool | FoldingRangeOptions | FoldingRangeRegistrationOptions?

    @[JSON::Field(key: "hoverProvider")]
    property hover_provider : Bool | HoverOptions?

    @[JSON::Field(key: "implementationProvider")]
    property implementation_provider : Bool | ImplementationOptions | ImplementationRegistrationOptions?

    @[JSON::Field(key: "inlayHintProvider")]
    property inlay_hint_provider : Bool | InlayHintOptions | InlayHintRegistrationOptions?

    @[JSON::Field(key: "inlineCompletionProvider")]
    property inline_completion_provider : Bool | InlineCompletionOptions?

    @[JSON::Field(key: "inlineValueProvider")]
    property inline_value_provider : Bool | InlineValueOptions | InlineValueRegistrationOptions?

    @[JSON::Field(key: "linkedEditingRangeProvider")]
    property linked_editing_range_provider : Bool | LinkedEditingRangeOptions | LinkedEditingRangeRegistrationOptions?

    @[JSON::Field(key: "monikerProvider")]
    property moniker_provider : Bool | MonikerOptions | MonikerRegistrationOptions?

    @[JSON::Field(key: "notebookDocumentSync")]
    property notebook_document_sync : NotebookDocumentSyncOptions | NotebookDocumentSyncRegistrationOptions?

    @[JSON::Field(key: "positionEncoding")]
    property position_encoding : PositionEncodingKind | String?

    @[JSON::Field(key: "referencesProvider")]
    property references_provider : Bool | ReferenceOptions?

    @[JSON::Field(key: "renameProvider")]
    property rename_provider : Bool | RenameOptions?

    @[JSON::Field(key: "selectionRangeProvider")]
    property selection_range_provider : Bool | SelectionRangeOptions | SelectionRangeRegistrationOptions?

    @[JSON::Field(key: "semanticTokensProvider")]
    property semantic_tokens_provider : SemanticTokensOptions | SemanticTokensRegistrationOptions?

    @[JSON::Field(key: "signatureHelpProvider")]
    property signature_help_provider : SignatureHelpOptions?

    @[JSON::Field(key: "textDocumentSync")]
    property text_document_sync : TextDocumentSyncOptions | TextDocumentSyncKind?

    @[JSON::Field(key: "typeDefinitionProvider")]
    property type_definition_provider : Bool | TypeDefinitionOptions | TypeDefinitionRegistrationOptions?

    @[JSON::Field(key: "typeHierarchyProvider")]
    property type_hierarchy_provider : Bool | TypeHierarchyOptions | TypeHierarchyRegistrationOptions?
    property workspace : WorkspaceOptions?

    @[JSON::Field(key: "workspaceSymbolProvider")]
    property workspace_symbol_provider : Bool | WorkspaceSymbolOptions?

    def initialize(
      @call_hierarchy_provider : Bool | CallHierarchyOptions | CallHierarchyRegistrationOptions? = nil,
      @code_action_provider : Bool | CodeActionOptions? = nil,
      @code_lens_provider : CodeLensOptions? = nil,
      @color_provider : Bool | DocumentColorOptions | DocumentColorRegistrationOptions? = nil,
      @completion_provider : CompletionOptions? = nil,
      @declaration_provider : Bool | DeclarationOptions | DeclarationRegistrationOptions? = nil,
      @definition_provider : Bool | DefinitionOptions? = nil,
      @diagnostic_provider : DiagnosticOptions | DiagnosticRegistrationOptions? = nil,
      @document_formatting_provider : Bool | DocumentFormattingOptions? = nil,
      @document_highlight_provider : Bool | DocumentHighlightOptions? = nil,
      @document_link_provider : DocumentLinkOptions? = nil,
      @document_on_type_formatting_provider : DocumentOnTypeFormattingOptions? = nil,
      @document_range_formatting_provider : Bool | DocumentRangeFormattingOptions? = nil,
      @document_symbol_provider : Bool | DocumentSymbolOptions? = nil,
      @execute_command_provider : ExecuteCommandOptions? = nil,
      @experimental : LSPAny? = nil,
      @folding_range_provider : Bool | FoldingRangeOptions | FoldingRangeRegistrationOptions? = nil,
      @hover_provider : Bool | HoverOptions? = nil,
      @implementation_provider : Bool | ImplementationOptions | ImplementationRegistrationOptions? = nil,
      @inlay_hint_provider : Bool | InlayHintOptions | InlayHintRegistrationOptions? = nil,
      @inline_completion_provider : Bool | InlineCompletionOptions? = nil,
      @inline_value_provider : Bool | InlineValueOptions | InlineValueRegistrationOptions? = nil,
      @linked_editing_range_provider : Bool | LinkedEditingRangeOptions | LinkedEditingRangeRegistrationOptions? = nil,
      @moniker_provider : Bool | MonikerOptions | MonikerRegistrationOptions? = nil,
      @notebook_document_sync : NotebookDocumentSyncOptions | NotebookDocumentSyncRegistrationOptions? = nil,
      @position_encoding : PositionEncodingKind | String? = nil,
      @references_provider : Bool | ReferenceOptions? = nil,
      @rename_provider : Bool | RenameOptions? = nil,
      @selection_range_provider : Bool | SelectionRangeOptions | SelectionRangeRegistrationOptions? = nil,
      @semantic_tokens_provider : SemanticTokensOptions | SemanticTokensRegistrationOptions? = nil,
      @signature_help_provider : SignatureHelpOptions? = nil,
      @text_document_sync : TextDocumentSyncOptions | TextDocumentSyncKind? = nil,
      @type_definition_provider : Bool | TypeDefinitionOptions | TypeDefinitionRegistrationOptions? = nil,
      @type_hierarchy_provider : Bool | TypeHierarchyOptions | TypeHierarchyRegistrationOptions? = nil,
      @workspace : WorkspaceOptions? = nil,
      @workspace_symbol_provider : Bool | WorkspaceSymbolOptions? = nil,
    )
    end
  end

  # Information about the server
  #
  # @since 3.15.0
  # @since 3.18.0 ServerInfo type name added.
  # Since: #3.18.0 ServerInfo type name added.
  class ServerInfo
    include JSON::Serializable

    property name : String
    property version : String?

    def initialize(
      @name : String,
      @version : String? = nil,
    )
    end
  end

  # A text document identifier to denote a specific version of a text document.
  class VersionedTextDocumentIdentifier
    include JSON::Serializable

    property uri : String
    property version : Int32

    def initialize(
      @uri : String,
      @version : Int32,
    )
    end
  end

  # An event describing a file change.
  class FileEvent
    include JSON::Serializable

    property type : FileChangeType
    property uri : String

    def initialize(
      @type : FileChangeType,
      @uri : String,
    )
    end
  end

  class FileSystemWatcher
    include JSON::Serializable

    @[JSON::Field(key: "globPattern")]
    property glob_pattern : GlobPattern
    property kind : WatchKind | UInt32?

    def initialize(
      @glob_pattern : GlobPattern,
      @kind : WatchKind | UInt32? = nil,
    )
    end
  end

  # Represents a diagnostic, such as a compiler error or warning. Diagnostic objects
  # are only valid in the scope of a resource.
  class Diagnostic
    include JSON::Serializable

    property code : Int32 | String?

    @[JSON::Field(key: "codeDescription")]
    property code_description : CodeDescription?
    property data : LSPAny?
    property message : String
    property range : Range

    @[JSON::Field(key: "relatedInformation")]
    property related_information : Array(DiagnosticRelatedInformation)?
    property severity : DiagnosticSeverity?
    property source : String?
    property tags : Array(DiagnosticTag)?

    def initialize(
      @message : String,
      @range : Range,
      @code : Int32 | String? = nil,
      @code_description : CodeDescription? = nil,
      @data : LSPAny? = nil,
      @related_information : Array(DiagnosticRelatedInformation)? = nil,
      @severity : DiagnosticSeverity? = nil,
      @source : String? = nil,
      @tags : Array(DiagnosticTag)? = nil,
    )
    end
  end

  # Contains additional information about the context in which a completion request is triggered.
  class CompletionContext
    include JSON::Serializable

    @[JSON::Field(key: "triggerCharacter")]
    property trigger_character : String?

    @[JSON::Field(key: "triggerKind")]
    property trigger_kind : CompletionTriggerKind

    def initialize(
      @trigger_kind : CompletionTriggerKind,
      @trigger_character : String? = nil,
    )
    end
  end

  # Additional details for a completion item label.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class CompletionItemLabelDetails
    include JSON::Serializable

    property description : String?
    property detail : String?

    def initialize(
      @description : String? = nil,
      @detail : String? = nil,
    )
    end
  end

  # A special text edit to provide an insert and a replace operation.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class InsertReplaceEdit
    include JSON::Serializable

    property insert : Range

    @[JSON::Field(key: "newText")]
    property new_text : String
    property replace : Range

    def initialize(
      @insert : Range,
      @new_text : String,
      @replace : Range,
    )
    end
  end

  # In many cases the items of an actual completion result share the same
  # value for properties like `commitCharacters` or the range of a text
  # edit. A completion list can therefore define item defaults which will
  # be used if a completion item itself doesn't specify the value.
  #
  # If a completion list specifies a default value and a completion item
  # also specifies a corresponding value the one from the item is used.
  #
  # Servers are only allowed to return default values if the client
  # signals support for this via the `completionList.itemDefaults`
  # capability.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class CompletionItemDefaults
    include JSON::Serializable

    @[JSON::Field(key: "commitCharacters")]
    property commit_characters : Array(String)?
    property data : LSPAny?

    @[JSON::Field(key: "editRange")]
    property edit_range : Range | EditRangeWithInsertReplace?

    @[JSON::Field(key: "insertTextFormat")]
    property insert_text_format : InsertTextFormat?

    @[JSON::Field(key: "insertTextMode")]
    property insert_text_mode : InsertTextMode?

    def initialize(
      @commit_characters : Array(String)? = nil,
      @data : LSPAny? = nil,
      @edit_range : Range | EditRangeWithInsertReplace? = nil,
      @insert_text_format : InsertTextFormat? = nil,
      @insert_text_mode : InsertTextMode? = nil,
    )
    end
  end

  # Additional information about the context in which a signature help request was triggered.
  #
  # @since 3.15.0
  # Since: #3.15.0
  class SignatureHelpContext
    include JSON::Serializable

    @[JSON::Field(key: "activeSignatureHelp")]
    property active_signature_help : SignatureHelp?

    @[JSON::Field(key: "isRetrigger")]
    property is_retrigger : Bool

    @[JSON::Field(key: "triggerCharacter")]
    property trigger_character : String?

    @[JSON::Field(key: "triggerKind")]
    property trigger_kind : SignatureHelpTriggerKind

    def initialize(
      @is_retrigger : Bool,
      @trigger_kind : SignatureHelpTriggerKind,
      @active_signature_help : SignatureHelp? = nil,
      @trigger_character : String? = nil,
    )
    end
  end

  # Represents the signature of something callable. A signature
  # can have a label, like a function-name, a doc-comment, and
  # a set of parameters.
  class SignatureInformation
    include JSON::Serializable

    @[JSON::Field(key: "activeParameter")]
    property active_parameter : UInt32?
    property documentation : String | MarkupContent?
    property label : String
    property parameters : Array(ParameterInformation)?

    def initialize(
      @label : String,
      @active_parameter : UInt32? = nil,
      @documentation : String | MarkupContent? = nil,
      @parameters : Array(ParameterInformation)? = nil,
    )
    end
  end

  # Value-object that contains additional information when
  # requesting references.
  class ReferenceContext
    include JSON::Serializable

    @[JSON::Field(key: "includeDeclaration")]
    property include_declaration : Bool

    def initialize(
      @include_declaration : Bool,
    )
    end
  end

  # Contains additional diagnostic information about the context in which
  # a {@link CodeActionProvider.provideCodeActions code action} is run.
  class CodeActionContext
    include JSON::Serializable

    property diagnostics : Array(Diagnostic)
    property only : Array(CodeActionKind | String)?

    @[JSON::Field(key: "triggerKind")]
    property trigger_kind : CodeActionTriggerKind?

    def initialize(
      @diagnostics : Array(Diagnostic),
      @only : Array(CodeActionKind | String)? = nil,
      @trigger_kind : CodeActionTriggerKind? = nil,
    )
    end
  end

  # Captures why the code action is currently disabled.
  #
  # @since 3.18.0
  # Since: #3.18.0
  class CodeActionDisabled
    include JSON::Serializable

    property reason : String

    def initialize(
      @reason : String,
    )
    end
  end

  # Location with only uri and does not include range.
  #
  # @since 3.18.0
  # Since: #3.18.0
  class LocationUriOnly
    include JSON::Serializable

    property uri : String

    def initialize(
      @uri : String,
    )
    end
  end

  # Value-object describing what options formatting should use.
  class FormattingOptions
    include JSON::Serializable

    @[JSON::Field(key: "insertFinalNewline")]
    property insert_final_newline : Bool?

    @[JSON::Field(key: "insertSpaces")]
    property insert_spaces : Bool

    @[JSON::Field(key: "tabSize")]
    property tab_size : UInt32

    @[JSON::Field(key: "trimFinalNewlines")]
    property trim_final_newlines : Bool?

    @[JSON::Field(key: "trimTrailingWhitespace")]
    property trim_trailing_whitespace : Bool?

    def initialize(
      @insert_spaces : Bool,
      @tab_size : UInt32,
      @insert_final_newline : Bool? = nil,
      @trim_final_newlines : Bool? = nil,
      @trim_trailing_whitespace : Bool? = nil,
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class PrepareRenamePlaceholder
    include JSON::Serializable

    property placeholder : String
    property range : Range

    def initialize(
      @placeholder : String,
      @range : Range,
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class PrepareRenameDefaultBehavior
    include JSON::Serializable

    @[JSON::Field(key: "defaultBehavior")]
    property default_behavior : Bool

    def initialize(
      @default_behavior : Bool,
    )
    end
  end

  # Additional data about a workspace edit.
  #
  # @since 3.18.0
  # @proposed
  # Since: #3.18.0
  # Proposed
  class WorkspaceEditMetadata
    include JSON::Serializable

    @[JSON::Field(key: "isRefactoring")]
    property is_refactoring : Bool?

    def initialize(
      @is_refactoring : Bool? = nil,
    )
    end
  end

  # @since 3.16.0
  # Since: #3.16.0
  class SemanticTokensLegend
    include JSON::Serializable

    @[JSON::Field(key: "tokenModifiers")]
    property token_modifiers : Array(String)

    @[JSON::Field(key: "tokenTypes")]
    property token_types : Array(String)

    def initialize(
      @token_modifiers : Array(String),
      @token_types : Array(String),
    )
    end
  end

  # Semantic tokens options to support deltas for full documents
  #
  # @since 3.18.0
  # Since: #3.18.0
  class SemanticTokensFullDelta
    include JSON::Serializable

    property delta : Bool?

    def initialize(
      @delta : Bool? = nil,
    )
    end
  end

  # A text document identifier to optionally denote a specific version of a text document.
  class OptionalVersionedTextDocumentIdentifier
    include JSON::Serializable

    property uri : String
    property version : Int32?

    def initialize(
      @uri : String,
      @version : Int32,
    )
    end
  end

  # A special text edit with an additional change annotation.
  #
  # @since 3.16.0.
  # Since: #3.16.0.
  class AnnotatedTextEdit
    include JSON::Serializable

    @[JSON::Field(key: "annotationId")]
    property annotation_id : ChangeAnnotationIdentifier

    @[JSON::Field(key: "newText")]
    property new_text : String
    property range : Range

    def initialize(
      @annotation_id : ChangeAnnotationIdentifier,
      @new_text : String,
      @range : Range,
    )
    end
  end

  # An interactive text edit.
  #
  # @since 3.18.0
  # @proposed
  # Since: #3.18.0
  # Proposed
  class SnippetTextEdit
    include JSON::Serializable

    @[JSON::Field(key: "annotationId")]
    property annotation_id : ChangeAnnotationIdentifier?
    property range : Range
    property snippet : StringValue

    def initialize(
      @range : Range,
      @snippet : StringValue,
      @annotation_id : ChangeAnnotationIdentifier? = nil,
    )
    end
  end

  # Options to create a file.
  class CreateFileOptions
    include JSON::Serializable

    @[JSON::Field(key: "ignoreIfExists")]
    property ignore_if_exists : Bool?
    property overwrite : Bool?

    def initialize(
      @ignore_if_exists : Bool? = nil,
      @overwrite : Bool? = nil,
    )
    end
  end

  # Rename file options
  class RenameFileOptions
    include JSON::Serializable

    @[JSON::Field(key: "ignoreIfExists")]
    property ignore_if_exists : Bool?
    property overwrite : Bool?

    def initialize(
      @ignore_if_exists : Bool? = nil,
      @overwrite : Bool? = nil,
    )
    end
  end

  # Delete file options
  class DeleteFileOptions
    include JSON::Serializable

    @[JSON::Field(key: "ignoreIfNotExists")]
    property ignore_if_not_exists : Bool?
    property recursive : Bool?

    def initialize(
      @ignore_if_not_exists : Bool? = nil,
      @recursive : Bool? = nil,
    )
    end
  end

  # A pattern to describe in which file operation requests or notifications
  # the server is interested in receiving.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class FileOperationPattern
    include JSON::Serializable

    property glob : String
    property matches : FileOperationPatternKind?
    property options : FileOperationPatternOptions?

    def initialize(
      @glob : String,
      @matches : FileOperationPatternKind? = nil,
      @options : FileOperationPatternOptions? = nil,
    )
    end
  end

  # A full document diagnostic report for a workspace diagnostic result.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class WorkspaceFullDocumentDiagnosticReport
    include JSON::Serializable

    property items : Array(Diagnostic)
    property kind : String

    @[JSON::Field(key: "resultId")]
    property result_id : String?
    property uri : String
    property version : Int32?

    def initialize(
      @items : Array(Diagnostic),
      @kind : String,
      @uri : String,
      @version : Int32,
      @result_id : String? = nil,
    )
    end
  end

  # An unchanged document diagnostic report for a workspace diagnostic result.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class WorkspaceUnchangedDocumentDiagnosticReport
    include JSON::Serializable

    property kind : String

    @[JSON::Field(key: "resultId")]
    property result_id : String
    property uri : String
    property version : Int32?

    def initialize(
      @kind : String,
      @result_id : String,
      @uri : String,
      @version : Int32,
    )
    end
  end

  # A notebook cell.
  #
  # A cell's document URI must be unique across ALL notebook
  # cells and can therefore be used to uniquely identify a
  # notebook cell or the cell's text document.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class NotebookCell
    include JSON::Serializable

    property document : String

    @[JSON::Field(key: "executionSummary")]
    property execution_summary : ExecutionSummary?
    property kind : NotebookCellKind
    property metadata : LSPObject?

    def initialize(
      @document : String,
      @kind : NotebookCellKind,
      @execution_summary : ExecutionSummary? = nil,
      @metadata : LSPObject? = nil,
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class NotebookDocumentFilterWithNotebook
    include JSON::Serializable

    property cells : Array(NotebookCellLanguage)?
    property notebook : String | NotebookDocumentFilter

    def initialize(
      @notebook : String | NotebookDocumentFilter,
      @cells : Array(NotebookCellLanguage)? = nil,
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class NotebookDocumentFilterWithCells
    include JSON::Serializable

    property cells : Array(NotebookCellLanguage)
    property notebook : String | NotebookDocumentFilter?

    def initialize(
      @cells : Array(NotebookCellLanguage),
      @notebook : String | NotebookDocumentFilter? = nil,
    )
    end
  end

  # Cell changes to a notebook document.
  #
  # @since 3.18.0
  # Since: #3.18.0
  class NotebookDocumentCellChanges
    include JSON::Serializable

    property data : Array(NotebookCell)?
    property structure : NotebookDocumentCellChangeStructure?

    @[JSON::Field(key: "textContent")]
    property text_content : Array(NotebookDocumentCellContentChanges)?

    def initialize(
      @data : Array(NotebookCell)? = nil,
      @structure : NotebookDocumentCellChangeStructure? = nil,
      @text_content : Array(NotebookDocumentCellContentChanges)? = nil,
    )
    end
  end

  # Describes the currently selected completion item.
  #
  # @since 3.18.0
  # @proposed
  # Since: #3.18.0
  # Proposed
  class SelectedCompletionInfo
    include JSON::Serializable

    property range : Range
    property text : String

    def initialize(
      @range : Range,
      @text : String,
    )
    end
  end

  # Information about the client
  #
  # @since 3.15.0
  # @since 3.18.0 ClientInfo type name added.
  # Since: #3.18.0 ClientInfo type name added.
  class ClientInfo
    include JSON::Serializable

    property name : String
    property version : String?

    def initialize(
      @name : String,
      @version : String? = nil,
    )
    end
  end

  # Defines the capabilities provided by the client.
  class ClientCapabilities
    include JSON::Serializable

    property experimental : LSPAny?
    property general : GeneralClientCapabilities?

    @[JSON::Field(key: "notebookDocument")]
    property notebook_document : NotebookDocumentClientCapabilities?

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentClientCapabilities?
    property window : WindowClientCapabilities?
    property workspace : WorkspaceClientCapabilities?

    def initialize(
      @experimental : LSPAny? = nil,
      @general : GeneralClientCapabilities? = nil,
      @notebook_document : NotebookDocumentClientCapabilities? = nil,
      @text_document : TextDocumentClientCapabilities? = nil,
      @window : WindowClientCapabilities? = nil,
      @workspace : WorkspaceClientCapabilities? = nil,
    )
    end
  end

  class TextDocumentSyncOptions
    include JSON::Serializable

    property change : TextDocumentSyncKind?

    @[JSON::Field(key: "openClose")]
    property open_close : Bool?
    property save : Bool | SaveOptions?

    @[JSON::Field(key: "willSave")]
    property will_save : Bool?

    @[JSON::Field(key: "willSaveWaitUntil")]
    property will_save_wait_until : Bool?

    def initialize(
      @change : TextDocumentSyncKind? = nil,
      @open_close : Bool? = nil,
      @save : Bool | SaveOptions? = nil,
      @will_save : Bool? = nil,
      @will_save_wait_until : Bool? = nil,
    )
    end
  end

  # Defines workspace specific capabilities of the server.
  #
  # @since 3.18.0
  # Since: #3.18.0
  class WorkspaceOptions
    include JSON::Serializable

    @[JSON::Field(key: "fileOperations")]
    property file_operations : FileOperationOptions?

    @[JSON::Field(key: "workspaceFolders")]
    property workspace_folders : WorkspaceFoldersServerCapabilities?

    def initialize(
      @file_operations : FileOperationOptions? = nil,
      @workspace_folders : WorkspaceFoldersServerCapabilities? = nil,
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class TextDocumentContentChangePartial
    include JSON::Serializable

    property range : Range

    @[JSON::Field(key: "rangeLength")]
    property range_length : UInt32?
    property text : String

    def initialize(
      @range : Range,
      @text : String,
      @range_length : UInt32? = nil,
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class TextDocumentContentChangeWholeDocument
    include JSON::Serializable

    property text : String

    def initialize(
      @text : String,
    )
    end
  end

  # Structure to capture a description for an error code.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class CodeDescription
    include JSON::Serializable

    property href : String

    def initialize(
      @href : String,
    )
    end
  end

  # Represents a related message and source code location for a diagnostic. This should be
  # used to point to code locations that cause or related to a diagnostics, e.g when duplicating
  # a symbol in a scope.
  class DiagnosticRelatedInformation
    include JSON::Serializable

    property location : Location
    property message : String

    def initialize(
      @location : Location,
      @message : String,
    )
    end
  end

  # Edit range variant that includes ranges for insert and replace operations.
  #
  # @since 3.18.0
  # Since: #3.18.0
  class EditRangeWithInsertReplace
    include JSON::Serializable

    property insert : Range
    property replace : Range

    def initialize(
      @insert : Range,
      @replace : Range,
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class ServerCompletionItemOptions
    include JSON::Serializable

    @[JSON::Field(key: "labelDetailsSupport")]
    property label_details_support : Bool?

    def initialize(
      @label_details_support : Bool? = nil,
    )
    end
  end

  # @since 3.18.0
  # @deprecated use MarkupContent instead.
  # Since: #3.18.0
  class MarkedStringWithLanguage
    include JSON::Serializable

    property language : String
    property value : String

    def initialize(
      @language : String,
      @value : String,
    )
    end
  end

  # Represents a parameter of a callable-signature. A parameter can
  # have a label and a doc-comment.
  class ParameterInformation
    include JSON::Serializable

    property documentation : String | MarkupContent?
    property label : String | Tuple(UInt32 | UInt32)

    def initialize(
      @label : String | Tuple(UInt32 | UInt32),
      @documentation : String | MarkupContent? = nil,
    )
    end
  end

  # Documentation for a class of code actions.
  #
  # @since 3.18.0
  # @proposed
  # Since: #3.18.0
  # Proposed
  class CodeActionKindDocumentation
    include JSON::Serializable

    property command : Command
    property kind : CodeActionKind | String

    def initialize(
      @command : Command,
      @kind : CodeActionKind | String,
    )
    end
  end

  # A notebook cell text document filter denotes a cell text
  # document by different properties.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class NotebookCellTextDocumentFilter
    include JSON::Serializable

    property language : String?
    property notebook : String | NotebookDocumentFilter

    def initialize(
      @notebook : String | NotebookDocumentFilter,
      @language : String? = nil,
    )
    end
  end

  # Matching options for the file operation pattern.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class FileOperationPatternOptions
    include JSON::Serializable

    @[JSON::Field(key: "ignoreCase")]
    property ignore_case : Bool?

    def initialize(
      @ignore_case : Bool? = nil,
    )
    end
  end

  class ExecutionSummary
    include JSON::Serializable

    @[JSON::Field(key: "executionOrder")]
    property execution_order : UInt32
    property success : Bool?

    def initialize(
      @execution_order : UInt32,
      @success : Bool? = nil,
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class NotebookCellLanguage
    include JSON::Serializable

    property language : String

    def initialize(
      @language : String,
    )
    end
  end

  # Structural changes to cells in a notebook document.
  #
  # @since 3.18.0
  # Since: #3.18.0
  class NotebookDocumentCellChangeStructure
    include JSON::Serializable

    property array : NotebookCellArrayChange

    @[JSON::Field(key: "didClose")]
    property did_close : Array(TextDocumentIdentifier)?

    @[JSON::Field(key: "didOpen")]
    property did_open : Array(TextDocumentItem)?

    def initialize(
      @array : NotebookCellArrayChange,
      @did_close : Array(TextDocumentIdentifier)? = nil,
      @did_open : Array(TextDocumentItem)? = nil,
    )
    end
  end

  # Content changes to a cell in a notebook document.
  #
  # @since 3.18.0
  # Since: #3.18.0
  class NotebookDocumentCellContentChanges
    include JSON::Serializable

    property changes : Array(TextDocumentContentChangeEvent)
    property document : VersionedTextDocumentIdentifier

    def initialize(
      @changes : Array(TextDocumentContentChangeEvent),
      @document : VersionedTextDocumentIdentifier,
    )
    end
  end

  # Workspace specific client capabilities.
  class WorkspaceClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "applyEdit")]
    property apply_edit : Bool?

    @[JSON::Field(key: "codeLens")]
    property code_lens : CodeLensWorkspaceClientCapabilities?
    property configuration : Bool?
    property diagnostics : DiagnosticWorkspaceClientCapabilities?

    @[JSON::Field(key: "didChangeConfiguration")]
    property did_change_configuration : DidChangeConfigurationClientCapabilities?

    @[JSON::Field(key: "didChangeWatchedFiles")]
    property did_change_watched_files : DidChangeWatchedFilesClientCapabilities?

    @[JSON::Field(key: "executeCommand")]
    property execute_command : ExecuteCommandClientCapabilities?

    @[JSON::Field(key: "fileOperations")]
    property file_operations : FileOperationClientCapabilities?

    @[JSON::Field(key: "foldingRange")]
    property folding_range : FoldingRangeWorkspaceClientCapabilities?

    @[JSON::Field(key: "inlayHint")]
    property inlay_hint : InlayHintWorkspaceClientCapabilities?

    @[JSON::Field(key: "inlineValue")]
    property inline_value : InlineValueWorkspaceClientCapabilities?

    @[JSON::Field(key: "semanticTokens")]
    property semantic_tokens : SemanticTokensWorkspaceClientCapabilities?
    property symbol : WorkspaceSymbolClientCapabilities?

    @[JSON::Field(key: "workspaceEdit")]
    property workspace_edit : WorkspaceEditClientCapabilities?

    @[JSON::Field(key: "workspaceFolders")]
    property workspace_folders : Bool?

    def initialize(
      @apply_edit : Bool? = nil,
      @code_lens : CodeLensWorkspaceClientCapabilities? = nil,
      @configuration : Bool? = nil,
      @diagnostics : DiagnosticWorkspaceClientCapabilities? = nil,
      @did_change_configuration : DidChangeConfigurationClientCapabilities? = nil,
      @did_change_watched_files : DidChangeWatchedFilesClientCapabilities? = nil,
      @execute_command : ExecuteCommandClientCapabilities? = nil,
      @file_operations : FileOperationClientCapabilities? = nil,
      @folding_range : FoldingRangeWorkspaceClientCapabilities? = nil,
      @inlay_hint : InlayHintWorkspaceClientCapabilities? = nil,
      @inline_value : InlineValueWorkspaceClientCapabilities? = nil,
      @semantic_tokens : SemanticTokensWorkspaceClientCapabilities? = nil,
      @symbol : WorkspaceSymbolClientCapabilities? = nil,
      @workspace_edit : WorkspaceEditClientCapabilities? = nil,
      @workspace_folders : Bool? = nil,
    )
    end
  end

  # Text document specific client capabilities.
  class TextDocumentClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "callHierarchy")]
    property call_hierarchy : CallHierarchyClientCapabilities?

    @[JSON::Field(key: "codeAction")]
    property code_action : CodeActionClientCapabilities?

    @[JSON::Field(key: "codeLens")]
    property code_lens : CodeLensClientCapabilities?

    @[JSON::Field(key: "colorProvider")]
    property color_provider : DocumentColorClientCapabilities?
    property completion : CompletionClientCapabilities?
    property declaration : DeclarationClientCapabilities?
    property definition : DefinitionClientCapabilities?
    property diagnostic : DiagnosticClientCapabilities?

    @[JSON::Field(key: "documentHighlight")]
    property document_highlight : DocumentHighlightClientCapabilities?

    @[JSON::Field(key: "documentLink")]
    property document_link : DocumentLinkClientCapabilities?

    @[JSON::Field(key: "documentSymbol")]
    property document_symbol : DocumentSymbolClientCapabilities?

    @[JSON::Field(key: "foldingRange")]
    property folding_range : FoldingRangeClientCapabilities?
    property formatting : DocumentFormattingClientCapabilities?
    property hover : HoverClientCapabilities?
    property implementation : ImplementationClientCapabilities?

    @[JSON::Field(key: "inlayHint")]
    property inlay_hint : InlayHintClientCapabilities?

    @[JSON::Field(key: "inlineCompletion")]
    property inline_completion : InlineCompletionClientCapabilities?

    @[JSON::Field(key: "inlineValue")]
    property inline_value : InlineValueClientCapabilities?

    @[JSON::Field(key: "linkedEditingRange")]
    property linked_editing_range : LinkedEditingRangeClientCapabilities?
    property moniker : MonikerClientCapabilities?

    @[JSON::Field(key: "onTypeFormatting")]
    property on_type_formatting : DocumentOnTypeFormattingClientCapabilities?

    @[JSON::Field(key: "publishDiagnostics")]
    property publish_diagnostics : PublishDiagnosticsClientCapabilities?

    @[JSON::Field(key: "rangeFormatting")]
    property range_formatting : DocumentRangeFormattingClientCapabilities?
    property references : ReferenceClientCapabilities?
    property rename : RenameClientCapabilities?

    @[JSON::Field(key: "selectionRange")]
    property selection_range : SelectionRangeClientCapabilities?

    @[JSON::Field(key: "semanticTokens")]
    property semantic_tokens : SemanticTokensClientCapabilities?

    @[JSON::Field(key: "signatureHelp")]
    property signature_help : SignatureHelpClientCapabilities?
    property synchronization : TextDocumentSyncClientCapabilities?

    @[JSON::Field(key: "typeDefinition")]
    property type_definition : TypeDefinitionClientCapabilities?

    @[JSON::Field(key: "typeHierarchy")]
    property type_hierarchy : TypeHierarchyClientCapabilities?

    def initialize(
      @call_hierarchy : CallHierarchyClientCapabilities? = nil,
      @code_action : CodeActionClientCapabilities? = nil,
      @code_lens : CodeLensClientCapabilities? = nil,
      @color_provider : DocumentColorClientCapabilities? = nil,
      @completion : CompletionClientCapabilities? = nil,
      @declaration : DeclarationClientCapabilities? = nil,
      @definition : DefinitionClientCapabilities? = nil,
      @diagnostic : DiagnosticClientCapabilities? = nil,
      @document_highlight : DocumentHighlightClientCapabilities? = nil,
      @document_link : DocumentLinkClientCapabilities? = nil,
      @document_symbol : DocumentSymbolClientCapabilities? = nil,
      @folding_range : FoldingRangeClientCapabilities? = nil,
      @formatting : DocumentFormattingClientCapabilities? = nil,
      @hover : HoverClientCapabilities? = nil,
      @implementation : ImplementationClientCapabilities? = nil,
      @inlay_hint : InlayHintClientCapabilities? = nil,
      @inline_completion : InlineCompletionClientCapabilities? = nil,
      @inline_value : InlineValueClientCapabilities? = nil,
      @linked_editing_range : LinkedEditingRangeClientCapabilities? = nil,
      @moniker : MonikerClientCapabilities? = nil,
      @on_type_formatting : DocumentOnTypeFormattingClientCapabilities? = nil,
      @publish_diagnostics : PublishDiagnosticsClientCapabilities? = nil,
      @range_formatting : DocumentRangeFormattingClientCapabilities? = nil,
      @references : ReferenceClientCapabilities? = nil,
      @rename : RenameClientCapabilities? = nil,
      @selection_range : SelectionRangeClientCapabilities? = nil,
      @semantic_tokens : SemanticTokensClientCapabilities? = nil,
      @signature_help : SignatureHelpClientCapabilities? = nil,
      @synchronization : TextDocumentSyncClientCapabilities? = nil,
      @type_definition : TypeDefinitionClientCapabilities? = nil,
      @type_hierarchy : TypeHierarchyClientCapabilities? = nil,
    )
    end
  end

  # Capabilities specific to the notebook document support.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class NotebookDocumentClientCapabilities
    include JSON::Serializable

    property synchronization : NotebookDocumentSyncClientCapabilities

    def initialize(
      @synchronization : NotebookDocumentSyncClientCapabilities,
    )
    end
  end

  class WindowClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "showDocument")]
    property show_document : ShowDocumentClientCapabilities?

    @[JSON::Field(key: "showMessage")]
    property show_message : ShowMessageRequestClientCapabilities?

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    def initialize(
      @show_document : ShowDocumentClientCapabilities? = nil,
      @show_message : ShowMessageRequestClientCapabilities? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # General client capabilities.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class GeneralClientCapabilities
    include JSON::Serializable

    property markdown : MarkdownClientCapabilities?

    @[JSON::Field(key: "positionEncodings")]
    property position_encodings : Array(PositionEncodingKind | String)?

    @[JSON::Field(key: "regularExpressions")]
    property regular_expressions : RegularExpressionsClientCapabilities?

    @[JSON::Field(key: "staleRequestSupport")]
    property stale_request_support : StaleRequestSupportOptions?

    def initialize(
      @markdown : MarkdownClientCapabilities? = nil,
      @position_encodings : Array(PositionEncodingKind | String)? = nil,
      @regular_expressions : RegularExpressionsClientCapabilities? = nil,
      @stale_request_support : StaleRequestSupportOptions? = nil,
    )
    end
  end

  class WorkspaceFoldersServerCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "changeNotifications")]
    property change_notifications : String | Bool?
    property supported : Bool?

    def initialize(
      @change_notifications : String | Bool? = nil,
      @supported : Bool? = nil,
    )
    end
  end

  # Options for notifications/requests for user operations on files.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class FileOperationOptions
    include JSON::Serializable

    @[JSON::Field(key: "didCreate")]
    property did_create : FileOperationRegistrationOptions?

    @[JSON::Field(key: "didDelete")]
    property did_delete : FileOperationRegistrationOptions?

    @[JSON::Field(key: "didRename")]
    property did_rename : FileOperationRegistrationOptions?

    @[JSON::Field(key: "willCreate")]
    property will_create : FileOperationRegistrationOptions?

    @[JSON::Field(key: "willDelete")]
    property will_delete : FileOperationRegistrationOptions?

    @[JSON::Field(key: "willRename")]
    property will_rename : FileOperationRegistrationOptions?

    def initialize(
      @did_create : FileOperationRegistrationOptions? = nil,
      @did_delete : FileOperationRegistrationOptions? = nil,
      @did_rename : FileOperationRegistrationOptions? = nil,
      @will_create : FileOperationRegistrationOptions? = nil,
      @will_delete : FileOperationRegistrationOptions? = nil,
      @will_rename : FileOperationRegistrationOptions? = nil,
    )
    end
  end

  # A relative pattern is a helper to construct glob patterns that are matched
  # relatively to a base URI. The common value for a `baseUri` is a workspace
  # folder root, but it can be another absolute URI as well.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class RelativePattern
    include JSON::Serializable

    @[JSON::Field(key: "baseUri")]
    property base_uri : WorkspaceFolder | String
    property pattern : Pattern

    def initialize(
      @base_uri : WorkspaceFolder | String,
      @pattern : Pattern,
    )
    end
  end

  # A document filter where `language` is required field.
  #
  # @since 3.18.0
  # Since: #3.18.0
  class TextDocumentFilterLanguage
    include JSON::Serializable

    property language : String
    property pattern : String?
    property scheme : String?

    def initialize(
      @language : String,
      @pattern : String? = nil,
      @scheme : String? = nil,
    )
    end
  end

  # A document filter where `scheme` is required field.
  #
  # @since 3.18.0
  # Since: #3.18.0
  class TextDocumentFilterScheme
    include JSON::Serializable

    property language : String?
    property pattern : String?
    property scheme : String

    def initialize(
      @scheme : String,
      @language : String? = nil,
      @pattern : String? = nil,
    )
    end
  end

  # A document filter where `pattern` is required field.
  #
  # @since 3.18.0
  # Since: #3.18.0
  class TextDocumentFilterPattern
    include JSON::Serializable

    property language : String?
    property pattern : String
    property scheme : String?

    def initialize(
      @pattern : String,
      @language : String? = nil,
      @scheme : String? = nil,
    )
    end
  end

  # A notebook document filter where `notebookType` is required field.
  #
  # @since 3.18.0
  # Since: #3.18.0
  class NotebookDocumentFilterNotebookType
    include JSON::Serializable

    @[JSON::Field(key: "notebookType")]
    property notebook_type : String
    property pattern : String?
    property scheme : String?

    def initialize(
      @notebook_type : String,
      @pattern : String? = nil,
      @scheme : String? = nil,
    )
    end
  end

  # A notebook document filter where `scheme` is required field.
  #
  # @since 3.18.0
  # Since: #3.18.0
  class NotebookDocumentFilterScheme
    include JSON::Serializable

    @[JSON::Field(key: "notebookType")]
    property notebook_type : String?
    property pattern : String?
    property scheme : String

    def initialize(
      @scheme : String,
      @notebook_type : String? = nil,
      @pattern : String? = nil,
    )
    end
  end

  # A notebook document filter where `pattern` is required field.
  #
  # @since 3.18.0
  # Since: #3.18.0
  class NotebookDocumentFilterPattern
    include JSON::Serializable

    @[JSON::Field(key: "notebookType")]
    property notebook_type : String?
    property pattern : String
    property scheme : String?

    def initialize(
      @pattern : String,
      @notebook_type : String? = nil,
      @scheme : String? = nil,
    )
    end
  end

  # A change describing how to move a `NotebookCell`
  # array from state S to S'.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class NotebookCellArrayChange
    include JSON::Serializable

    property cells : Array(NotebookCell)?

    @[JSON::Field(key: "deleteCount")]
    property delete_count : UInt32
    property start : UInt32

    def initialize(
      @delete_count : UInt32,
      @start : UInt32,
      @cells : Array(NotebookCell)? = nil,
    )
    end
  end

  class WorkspaceEditClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "changeAnnotationSupport")]
    property change_annotation_support : ChangeAnnotationsSupportOptions?

    @[JSON::Field(key: "documentChanges")]
    property document_changes : Bool?

    @[JSON::Field(key: "failureHandling")]
    property failure_handling : FailureHandlingKind?

    @[JSON::Field(key: "metadataSupport")]
    property metadata_support : Bool?

    @[JSON::Field(key: "normalizesLineEndings")]
    property normalizes_line_endings : Bool?

    @[JSON::Field(key: "resourceOperations")]
    property resource_operations : Array(ResourceOperationKind)?

    @[JSON::Field(key: "snippetEditSupport")]
    property snippet_edit_support : Bool?

    def initialize(
      @change_annotation_support : ChangeAnnotationsSupportOptions? = nil,
      @document_changes : Bool? = nil,
      @failure_handling : FailureHandlingKind? = nil,
      @metadata_support : Bool? = nil,
      @normalizes_line_endings : Bool? = nil,
      @resource_operations : Array(ResourceOperationKind)? = nil,
      @snippet_edit_support : Bool? = nil,
    )
    end
  end

  class DidChangeConfigurationClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  class DidChangeWatchedFilesClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    @[JSON::Field(key: "relativePatternSupport")]
    property relative_pattern_support : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
      @relative_pattern_support : Bool? = nil,
    )
    end
  end

  # Client capabilities for a {@link WorkspaceSymbolRequest}.
  class WorkspaceSymbolClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    @[JSON::Field(key: "resolveSupport")]
    property resolve_support : ClientSymbolResolveOptions?

    @[JSON::Field(key: "symbolKind")]
    property symbol_kind : ClientSymbolKindOptions?

    @[JSON::Field(key: "tagSupport")]
    property tag_support : ClientSymbolTagOptions?

    def initialize(
      @dynamic_registration : Bool? = nil,
      @resolve_support : ClientSymbolResolveOptions? = nil,
      @symbol_kind : ClientSymbolKindOptions? = nil,
      @tag_support : ClientSymbolTagOptions? = nil,
    )
    end
  end

  # The client capabilities of a {@link ExecuteCommandRequest}.
  class ExecuteCommandClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # @since 3.16.0
  # Since: #3.16.0
  class SemanticTokensWorkspaceClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "refreshSupport")]
    property refresh_support : Bool?

    def initialize(
      @refresh_support : Bool? = nil,
    )
    end
  end

  # @since 3.16.0
  # Since: #3.16.0
  class CodeLensWorkspaceClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "refreshSupport")]
    property refresh_support : Bool?

    def initialize(
      @refresh_support : Bool? = nil,
    )
    end
  end

  # Capabilities relating to events from file operations by the user in the client.
  #
  # These events do not come from the file system, they come from user operations
  # like renaming a file in the UI.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class FileOperationClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "didCreate")]
    property did_create : Bool?

    @[JSON::Field(key: "didDelete")]
    property did_delete : Bool?

    @[JSON::Field(key: "didRename")]
    property did_rename : Bool?

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    @[JSON::Field(key: "willCreate")]
    property will_create : Bool?

    @[JSON::Field(key: "willDelete")]
    property will_delete : Bool?

    @[JSON::Field(key: "willRename")]
    property will_rename : Bool?

    def initialize(
      @did_create : Bool? = nil,
      @did_delete : Bool? = nil,
      @did_rename : Bool? = nil,
      @dynamic_registration : Bool? = nil,
      @will_create : Bool? = nil,
      @will_delete : Bool? = nil,
      @will_rename : Bool? = nil,
    )
    end
  end

  # Client workspace capabilities specific to inline values.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class InlineValueWorkspaceClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "refreshSupport")]
    property refresh_support : Bool?

    def initialize(
      @refresh_support : Bool? = nil,
    )
    end
  end

  # Client workspace capabilities specific to inlay hints.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class InlayHintWorkspaceClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "refreshSupport")]
    property refresh_support : Bool?

    def initialize(
      @refresh_support : Bool? = nil,
    )
    end
  end

  # Workspace client capabilities specific to diagnostic pull requests.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class DiagnosticWorkspaceClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "refreshSupport")]
    property refresh_support : Bool?

    def initialize(
      @refresh_support : Bool? = nil,
    )
    end
  end

  # Client workspace capabilities specific to folding ranges
  #
  # @since 3.18.0
  # @proposed
  # Since: #3.18.0
  # Proposed
  class FoldingRangeWorkspaceClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "refreshSupport")]
    property refresh_support : Bool?

    def initialize(
      @refresh_support : Bool? = nil,
    )
    end
  end

  class TextDocumentSyncClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "didSave")]
    property did_save : Bool?

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    @[JSON::Field(key: "willSave")]
    property will_save : Bool?

    @[JSON::Field(key: "willSaveWaitUntil")]
    property will_save_wait_until : Bool?

    def initialize(
      @did_save : Bool? = nil,
      @dynamic_registration : Bool? = nil,
      @will_save : Bool? = nil,
      @will_save_wait_until : Bool? = nil,
    )
    end
  end

  # Completion client capabilities
  class CompletionClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "completionItem")]
    property completion_item : ClientCompletionItemOptions?

    @[JSON::Field(key: "completionItemKind")]
    property completion_item_kind : ClientCompletionItemOptionsKind?

    @[JSON::Field(key: "completionList")]
    property completion_list : CompletionListCapabilities?

    @[JSON::Field(key: "contextSupport")]
    property context_support : Bool?

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    @[JSON::Field(key: "insertTextMode")]
    property insert_text_mode : InsertTextMode?

    def initialize(
      @completion_item : ClientCompletionItemOptions? = nil,
      @completion_item_kind : ClientCompletionItemOptionsKind? = nil,
      @completion_list : CompletionListCapabilities? = nil,
      @context_support : Bool? = nil,
      @dynamic_registration : Bool? = nil,
      @insert_text_mode : InsertTextMode? = nil,
    )
    end
  end

  class HoverClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "contentFormat")]
    property content_format : Array(MarkupKind)?

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    def initialize(
      @content_format : Array(MarkupKind)? = nil,
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # Client Capabilities for a {@link SignatureHelpRequest}.
  class SignatureHelpClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "contextSupport")]
    property context_support : Bool?

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    @[JSON::Field(key: "signatureInformation")]
    property signature_information : ClientSignatureInformationOptions?

    def initialize(
      @context_support : Bool? = nil,
      @dynamic_registration : Bool? = nil,
      @signature_information : ClientSignatureInformationOptions? = nil,
    )
    end
  end

  # @since 3.14.0
  # Since: #3.14.0
  class DeclarationClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    @[JSON::Field(key: "linkSupport")]
    property link_support : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
      @link_support : Bool? = nil,
    )
    end
  end

  # Client Capabilities for a {@link DefinitionRequest}.
  class DefinitionClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    @[JSON::Field(key: "linkSupport")]
    property link_support : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
      @link_support : Bool? = nil,
    )
    end
  end

  # Since 3.6.0
  class TypeDefinitionClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    @[JSON::Field(key: "linkSupport")]
    property link_support : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
      @link_support : Bool? = nil,
    )
    end
  end

  # @since 3.6.0
  # Since: #3.6.0
  class ImplementationClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    @[JSON::Field(key: "linkSupport")]
    property link_support : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
      @link_support : Bool? = nil,
    )
    end
  end

  # Client Capabilities for a {@link ReferencesRequest}.
  class ReferenceClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # Client Capabilities for a {@link DocumentHighlightRequest}.
  class DocumentHighlightClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # Client Capabilities for a {@link DocumentSymbolRequest}.
  class DocumentSymbolClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    @[JSON::Field(key: "hierarchicalDocumentSymbolSupport")]
    property hierarchical_document_symbol_support : Bool?

    @[JSON::Field(key: "labelSupport")]
    property label_support : Bool?

    @[JSON::Field(key: "symbolKind")]
    property symbol_kind : ClientSymbolKindOptions?

    @[JSON::Field(key: "tagSupport")]
    property tag_support : ClientSymbolTagOptions?

    def initialize(
      @dynamic_registration : Bool? = nil,
      @hierarchical_document_symbol_support : Bool? = nil,
      @label_support : Bool? = nil,
      @symbol_kind : ClientSymbolKindOptions? = nil,
      @tag_support : ClientSymbolTagOptions? = nil,
    )
    end
  end

  # The Client Capabilities of a {@link CodeActionRequest}.
  class CodeActionClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "codeActionLiteralSupport")]
    property code_action_literal_support : ClientCodeActionLiteralOptions?

    @[JSON::Field(key: "dataSupport")]
    property data_support : Bool?

    @[JSON::Field(key: "disabledSupport")]
    property disabled_support : Bool?

    @[JSON::Field(key: "documentationSupport")]
    property documentation_support : Bool?

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    @[JSON::Field(key: "honorsChangeAnnotations")]
    property honors_change_annotations : Bool?

    @[JSON::Field(key: "isPreferredSupport")]
    property is_preferred_support : Bool?

    @[JSON::Field(key: "resolveSupport")]
    property resolve_support : ClientCodeActionResolveOptions?

    def initialize(
      @code_action_literal_support : ClientCodeActionLiteralOptions? = nil,
      @data_support : Bool? = nil,
      @disabled_support : Bool? = nil,
      @documentation_support : Bool? = nil,
      @dynamic_registration : Bool? = nil,
      @honors_change_annotations : Bool? = nil,
      @is_preferred_support : Bool? = nil,
      @resolve_support : ClientCodeActionResolveOptions? = nil,
    )
    end
  end

  # The client capabilities  of a {@link CodeLensRequest}.
  class CodeLensClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # The client capabilities of a {@link DocumentLinkRequest}.
  class DocumentLinkClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    @[JSON::Field(key: "tooltipSupport")]
    property tooltip_support : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
      @tooltip_support : Bool? = nil,
    )
    end
  end

  class DocumentColorClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # Client capabilities of a {@link DocumentFormattingRequest}.
  class DocumentFormattingClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # Client capabilities of a {@link DocumentRangeFormattingRequest}.
  class DocumentRangeFormattingClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    @[JSON::Field(key: "rangesSupport")]
    property ranges_support : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
      @ranges_support : Bool? = nil,
    )
    end
  end

  # Client capabilities of a {@link DocumentOnTypeFormattingRequest}.
  class DocumentOnTypeFormattingClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  class RenameClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    @[JSON::Field(key: "honorsChangeAnnotations")]
    property honors_change_annotations : Bool?

    @[JSON::Field(key: "prepareSupport")]
    property prepare_support : Bool?

    @[JSON::Field(key: "prepareSupportDefaultBehavior")]
    property prepare_support_default_behavior : PrepareSupportDefaultBehavior?

    def initialize(
      @dynamic_registration : Bool? = nil,
      @honors_change_annotations : Bool? = nil,
      @prepare_support : Bool? = nil,
      @prepare_support_default_behavior : PrepareSupportDefaultBehavior? = nil,
    )
    end
  end

  class FoldingRangeClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    @[JSON::Field(key: "foldingRange")]
    property folding_range : ClientFoldingRangeOptions?

    @[JSON::Field(key: "foldingRangeKind")]
    property folding_range_kind : ClientFoldingRangeKindOptions?

    @[JSON::Field(key: "lineFoldingOnly")]
    property line_folding_only : Bool?

    @[JSON::Field(key: "rangeLimit")]
    property range_limit : UInt32?

    def initialize(
      @dynamic_registration : Bool? = nil,
      @folding_range : ClientFoldingRangeOptions? = nil,
      @folding_range_kind : ClientFoldingRangeKindOptions? = nil,
      @line_folding_only : Bool? = nil,
      @range_limit : UInt32? = nil,
    )
    end
  end

  class SelectionRangeClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # General diagnostics capabilities for pull and push model.
  class DiagnosticsCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "codeDescriptionSupport")]
    property code_description_support : Bool?

    @[JSON::Field(key: "dataSupport")]
    property data_support : Bool?

    @[JSON::Field(key: "relatedInformation")]
    property related_information : Bool?

    @[JSON::Field(key: "tagSupport")]
    property tag_support : ClientDiagnosticsTagOptions?

    def initialize(
      @code_description_support : Bool? = nil,
      @data_support : Bool? = nil,
      @related_information : Bool? = nil,
      @tag_support : ClientDiagnosticsTagOptions? = nil,
    )
    end
  end

  # The publish diagnostic client capabilities.
  class PublishDiagnosticsClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "codeDescriptionSupport")]
    property code_description_support : Bool?

    @[JSON::Field(key: "dataSupport")]
    property data_support : Bool?

    @[JSON::Field(key: "relatedInformation")]
    property related_information : Bool?

    @[JSON::Field(key: "tagSupport")]
    property tag_support : ClientDiagnosticsTagOptions?

    @[JSON::Field(key: "versionSupport")]
    property version_support : Bool?

    def initialize(
      @code_description_support : Bool? = nil,
      @data_support : Bool? = nil,
      @related_information : Bool? = nil,
      @tag_support : ClientDiagnosticsTagOptions? = nil,
      @version_support : Bool? = nil,
    )
    end
  end

  # @since 3.16.0
  # Since: #3.16.0
  class CallHierarchyClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # @since 3.16.0
  # Since: #3.16.0
  class SemanticTokensClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "augmentsSyntaxTokens")]
    property augments_syntax_tokens : Bool?

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?
    property formats : Array(TokenFormat)

    @[JSON::Field(key: "multilineTokenSupport")]
    property multiline_token_support : Bool?

    @[JSON::Field(key: "overlappingTokenSupport")]
    property overlapping_token_support : Bool?
    property requests : ClientSemanticTokensRequestOptions

    @[JSON::Field(key: "serverCancelSupport")]
    property server_cancel_support : Bool?

    @[JSON::Field(key: "tokenModifiers")]
    property token_modifiers : Array(String)

    @[JSON::Field(key: "tokenTypes")]
    property token_types : Array(String)

    def initialize(
      @formats : Array(TokenFormat),
      @requests : ClientSemanticTokensRequestOptions,
      @token_modifiers : Array(String),
      @token_types : Array(String),
      @augments_syntax_tokens : Bool? = nil,
      @dynamic_registration : Bool? = nil,
      @multiline_token_support : Bool? = nil,
      @overlapping_token_support : Bool? = nil,
      @server_cancel_support : Bool? = nil,
    )
    end
  end

  # Client capabilities for the linked editing range request.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class LinkedEditingRangeClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # Client capabilities specific to the moniker request.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class MonikerClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # @since 3.17.0
  # Since: #3.17.0
  class TypeHierarchyClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # Client capabilities specific to inline values.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class InlineValueClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # Inlay hint client capabilities.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class InlayHintClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    @[JSON::Field(key: "resolveSupport")]
    property resolve_support : ClientInlayHintResolveOptions?

    def initialize(
      @dynamic_registration : Bool? = nil,
      @resolve_support : ClientInlayHintResolveOptions? = nil,
    )
    end
  end

  # Client capabilities specific to diagnostic pull requests.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class DiagnosticClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "codeDescriptionSupport")]
    property code_description_support : Bool?

    @[JSON::Field(key: "dataSupport")]
    property data_support : Bool?

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    @[JSON::Field(key: "relatedDocumentSupport")]
    property related_document_support : Bool?

    @[JSON::Field(key: "relatedInformation")]
    property related_information : Bool?

    @[JSON::Field(key: "tagSupport")]
    property tag_support : ClientDiagnosticsTagOptions?

    def initialize(
      @code_description_support : Bool? = nil,
      @data_support : Bool? = nil,
      @dynamic_registration : Bool? = nil,
      @related_document_support : Bool? = nil,
      @related_information : Bool? = nil,
      @tag_support : ClientDiagnosticsTagOptions? = nil,
    )
    end
  end

  # Client capabilities specific to inline completions.
  #
  # @since 3.18.0
  # @proposed
  # Since: #3.18.0
  # Proposed
  class InlineCompletionClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # Notebook specific client capabilities.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class NotebookDocumentSyncClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    @[JSON::Field(key: "executionSummarySupport")]
    property execution_summary_support : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
      @execution_summary_support : Bool? = nil,
    )
    end
  end

  # Show message request client capabilities
  class ShowMessageRequestClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "messageActionItem")]
    property message_action_item : ClientShowMessageActionItemOptions?

    def initialize(
      @message_action_item : ClientShowMessageActionItemOptions? = nil,
    )
    end
  end

  # Client capabilities for the showDocument request.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class ShowDocumentClientCapabilities
    include JSON::Serializable

    property support : Bool

    def initialize(
      @support : Bool,
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class StaleRequestSupportOptions
    include JSON::Serializable

    property cancel : Bool

    @[JSON::Field(key: "retryOnContentModified")]
    property retry_on_content_modified : Array(String)

    def initialize(
      @cancel : Bool,
      @retry_on_content_modified : Array(String),
    )
    end
  end

  # Client capabilities specific to regular expressions.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class RegularExpressionsClientCapabilities
    include JSON::Serializable

    property engine : RegularExpressionEngineKind
    property version : String?

    def initialize(
      @engine : RegularExpressionEngineKind,
      @version : String? = nil,
    )
    end
  end

  # Client capabilities specific to the used markdown parser.
  #
  # @since 3.16.0
  # Since: #3.16.0
  class MarkdownClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "allowedTags")]
    property allowed_tags : Array(String)?
    property parser : String
    property version : String?

    def initialize(
      @parser : String,
      @allowed_tags : Array(String)? = nil,
      @version : String? = nil,
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class ChangeAnnotationsSupportOptions
    include JSON::Serializable

    @[JSON::Field(key: "groupsOnLabel")]
    property groups_on_label : Bool?

    def initialize(
      @groups_on_label : Bool? = nil,
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class ClientSymbolKindOptions
    include JSON::Serializable

    @[JSON::Field(key: "valueSet")]
    property value_set : Array(SymbolKind)?

    def initialize(
      @value_set : Array(SymbolKind)? = nil,
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class ClientSymbolTagOptions
    include JSON::Serializable

    @[JSON::Field(key: "valueSet")]
    property value_set : Array(SymbolTag)

    def initialize(
      @value_set : Array(SymbolTag),
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class ClientSymbolResolveOptions
    include JSON::Serializable

    property properties : Array(String)

    def initialize(
      @properties : Array(String),
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class ClientCompletionItemOptions
    include JSON::Serializable

    @[JSON::Field(key: "commitCharactersSupport")]
    property commit_characters_support : Bool?

    @[JSON::Field(key: "deprecatedSupport")]
    property deprecated_support : Bool?

    @[JSON::Field(key: "documentationFormat")]
    property documentation_format : Array(MarkupKind)?

    @[JSON::Field(key: "insertReplaceSupport")]
    property insert_replace_support : Bool?

    @[JSON::Field(key: "insertTextModeSupport")]
    property insert_text_mode_support : ClientCompletionItemInsertTextModeOptions?

    @[JSON::Field(key: "labelDetailsSupport")]
    property label_details_support : Bool?

    @[JSON::Field(key: "preselectSupport")]
    property preselect_support : Bool?

    @[JSON::Field(key: "resolveSupport")]
    property resolve_support : ClientCompletionItemResolveOptions?

    @[JSON::Field(key: "snippetSupport")]
    property snippet_support : Bool?

    @[JSON::Field(key: "tagSupport")]
    property tag_support : CompletionItemTagOptions?

    def initialize(
      @commit_characters_support : Bool? = nil,
      @deprecated_support : Bool? = nil,
      @documentation_format : Array(MarkupKind)? = nil,
      @insert_replace_support : Bool? = nil,
      @insert_text_mode_support : ClientCompletionItemInsertTextModeOptions? = nil,
      @label_details_support : Bool? = nil,
      @preselect_support : Bool? = nil,
      @resolve_support : ClientCompletionItemResolveOptions? = nil,
      @snippet_support : Bool? = nil,
      @tag_support : CompletionItemTagOptions? = nil,
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class ClientCompletionItemOptionsKind
    include JSON::Serializable

    @[JSON::Field(key: "valueSet")]
    property value_set : Array(CompletionItemKind)?

    def initialize(
      @value_set : Array(CompletionItemKind)? = nil,
    )
    end
  end

  # The client supports the following `CompletionList` specific
  # capabilities.
  #
  # @since 3.17.0
  # Since: #3.17.0
  class CompletionListCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "itemDefaults")]
    property item_defaults : Array(String)?

    def initialize(
      @item_defaults : Array(String)? = nil,
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class ClientSignatureInformationOptions
    include JSON::Serializable

    @[JSON::Field(key: "activeParameterSupport")]
    property active_parameter_support : Bool?

    @[JSON::Field(key: "documentationFormat")]
    property documentation_format : Array(MarkupKind)?

    @[JSON::Field(key: "noActiveParameterSupport")]
    property no_active_parameter_support : Bool?

    @[JSON::Field(key: "parameterInformation")]
    property parameter_information : ClientSignatureParameterInformationOptions?

    def initialize(
      @active_parameter_support : Bool? = nil,
      @documentation_format : Array(MarkupKind)? = nil,
      @no_active_parameter_support : Bool? = nil,
      @parameter_information : ClientSignatureParameterInformationOptions? = nil,
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class ClientCodeActionLiteralOptions
    include JSON::Serializable

    @[JSON::Field(key: "codeActionKind")]
    property code_action_kind : ClientCodeActionKindOptions

    def initialize(
      @code_action_kind : ClientCodeActionKindOptions,
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class ClientCodeActionResolveOptions
    include JSON::Serializable

    property properties : Array(String)

    def initialize(
      @properties : Array(String),
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class ClientFoldingRangeKindOptions
    include JSON::Serializable

    @[JSON::Field(key: "valueSet")]
    property value_set : Array(FoldingRangeKind | String)?

    def initialize(
      @value_set : Array(FoldingRangeKind | String)? = nil,
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class ClientFoldingRangeOptions
    include JSON::Serializable

    @[JSON::Field(key: "collapsedText")]
    property collapsed_text : Bool?

    def initialize(
      @collapsed_text : Bool? = nil,
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class ClientSemanticTokensRequestOptions
    include JSON::Serializable

    property full : Bool | ClientSemanticTokensRequestFullDelta?
    property range : Bool | JSON::Any??

    def initialize(
      @full : Bool | ClientSemanticTokensRequestFullDelta? = nil,
      @range : Bool | JSON::Any?? = nil,
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class ClientInlayHintResolveOptions
    include JSON::Serializable

    property properties : Array(String)

    def initialize(
      @properties : Array(String),
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class ClientShowMessageActionItemOptions
    include JSON::Serializable

    @[JSON::Field(key: "additionalPropertiesSupport")]
    property additional_properties_support : Bool?

    def initialize(
      @additional_properties_support : Bool? = nil,
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class CompletionItemTagOptions
    include JSON::Serializable

    @[JSON::Field(key: "valueSet")]
    property value_set : Array(CompletionItemTag)

    def initialize(
      @value_set : Array(CompletionItemTag),
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class ClientCompletionItemResolveOptions
    include JSON::Serializable

    property properties : Array(String)

    def initialize(
      @properties : Array(String),
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class ClientCompletionItemInsertTextModeOptions
    include JSON::Serializable

    @[JSON::Field(key: "valueSet")]
    property value_set : Array(InsertTextMode)

    def initialize(
      @value_set : Array(InsertTextMode),
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class ClientSignatureParameterInformationOptions
    include JSON::Serializable

    @[JSON::Field(key: "labelOffsetSupport")]
    property label_offset_support : Bool?

    def initialize(
      @label_offset_support : Bool? = nil,
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class ClientCodeActionKindOptions
    include JSON::Serializable

    @[JSON::Field(key: "valueSet")]
    property value_set : Array(CodeActionKind | String)

    def initialize(
      @value_set : Array(CodeActionKind | String),
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class ClientDiagnosticsTagOptions
    include JSON::Serializable

    @[JSON::Field(key: "valueSet")]
    property value_set : Array(DiagnosticTag)

    def initialize(
      @value_set : Array(DiagnosticTag),
    )
    end
  end

  # @since 3.18.0
  # Since: #3.18.0
  class ClientSemanticTokensRequestFullDelta
    include JSON::Serializable

    property delta : Bool?

    def initialize(
      @delta : Bool? = nil,
    )
    end
  end

  # A set of predefined token types. This set is not fixed
  # an clients can specify additional token types via the
  # corresponding client capabilities.
  #
  # @since 3.16.0
  # Since: #3.16.0
  Enum.string SemanticTokenTypes do
    Namespace
    # Represents a generic type. Acts as a fallback for types which can't be mapped to
    # a specific type like class or enum.
    Type
    Class
    Enum
    Interface
    Struct
    TypeParameter
    Parameter
    Variable
    Property
    EnumMember
    Event
    Function
    Method
    Macro
    Keyword
    Modifier
    Comment
    String
    Number
    Regexp
    Operator
    # Since: #3.17.0
    # @since 3.17.0
    Decorator
  end

  # A set of predefined token modifiers. This set is not fixed
  # an clients can specify additional token types via the
  # corresponding client capabilities.
  #
  # @since 3.16.0
  # Since: #3.16.0
  Enum.string SemanticTokenModifiers do
    Declaration
    Definition
    Readonly
    Static
    Deprecated
    Abstract
    Async
    Modification
    Documentation
    DefaultLibrary
  end

  # The document diagnostic report kinds.
  #
  # @since 3.17.0
  # Since: #3.17.0
  Enum.string DocumentDiagnosticReportKind do
    # A diagnostic report with a full
    # set of problems.
    Full
    # A report indicating that the last
    # returned report is still accurate.
    Unchanged
  end

  # Predefined error codes.
  Enum.number ErrorCodes do
    ParseError     = -32700
    InvalidRequest = -32600
    MethodNotFound = -32601
    InvalidParams  = -32602
    InternalError  = -32603
    # Error code indicating that a server received a notification or
    # request before the server has received the `initialize` request.
    ServerNotInitialized = -32002
    UnknownErrorCode     = -32001
  end

  Enum.number LSPErrorCodes do
    # Since: #3.17.0
    # A request failed but it was syntactically correct, e.g the
    # method name was known and the parameters were valid. The error
    # message should contain human readable information about why
    # the request failed.
    #
    # @since 3.17.0
    RequestFailed = -32803
    # Since: #3.17.0
    # The server cancelled the request. This error code should
    # only be used for requests that explicitly support being
    # server cancellable.
    #
    # @since 3.17.0
    ServerCancelled = -32802
    # The server detected that the content of a document got
    # modified outside normal conditions. A server should
    # NOT send this error code if it detects a content change
    # in it unprocessed messages. The result even computed
    # on an older state might still be useful for the client.
    #
    # If a client decides that a result is not of any use anymore
    # the client should cancel the request.
    ContentModified = -32801
    # The client has canceled a request and a server as detected
    # the cancel.
    RequestCancelled = -32800
  end

  # A set of predefined range kinds.
  Enum.string FoldingRangeKind do
    # Folding range for a comment
    Comment
    # Folding range for an import or include
    Imports
    # Folding range for a region (e.g. `#region`)
    Region
  end

  # A symbol kind.
  Enum.number SymbolKind do
    File          =  1
    Module        =  2
    Namespace     =  3
    Package       =  4
    Class         =  5
    Method        =  6
    Property      =  7
    Field         =  8
    Constructor   =  9
    Enum          = 10
    Interface     = 11
    Function      = 12
    Variable      = 13
    Constant      = 14
    String        = 15
    Number        = 16
    Boolean       = 17
    Array         = 18
    Object        = 19
    Key           = 20
    Null          = 21
    EnumMember    = 22
    Struct        = 23
    Event         = 24
    Operator      = 25
    TypeParameter = 26
  end

  # Symbol tags are extra annotations that tweak the rendering of a symbol.
  #
  # @since 3.16
  # Since: #3.16
  Enum.number SymbolTag do
    # Render a symbol as obsolete, usually using a strike-out.
    Deprecated = 1
  end

  # Moniker uniqueness level to define scope of the moniker.
  #
  # @since 3.16.0
  # Since: #3.16.0
  Enum.string UniquenessLevel do
    # The moniker is only unique inside a document
    Document
    # The moniker is unique inside a project for which a dump got created
    Project
    # The moniker is unique inside the group to which a project belongs
    Group
    # The moniker is unique inside the moniker scheme.
    Scheme
    # The moniker is globally unique
    Global
  end

  # The moniker kind.
  #
  # @since 3.16.0
  # Since: #3.16.0
  Enum.string MonikerKind do
    # The moniker represent a symbol that is imported into a project
    Import
    # The moniker represents a symbol that is exported from a project
    Export
    # The moniker represents a symbol that is local to a project (e.g. a local
    # variable of a function, a class not visible outside the project, ...)
    Local
  end

  # Inlay hint kinds.
  #
  # @since 3.17.0
  # Since: #3.17.0
  Enum.number InlayHintKind do
    # An inlay hint that for a type annotation.
    Type = 1
    # An inlay hint that is for a parameter.
    Parameter = 2
  end

  # The message type
  Enum.number MessageType do
    # An error message.
    Error = 1
    # A warning message.
    Warning = 2
    # An information message.
    Info = 3
    # A log message.
    Log = 4
    # Since: #3.18.0
    # Proposed
    # A debug message.
    #
    # @since 3.18.0
    # @proposed
    Debug = 5
  end

  # Defines how the host (editor) should sync
  # document changes to the language server.
  Enum.number TextDocumentSyncKind do
    # Documents should not be synced at all.
    None_ = 0
    # Documents are synced by always sending the full content
    # of the document.
    Full = 1
    # Documents are synced by sending the full content on open.
    # After that only incremental updates to the document are
    # send.
    Incremental = 2
  end

  # Represents reasons why a text document is saved.
  Enum.number TextDocumentSaveReason do
    # Manually triggered, e.g. by the user pressing save, by starting debugging,
    # or by an API call.
    Manual = 1
    # Automatic after a delay.
    AfterDelay = 2
    # When the editor lost focus.
    FocusOut = 3
  end

  # The kind of a completion entry.
  Enum.number CompletionItemKind do
    Text          =  1
    Method        =  2
    Function      =  3
    Constructor   =  4
    Field         =  5
    Variable      =  6
    Class         =  7
    Interface     =  8
    Module        =  9
    Property      = 10
    Unit          = 11
    Value         = 12
    Enum          = 13
    Keyword       = 14
    Snippet       = 15
    Color         = 16
    File          = 17
    Reference     = 18
    Folder        = 19
    EnumMember    = 20
    Constant      = 21
    Struct        = 22
    Event         = 23
    Operator      = 24
    TypeParameter = 25
  end

  # Completion item tags are extra annotations that tweak the rendering of a completion
  # item.
  #
  # @since 3.15.0
  # Since: #3.15.0
  Enum.number CompletionItemTag do
    # Render a completion as obsolete, usually using a strike-out.
    Deprecated = 1
  end

  # Defines whether the insert text in a completion item should be interpreted as
  # plain text or a snippet.
  Enum.number InsertTextFormat do
    # The primary text to be inserted is treated as a plain string.
    PlainText = 1
    # The primary text to be inserted is treated as a snippet.
    #
    # A snippet can define tab stops and placeholders with `$1`, `$2`
    # and `${3:foo}`. `$0` defines the final tab stop, it defaults to
    # the end of the snippet. Placeholders with equal identifiers are linked,
    # that is typing in one will update others too.
    #
    # See also: https://microsoft.github.io/language-server-protocol/specifications/specification-current/#snippet_syntax
    Snippet = 2
  end

  # How whitespace and indentation is handled during completion
  # item insertion.
  #
  # @since 3.16.0
  # Since: #3.16.0
  Enum.number InsertTextMode do
    # The insertion or replace strings is taken as it is. If the
    # value is multi line the lines below the cursor will be
    # inserted using the indentation defined in the string value.
    # The client will not apply any kind of adjustments to the
    # string.
    AsIs = 1
    # The editor adjusts leading whitespace of new lines so that
    # they match the indentation up to the cursor of the line for
    # which the item is accepted.
    #
    # Consider a line like this: <2tabs><cursor><3tabs>foo. Accepting a
    # multi line completion item is indented using 2 tabs and all
    # following lines inserted will be indented using 2 tabs as well.
    AdjustIndentation = 2
  end

  # A document highlight kind.
  Enum.number DocumentHighlightKind do
    # A textual occurrence.
    Text = 1
    # Read-access of a symbol, like reading a variable.
    Read = 2
    # Write-access of a symbol, like writing to a variable.
    Write = 3
  end

  # A set of predefined code action kinds
  Enum.string CodeActionKind, mappings: {
    Empty:                 "",
    RefactorExtract:       "refactor.extract",
    RefactorInline:        "refactor.inline",
    RefactorMove:          "refactor.move",
    RefactorRewrite:       "refactor.rewrite",
    SourceOrganizeImports: "source.organizeImports",
    SourceFixAll:          "source.fixAll",
  } do
    # Empty kind.
    Empty
    # Base kind for quickfix actions: 'quickfix'
    QuickFix
    # Base kind for refactoring actions: 'refactor'
    Refactor
    # Base kind for refactoring extraction actions: 'refactor.extract'
    #
    # Example extract actions:
    #
    # - Extract method
    # - Extract function
    # - Extract variable
    # - Extract interface from class
    # - ...
    RefactorExtract
    # Base kind for refactoring inline actions: 'refactor.inline'
    #
    # Example inline actions:
    #
    # - Inline function
    # - Inline variable
    # - Inline constant
    # - ...
    RefactorInline
    # Since: #3.18.0
    # Proposed
    # Base kind for refactoring move actions: `refactor.move`
    #
    # Example move actions:
    #
    # - Move a function to a new file
    # - Move a property between classes
    # - Move method to base class
    # - ...
    #
    # @since 3.18.0
    # @proposed
    RefactorMove
    # Base kind for refactoring rewrite actions: 'refactor.rewrite'
    #
    # Example rewrite actions:
    #
    # - Convert JavaScript function to class
    # - Add or remove parameter
    # - Encapsulate field
    # - Make method static
    # - Move method to base class
    # - ...
    RefactorRewrite
    # Base kind for source actions: `source`
    #
    # Source code actions apply to the entire file.
    Source
    # Base kind for an organize imports source action: `source.organizeImports`
    SourceOrganizeImports
    # Since: #3.15.0
    # Base kind for auto-fix source actions: `source.fixAll`.
    #
    # Fix all actions automatically fix errors that have a clear fix that do not require user input.
    # They should not suppress errors or perform unsafe fixes such as generating new types or classes.
    #
    # @since 3.15.0
    SourceFixAll
    # Since: #3.18.0
    # Base kind for all code actions applying to the entire notebook's scope. CodeActionKinds using
    # this should always begin with `notebook.`
    #
    # @since 3.18.0
    Notebook
  end

  Enum.string TraceValue do
    # Turn tracing off.
    Off
    # Trace messages only.
    Messages
    # Verbose message tracing.
    Verbose
  end

  # Describes the content type that a client supports in various
  # result literals like `Hover`, `ParameterInfo` or `CompletionItem`.
  #
  # Please note that `MarkupKinds` must not start with a `$`. This kinds
  # are reserved for internal usage.
  Enum.string MarkupKind do
    # Plain text is supported as a content format
    PlainText
    # Markdown is supported as a content format
    Markdown
  end

  # Predefined Language kinds
  # @since 3.18.0
  # @proposed
  # Since: #3.18.0
  # Proposed
  Enum.string LanguageKind, mappings: {
    WindowsBat:   "bat",
    Delphi:       "pascal",
    GitCommit:    "git-commit",
    GitRebase:    "rebase",
    ObjectiveC:   "objective-c",
    ObjectiveCpp: "objective-cpp",
    Pug:          "jade",
    VisualBasic:  "vb",
  } do
    Abap
    WindowsBat
    BibTeX
    Clojure
    Coffeescript
    C
    Cpp
    CSharp
    Css
    # Since: #3.18.0
    # Proposed
    # @since 3.18.0
    # @proposed
    D
    # Since: #3.18.0
    # Proposed
    # @since 3.18.0
    # @proposed
    Delphi
    Diff
    Dart
    Dockerfile
    Elixir
    Erlang
    FSharp
    GitCommit
    GitRebase
    Go
    Groovy
    Handlebars
    Haskell
    Html
    Ini
    Java
    JavaScript
    JavaScriptReact
    Json
    LaTeX
    Less
    Lua
    Makefile
    Markdown
    ObjectiveC
    ObjectiveCpp
    # Since: #3.18.0
    # Proposed
    # @since 3.18.0
    # @proposed
    Pascal
    Perl
    Perl6
    Php
    Powershell
    Pug
    Python
    R
    Razor
    Ruby
    Rust
    Scss
    Sass
    Scala
    ShaderLab
    ShellScript
    Sql
    Swift
    TypeScript
    TypeScriptReact
    TeX
    VisualBasic
    Xml
    Xsl
    Yaml
  end

  # Describes how an {@link InlineCompletionItemProvider inline completion provider} was triggered.
  #
  # @since 3.18.0
  # @proposed
  # Since: #3.18.0
  # Proposed
  Enum.number InlineCompletionTriggerKind do
    # Completion was triggered explicitly by a user gesture.
    Invoked = 1
    # Completion was triggered automatically while editing.
    Automatic = 2
  end

  # A set of predefined position encoding kinds.
  #
  # @since 3.17.0
  # Since: #3.17.0
  Enum.string PositionEncodingKind, mappings: {
    Utf8:  "utf-8",
    Utf16: "utf-16",
    Utf32: "utf-32",
  } do
    # Character offsets count UTF-8 code units (e.g. bytes).
    Utf8
    # Character offsets count UTF-16 code units.
    #
    # This is the default and must always be supported
    # by servers
    Utf16
    # Character offsets count UTF-32 code units.
    #
    # Implementation note: these are the same as Unicode codepoints,
    # so this `PositionEncodingKind` may also be used for an
    # encoding-agnostic representation of character offsets.
    Utf32
  end

  # The file event type
  Enum.number FileChangeType do
    # The file got created.
    Created = 1
    # The file got changed.
    Changed = 2
    # The file got deleted.
    Deleted = 3
  end

  Enum.number WatchKind do
    # Interested in create events.
    Create = 1
    # Interested in change events
    Change = 2
    # Interested in delete events
    Delete = 4
  end

  # The diagnostic's severity.
  Enum.number DiagnosticSeverity do
    # Reports an error.
    Error = 1
    # Reports a warning.
    Warning = 2
    # Reports an information.
    Information = 3
    # Reports a hint.
    Hint = 4
  end

  # The diagnostic tags.
  #
  # @since 3.15.0
  # Since: #3.15.0
  Enum.number DiagnosticTag do
    # Unused or unnecessary code.
    #
    # Clients are allowed to render diagnostics with this tag faded out instead of having
    # an error squiggle.
    Unnecessary = 1
    # Deprecated or obsolete code.
    #
    # Clients are allowed to rendered diagnostics with this tag strike through.
    Deprecated = 2
  end

  # How a completion was triggered
  Enum.number CompletionTriggerKind do
    # Completion was triggered by typing an identifier (24x7 code
    # complete), manual invocation (e.g Ctrl+Space) or via API.
    Invoked = 1
    # Completion was triggered by a trigger character specified by
    # the `triggerCharacters` properties of the `CompletionRegistrationOptions`.
    TriggerCharacter = 2
    # Completion was re-triggered as current completion list is incomplete
    TriggerForIncompleteCompletions = 3
  end

  # How a signature help was triggered.
  #
  # @since 3.15.0
  # Since: #3.15.0
  Enum.number SignatureHelpTriggerKind do
    # Signature help was invoked manually by the user or by a command.
    Invoked = 1
    # Signature help was triggered by a trigger character.
    TriggerCharacter = 2
    # Signature help was triggered by the cursor moving or by the document content changing.
    ContentChange = 3
  end

  # The reason why code actions were requested.
  #
  # @since 3.17.0
  # Since: #3.17.0
  Enum.number CodeActionTriggerKind do
    # Code actions were explicitly requested by the user or by an extension.
    Invoked = 1
    # Code actions were requested automatically.
    #
    # This typically happens when current selection in a file changes, but can
    # also be triggered when file content changes.
    Automatic = 2
  end

  # A pattern kind describing if a glob pattern matches a file a folder or
  # both.
  #
  # @since 3.16.0
  # Since: #3.16.0
  Enum.string FileOperationPatternKind do
    # The pattern matches a file only.
    File
    # The pattern matches a folder only.
    Folder
  end

  # A notebook cell kind.
  #
  # @since 3.17.0
  # Since: #3.17.0
  Enum.number NotebookCellKind do
    # A markup-cell is formatted source that is used for display.
    Markup = 1
    # A code-cell is source code.
    Code = 2
  end

  Enum.string ResourceOperationKind do
    # Supports creating new files and folders.
    Create
    # Supports renaming existing files and folders.
    Rename
    # Supports deleting existing files and folders.
    Delete
  end

  Enum.string FailureHandlingKind do
    # Applying the workspace change is simply aborted if one of the changes provided
    # fails. All operations executed before the failing operation stay executed.
    Abort
    # All operations are executed transactional. That means they either all
    # succeed or no changes at all are applied to the workspace.
    Transactional
    # If the workspace edit contains only textual file changes they are executed transactional.
    # If resource changes (create, rename or delete file) are part of the change the failure
    # handling strategy is abort.
    TextOnlyTransactional
    # The client tries to undo the operations already executed. But there is no
    # guarantee that this is succeeding.
    Undo
  end

  Enum.number PrepareSupportDefaultBehavior do
    # The client's default behavior is to select the identifier
    # according the to language's syntax rule.
    Identifier = 1
  end

  Enum.string TokenFormat do
    Relative
  end

  # The definition of a symbol represented as one or many {@link Location locations}.
  # For most programming languages there is only one location at which a symbol is
  # defined.
  #
  # Servers should prefer returning `DefinitionLink` over `Definition` if supported
  # by the client.
  alias Definition = Location | Array(Location)

  # Information about where a symbol is defined.
  #
  # Provides additional metadata over normal {@link Location location} definitions, including the range of
  # the defining symbol
  alias DefinitionLink = LocationLink

  # LSP arrays.
  # @since 3.17.0
  # Since: #3.17.0
  alias LSPArray = Array(LSPAny)

  # The LSP any type.
  # Please note that strictly speaking a property with the value `undefined`
  # can't be converted into JSON preserving the property name. However for
  # convenience it is allowed and assumed that all these properties are
  # optional as well.
  # @since 3.17.0
  # Since: #3.17.0
  alias LSPAny = JSON::Any?

  # The declaration of a symbol representation as one or many {@link Location locations}.
  alias Declaration = Location | Array(Location)

  # Information about where a symbol is declared.
  #
  # Provides additional metadata over normal {@link Location location} declarations, including the range of
  # the declaring symbol.
  #
  # Servers should prefer returning `DeclarationLink` over `Declaration` if supported
  # by the client.
  alias DeclarationLink = LocationLink

  # Inline value information can be provided by different means:
  # - directly as a text value (class InlineValueText).
  # - as a name to use for a variable lookup (class InlineValueVariableLookup)
  # - as an evaluatable expression (class InlineValueEvaluatableExpression)
  # The InlineValue types combines all inline value types into one type.
  #
  # @since 3.17.0
  # Since: #3.17.0
  alias InlineValue = InlineValueText | InlineValueVariableLookup | InlineValueEvaluatableExpression

  # The result of a document diagnostic pull request. A report can
  # either be a full report containing all diagnostics for the
  # requested document or an unchanged report indicating that nothing
  # has changed in terms of diagnostics in comparison to the last
  # pull request.
  #
  # @since 3.17.0
  # Since: #3.17.0
  alias DocumentDiagnosticReport = RelatedFullDocumentDiagnosticReport | RelatedUnchangedDocumentDiagnosticReport

  alias PrepareRenameResult = Range | PrepareRenamePlaceholder | PrepareRenameDefaultBehavior

  # A document selector is the combination of one or many document filters.
  #
  # @sample `let sel:DocumentSelector = [{ language: 'typescript' }, { language: 'json', pattern: '**∕tsconfig.json' }]`;
  #
  # The use of a string as a document filter is deprecated @since 3.16.0.
  # Since: #3.16.0.
  alias DocumentSelector = Array(DocumentFilter)

  alias ProgressToken = Int32 | String

  # An identifier to refer to a change annotation stored with a workspace edit.
  alias ChangeAnnotationIdentifier = String

  # A workspace diagnostic document report.
  #
  # @since 3.17.0
  # Since: #3.17.0
  alias WorkspaceDocumentDiagnosticReport = WorkspaceFullDocumentDiagnosticReport | WorkspaceUnchangedDocumentDiagnosticReport

  # An event describing a change to a text document. If only a text is provided
  # it is considered to be the full content of the document.
  alias TextDocumentContentChangeEvent = TextDocumentContentChangePartial | TextDocumentContentChangeWholeDocument

  # MarkedString can be used to render human readable text. It is either a markdown string
  # or a code-block that provides a language and a code snippet. The language identifier
  # is semantically equal to the optional language identifier in fenced code blocks in GitHub
  # issues. See https://help.github.com/articles/creating-and-highlighting-code-blocks/#syntax-highlighting
  #
  # The pair of a language and a value is an equivalent to markdown:
  # ```${language}
  # ${value}
  # ```
  #
  # Note that markdown strings will be sanitized - that means html will be escaped.
  # @deprecated use MarkupContent instead.
  alias MarkedString = String | MarkedStringWithLanguage

  # A document filter describes a top level text document or
  # a notebook cell document.
  #
  # @since 3.17.0 - proposed support for NotebookCellTextDocumentFilter.
  # Since: #3.17.0 - proposed support for NotebookCellTextDocumentFilter.
  alias DocumentFilter = TextDocumentFilter | NotebookCellTextDocumentFilter

  # LSP object definition.
  # @since 3.17.0
  # Since: #3.17.0
  alias LSPObject = JSON::Any?

  # The glob pattern. Either a string pattern or a relative pattern.
  #
  # @since 3.17.0
  # Since: #3.17.0
  alias GlobPattern = Pattern | RelativePattern

  # A document filter denotes a document by different properties like
  # the {@link TextDocument.languageId language}, the {@link Uri.scheme scheme} of
  # its resource, or a glob-pattern that is applied to the {@link TextDocument.fileName path}.
  #
  # Glob patterns can have the following syntax:
  # - `*` to match one or more characters in a path segment
  # - `?` to match on one character in a path segment
  # - `**` to match any number of path segments, including none
  # - `{}` to group sub patterns into an OR expression. (e.g. `**​/*.{ts,js}` matches all TypeScript and JavaScript files)
  # - `[]` to declare a range of characters to match in a path segment (e.g., `example.[0-9]` to match on `example.0`, `example.1`, …)
  # - `[!...]` to negate a range of characters to match in a path segment (e.g., `example.[!0-9]` to match on `example.a`, `example.b`, but not `example.0`)
  #
  # @sample A language filter that applies to typescript files on disk: `{ language: 'typescript', scheme: 'file' }`
  # @sample A language filter that applies to all package.json paths: `{ language: 'json', pattern: '**package.json' }`
  #
  # @since 3.17.0
  # Since: #3.17.0
  alias TextDocumentFilter = TextDocumentFilterLanguage | TextDocumentFilterScheme | TextDocumentFilterPattern

  # A notebook document filter denotes a notebook document by
  # different properties. The properties will be match
  # against the notebook's URI (same as with documents)
  #
  # @since 3.17.0
  # Since: #3.17.0
  alias NotebookDocumentFilter = NotebookDocumentFilterNotebookType | NotebookDocumentFilterScheme | NotebookDocumentFilterPattern

  # The glob pattern to watch relative to the base path. Glob patterns can have the following syntax:
  # - `*` to match one or more characters in a path segment
  # - `?` to match on one character in a path segment
  # - `**` to match any number of path segments, including none
  # - `{}` to group conditions (e.g. `**​/*.{ts,js}` matches all TypeScript and JavaScript files)
  # - `[]` to declare a range of characters to match in a path segment (e.g., `example.[0-9]` to match on `example.0`, `example.1`, …)
  # - `[!...]` to negate a range of characters to match in a path segment (e.g., `example.[!0-9]` to match on `example.a`, `example.b`, but not `example.0`)
  #
  # @since 3.17.0
  # Since: #3.17.0
  alias Pattern = String

  alias RegularExpressionEngineKind = String

  class TextDocumentColorPresentationOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    property work_done_progress : Bool?

    @[JSON::Field(key: "documentSelector")]
    property document_selector : DocumentSelector?

    def initialize(
      @document_selector : DocumentSelector,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class ResponseError
    include JSON::Serializable

    # A number indicating the error type that occurred.
    property code : Int32
    # A string providing a short description of the error.
    property message : String
    # A primitive or structured value that contains additional information about the error. Can be omitted.
    property data : LSPAny?

    def initialize(@code : Int32, @message : String, @data : LSPAny? = nil)
    end
  end

  class ResponseErrorMessage
    include JSON::Serializable

    property jsonrpc : String = "2.0"
    # The request id where the error occurred.
    property id : Int32 | String
    # The error object in case a request fails.
    property error : ResponseError?

    def initialize(@id : Int32 | String, @error : ResponseError? = nil)
    end
  end

  class ResponseMessage
    include JSON::Serializable

    property jsonrpc : String = "2.0"
    # The request id where the error occurred.
    property id : Int32 | String
    # The error object in case a request fails.
    @[JSON::Field(emit_null: true)]
    property result : JSON::Any?

    def initialize(@id : Int32 | String, @result : JSON::Any? = nil)
    end
  end

  alias TextDocumentImplementationResult = Definition | Array(DefinitionLink) | Nil

  # A request to resolve the implementation locations of a symbol at a given text
  # document position. The request's parameter is of type {@link TextDocumentPositionParams}
  # the response is of type {@link Definition} or a Thenable that resolves to such.
  class TextDocumentImplementationRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : ImplementationParams
    # The method to be invoked.
    property method : String = "textDocument/implementation"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : ImplementationParams)
    end
  end

  class TextDocumentImplementationResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentImplementationResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentImplementationResult)
    end
  end

  alias TextDocumentTypeDefinitionResult = Definition | Array(DefinitionLink) | Nil

  # A request to resolve the type definition locations of a symbol at a given text
  # document position. The request's parameter is of type {@link TextDocumentPositionParams}
  # the response is of type {@link Definition} or a Thenable that resolves to such.
  class TextDocumentTypeDefinitionRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : TypeDefinitionParams
    # The method to be invoked.
    property method : String = "textDocument/typeDefinition"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : TypeDefinitionParams)
    end
  end

  class TextDocumentTypeDefinitionResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentTypeDefinitionResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentTypeDefinitionResult)
    end
  end

  alias WorkspaceWorkspaceFoldersResult = Array(WorkspaceFolder) | Nil

  # The `workspace/workspaceFolders` is sent from the server to the client to fetch the open workspace folders.
  class WorkspaceWorkspaceFoldersRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : Nil
    # The method to be invoked.
    property method : String = "workspace/workspaceFolders"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : Nil)
    end
  end

  class WorkspaceWorkspaceFoldersResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : WorkspaceWorkspaceFoldersResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : WorkspaceWorkspaceFoldersResult)
    end
  end

  alias WorkspaceConfigurationResult = Array(LSPAny)

  # The 'workspace/configuration' request is sent from the server to the client to fetch a certain
  # configuration setting.
  #
  # This pull model replaces the old push model were the client signaled configuration change via an
  # event. If the server still needs to react to configuration changes (since the server caches the
  # result of `workspace/configuration` requests) the server should register for an empty configuration
  # change event and empty the cache if such an event is received.
  class WorkspaceConfigurationRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : ConfigurationParams
    # The method to be invoked.
    property method : String = "workspace/configuration"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : ConfigurationParams)
    end
  end

  class WorkspaceConfigurationResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : WorkspaceConfigurationResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : WorkspaceConfigurationResult)
    end
  end

  alias TextDocumentDocumentColorResult = Array(ColorInformation)

  # A request to list all color symbols found in a given text document. The request's
  # parameter is of type {@link DocumentColorParams} the
  # response is of type {@link ColorInformation ColorInformation[]} or a Thenable
  # that resolves to such.
  class TextDocumentDocumentColorRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : DocumentColorParams
    # The method to be invoked.
    property method : String = "textDocument/documentColor"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DocumentColorParams)
    end
  end

  class TextDocumentDocumentColorResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentDocumentColorResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentDocumentColorResult)
    end
  end

  alias TextDocumentColorPresentationResult = Array(ColorPresentation)

  # A request to list all presentation for a color. The request's
  # parameter is of type {@link ColorPresentationParams} the
  # response is of type {@link ColorInformation ColorInformation[]} or a Thenable
  # that resolves to such.
  class TextDocumentColorPresentationRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : ColorPresentationParams
    # The method to be invoked.
    property method : String = "textDocument/colorPresentation"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : ColorPresentationParams)
    end
  end

  class TextDocumentColorPresentationResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentColorPresentationResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentColorPresentationResult)
    end
  end

  alias TextDocumentFoldingRangeResult = Array(FoldingRange) | Nil

  # A request to provide folding ranges in a document. The request's
  # parameter is of type {@link FoldingRangeParams}, the
  # response is of type {@link FoldingRangeList} or a Thenable
  # that resolves to such.
  class TextDocumentFoldingRangeRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : FoldingRangeParams
    # The method to be invoked.
    property method : String = "textDocument/foldingRange"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : FoldingRangeParams)
    end
  end

  class TextDocumentFoldingRangeResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentFoldingRangeResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentFoldingRangeResult)
    end
  end

  # @since 3.18.0
  # @proposed
  class WorkspaceFoldingRangeRefreshRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : Nil
    # The method to be invoked.
    property method : String = "workspace/foldingRange/refresh"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : Nil)
    end
  end

  class WorkspaceFoldingRangeRefreshResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : Nil
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : Nil)
    end
  end

  alias TextDocumentDeclarationResult = Declaration | Array(DeclarationLink) | Nil

  # A request to resolve the type definition locations of a symbol at a given text
  # document position. The request's parameter is of type {@link TextDocumentPositionParams}
  # the response is of type {@link Declaration} or a typed array of {@link DeclarationLink}
  # or a Thenable that resolves to such.
  class TextDocumentDeclarationRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : DeclarationParams
    # The method to be invoked.
    property method : String = "textDocument/declaration"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DeclarationParams)
    end
  end

  class TextDocumentDeclarationResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentDeclarationResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentDeclarationResult)
    end
  end

  alias TextDocumentSelectionRangeResult = Array(SelectionRange) | Nil

  # A request to provide selection ranges in a document. The request's
  # parameter is of type {@link SelectionRangeParams}, the
  # response is of type {@link SelectionRange SelectionRange[]} or a Thenable
  # that resolves to such.
  class TextDocumentSelectionRangeRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : SelectionRangeParams
    # The method to be invoked.
    property method : String = "textDocument/selectionRange"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : SelectionRangeParams)
    end
  end

  class TextDocumentSelectionRangeResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentSelectionRangeResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentSelectionRangeResult)
    end
  end

  # The `window/workDoneProgress/create` request is sent from the server to the client to initiate progress
  # reporting from the server.
  class WindowWorkDoneProgressCreateRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : WorkDoneProgressCreateParams
    # The method to be invoked.
    property method : String = "window/workDoneProgress/create"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : WorkDoneProgressCreateParams)
    end
  end

  class WindowWorkDoneProgressCreateResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : Nil
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : Nil)
    end
  end

  alias TextDocumentPrepareCallHierarchyResult = Array(CallHierarchyItem) | Nil

  # A request to result a `CallHierarchyItem` in a document at a given position.
  # Can be used as an input to an incoming or outgoing call hierarchy.
  #
  # @since 3.16.0
  class TextDocumentPrepareCallHierarchyRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : CallHierarchyPrepareParams
    # The method to be invoked.
    property method : String = "textDocument/prepareCallHierarchy"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : CallHierarchyPrepareParams)
    end
  end

  class TextDocumentPrepareCallHierarchyResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentPrepareCallHierarchyResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentPrepareCallHierarchyResult)
    end
  end

  alias CallHierarchyIncomingCallsResult = Array(CallHierarchyIncomingCall) | Nil

  # A request to resolve the incoming calls for a given `CallHierarchyItem`.
  #
  # @since 3.16.0
  class CallHierarchyIncomingCallsRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : CallHierarchyIncomingCallsParams
    # The method to be invoked.
    property method : String = "callHierarchy/incomingCalls"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : CallHierarchyIncomingCallsParams)
    end
  end

  class CallHierarchyIncomingCallsResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : CallHierarchyIncomingCallsResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : CallHierarchyIncomingCallsResult)
    end
  end

  alias CallHierarchyOutgoingCallsResult = Array(CallHierarchyOutgoingCall) | Nil

  # A request to resolve the outgoing calls for a given `CallHierarchyItem`.
  #
  # @since 3.16.0
  class CallHierarchyOutgoingCallsRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : CallHierarchyOutgoingCallsParams
    # The method to be invoked.
    property method : String = "callHierarchy/outgoingCalls"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : CallHierarchyOutgoingCallsParams)
    end
  end

  class CallHierarchyOutgoingCallsResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : CallHierarchyOutgoingCallsResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : CallHierarchyOutgoingCallsResult)
    end
  end

  alias TextDocumentSemanticTokensFullResult = SemanticTokens | Nil

  # @since 3.16.0
  class TextDocumentSemanticTokensFullRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : SemanticTokensParams
    # The method to be invoked.
    property method : String = "textDocument/semanticTokens/full"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : SemanticTokensParams)
    end
  end

  class TextDocumentSemanticTokensFullResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentSemanticTokensFullResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentSemanticTokensFullResult)
    end
  end

  alias TextDocumentSemanticTokensFullDeltaResult = SemanticTokens | SemanticTokensDelta | Nil

  # @since 3.16.0
  class TextDocumentSemanticTokensFullDeltaRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : SemanticTokensDeltaParams
    # The method to be invoked.
    property method : String = "textDocument/semanticTokens/full/delta"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : SemanticTokensDeltaParams)
    end
  end

  class TextDocumentSemanticTokensFullDeltaResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentSemanticTokensFullDeltaResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentSemanticTokensFullDeltaResult)
    end
  end

  alias TextDocumentSemanticTokensRangeResult = SemanticTokens | Nil

  # @since 3.16.0
  class TextDocumentSemanticTokensRangeRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : SemanticTokensRangeParams
    # The method to be invoked.
    property method : String = "textDocument/semanticTokens/range"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : SemanticTokensRangeParams)
    end
  end

  class TextDocumentSemanticTokensRangeResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentSemanticTokensRangeResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentSemanticTokensRangeResult)
    end
  end

  # @since 3.16.0
  class WorkspaceSemanticTokensRefreshRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : Nil
    # The method to be invoked.
    property method : String = "workspace/semanticTokens/refresh"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : Nil)
    end
  end

  class WorkspaceSemanticTokensRefreshResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : Nil
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : Nil)
    end
  end

  # A request to show a document. This request might open an
  # external program depending on the value of the URI to open.
  # For example a request to open `https://code.visualstudio.com/`
  # will very likely open the URI in a WEB browser.
  #
  # @since 3.16.0
  class WindowShowDocumentRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : ShowDocumentParams
    # The method to be invoked.
    property method : String = "window/showDocument"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : ShowDocumentParams)
    end
  end

  class WindowShowDocumentResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : ShowDocumentResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : ShowDocumentResult)
    end
  end

  alias TextDocumentLinkedEditingRangeResult = LinkedEditingRanges | Nil

  # A request to provide ranges that can be edited together.
  #
  # @since 3.16.0
  class TextDocumentLinkedEditingRangeRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : LinkedEditingRangeParams
    # The method to be invoked.
    property method : String = "textDocument/linkedEditingRange"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : LinkedEditingRangeParams)
    end
  end

  class TextDocumentLinkedEditingRangeResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentLinkedEditingRangeResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentLinkedEditingRangeResult)
    end
  end

  alias WorkspaceWillCreateFilesResult = WorkspaceEdit | Nil

  # The will create files request is sent from the client to the server before files are actually
  # created as long as the creation is triggered from within the client.
  #
  # The request can return a `WorkspaceEdit` which will be applied to workspace before the
  # files are created. Hence the `WorkspaceEdit` can not manipulate the content of the file
  # to be created.
  #
  # @since 3.16.0
  class WorkspaceWillCreateFilesRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : CreateFilesParams
    # The method to be invoked.
    property method : String = "workspace/willCreateFiles"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : CreateFilesParams)
    end
  end

  class WorkspaceWillCreateFilesResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : WorkspaceWillCreateFilesResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : WorkspaceWillCreateFilesResult)
    end
  end

  alias WorkspaceWillRenameFilesResult = WorkspaceEdit | Nil

  # The will rename files request is sent from the client to the server before files are actually
  # renamed as long as the rename is triggered from within the client.
  #
  # @since 3.16.0
  class WorkspaceWillRenameFilesRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : RenameFilesParams
    # The method to be invoked.
    property method : String = "workspace/willRenameFiles"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : RenameFilesParams)
    end
  end

  class WorkspaceWillRenameFilesResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : WorkspaceWillRenameFilesResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : WorkspaceWillRenameFilesResult)
    end
  end

  alias WorkspaceWillDeleteFilesResult = WorkspaceEdit | Nil

  # The did delete files notification is sent from the client to the server when
  # files were deleted from within the client.
  #
  # @since 3.16.0
  class WorkspaceWillDeleteFilesRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : DeleteFilesParams
    # The method to be invoked.
    property method : String = "workspace/willDeleteFiles"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DeleteFilesParams)
    end
  end

  class WorkspaceWillDeleteFilesResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : WorkspaceWillDeleteFilesResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : WorkspaceWillDeleteFilesResult)
    end
  end

  alias TextDocumentMonikerResult = Array(Moniker) | Nil

  # A request to get the moniker of a symbol at a given text document position.
  # The request parameter is of type {@link TextDocumentPositionParams}.
  # The response is of type {@link Moniker Moniker[]} or `null`.
  class TextDocumentMonikerRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : MonikerParams
    # The method to be invoked.
    property method : String = "textDocument/moniker"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : MonikerParams)
    end
  end

  class TextDocumentMonikerResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentMonikerResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentMonikerResult)
    end
  end

  alias TextDocumentPrepareTypeHierarchyResult = Array(TypeHierarchyItem) | Nil

  # A request to result a `TypeHierarchyItem` in a document at a given position.
  # Can be used as an input to a subtypes or supertypes type hierarchy.
  #
  # @since 3.17.0
  class TextDocumentPrepareTypeHierarchyRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : TypeHierarchyPrepareParams
    # The method to be invoked.
    property method : String = "textDocument/prepareTypeHierarchy"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : TypeHierarchyPrepareParams)
    end
  end

  class TextDocumentPrepareTypeHierarchyResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentPrepareTypeHierarchyResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentPrepareTypeHierarchyResult)
    end
  end

  alias TypeHierarchySupertypesResult = Array(TypeHierarchyItem) | Nil

  # A request to resolve the supertypes for a given `TypeHierarchyItem`.
  #
  # @since 3.17.0
  class TypeHierarchySupertypesRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : TypeHierarchySupertypesParams
    # The method to be invoked.
    property method : String = "typeHierarchy/supertypes"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : TypeHierarchySupertypesParams)
    end
  end

  class TypeHierarchySupertypesResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TypeHierarchySupertypesResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TypeHierarchySupertypesResult)
    end
  end

  alias TypeHierarchySubtypesResult = Array(TypeHierarchyItem) | Nil

  # A request to resolve the subtypes for a given `TypeHierarchyItem`.
  #
  # @since 3.17.0
  class TypeHierarchySubtypesRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : TypeHierarchySubtypesParams
    # The method to be invoked.
    property method : String = "typeHierarchy/subtypes"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : TypeHierarchySubtypesParams)
    end
  end

  class TypeHierarchySubtypesResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TypeHierarchySubtypesResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TypeHierarchySubtypesResult)
    end
  end

  alias TextDocumentInlineValueResult = Array(InlineValue) | Nil

  # A request to provide inline values in a document. The request's parameter is of
  # type {@link InlineValueParams}, the response is of type
  # {@link InlineValue InlineValue[]} or a Thenable that resolves to such.
  #
  # @since 3.17.0
  class TextDocumentInlineValueRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : InlineValueParams
    # The method to be invoked.
    property method : String = "textDocument/inlineValue"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : InlineValueParams)
    end
  end

  class TextDocumentInlineValueResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentInlineValueResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentInlineValueResult)
    end
  end

  # @since 3.17.0
  class WorkspaceInlineValueRefreshRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : Nil
    # The method to be invoked.
    property method : String = "workspace/inlineValue/refresh"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : Nil)
    end
  end

  class WorkspaceInlineValueRefreshResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : Nil
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : Nil)
    end
  end

  alias TextDocumentInlayHintResult = Array(InlayHint) | Nil

  # A request to provide inlay hints in a document. The request's parameter is of
  # type {@link InlayHintsParams}, the response is of type
  # {@link InlayHint InlayHint[]} or a Thenable that resolves to such.
  #
  # @since 3.17.0
  class TextDocumentInlayHintRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : InlayHintParams
    # The method to be invoked.
    property method : String = "textDocument/inlayHint"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : InlayHintParams)
    end
  end

  class TextDocumentInlayHintResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentInlayHintResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentInlayHintResult)
    end
  end

  # A request to resolve additional properties for an inlay hint.
  # The request's parameter is of type {@link InlayHint}, the response is
  # of type {@link InlayHint} or a Thenable that resolves to such.
  #
  # @since 3.17.0
  class InlayHintResolveRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : InlayHint
    # The method to be invoked.
    property method : String = "inlayHint/resolve"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : InlayHint)
    end
  end

  class InlayHintResolveResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : InlayHint
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : InlayHint)
    end
  end

  # @since 3.17.0
  class WorkspaceInlayHintRefreshRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : Nil
    # The method to be invoked.
    property method : String = "workspace/inlayHint/refresh"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : Nil)
    end
  end

  class WorkspaceInlayHintRefreshResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : Nil
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : Nil)
    end
  end

  # The document diagnostic request definition.
  #
  # @since 3.17.0
  class TextDocumentDiagnosticRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : DocumentDiagnosticParams
    # The method to be invoked.
    property method : String = "textDocument/diagnostic"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DocumentDiagnosticParams)
    end
  end

  class TextDocumentDiagnosticResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : DocumentDiagnosticReport
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : DocumentDiagnosticReport)
    end
  end

  # The workspace diagnostic request definition.
  #
  # @since 3.17.0
  class WorkspaceDiagnosticRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : WorkspaceDiagnosticParams
    # The method to be invoked.
    property method : String = "workspace/diagnostic"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : WorkspaceDiagnosticParams)
    end
  end

  class WorkspaceDiagnosticResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : WorkspaceDiagnosticReport
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : WorkspaceDiagnosticReport)
    end
  end

  # The diagnostic refresh request definition.
  #
  # @since 3.17.0
  class WorkspaceDiagnosticRefreshRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : Nil
    # The method to be invoked.
    property method : String = "workspace/diagnostic/refresh"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : Nil)
    end
  end

  class WorkspaceDiagnosticRefreshResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : Nil
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : Nil)
    end
  end

  alias TextDocumentInlineCompletionResult = InlineCompletionList | Array(InlineCompletionItem) | Nil

  # A request to provide inline completions in a document. The request's parameter is of
  # type {@link InlineCompletionParams}, the response is of type
  # {@link InlineCompletion InlineCompletion[]} or a Thenable that resolves to such.
  #
  # @since 3.18.0
  # @proposed
  class TextDocumentInlineCompletionRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : InlineCompletionParams
    # The method to be invoked.
    property method : String = "textDocument/inlineCompletion"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : InlineCompletionParams)
    end
  end

  class TextDocumentInlineCompletionResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentInlineCompletionResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentInlineCompletionResult)
    end
  end

  # The `client/registerCapability` request is sent from the server to the client to register a new capability
  # handler on the client side.
  class ClientRegisterCapabilityRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : RegistrationParams
    # The method to be invoked.
    property method : String = "client/registerCapability"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : RegistrationParams)
    end
  end

  class ClientRegisterCapabilityResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : Nil
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : Nil)
    end
  end

  # The `client/unregisterCapability` request is sent from the server to the client to unregister a previously registered capability
  # handler on the client side.
  class ClientUnregisterCapabilityRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : UnregistrationParams
    # The method to be invoked.
    property method : String = "client/unregisterCapability"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : UnregistrationParams)
    end
  end

  class ClientUnregisterCapabilityResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : Nil
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : Nil)
    end
  end

  # The initialize request is sent from the client to the server.
  # It is sent once as the request after starting up the server.
  # The requests parameter is of type {@link InitializeParams}
  # the response if of type {@link InitializeResult} of a Thenable that
  # resolves to such.
  class InitializeRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : InitializeParams
    # The method to be invoked.
    property method : String = "initialize"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : InitializeParams)
    end
  end

  class InitializeResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : InitializeResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : InitializeResult)
    end
  end

  # A shutdown request is sent from the client to the server.
  # It is sent once when the client decides to shutdown the
  # server. The only notification that is sent after a shutdown request
  # is the exit event.
  class ShutdownRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : Nil
    # The method to be invoked.
    property method : String = "shutdown"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : Nil)
    end
  end

  class ShutdownResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : Nil
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : Nil)
    end
  end

  alias WindowShowMessageRequestResult = MessageActionItem | Nil

  # The show message request is sent from the server to the client to show a message
  # and a set of options actions to the user.
  class WindowShowMessageRequestRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : ShowMessageRequestParams
    # The method to be invoked.
    property method : String = "window/showMessageRequest"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : ShowMessageRequestParams)
    end
  end

  class WindowShowMessageRequestResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : WindowShowMessageRequestResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : WindowShowMessageRequestResult)
    end
  end

  alias TextDocumentWillSaveWaitUntilResult = Array(TextEdit) | Nil

  # A document will save request is sent from the client to the server before
  # the document is actually saved. The request can return an array of TextEdits
  # which will be applied to the text document before it is saved. Please note that
  # clients might drop results if computing the text edits took too long or if a
  # server constantly fails on this request. This is done to keep the save fast and
  # reliable.
  class TextDocumentWillSaveWaitUntilRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : WillSaveTextDocumentParams
    # The method to be invoked.
    property method : String = "textDocument/willSaveWaitUntil"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : WillSaveTextDocumentParams)
    end
  end

  class TextDocumentWillSaveWaitUntilResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentWillSaveWaitUntilResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentWillSaveWaitUntilResult)
    end
  end

  alias TextDocumentCompletionResult = Array(CompletionItem) | CompletionList | Nil

  # Request to request completion at a given text document position. The request's
  # parameter is of type {@link TextDocumentPosition} the response
  # is of type {@link CompletionItem CompletionItem[]} or {@link CompletionList}
  # or a Thenable that resolves to such.
  #
  # The request can delay the computation of the {@link CompletionItem.detail `detail`}
  # and {@link CompletionItem.documentation `documentation`} properties to the `completionItem/resolve`
  # request. However, properties that are needed for the initial sorting and filtering, like `sortText`,
  # `filterText`, `insertText`, and `textEdit`, must not be changed during resolve.
  class TextDocumentCompletionRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : CompletionParams
    # The method to be invoked.
    property method : String = "textDocument/completion"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : CompletionParams)
    end
  end

  class TextDocumentCompletionResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentCompletionResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentCompletionResult)
    end
  end

  # Request to resolve additional information for a given completion item.The request's
  # parameter is of type {@link CompletionItem} the response
  # is of type {@link CompletionItem} or a Thenable that resolves to such.
  class CompletionItemResolveRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : CompletionItem
    # The method to be invoked.
    property method : String = "completionItem/resolve"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : CompletionItem)
    end
  end

  class CompletionItemResolveResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : CompletionItem
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : CompletionItem)
    end
  end

  alias TextDocumentHoverResult = Hover | Nil

  # Request to request hover information at a given text document position. The request's
  # parameter is of type {@link TextDocumentPosition} the response is of
  # type {@link Hover} or a Thenable that resolves to such.
  class TextDocumentHoverRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : HoverParams
    # The method to be invoked.
    property method : String = "textDocument/hover"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : HoverParams)
    end
  end

  class TextDocumentHoverResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentHoverResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentHoverResult)
    end
  end

  alias TextDocumentSignatureHelpResult = SignatureHelp | Nil

  #
  class TextDocumentSignatureHelpRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : SignatureHelpParams
    # The method to be invoked.
    property method : String = "textDocument/signatureHelp"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : SignatureHelpParams)
    end
  end

  class TextDocumentSignatureHelpResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentSignatureHelpResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentSignatureHelpResult)
    end
  end

  alias TextDocumentDefinitionResult = Definition | Array(DefinitionLink) | Nil

  # A request to resolve the definition location of a symbol at a given text
  # document position. The request's parameter is of type {@link TextDocumentPosition}
  # the response is of either type {@link Definition} or a typed array of
  # {@link DefinitionLink} or a Thenable that resolves to such.
  class TextDocumentDefinitionRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : DefinitionParams
    # The method to be invoked.
    property method : String = "textDocument/definition"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DefinitionParams)
    end
  end

  class TextDocumentDefinitionResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentDefinitionResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentDefinitionResult)
    end
  end

  alias TextDocumentReferencesResult = Array(Location) | Nil

  # A request to resolve project-wide references for the symbol denoted
  # by the given text document position. The request's parameter is of
  # type {@link ReferenceParams} the response is of type
  # {@link Location Location[]} or a Thenable that resolves to such.
  class TextDocumentReferencesRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : ReferenceParams
    # The method to be invoked.
    property method : String = "textDocument/references"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : ReferenceParams)
    end
  end

  class TextDocumentReferencesResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentReferencesResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentReferencesResult)
    end
  end

  alias TextDocumentDocumentHighlightResult = Array(DocumentHighlight) | Nil

  # Request to resolve a {@link DocumentHighlight} for a given
  # text document position. The request's parameter is of type {@link TextDocumentPosition}
  # the request response is an array of type {@link DocumentHighlight}
  # or a Thenable that resolves to such.
  class TextDocumentDocumentHighlightRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : DocumentHighlightParams
    # The method to be invoked.
    property method : String = "textDocument/documentHighlight"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DocumentHighlightParams)
    end
  end

  class TextDocumentDocumentHighlightResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentDocumentHighlightResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentDocumentHighlightResult)
    end
  end

  alias TextDocumentDocumentSymbolResult = Array(SymbolInformation) | Array(DocumentSymbol) | Nil

  # A request to list all symbols found in a given text document. The request's
  # parameter is of type {@link TextDocumentIdentifier} the
  # response is of type {@link SymbolInformation SymbolInformation[]} or a Thenable
  # that resolves to such.
  class TextDocumentDocumentSymbolRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : DocumentSymbolParams
    # The method to be invoked.
    property method : String = "textDocument/documentSymbol"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DocumentSymbolParams)
    end
  end

  class TextDocumentDocumentSymbolResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentDocumentSymbolResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentDocumentSymbolResult)
    end
  end

  alias TextDocumentCodeActionResult = Array(Command | CodeAction) | Nil

  # A request to provide commands for the given text document and range.
  class TextDocumentCodeActionRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : CodeActionParams
    # The method to be invoked.
    property method : String = "textDocument/codeAction"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : CodeActionParams)
    end
  end

  class TextDocumentCodeActionResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentCodeActionResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentCodeActionResult)
    end
  end

  # Request to resolve additional information for a given code action.The request's
  # parameter is of type {@link CodeAction} the response
  # is of type {@link CodeAction} or a Thenable that resolves to such.
  class CodeActionResolveRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : CodeAction
    # The method to be invoked.
    property method : String = "codeAction/resolve"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : CodeAction)
    end
  end

  class CodeActionResolveResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : CodeAction
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : CodeAction)
    end
  end

  alias WorkspaceSymbolResult = Array(SymbolInformation) | Array(WorkspaceSymbol) | Nil

  # A request to list project-wide symbols matching the query string given
  # by the {@link WorkspaceSymbolParams}. The response is
  # of type {@link SymbolInformation SymbolInformation[]} or a Thenable that
  # resolves to such.
  #
  # @since 3.17.0 - support for WorkspaceSymbol in the returned data. Clients
  #  need to advertise support for WorkspaceSymbols via the client capability
  #  `workspace.symbol.resolveSupport`.
  #
  class WorkspaceSymbolRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : WorkspaceSymbolParams
    # The method to be invoked.
    property method : String = "workspace/symbol"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : WorkspaceSymbolParams)
    end
  end

  class WorkspaceSymbolResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : WorkspaceSymbolResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : WorkspaceSymbolResult)
    end
  end

  # A request to resolve the range inside the workspace
  # symbol's location.
  #
  # @since 3.17.0
  class WorkspaceSymbolResolveRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : WorkspaceSymbol
    # The method to be invoked.
    property method : String = "workspaceSymbol/resolve"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : WorkspaceSymbol)
    end
  end

  class WorkspaceSymbolResolveResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : WorkspaceSymbol
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : WorkspaceSymbol)
    end
  end

  alias TextDocumentCodeLensResult = Array(CodeLens) | Nil

  # A request to provide code lens for the given text document.
  class TextDocumentCodeLensRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : CodeLensParams
    # The method to be invoked.
    property method : String = "textDocument/codeLens"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : CodeLensParams)
    end
  end

  class TextDocumentCodeLensResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentCodeLensResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentCodeLensResult)
    end
  end

  # A request to resolve a command for a given code lens.
  class CodeLensResolveRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : CodeLens
    # The method to be invoked.
    property method : String = "codeLens/resolve"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : CodeLens)
    end
  end

  class CodeLensResolveResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : CodeLens
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : CodeLens)
    end
  end

  # A request to refresh all code actions
  #
  # @since 3.16.0
  class WorkspaceCodeLensRefreshRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : Nil
    # The method to be invoked.
    property method : String = "workspace/codeLens/refresh"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : Nil)
    end
  end

  class WorkspaceCodeLensRefreshResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : Nil
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : Nil)
    end
  end

  alias TextDocumentDocumentLinkResult = Array(DocumentLink) | Nil

  # A request to provide document links
  class TextDocumentDocumentLinkRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : DocumentLinkParams
    # The method to be invoked.
    property method : String = "textDocument/documentLink"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DocumentLinkParams)
    end
  end

  class TextDocumentDocumentLinkResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentDocumentLinkResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentDocumentLinkResult)
    end
  end

  # Request to resolve additional information for a given document link. The request's
  # parameter is of type {@link DocumentLink} the response
  # is of type {@link DocumentLink} or a Thenable that resolves to such.
  class DocumentLinkResolveRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : DocumentLink
    # The method to be invoked.
    property method : String = "documentLink/resolve"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DocumentLink)
    end
  end

  class DocumentLinkResolveResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : DocumentLink
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : DocumentLink)
    end
  end

  alias TextDocumentFormattingResult = Array(TextEdit) | Nil

  # A request to format a whole document.
  class TextDocumentFormattingRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : DocumentFormattingParams
    # The method to be invoked.
    property method : String = "textDocument/formatting"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DocumentFormattingParams)
    end
  end

  class TextDocumentFormattingResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentFormattingResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentFormattingResult)
    end
  end

  alias TextDocumentRangeFormattingResult = Array(TextEdit) | Nil

  # A request to format a range in a document.
  class TextDocumentRangeFormattingRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : DocumentRangeFormattingParams
    # The method to be invoked.
    property method : String = "textDocument/rangeFormatting"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DocumentRangeFormattingParams)
    end
  end

  class TextDocumentRangeFormattingResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentRangeFormattingResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentRangeFormattingResult)
    end
  end

  alias TextDocumentRangesFormattingResult = Array(TextEdit) | Nil

  # A request to format ranges in a document.
  #
  # @since 3.18.0
  # @proposed
  class TextDocumentRangesFormattingRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : DocumentRangesFormattingParams
    # The method to be invoked.
    property method : String = "textDocument/rangesFormatting"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DocumentRangesFormattingParams)
    end
  end

  class TextDocumentRangesFormattingResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentRangesFormattingResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentRangesFormattingResult)
    end
  end

  alias TextDocumentOnTypeFormattingResult = Array(TextEdit) | Nil

  # A request to format a document on type.
  class TextDocumentOnTypeFormattingRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : DocumentOnTypeFormattingParams
    # The method to be invoked.
    property method : String = "textDocument/onTypeFormatting"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DocumentOnTypeFormattingParams)
    end
  end

  class TextDocumentOnTypeFormattingResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentOnTypeFormattingResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentOnTypeFormattingResult)
    end
  end

  alias TextDocumentRenameResult = WorkspaceEdit | Nil

  # A request to rename a symbol.
  class TextDocumentRenameRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : RenameParams
    # The method to be invoked.
    property method : String = "textDocument/rename"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : RenameParams)
    end
  end

  class TextDocumentRenameResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentRenameResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentRenameResult)
    end
  end

  alias TextDocumentPrepareRenameResult = PrepareRenameResult | Nil

  # A request to test and perform the setup necessary for a rename.
  #
  # @since 3.16 - support for default behavior
  class TextDocumentPrepareRenameRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : PrepareRenameParams
    # The method to be invoked.
    property method : String = "textDocument/prepareRename"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : PrepareRenameParams)
    end
  end

  class TextDocumentPrepareRenameResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : TextDocumentPrepareRenameResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentPrepareRenameResult)
    end
  end

  alias WorkspaceExecuteCommandResult = LSPAny | Nil

  # A request send from the client to the server to execute a command. The request might return
  # a workspace edit which the client will apply to the workspace.
  class WorkspaceExecuteCommandRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : ExecuteCommandParams
    # The method to be invoked.
    property method : String = "workspace/executeCommand"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : ExecuteCommandParams)
    end
  end

  class WorkspaceExecuteCommandResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : WorkspaceExecuteCommandResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : WorkspaceExecuteCommandResult)
    end
  end

  # A request sent from the server to the client to modified certain resources.
  class WorkspaceApplyEditRequest
    include JSON::Serializable

    # The request id.
    property id : Int32 | String
    property params : ApplyWorkspaceEditParams
    # The method to be invoked.
    property method : String = "workspace/applyEdit"
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : ApplyWorkspaceEditParams)
    end
  end

  class WorkspaceApplyEditResponse
    include JSON::Serializable

    # The request id.
    property id : Int32 | String?
    property result : ApplyWorkspaceEditResult
    property jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : ApplyWorkspaceEditResult)
    end
  end

  # The `workspace/didChangeWorkspaceFolders` notification is sent from the client to the server when the workspace
  # folder configuration changes.
  class WorkspaceDidChangeWorkspaceFoldersNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : DidChangeWorkspaceFoldersParams
    # The method to be invoked.
    property method : String = "workspace/didChangeWorkspaceFolders"
    property jsonrpc : String = "2.0"

    def initialize(@params : DidChangeWorkspaceFoldersParams)
    end
  end

  # The `window/workDoneProgress/cancel` notification is sent from  the client to the server to cancel a progress
  # initiated on the server side.
  class WindowWorkDoneProgressCancelNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : WorkDoneProgressCancelParams
    # The method to be invoked.
    property method : String = "window/workDoneProgress/cancel"
    property jsonrpc : String = "2.0"

    def initialize(@params : WorkDoneProgressCancelParams)
    end
  end

  # The did create files notification is sent from the client to the server when
  # files were created from within the client.
  #
  # @since 3.16.0
  class WorkspaceDidCreateFilesNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : CreateFilesParams
    # The method to be invoked.
    property method : String = "workspace/didCreateFiles"
    property jsonrpc : String = "2.0"

    def initialize(@params : CreateFilesParams)
    end
  end

  # The did rename files notification is sent from the client to the server when
  # files were renamed from within the client.
  #
  # @since 3.16.0
  class WorkspaceDidRenameFilesNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : RenameFilesParams
    # The method to be invoked.
    property method : String = "workspace/didRenameFiles"
    property jsonrpc : String = "2.0"

    def initialize(@params : RenameFilesParams)
    end
  end

  # The will delete files request is sent from the client to the server before files are actually
  # deleted as long as the deletion is triggered from within the client.
  #
  # @since 3.16.0
  class WorkspaceDidDeleteFilesNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : DeleteFilesParams
    # The method to be invoked.
    property method : String = "workspace/didDeleteFiles"
    property jsonrpc : String = "2.0"

    def initialize(@params : DeleteFilesParams)
    end
  end

  # A notification sent when a notebook opens.
  #
  # @since 3.17.0
  class NotebookDocumentDidOpenNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : DidOpenNotebookDocumentParams
    # The method to be invoked.
    property method : String = "notebookDocument/didOpen"
    property jsonrpc : String = "2.0"

    def initialize(@params : DidOpenNotebookDocumentParams)
    end
  end

  #
  class NotebookDocumentDidChangeNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : DidChangeNotebookDocumentParams
    # The method to be invoked.
    property method : String = "notebookDocument/didChange"
    property jsonrpc : String = "2.0"

    def initialize(@params : DidChangeNotebookDocumentParams)
    end
  end

  # A notification sent when a notebook document is saved.
  #
  # @since 3.17.0
  class NotebookDocumentDidSaveNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : DidSaveNotebookDocumentParams
    # The method to be invoked.
    property method : String = "notebookDocument/didSave"
    property jsonrpc : String = "2.0"

    def initialize(@params : DidSaveNotebookDocumentParams)
    end
  end

  # A notification sent when a notebook closes.
  #
  # @since 3.17.0
  class NotebookDocumentDidCloseNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : DidCloseNotebookDocumentParams
    # The method to be invoked.
    property method : String = "notebookDocument/didClose"
    property jsonrpc : String = "2.0"

    def initialize(@params : DidCloseNotebookDocumentParams)
    end
  end

  # The initialized notification is sent from the client to the
  # server after the client is fully initialized and the server
  # is allowed to send requests from the server to the client.
  class InitializedNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : InitializedParams
    # The method to be invoked.
    property method : String = "initialized"
    property jsonrpc : String = "2.0"

    def initialize(@params : InitializedParams)
    end
  end

  # The exit event is sent from the client to the server to
  # ask the server to exit its process.
  class ExitNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : Nil
    # The method to be invoked.
    property method : String = "exit"
    property jsonrpc : String = "2.0"

    def initialize(@params : Nil)
    end
  end

  # The configuration change notification is sent from the client to the server
  # when the client's configuration has changed. The notification contains
  # the changed configuration as defined by the language client.
  class WorkspaceDidChangeConfigurationNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : DidChangeConfigurationParams
    # The method to be invoked.
    property method : String = "workspace/didChangeConfiguration"
    property jsonrpc : String = "2.0"

    def initialize(@params : DidChangeConfigurationParams)
    end
  end

  # The show message notification is sent from a server to a client to ask
  # the client to display a particular message in the user interface.
  class WindowShowMessageNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : ShowMessageParams
    # The method to be invoked.
    property method : String = "window/showMessage"
    property jsonrpc : String = "2.0"

    def initialize(@params : ShowMessageParams)
    end
  end

  # The log message notification is sent from the server to the client to ask
  # the client to log a particular message.
  class WindowLogMessageNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : LogMessageParams
    # The method to be invoked.
    property method : String = "window/logMessage"
    property jsonrpc : String = "2.0"

    def initialize(@params : LogMessageParams)
    end
  end

  # The telemetry event notification is sent from the server to the client to ask
  # the client to log telemetry data.
  class TelemetryEventNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : LSPAny
    # The method to be invoked.
    property method : String = "telemetry/event"
    property jsonrpc : String = "2.0"

    def initialize(@params : LSPAny)
    end
  end

  # The document open notification is sent from the client to the server to signal
  # newly opened text documents. The document's truth is now managed by the client
  # and the server must not try to read the document's truth using the document's
  # uri. Open in this sense means it is managed by the client. It doesn't necessarily
  # mean that its content is presented in an editor. An open notification must not
  # be sent more than once without a corresponding close notification send before.
  # This means open and close notification must be balanced and the max open count
  # is one.
  class TextDocumentDidOpenNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : DidOpenTextDocumentParams
    # The method to be invoked.
    property method : String = "textDocument/didOpen"
    property jsonrpc : String = "2.0"

    def initialize(@params : DidOpenTextDocumentParams)
    end
  end

  # The document change notification is sent from the client to the server to signal
  # changes to a text document.
  class TextDocumentDidChangeNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : DidChangeTextDocumentParams
    # The method to be invoked.
    property method : String = "textDocument/didChange"
    property jsonrpc : String = "2.0"

    def initialize(@params : DidChangeTextDocumentParams)
    end
  end

  # The document close notification is sent from the client to the server when
  # the document got closed in the client. The document's truth now exists where
  # the document's uri points to (e.g. if the document's uri is a file uri the
  # truth now exists on disk). As with the open notification the close notification
  # is about managing the document's content. Receiving a close notification
  # doesn't mean that the document was open in an editor before. A close
  # notification requires a previous open notification to be sent.
  class TextDocumentDidCloseNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : DidCloseTextDocumentParams
    # The method to be invoked.
    property method : String = "textDocument/didClose"
    property jsonrpc : String = "2.0"

    def initialize(@params : DidCloseTextDocumentParams)
    end
  end

  # The document save notification is sent from the client to the server when
  # the document got saved in the client.
  class TextDocumentDidSaveNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : DidSaveTextDocumentParams
    # The method to be invoked.
    property method : String = "textDocument/didSave"
    property jsonrpc : String = "2.0"

    def initialize(@params : DidSaveTextDocumentParams)
    end
  end

  # A document will save notification is sent from the client to the server before
  # the document is actually saved.
  class TextDocumentWillSaveNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : WillSaveTextDocumentParams
    # The method to be invoked.
    property method : String = "textDocument/willSave"
    property jsonrpc : String = "2.0"

    def initialize(@params : WillSaveTextDocumentParams)
    end
  end

  # The watched files notification is sent from the client to the server when
  # the client detects changes to file watched by the language client.
  class WorkspaceDidChangeWatchedFilesNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : DidChangeWatchedFilesParams
    # The method to be invoked.
    property method : String = "workspace/didChangeWatchedFiles"
    property jsonrpc : String = "2.0"

    def initialize(@params : DidChangeWatchedFilesParams)
    end
  end

  # Diagnostics notification are sent from the server to the client to signal
  # results of validation runs.
  class TextDocumentPublishDiagnosticsNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : PublishDiagnosticsParams
    # The method to be invoked.
    property method : String = "textDocument/publishDiagnostics"
    property jsonrpc : String = "2.0"

    def initialize(@params : PublishDiagnosticsParams)
    end
  end

  #
  class SetTraceNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : SetTraceParams
    # The method to be invoked.
    property method : String = "$/setTrace"
    property jsonrpc : String = "2.0"

    def initialize(@params : SetTraceParams)
    end
  end

  #
  class LogTraceNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : LogTraceParams
    # The method to be invoked.
    property method : String = "$/logTrace"
    property jsonrpc : String = "2.0"

    def initialize(@params : LogTraceParams)
    end
  end

  #
  class CancelRequestNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : CancelParams
    # The method to be invoked.
    property method : String = "$/cancelRequest"
    property jsonrpc : String = "2.0"

    def initialize(@params : CancelParams)
    end
  end

  #
  class ProgressNotification
    include JSON::Serializable

    property id : Int32 | String | Nil
    property params : ProgressParams
    # The method to be invoked.
    property method : String = "$/progress"
    property jsonrpc : String = "2.0"

    def initialize(@params : ProgressParams)
    end
  end

  Enum.string MessageDirection do
    Both
    ClientToServer
    ServerToClient
  end
end
