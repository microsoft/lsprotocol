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

    # The position inside the text document.
    getter position : Position

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    def initialize(
      @position : Position?,
      @text_document : TextDocumentIdentifier?,
    )
    end
  end

  class WorkDoneProgressParams
    include JSON::Serializable

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  class PartialResultParams
    include JSON::Serializable

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    def initialize(
      @partial_result_token : ProgressToken? = nil,
    )
    end
  end

  class ImplementationParams
    include JSON::Serializable

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # The position inside the text document.
    getter position : Position

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @position : Position?,
      @text_document : TextDocumentIdentifier?,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Represents a location inside a resource, such as a line
  # inside a text file.
  class Location
    include JSON::Serializable

    getter range : Range

    getter uri : URI

    def initialize(
      @range : Range?,
      @uri : URI?,
    )
    end
  end

  # General text document registration options.
  class TextDocumentRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    def initialize(
      @document_selector : DocumentSelector?,
    )
    end
  end

  class WorkDoneProgressOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class ImplementationOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Static registration options to be returned in the initialize
  # request.
  class StaticRegistrationOptions
    include JSON::Serializable

    # The id used to register the request. The id can be used to deregister
    # the request again. See also Registration#id.
    getter id : String?

    def initialize(
      @id : String? = nil,
    )
    end
  end

  class ImplementationRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    # The id used to register the request. The id can be used to deregister
    # the request again. See also Registration#id.
    getter id : String?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @id : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class TypeDefinitionParams
    include JSON::Serializable

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # The position inside the text document.
    getter position : Position

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @position : Position?,
      @text_document : TextDocumentIdentifier?,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  class TypeDefinitionOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class TypeDefinitionRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    # The id used to register the request. The id can be used to deregister
    # the request again. See also Registration#id.
    getter id : String?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @id : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # A workspace folder inside a client.
  class WorkspaceFolder
    include JSON::Serializable

    # The name of the workspace folder. Used to refer to this
    # workspace folder in the user interface.
    getter name : String

    # The associated URI for this workspace folder.
    getter uri : URI

    def initialize(
      @name : String?,
      @uri : URI?,
    )
    end
  end

  # The parameters of a `workspace/didChangeWorkspaceFolders` notification.
  class DidChangeWorkspaceFoldersParams
    include JSON::Serializable

    # The actual workspace folder change event.
    getter event : WorkspaceFoldersChangeEvent

    def initialize(
      @event : WorkspaceFoldersChangeEvent?,
    )
    end
  end

  # The parameters of a configuration request.
  class ConfigurationParams
    include JSON::Serializable

    getter items : Array(ConfigurationItem)

    def initialize(
      @items : Array(ConfigurationItem)?,
    )
    end
  end

  # Parameters for a `DocumentColorRequest`.
  class DocumentColorParams
    include JSON::Serializable

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @text_document : TextDocumentIdentifier?,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Represents a color range from a document.
  class ColorInformation
    include JSON::Serializable

    # The actual color value for this color range.
    getter color : Color

    # The range in the document where this color appears.
    getter range : Range

    def initialize(
      @color : Color?,
      @range : Range?,
    )
    end
  end

  class DocumentColorOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class DocumentColorRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    # The id used to register the request. The id can be used to deregister
    # the request again. See also Registration#id.
    getter id : String?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @id : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Parameters for a `ColorPresentationRequest`.
  class ColorPresentationParams
    include JSON::Serializable

    # The color to request presentations for.
    getter color : Color

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # The range where the color would be inserted. Serves as a context.
    getter range : Range

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @color : Color?,
      @range : Range?,
      @text_document : TextDocumentIdentifier?,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  class ColorPresentation
    include JSON::Serializable

    # An optional array of additional `TextEdit` that are applied when
    # selecting this color presentation. Edits must not overlap with the main `ColorPresentation#textEdit` nor with themselves.
    @[JSON::Field(key: "additionalTextEdits")]
    getter additional_text_edits : Array(TextEdit)?

    # The label of this color presentation. It will be shown on the color
    # picker header. By default this is also the text that is inserted when selecting
    # this color presentation.
    getter label : String

    # An `TextEdit` which is applied to a document when selecting
    # this presentation for the color.  When `falsy` the `ColorPresentation#label`
    # is used.
    @[JSON::Field(key: "textEdit")]
    getter text_edit : TextEdit?

    def initialize(
      @label : String?,
      @additional_text_edits : Array(TextEdit)? = nil,
      @text_edit : TextEdit? = nil,
    )
    end
  end

  # Parameters for a `FoldingRangeRequest`.
  class FoldingRangeParams
    include JSON::Serializable

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @text_document : TextDocumentIdentifier?,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Represents a folding range. To be valid, start and end line must be bigger than zero and smaller
  # than the number of lines in the document. Clients are free to ignore invalid ranges.
  class FoldingRange
    include JSON::Serializable

    # The text that the client should show when the specified range is
    # collapsed. If not defined or not supported by the client, a default
    # will be chosen by the client.
    #
    # @since 3.17.0
    @[JSON::Field(key: "collapsedText")]
    getter collapsed_text : String?

    # The zero-based character offset before the folded range ends. If not defined, defaults to the length of the end line.
    @[JSON::Field(key: "endCharacter")]
    getter end_character : UInt32?

    # The zero-based end line of the range to fold. The folded area ends with the line's last character.
    # To be valid, the end must be zero or larger and smaller than the number of lines in the document.
    @[JSON::Field(key: "endLine")]
    getter end_line : UInt32

    # Describes the kind of the folding range such as 'comment' or 'region'. The kind
    # is used to categorize folding ranges and used by commands like 'Fold all comments'.
    # See `FoldingRangeKind` for an enumeration of standardized kinds.
    getter kind : FoldingRangeKind | String?

    # The zero-based character offset from where the folded range starts. If not defined, defaults to the length of the start line.
    @[JSON::Field(key: "startCharacter")]
    getter start_character : UInt32?

    # The zero-based start line of the range to fold. The folded area starts after the line's last character.
    # To be valid, the end must be zero or larger and smaller than the number of lines in the document.
    @[JSON::Field(key: "startLine")]
    getter start_line : UInt32

    def initialize(
      @end_line : UInt32?,
      @start_line : UInt32?,
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
    getter work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class FoldingRangeRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    # The id used to register the request. The id can be used to deregister
    # the request again. See also Registration#id.
    getter id : String?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @id : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class DeclarationParams
    include JSON::Serializable

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # The position inside the text document.
    getter position : Position

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @position : Position?,
      @text_document : TextDocumentIdentifier?,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  class DeclarationOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class DeclarationRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    # The id used to register the request. The id can be used to deregister
    # the request again. See also Registration#id.
    getter id : String?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @id : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # A parameter literal used in selection range requests.
  class SelectionRangeParams
    include JSON::Serializable

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # The positions inside the text document.
    getter positions : Array(Position)

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @positions : Array(Position)?,
      @text_document : TextDocumentIdentifier?,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # A selection range represents a part of a selection hierarchy. A selection range
  # may have a parent selection range that contains it.
  class SelectionRange
    include JSON::Serializable

    # The parent selection range containing this range. Therefore `parent.range` must contain `this.range`.
    getter parent : SelectionRange?

    # The `Range` of this selection range.
    getter range : Range

    def initialize(
      @range : Range?,
      @parent : SelectionRange? = nil,
    )
    end
  end

  class SelectionRangeOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class SelectionRangeRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    # The id used to register the request. The id can be used to deregister
    # the request again. See also Registration#id.
    getter id : String?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @id : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class WorkDoneProgressCreateParams
    include JSON::Serializable

    # The token to be used to report progress.
    getter token : ProgressToken

    def initialize(
      @token : ProgressToken?,
    )
    end
  end

  class WorkDoneProgressCancelParams
    include JSON::Serializable

    # The token to be used to report progress.
    getter token : ProgressToken

    def initialize(
      @token : ProgressToken?,
    )
    end
  end

  # The parameter of a `textDocument/prepareCallHierarchy` request.
  #
  # @since 3.16.0
  class CallHierarchyPrepareParams
    include JSON::Serializable

    # The position inside the text document.
    getter position : Position

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @position : Position?,
      @text_document : TextDocumentIdentifier?,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Represents programming constructs like functions or constructors in the context
  # of call hierarchy.
  #
  # @since 3.16.0
  class CallHierarchyItem
    include JSON::Serializable

    # A data entry field that is preserved between a call hierarchy prepare and
    # incoming calls or outgoing calls requests.
    getter data : LSPAny?

    # More detail for this item, e.g. the signature of a function.
    getter detail : String?

    # The kind of this item.
    getter kind : SymbolKind

    # The name of this item.
    getter name : String

    # The range enclosing this symbol not including leading/trailing whitespace but everything else, e.g. comments and code.
    getter range : Range

    # The range that should be selected and revealed when this symbol is being picked, e.g. the name of a function.
    # Must be contained by the `CallHierarchyItem#range`.
    @[JSON::Field(key: "selectionRange")]
    getter selection_range : Range

    # Tags for this item.
    getter tags : Array(SymbolTag)?

    # The resource identifier of this item.
    getter uri : URI

    def initialize(
      @kind : SymbolKind?,
      @name : String?,
      @range : Range?,
      @selection_range : Range?,
      @uri : URI?,
      @data : LSPAny? = nil,
      @detail : String? = nil,
      @tags : Array(SymbolTag)? = nil,
    )
    end
  end

  # Call hierarchy options used during static registration.
  #
  # @since 3.16.0
  class CallHierarchyOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Call hierarchy options used during static or dynamic registration.
  #
  # @since 3.16.0
  class CallHierarchyRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    # The id used to register the request. The id can be used to deregister
    # the request again. See also Registration#id.
    getter id : String?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @id : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # The parameter of a `callHierarchy/incomingCalls` request.
  #
  # @since 3.16.0
  class CallHierarchyIncomingCallsParams
    include JSON::Serializable

    getter item : CallHierarchyItem

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @item : CallHierarchyItem?,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Represents an incoming call, e.g. a caller of a method or constructor.
  #
  # @since 3.16.0
  class CallHierarchyIncomingCall
    include JSON::Serializable

    # The item that makes the call.
    @[JSON::Field(key: "from")]
    getter from_ : CallHierarchyItem

    # The ranges at which the calls appear. This is relative to the caller
    # denoted by `CallHierarchyIncomingCall#from`.
    @[JSON::Field(key: "fromRanges")]
    getter from_ranges : Array(Range)

    def initialize(
      @from_ : CallHierarchyItem?,
      @from_ranges : Array(Range)?,
    )
    end
  end

  # The parameter of a `callHierarchy/outgoingCalls` request.
  #
  # @since 3.16.0
  class CallHierarchyOutgoingCallsParams
    include JSON::Serializable

    getter item : CallHierarchyItem

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @item : CallHierarchyItem?,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Represents an outgoing call, e.g. calling a getter from a method or a method from a constructor etc.
  #
  # @since 3.16.0
  class CallHierarchyOutgoingCall
    include JSON::Serializable

    # The range at which this item is called. This is the range relative to the caller, e.g the item
    # passed to `CallHierarchyItemProvider#provideCallHierarchyOutgoingCalls`
    # and not `CallHierarchyOutgoingCall#to`.
    @[JSON::Field(key: "fromRanges")]
    getter from_ranges : Array(Range)

    # The item that is called.
    getter to : CallHierarchyItem

    def initialize(
      @from_ranges : Array(Range)?,
      @to : CallHierarchyItem?,
    )
    end
  end

  # @since 3.16.0
  class SemanticTokensParams
    include JSON::Serializable

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @text_document : TextDocumentIdentifier?,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # @since 3.16.0
  class SemanticTokens
    include JSON::Serializable

    # The actual tokens.
    getter data : Array(UInt32)

    # An optional result id. If provided and clients support delta updating
    # the client will include the result id in the next semantic token request.
    # A server can then instead of computing all semantic tokens again simply
    # send a delta.
    @[JSON::Field(key: "resultId")]
    getter result_id : String?

    def initialize(
      @data : Array(UInt32)?,
      @result_id : String? = nil,
    )
    end
  end

  # @since 3.16.0
  class SemanticTokensPartialResult
    include JSON::Serializable

    getter data : Array(UInt32)

    def initialize(
      @data : Array(UInt32)?,
    )
    end
  end

  # @since 3.16.0
  class SemanticTokensOptions
    include JSON::Serializable

    # Server supports providing semantic tokens for a full document.
    getter full : Bool | SemanticTokensFullDelta?

    # The legend used by the server
    getter legend : SemanticTokensLegend

    # Server supports providing semantic tokens for a specific range
    # of a document.
    getter range : Bool | JSON::Any??

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @legend : SemanticTokensLegend?,
      @full : Bool | SemanticTokensFullDelta? = nil,
      @range : Bool | JSON::Any?? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # @since 3.16.0
  class SemanticTokensRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    # Server supports providing semantic tokens for a full document.
    getter full : Bool | SemanticTokensFullDelta?

    # The id used to register the request. The id can be used to deregister
    # the request again. See also Registration#id.
    getter id : String?

    # The legend used by the server
    getter legend : SemanticTokensLegend

    # Server supports providing semantic tokens for a specific range
    # of a document.
    getter range : Bool | JSON::Any??

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @legend : SemanticTokensLegend?,
      @full : Bool | SemanticTokensFullDelta? = nil,
      @id : String? = nil,
      @range : Bool | JSON::Any?? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # @since 3.16.0
  class SemanticTokensDeltaParams
    include JSON::Serializable

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # The result id of a previous response. The result Id can either point to a full response
    # or a delta response depending on what was received last.
    @[JSON::Field(key: "previousResultId")]
    getter previous_result_id : String

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @previous_result_id : String?,
      @text_document : TextDocumentIdentifier?,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # @since 3.16.0
  class SemanticTokensDelta
    include JSON::Serializable

    # The semantic token edits to transform a previous result into a new result.
    getter edits : Array(SemanticTokensEdit)

    @[JSON::Field(key: "resultId")]
    getter result_id : String?

    def initialize(
      @edits : Array(SemanticTokensEdit)?,
      @result_id : String? = nil,
    )
    end
  end

  # @since 3.16.0
  class SemanticTokensDeltaPartialResult
    include JSON::Serializable

    getter edits : Array(SemanticTokensEdit)

    def initialize(
      @edits : Array(SemanticTokensEdit)?,
    )
    end
  end

  # @since 3.16.0
  class SemanticTokensRangeParams
    include JSON::Serializable

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # The range the semantic tokens are requested for.
    getter range : Range

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @range : Range?,
      @text_document : TextDocumentIdentifier?,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Params to show a resource in the UI.
  #
  # @since 3.16.0
  class ShowDocumentParams
    include JSON::Serializable

    # Indicates to show the resource in an external program.
    # To show, for example, `https://code.visualstudio.com/`
    # in the default WEB browser set `external` to `true`.
    getter external : Bool?

    # An optional selection range if the document is a text
    # document. Clients might ignore the property if an
    # external program is started or the file is not a text
    # file.
    getter selection : Range?

    # An optional property to indicate whether the editor
    # showing the document should take focus or not.
    # Clients might ignore this property if an external
    # program is started.
    @[JSON::Field(key: "takeFocus")]
    getter take_focus : Bool?

    # The uri to show.
    getter uri : URI

    def initialize(
      @uri : URI?,
      @external : Bool? = nil,
      @selection : Range? = nil,
      @take_focus : Bool? = nil,
    )
    end
  end

  # The result of a showDocument request.
  #
  # @since 3.16.0
  class ShowDocumentResult
    include JSON::Serializable

    # A boolean indicating if the show was successful.
    getter success : Bool

    def initialize(
      @success : Bool?,
    )
    end
  end

  class LinkedEditingRangeParams
    include JSON::Serializable

    # The position inside the text document.
    getter position : Position

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @position : Position?,
      @text_document : TextDocumentIdentifier?,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # The result of a linked editing range request.
  #
  # @since 3.16.0
  class LinkedEditingRanges
    include JSON::Serializable

    # A list of ranges that can be edited together. The ranges must have
    # identical length and contain identical text content. The ranges cannot overlap.
    getter ranges : Array(Range)

    # An optional word pattern (regular expression) that describes valid contents for
    # the given ranges. If no pattern is provided, the client configuration's word
    # pattern will be used.
    @[JSON::Field(key: "wordPattern")]
    getter word_pattern : String?

    def initialize(
      @ranges : Array(Range)?,
      @word_pattern : String? = nil,
    )
    end
  end

  class LinkedEditingRangeOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class LinkedEditingRangeRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    # The id used to register the request. The id can be used to deregister
    # the request again. See also Registration#id.
    getter id : String?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @id : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # The parameters sent in notifications/requests for user-initiated creation of
  # files.
  #
  # @since 3.16.0
  class CreateFilesParams
    include JSON::Serializable

    # An array of all files/folders created in this operation.
    getter files : Array(FileCreate)

    def initialize(
      @files : Array(FileCreate)?,
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

    # A map of change annotations that can be referenced in `AnnotatedTextEdit`s or create, rename and
    # delete file / folder operations.
    #
    # Whether clients honor this property depends on the client capability `workspace.changeAnnotationSupport`.
    #
    # @since 3.16.0
    @[JSON::Field(key: "changeAnnotations")]
    getter change_annotations : Hash(ChangeAnnotationIdentifier, ChangeAnnotation)?

    # Holds changes to existing resources.
    getter changes : Hash(URI, Array(TextEdit))?

    # Depending on the client capability `workspace.workspaceEdit.resourceOperations` document changes
    # are either an array of `TextDocumentEdit`s to express changes to n different text documents
    # where each text document edit addresses a specific version of a text document. Or it can contain
    # above `TextDocumentEdit`s mixed with create, rename and delete file / folder operations.
    #
    # Whether a client supports versioned document edits is expressed via
    # `workspace.workspaceEdit.documentChanges` client capability.
    #
    # If a client neither supports `documentChanges` nor `workspace.workspaceEdit.resourceOperations` then
    # only plain `TextEdit`s using the `changes` property are supported.
    @[JSON::Field(key: "documentChanges")]
    getter document_changes : Array(CreateFile | DeleteFile | RenameFile | TextDocumentEdit)?

    def initialize(
      @change_annotations : Hash(ChangeAnnotationIdentifier, ChangeAnnotation)? = nil,
      @changes : Hash(URI, Array(TextEdit))? = nil,
      @document_changes : Array(CreateFile | DeleteFile | RenameFile | TextDocumentEdit)? = nil,
    )
    end
  end

  # The options to register for file operations.
  #
  # @since 3.16.0
  class FileOperationRegistrationOptions
    include JSON::Serializable

    # The actual filters.
    getter filters : Array(FileOperationFilter)

    def initialize(
      @filters : Array(FileOperationFilter)?,
    )
    end
  end

  # The parameters sent in notifications/requests for user-initiated renames of
  # files.
  #
  # @since 3.16.0
  class RenameFilesParams
    include JSON::Serializable

    # An array of all files/folders renamed in this operation. When a folder is renamed, only
    # the folder will be included, and not its children.
    getter files : Array(FileRename)

    def initialize(
      @files : Array(FileRename)?,
    )
    end
  end

  # The parameters sent in notifications/requests for user-initiated deletes of
  # files.
  #
  # @since 3.16.0
  class DeleteFilesParams
    include JSON::Serializable

    # An array of all files/folders deleted in this operation.
    getter files : Array(FileDelete)

    def initialize(
      @files : Array(FileDelete)?,
    )
    end
  end

  class MonikerParams
    include JSON::Serializable

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # The position inside the text document.
    getter position : Position

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @position : Position?,
      @text_document : TextDocumentIdentifier?,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Moniker definition to match LSIF 0.5 moniker definition.
  #
  # @since 3.16.0
  class Moniker
    include JSON::Serializable

    # The identifier of the moniker. The value is opaque in LSIF however
    # schema owners are allowed to define the structure if they want.
    getter identifier : String

    # The moniker kind if known.
    getter kind : MonikerKind?

    # The scheme of the moniker. For example tsc or .Net
    getter scheme : String

    # The scope in which the moniker is unique
    getter unique : UniquenessLevel

    def initialize(
      @identifier : String?,
      @scheme : String?,
      @unique : UniquenessLevel?,
      @kind : MonikerKind? = nil,
    )
    end
  end

  class MonikerOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class MonikerRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # The parameter of a `textDocument/prepareTypeHierarchy` request.
  #
  # @since 3.17.0
  class TypeHierarchyPrepareParams
    include JSON::Serializable

    # The position inside the text document.
    getter position : Position

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @position : Position?,
      @text_document : TextDocumentIdentifier?,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # @since 3.17.0
  class TypeHierarchyItem
    include JSON::Serializable

    # A data entry field that is preserved between a type hierarchy prepare and
    # supertypes or subtypes requests. It could also be used to identify the
    # type hierarchy in the server, helping improve the performance on
    # resolving supertypes and subtypes.
    getter data : LSPAny?

    # More detail for this item, e.g. the signature of a function.
    getter detail : String?

    # The kind of this item.
    getter kind : SymbolKind

    # The name of this item.
    getter name : String

    # The range enclosing this symbol not including leading/trailing whitespace
    # but everything else, e.g. comments and code.
    getter range : Range

    # The range that should be selected and revealed when this symbol is being
    # picked, e.g. the name of a function. Must be contained by the
    # `TypeHierarchyItem#range`.
    @[JSON::Field(key: "selectionRange")]
    getter selection_range : Range

    # Tags for this item.
    getter tags : Array(SymbolTag)?

    # The resource identifier of this item.
    getter uri : URI

    def initialize(
      @kind : SymbolKind?,
      @name : String?,
      @range : Range?,
      @selection_range : Range?,
      @uri : URI?,
      @data : LSPAny? = nil,
      @detail : String? = nil,
      @tags : Array(SymbolTag)? = nil,
    )
    end
  end

  # Type hierarchy options used during static registration.
  #
  # @since 3.17.0
  class TypeHierarchyOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Type hierarchy options used during static or dynamic registration.
  #
  # @since 3.17.0
  class TypeHierarchyRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    # The id used to register the request. The id can be used to deregister
    # the request again. See also Registration#id.
    getter id : String?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @id : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # The parameter of a `typeHierarchy/supertypes` request.
  #
  # @since 3.17.0
  class TypeHierarchySupertypesParams
    include JSON::Serializable

    getter item : TypeHierarchyItem

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @item : TypeHierarchyItem?,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # The parameter of a `typeHierarchy/subtypes` request.
  #
  # @since 3.17.0
  class TypeHierarchySubtypesParams
    include JSON::Serializable

    getter item : TypeHierarchyItem

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @item : TypeHierarchyItem?,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # A parameter literal used in inline value requests.
  #
  # @since 3.17.0
  class InlineValueParams
    include JSON::Serializable

    # Additional information about the context in which inline values were
    # requested.
    getter context : InlineValueContext

    # The document range for which inline values should be computed.
    getter range : Range

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @context : InlineValueContext?,
      @range : Range?,
      @text_document : TextDocumentIdentifier?,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Inline value options used during static registration.
  #
  # @since 3.17.0
  class InlineValueOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Inline value options used during static or dynamic registration.
  #
  # @since 3.17.0
  class InlineValueRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    # The id used to register the request. The id can be used to deregister
    # the request again. See also Registration#id.
    getter id : String?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @id : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # A parameter literal used in inlay hint requests.
  #
  # @since 3.17.0
  class InlayHintParams
    include JSON::Serializable

    # The document range for which inlay hints should be computed.
    getter range : Range

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @range : Range?,
      @text_document : TextDocumentIdentifier?,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Inlay hint information.
  #
  # @since 3.17.0
  class InlayHint
    include JSON::Serializable

    # A data entry field that is preserved on an inlay hint between
    # a `textDocument/inlayHint` and a `inlayHint/resolve` request.
    getter data : LSPAny?

    # The kind of this hint. Can be omitted in which case the client
    # should fall back to a reasonable default.
    getter kind : InlayHintKind?

    # The label of this hint. A human readable string or an array of
    # InlayHintLabelPart label parts.
    #
    # *Note* that neither the string nor the label part can be empty.
    getter label : Array(InlayHintLabelPart) | String

    # Render padding before the hint.
    #
    # Note: Padding should use the editor's background color, not the
    # background color of the hint itself. That means padding can be used
    # to visually align/separate an inlay hint.
    @[JSON::Field(key: "paddingLeft")]
    getter padding_left : Bool?

    # Render padding after the hint.
    #
    # Note: Padding should use the editor's background color, not the
    # background color of the hint itself. That means padding can be used
    # to visually align/separate an inlay hint.
    @[JSON::Field(key: "paddingRight")]
    getter padding_right : Bool?

    # The position of this hint.
    #
    # If multiple hints have the same position, they will be shown in the order
    # they appear in the response.
    getter position : Position

    # Optional text edits that are performed when accepting this inlay hint.
    #
    # *Note* that edits are expected to change the document so that the inlay
    # hint (or its nearest variant) is now part of the document and the inlay
    # hint itself is now obsolete.
    @[JSON::Field(key: "textEdits")]
    getter text_edits : Array(TextEdit)?

    # The tooltip text when you hover over this item.
    getter tooltip : MarkupContent | String?

    def initialize(
      @label : Array(InlayHintLabelPart) | String?,
      @position : Position?,
      @data : LSPAny? = nil,
      @kind : InlayHintKind? = nil,
      @padding_left : Bool? = nil,
      @padding_right : Bool? = nil,
      @text_edits : Array(TextEdit)? = nil,
      @tooltip : MarkupContent | String? = nil,
    )
    end
  end

  # Inlay hint options used during static registration.
  #
  # @since 3.17.0
  class InlayHintOptions
    include JSON::Serializable

    # The server provides support to resolve additional
    # information for an inlay hint item.
    @[JSON::Field(key: "resolveProvider")]
    getter resolve_provider : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @resolve_provider : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Inlay hint options used during static or dynamic registration.
  #
  # @since 3.17.0
  class InlayHintRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    # The id used to register the request. The id can be used to deregister
    # the request again. See also Registration#id.
    getter id : String?

    # The server provides support to resolve additional
    # information for an inlay hint item.
    @[JSON::Field(key: "resolveProvider")]
    getter resolve_provider : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @id : String? = nil,
      @resolve_provider : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Parameters of the document diagnostic request.
  #
  # @since 3.17.0
  class DocumentDiagnosticParams
    include JSON::Serializable

    # The additional identifier  provided during registration.
    getter identifier : String?

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # The result id of a previous response if provided.
    @[JSON::Field(key: "previousResultId")]
    getter previous_result_id : String?

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @text_document : TextDocumentIdentifier?,
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
  class DocumentDiagnosticReportPartialResult
    include JSON::Serializable

    @[JSON::Field(key: "relatedDocuments")]
    getter related_documents : Hash(URI, FullDocumentDiagnosticReport | UnchangedDocumentDiagnosticReport)

    def initialize(
      @related_documents : Hash(URI, FullDocumentDiagnosticReport | UnchangedDocumentDiagnosticReport)?,
    )
    end
  end

  # Cancellation data returned from a diagnostic request.
  #
  # @since 3.17.0
  class DiagnosticServerCancellationData
    include JSON::Serializable

    @[JSON::Field(key: "retriggerRequest")]
    getter retrigger_request : Bool

    def initialize(
      @retrigger_request : Bool?,
    )
    end
  end

  # Diagnostic options.
  #
  # @since 3.17.0
  class DiagnosticOptions
    include JSON::Serializable

    # An optional identifier under which the diagnostics are
    # managed by the client.
    getter identifier : String?

    # Whether the language has inter file dependencies meaning that
    # editing code in one file can result in a different diagnostic
    # set in another file. Inter file dependencies are common for
    # most programming languages and typically uncommon for linters.
    @[JSON::Field(key: "interFileDependencies")]
    getter inter_file_dependencies : Bool

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    # The server provides support for workspace diagnostics as well.
    @[JSON::Field(key: "workspaceDiagnostics")]
    getter workspace_diagnostics : Bool

    def initialize(
      @inter_file_dependencies : Bool?,
      @workspace_diagnostics : Bool?,
      @identifier : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Diagnostic registration options.
  #
  # @since 3.17.0
  class DiagnosticRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    # The id used to register the request. The id can be used to deregister
    # the request again. See also Registration#id.
    getter id : String?

    # An optional identifier under which the diagnostics are
    # managed by the client.
    getter identifier : String?

    # Whether the language has inter file dependencies meaning that
    # editing code in one file can result in a different diagnostic
    # set in another file. Inter file dependencies are common for
    # most programming languages and typically uncommon for linters.
    @[JSON::Field(key: "interFileDependencies")]
    getter inter_file_dependencies : Bool

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    # The server provides support for workspace diagnostics as well.
    @[JSON::Field(key: "workspaceDiagnostics")]
    getter workspace_diagnostics : Bool

    def initialize(
      @document_selector : DocumentSelector?,
      @inter_file_dependencies : Bool?,
      @workspace_diagnostics : Bool?,
      @id : String? = nil,
      @identifier : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Parameters of the workspace diagnostic request.
  #
  # @since 3.17.0
  class WorkspaceDiagnosticParams
    include JSON::Serializable

    # The additional identifier provided during registration.
    getter identifier : String?

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # The currently known diagnostic reports with their
    # previous result ids.
    @[JSON::Field(key: "previousResultIds")]
    getter previous_result_ids : Array(PreviousResultId)

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @previous_result_ids : Array(PreviousResultId)?,
      @identifier : String? = nil,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # A workspace diagnostic report.
  #
  # @since 3.17.0
  class WorkspaceDiagnosticReport
    include JSON::Serializable

    getter items : Array(WorkspaceDocumentDiagnosticReport)

    def initialize(
      @items : Array(WorkspaceDocumentDiagnosticReport)?,
    )
    end
  end

  # A partial result for a workspace diagnostic report.
  #
  # @since 3.17.0
  class WorkspaceDiagnosticReportPartialResult
    include JSON::Serializable

    getter items : Array(WorkspaceDocumentDiagnosticReport)

    def initialize(
      @items : Array(WorkspaceDocumentDiagnosticReport)?,
    )
    end
  end

  # The params sent in an open notebook document notification.
  #
  # @since 3.17.0
  class DidOpenNotebookDocumentParams
    include JSON::Serializable

    # The text documents that represent the content
    # of a notebook cell.
    @[JSON::Field(key: "cellTextDocuments")]
    getter cell_text_documents : Array(TextDocumentItem)

    # The notebook document that got opened.
    @[JSON::Field(key: "notebookDocument")]
    getter notebook_document : NotebookDocument

    def initialize(
      @cell_text_documents : Array(TextDocumentItem)?,
      @notebook_document : NotebookDocument?,
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
  class NotebookDocumentSyncOptions
    include JSON::Serializable

    # The notebooks to be synced
    @[JSON::Field(key: "notebookSelector")]
    getter notebook_selector : Array(NotebookDocumentFilterWithCells | NotebookDocumentFilterWithNotebook)

    # Whether save notification should be forwarded to
    # the server. Will only be honored if mode === `notebook`.
    getter save : Bool?

    def initialize(
      @notebook_selector : Array(NotebookDocumentFilterWithCells | NotebookDocumentFilterWithNotebook)?,
      @save : Bool? = nil,
    )
    end
  end

  # Registration options specific to a notebook.
  #
  # @since 3.17.0
  class NotebookDocumentSyncRegistrationOptions
    include JSON::Serializable

    # The id used to register the request. The id can be used to deregister
    # the request again. See also Registration#id.
    getter id : String?

    # The notebooks to be synced
    @[JSON::Field(key: "notebookSelector")]
    getter notebook_selector : Array(NotebookDocumentFilterWithCells | NotebookDocumentFilterWithNotebook)

    # Whether save notification should be forwarded to
    # the server. Will only be honored if mode === `notebook`.
    getter save : Bool?

    def initialize(
      @notebook_selector : Array(NotebookDocumentFilterWithCells | NotebookDocumentFilterWithNotebook)?,
      @id : String? = nil,
      @save : Bool? = nil,
    )
    end
  end

  # The params sent in a change notebook document notification.
  #
  # @since 3.17.0
  class DidChangeNotebookDocumentParams
    include JSON::Serializable

    # The actual changes to the notebook document.
    #
    # The changes describe single state changes to the notebook document.
    # So if there are two changes c1 (at array index 0) and c2 (at array
    # index 1) for a notebook in state S then c1 moves the notebook from
    # S to S' and c2 from S' to S''. So c1 is computed on the state S and
    # c2 is computed on the state S'.
    #
    # To mirror the content of a notebook using change events use the following approach:
    # - start with the same initial content
    # - apply the 'notebookDocument/didChange' notifications in the order you receive them.
    # - apply the `NotebookChangeEvent`s in a single notification in the order
    #   you receive them.
    getter change : NotebookDocumentChangeEvent

    # The notebook document that did change. The version number points
    # to the version after all provided changes have been applied. If
    # only the text document content of a cell changes the notebook version
    # doesn't necessarily have to change.
    @[JSON::Field(key: "notebookDocument")]
    getter notebook_document : VersionedNotebookDocumentIdentifier

    def initialize(
      @change : NotebookDocumentChangeEvent?,
      @notebook_document : VersionedNotebookDocumentIdentifier?,
    )
    end
  end

  # The params sent in a save notebook document notification.
  #
  # @since 3.17.0
  class DidSaveNotebookDocumentParams
    include JSON::Serializable

    # The notebook document that got saved.
    @[JSON::Field(key: "notebookDocument")]
    getter notebook_document : NotebookDocumentIdentifier

    def initialize(
      @notebook_document : NotebookDocumentIdentifier?,
    )
    end
  end

  # The params sent in a close notebook document notification.
  #
  # @since 3.17.0
  class DidCloseNotebookDocumentParams
    include JSON::Serializable

    # The text documents that represent the content
    # of a notebook cell that got closed.
    @[JSON::Field(key: "cellTextDocuments")]
    getter cell_text_documents : Array(TextDocumentIdentifier)

    # The notebook document that got closed.
    @[JSON::Field(key: "notebookDocument")]
    getter notebook_document : NotebookDocumentIdentifier

    def initialize(
      @cell_text_documents : Array(TextDocumentIdentifier)?,
      @notebook_document : NotebookDocumentIdentifier?,
    )
    end
  end

  # A parameter literal used in inline completion requests.
  #
  # @since 3.18.0
  # @proposed
  class InlineCompletionParams
    include JSON::Serializable

    # Additional information about the context in which inline completions were
    # requested.
    getter context : InlineCompletionContext

    # The position inside the text document.
    getter position : Position

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @context : InlineCompletionContext?,
      @position : Position?,
      @text_document : TextDocumentIdentifier?,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Represents a collection of `InlineCompletionItem` to be presented in the editor.
  #
  # @since 3.18.0
  # @proposed
  class InlineCompletionList
    include JSON::Serializable

    # The inline completion items
    getter items : Array(InlineCompletionItem)

    def initialize(
      @items : Array(InlineCompletionItem)?,
    )
    end
  end

  # An inline completion item represents a text snippet that is proposed inline to complete text that is being typed.
  #
  # @since 3.18.0
  # @proposed
  class InlineCompletionItem
    include JSON::Serializable

    # An optional `Command` that is executed *after* inserting this completion.
    getter command : Command?

    # A text that is used to decide if this inline completion should be shown. When `falsy` the `InlineCompletionItem#insertText` is used.
    @[JSON::Field(key: "filterText")]
    getter filter_text : String?

    # The text to replace the range with. Must be set.
    @[JSON::Field(key: "insertText")]
    getter insert_text : String | StringValue

    # The range to replace. Must begin and end on the same line.
    getter range : Range?

    def initialize(
      @insert_text : String | StringValue?,
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
  class InlineCompletionOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Inline completion options used during static or dynamic registration.
  #
  # @since 3.18.0
  # @proposed
  class InlineCompletionRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    # The id used to register the request. The id can be used to deregister
    # the request again. See also Registration#id.
    getter id : String?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @id : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class RegistrationParams
    include JSON::Serializable

    getter registrations : Array(Registration)

    def initialize(
      @registrations : Array(Registration)?,
    )
    end
  end

  class UnregistrationParams
    include JSON::Serializable

    getter unregisterations : Array(Unregistration)

    def initialize(
      @unregisterations : Array(Unregistration)?,
    )
    end
  end

  # The initialize parameters
  class InitializeParamsPrivate
    include JSON::Serializable

    # The capabilities provided by the client (editor or tool)
    getter capabilities : ClientCapabilities

    # Information about the client
    #
    # @since 3.15.0
    @[JSON::Field(key: "clientInfo")]
    getter client_info : ClientInfo?

    # User provided initialization options.
    @[JSON::Field(key: "initializationOptions")]
    getter initialization_options : LSPAny?

    # The locale the client is currently showing the user interface
    # in. This must not necessarily be the locale of the operating
    # system.
    #
    # Uses IETF language tags as the value's syntax
    # (See https://en.wikipedia.org/wiki/IETF_language_tag)
    #
    # @since 3.16.0
    getter locale : String?

    # The process Id of the parent process that started
    # the server.
    #
    # Is `null` if the process has not been started by another process.
    # If the parent process is not alive then the server should exit.
    @[JSON::Field(key: "processId")]
    getter process_id : Int32?

    # The rootPath of the workspace. Is null
    # if no folder is open.
    #
    # @deprecated in favour of rootUri.
    @[JSON::Field(key: "rootPath")]
    getter root_path : String?

    # The rootUri of the workspace. Is null if no
    # folder is open. If both `rootPath` and `rootUri` are set
    # `rootUri` wins.
    #
    # @deprecated in favour of workspaceFolders.
    @[JSON::Field(key: "rootUri")]
    getter root_uri : URI?

    # The initial trace setting. If omitted trace is disabled ('off').
    getter trace : TraceValue?

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @capabilities : ClientCapabilities?,
      @process_id : Int32?,
      @root_uri : URI?,
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

    # The workspace folders configured in the client when the server starts.
    #
    # This property is only available if the client supports workspace folders.
    # It can be `null` if the client supports workspace folders but none are
    # configured.
    #
    # @since 3.6.0
    @[JSON::Field(key: "workspaceFolders")]
    getter workspace_folders : Array(WorkspaceFolder)?

    def initialize(
      @workspace_folders : Array(WorkspaceFolder)? = nil,
    )
    end
  end

  class InitializeParams
    include JSON::Serializable

    # The capabilities provided by the client (editor or tool)
    getter capabilities : ClientCapabilities

    # Information about the client
    #
    # @since 3.15.0
    @[JSON::Field(key: "clientInfo")]
    getter client_info : ClientInfo?

    # User provided initialization options.
    @[JSON::Field(key: "initializationOptions")]
    getter initialization_options : LSPAny?

    # The locale the client is currently showing the user interface
    # in. This must not necessarily be the locale of the operating
    # system.
    #
    # Uses IETF language tags as the value's syntax
    # (See https://en.wikipedia.org/wiki/IETF_language_tag)
    #
    # @since 3.16.0
    getter locale : String?

    # The process Id of the parent process that started
    # the server.
    #
    # Is `null` if the process has not been started by another process.
    # If the parent process is not alive then the server should exit.
    @[JSON::Field(key: "processId")]
    getter process_id : Int32?

    # The rootPath of the workspace. Is null
    # if no folder is open.
    #
    # @deprecated in favour of rootUri.
    @[JSON::Field(key: "rootPath")]
    getter root_path : String?

    # The rootUri of the workspace. Is null if no
    # folder is open. If both `rootPath` and `rootUri` are set
    # `rootUri` wins.
    #
    # @deprecated in favour of workspaceFolders.
    @[JSON::Field(key: "rootUri")]
    getter root_uri : URI?

    # The initial trace setting. If omitted trace is disabled ('off').
    getter trace : TraceValue?

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    # The workspace folders configured in the client when the server starts.
    #
    # This property is only available if the client supports workspace folders.
    # It can be `null` if the client supports workspace folders but none are
    # configured.
    #
    # @since 3.6.0
    @[JSON::Field(key: "workspaceFolders")]
    getter workspace_folders : Array(WorkspaceFolder)?

    def initialize(
      @capabilities : ClientCapabilities?,
      @process_id : Int32?,
      @root_uri : URI?,
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

    # The capabilities the language server provides.
    getter capabilities : ServerCapabilities

    # Information about the server.
    #
    # @since 3.15.0
    @[JSON::Field(key: "serverInfo")]
    getter server_info : ServerInfo?

    def initialize(
      @capabilities : ServerCapabilities?,
      @server_info : ServerInfo? = nil,
    )
    end
  end

  # The data type of the ResponseError if the
  # initialize request fails.
  class InitializeError
    include JSON::Serializable

    # Indicates whether the client execute the following retry logic:
    # (1) show the message provided by the ResponseError to the user
    # (2) user selects retry or cancel
    # (3) if user selected retry the initialize method is sent again.
    getter retry : Bool

    def initialize(
      @retry : Bool?,
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

    # The actual changed settings
    getter settings : LSPAny

    def initialize(
      @settings : LSPAny?,
    )
    end
  end

  class DidChangeConfigurationRegistrationOptions
    include JSON::Serializable

    getter section : Array(String) | String?

    def initialize(
      @section : Array(String) | String? = nil,
    )
    end
  end

  # The parameters of a notification message.
  class ShowMessageParams
    include JSON::Serializable

    # The actual message.
    getter message : String

    # The message type. See `MessageType`
    getter type : MessageType

    def initialize(
      @message : String?,
      @type : MessageType?,
    )
    end
  end

  class ShowMessageRequestParams
    include JSON::Serializable

    # The message action items to present.
    getter actions : Array(MessageActionItem)?

    # The actual message.
    getter message : String

    # The message type. See `MessageType`
    getter type : MessageType

    def initialize(
      @message : String?,
      @type : MessageType?,
      @actions : Array(MessageActionItem)? = nil,
    )
    end
  end

  class MessageActionItem
    include JSON::Serializable

    # A short title like 'Retry', 'Open Log' etc.
    getter title : String

    def initialize(
      @title : String?,
    )
    end
  end

  # The log message parameters.
  class LogMessageParams
    include JSON::Serializable

    # The actual message.
    getter message : String

    # The message type. See `MessageType`
    getter type : MessageType

    def initialize(
      @message : String?,
      @type : MessageType?,
    )
    end
  end

  # The parameters sent in an open text document notification
  class DidOpenTextDocumentParams
    include JSON::Serializable

    # The document that was opened.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentItem

    def initialize(
      @text_document : TextDocumentItem?,
    )
    end
  end

  # The change text document notification's parameters.
  class DidChangeTextDocumentParams
    include JSON::Serializable

    # The actual content changes. The content changes describe single state changes
    # to the document. So if there are two content changes c1 (at array index 0) and
    # c2 (at array index 1) for a document in state S then c1 moves the document from
    # S to S' and c2 from S' to S''. So c1 is computed on the state S and c2 is computed
    # on the state S'.
    #
    # To mirror the content of a document using change events use the following approach:
    # - start with the same initial content
    # - apply the 'textDocument/didChange' notifications in the order you receive them.
    # - apply the `TextDocumentContentChangeEvent`s in a single notification in the order
    #   you receive them.
    @[JSON::Field(key: "contentChanges")]
    getter content_changes : Array(TextDocumentContentChangeEvent)

    # The document that did change. The version number points
    # to the version after all provided content changes have
    # been applied.
    @[JSON::Field(key: "textDocument")]
    getter text_document : VersionedTextDocumentIdentifier

    def initialize(
      @content_changes : Array(TextDocumentContentChangeEvent)?,
      @text_document : VersionedTextDocumentIdentifier?,
    )
    end
  end

  # Describe options to be used when registered for text document change events.
  class TextDocumentChangeRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    # How documents are synced to the server.
    @[JSON::Field(key: "syncKind")]
    getter sync_kind : TextDocumentSyncKind

    def initialize(
      @document_selector : DocumentSelector?,
      @sync_kind : TextDocumentSyncKind?,
    )
    end
  end

  # The parameters sent in a close text document notification
  class DidCloseTextDocumentParams
    include JSON::Serializable

    # The document that was closed.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    def initialize(
      @text_document : TextDocumentIdentifier?,
    )
    end
  end

  # The parameters sent in a save text document notification
  class DidSaveTextDocumentParams
    include JSON::Serializable

    # Optional the content when saved. Depends on the includeText value
    # when the save notification was requested.
    getter text : String?

    # The document that was saved.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    def initialize(
      @text_document : TextDocumentIdentifier?,
      @text : String? = nil,
    )
    end
  end

  # Save options.
  class SaveOptions
    include JSON::Serializable

    # The client is supposed to include the content on save.
    @[JSON::Field(key: "includeText")]
    getter include_text : Bool?

    def initialize(
      @include_text : Bool? = nil,
    )
    end
  end

  # Save registration options.
  class TextDocumentSaveRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    # The client is supposed to include the content on save.
    @[JSON::Field(key: "includeText")]
    getter include_text : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @include_text : Bool? = nil,
    )
    end
  end

  # The parameters sent in a will save text document notification.
  class WillSaveTextDocumentParams
    include JSON::Serializable

    # The 'TextDocumentSaveReason'.
    getter reason : TextDocumentSaveReason

    # The document that will be saved.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    def initialize(
      @reason : TextDocumentSaveReason?,
      @text_document : TextDocumentIdentifier?,
    )
    end
  end

  # A text edit applicable to a text document.
  class TextEdit
    include JSON::Serializable

    # The string to be inserted. For delete operations use an
    # empty string.
    @[JSON::Field(key: "newText")]
    getter new_text : String

    # The range of the text document to be manipulated. To insert
    # text into a document create a range where start === end.
    getter range : Range

    def initialize(
      @new_text : String?,
      @range : Range?,
    )
    end
  end

  # The watched files change notification's parameters.
  class DidChangeWatchedFilesParams
    include JSON::Serializable

    # The actual file events.
    getter changes : Array(FileEvent)

    def initialize(
      @changes : Array(FileEvent)?,
    )
    end
  end

  # Describe options to be used when registered for text document change events.
  class DidChangeWatchedFilesRegistrationOptions
    include JSON::Serializable

    # The watchers to register.
    getter watchers : Array(FileSystemWatcher)

    def initialize(
      @watchers : Array(FileSystemWatcher)?,
    )
    end
  end

  # The publish diagnostic notification's parameters.
  class PublishDiagnosticsParams
    include JSON::Serializable

    # An array of diagnostic information items.
    getter diagnostics : Array(Diagnostic)

    # The URI for which diagnostic information is reported.
    getter uri : URI

    # Optional the version number of the document the diagnostics are published for.
    #
    # @since 3.15.0
    getter version : Int32?

    def initialize(
      @diagnostics : Array(Diagnostic)?,
      @uri : URI?,
      @version : Int32? = nil,
    )
    end
  end

  # Completion parameters
  class CompletionParams
    include JSON::Serializable

    # The completion context. This is only available it the client specifies
    # to send this using the client capability `textDocument.completion.contextSupport === true`
    getter context : CompletionContext?

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # The position inside the text document.
    getter position : Position

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @position : Position?,
      @text_document : TextDocumentIdentifier?,
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

    # An optional array of additional `TextEdit` that are applied when
    # selecting this completion. Edits must not overlap (including the same insert position)
    # with the main `CompletionItem#textEdit` nor with themselves.
    #
    # Additional text edits should be used to change text unrelated to the current cursor position
    # (for example adding an import statement at the top of the file if the completion item will
    # insert an unqualified type).
    @[JSON::Field(key: "additionalTextEdits")]
    getter additional_text_edits : Array(TextEdit)?

    # An optional `Command` that is executed *after* inserting this completion. *Note* that
    # additional modifications to the current document should be described with the
    # `CompletionItem#additionalTextEdits`-property.
    getter command : Command?

    # An optional set of characters that when pressed while this completion is active will accept it first and
    # then type that character. *Note* that all commit characters should have `length=1` and that superfluous
    # characters will be ignored.
    @[JSON::Field(key: "commitCharacters")]
    getter commit_characters : Array(String)?

    # A data entry field that is preserved on a completion item between a
    # `CompletionRequest` and a `CompletionResolveRequest`.
    getter data : LSPAny?

    # Indicates if this item is deprecated.
    # @deprecated Use `tags` instead.
    getter deprecated : Bool?

    # A human-readable string with additional information
    # about this item, like type or symbol information.
    getter detail : String?

    # A human-readable string that represents a doc-comment.
    getter documentation : MarkupContent | String?

    # A string that should be used when filtering a set of
    # completion items. When `falsy` the `CompletionItem#label`
    # is used.
    @[JSON::Field(key: "filterText")]
    getter filter_text : String?

    # A string that should be inserted into a document when selecting
    # this completion. When `falsy` the `CompletionItem#label`
    # is used.
    #
    # The `insertText` is subject to interpretation by the client side.
    # Some tools might not take the string literally. For example
    # VS Code when code complete is requested in this example
    # `con<cursor position>` and a completion item with an `insertText` of
    # `console` is provided it will only insert `sole`. Therefore it is
    # recommended to use `textEdit` instead since it avoids additional client
    # side interpretation.
    @[JSON::Field(key: "insertText")]
    getter insert_text : String?

    # The format of the insert text. The format applies to both the
    # `insertText` property and the `newText` property of a provided
    # `textEdit`. If omitted defaults to `InsertTextFormat.PlainText`.
    #
    # Please note that the insertTextFormat doesn't apply to
    # `additionalTextEdits`.
    @[JSON::Field(key: "insertTextFormat")]
    getter insert_text_format : InsertTextFormat?

    # How whitespace and indentation is handled during completion
    # item insertion. If not provided the clients default value depends on
    # the `textDocument.completion.insertTextMode` client capability.
    #
    # @since 3.16.0
    @[JSON::Field(key: "insertTextMode")]
    getter insert_text_mode : InsertTextMode?

    # The kind of this completion item. Based of the kind
    # an icon is chosen by the editor.
    getter kind : CompletionItemKind?

    # The label of this completion item.
    #
    # The label property is also by default the text that
    # is inserted when selecting this completion.
    #
    # If label details are provided the label itself should
    # be an unqualified name of the completion item.
    getter label : String

    # Additional details for the label
    #
    # @since 3.17.0
    @[JSON::Field(key: "labelDetails")]
    getter label_details : CompletionItemLabelDetails?

    # Select this item when showing.
    #
    # *Note* that only one completion item can be selected and that the
    # tool / client decides which item that is. The rule is that the *first*
    # item of those that match best is selected.
    getter preselect : Bool?

    # A string that should be used when comparing this item
    # with other items. When `falsy` the `CompletionItem#label`
    # is used.
    @[JSON::Field(key: "sortText")]
    getter sort_text : String?

    # Tags for this completion item.
    #
    # @since 3.15.0
    getter tags : Array(CompletionItemTag)?

    # An `TextEdit` which is applied to a document when selecting
    # this completion. When an edit is provided the value of
    # `CompletionItem#insertText` is ignored.
    #
    # Most editors support two different operations when accepting a completion
    # item. One is to insert a completion text and the other is to replace an
    # existing text with a completion text. Since this can usually not be
    # predetermined by a server it can report both ranges. Clients need to
    # signal support for `InsertReplaceEdits` via the
    # `textDocument.completion.insertReplaceSupport` client capability
    # property.
    #
    # *Note 1:* The text edit's range as well as both ranges from an insert
    # replace edit must be a [single line] and they must contain the position
    # at which completion has been requested.
    # *Note 2:* If an `InsertReplaceEdit` is returned the edit's insert range
    # must be a prefix of the edit's replace range, that means it must be
    # contained and starting at the same position.
    #
    # @since 3.16.0 additional type `InsertReplaceEdit`
    @[JSON::Field(key: "textEdit")]
    getter text_edit : InsertReplaceEdit | TextEdit?

    # The edit text used if the completion item is part of a CompletionList and
    # CompletionList defines an item default for the text edit range.
    #
    # Clients will only honor this property if they opt into completion list
    # item defaults using the capability `completionList.itemDefaults`.
    #
    # If not provided and a list's default range is provided the label
    # property is used as a text.
    #
    # @since 3.17.0
    @[JSON::Field(key: "textEditText")]
    getter text_edit_text : String?

    def initialize(
      @label : String?,
      @additional_text_edits : Array(TextEdit)? = nil,
      @command : Command? = nil,
      @commit_characters : Array(String)? = nil,
      @data : LSPAny? = nil,
      @deprecated : Bool? = nil,
      @detail : String? = nil,
      @documentation : MarkupContent | String? = nil,
      @filter_text : String? = nil,
      @insert_text : String? = nil,
      @insert_text_format : InsertTextFormat? = nil,
      @insert_text_mode : InsertTextMode? = nil,
      @kind : CompletionItemKind? = nil,
      @label_details : CompletionItemLabelDetails? = nil,
      @preselect : Bool? = nil,
      @sort_text : String? = nil,
      @tags : Array(CompletionItemTag)? = nil,
      @text_edit : InsertReplaceEdit | TextEdit? = nil,
      @text_edit_text : String? = nil,
    )
    end
  end

  # Represents a collection of `CompletionItem` to be presented
  # in the editor.
  class CompletionList
    include JSON::Serializable

    # This list it not complete. Further typing results in recomputing this list.
    #
    # Recomputed lists have all their items replaced (not appended) in the
    # incomplete completion sessions.
    @[JSON::Field(key: "isIncomplete")]
    getter is_incomplete : Bool

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
    @[JSON::Field(key: "itemDefaults")]
    getter item_defaults : CompletionItemDefaults?

    # The completion items.
    getter items : Array(CompletionItem)

    def initialize(
      @is_incomplete : Bool?,
      @items : Array(CompletionItem)?,
      @item_defaults : CompletionItemDefaults? = nil,
    )
    end
  end

  # Completion options.
  class CompletionOptions
    include JSON::Serializable

    # The list of all possible characters that commit a completion. This field can be used
    # if clients don't support individual commit characters per completion item. See
    # `ClientCapabilities.textDocument.completion.completionItem.commitCharactersSupport`
    #
    # If a server provides both `allCommitCharacters` and commit characters on an individual
    # completion item the ones on the completion item win.
    #
    # @since 3.2.0
    @[JSON::Field(key: "allCommitCharacters")]
    getter all_commit_characters : Array(String)?

    # The server supports the following `CompletionItem` specific
    # capabilities.
    #
    # @since 3.17.0
    @[JSON::Field(key: "completionItem")]
    getter completion_item : ServerCompletionItemOptions?

    # The server provides support to resolve additional
    # information for a completion item.
    @[JSON::Field(key: "resolveProvider")]
    getter resolve_provider : Bool?

    # Most tools trigger completion request automatically without explicitly requesting
    # it using a keyboard shortcut (e.g. Ctrl+Space). Typically they do so when the user
    # starts to type an identifier. For example if the user types `c` in a JavaScript file
    # code complete will automatically pop up present `console` besides others as a
    # completion item. Characters that make up identifiers don't need to be listed here.
    #
    # If code complete should automatically be trigger on characters not being valid inside
    # an identifier (for example `.` in JavaScript) list them in `triggerCharacters`.
    @[JSON::Field(key: "triggerCharacters")]
    getter trigger_characters : Array(String)?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @all_commit_characters : Array(String)? = nil,
      @completion_item : ServerCompletionItemOptions? = nil,
      @resolve_provider : Bool? = nil,
      @trigger_characters : Array(String)? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a `CompletionRequest`.
  class CompletionRegistrationOptions
    include JSON::Serializable

    # The list of all possible characters that commit a completion. This field can be used
    # if clients don't support individual commit characters per completion item. See
    # `ClientCapabilities.textDocument.completion.completionItem.commitCharactersSupport`
    #
    # If a server provides both `allCommitCharacters` and commit characters on an individual
    # completion item the ones on the completion item win.
    #
    # @since 3.2.0
    @[JSON::Field(key: "allCommitCharacters")]
    getter all_commit_characters : Array(String)?

    # The server supports the following `CompletionItem` specific
    # capabilities.
    #
    # @since 3.17.0
    @[JSON::Field(key: "completionItem")]
    getter completion_item : ServerCompletionItemOptions?

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    # The server provides support to resolve additional
    # information for a completion item.
    @[JSON::Field(key: "resolveProvider")]
    getter resolve_provider : Bool?

    # Most tools trigger completion request automatically without explicitly requesting
    # it using a keyboard shortcut (e.g. Ctrl+Space). Typically they do so when the user
    # starts to type an identifier. For example if the user types `c` in a JavaScript file
    # code complete will automatically pop up present `console` besides others as a
    # completion item. Characters that make up identifiers don't need to be listed here.
    #
    # If code complete should automatically be trigger on characters not being valid inside
    # an identifier (for example `.` in JavaScript) list them in `triggerCharacters`.
    @[JSON::Field(key: "triggerCharacters")]
    getter trigger_characters : Array(String)?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @all_commit_characters : Array(String)? = nil,
      @completion_item : ServerCompletionItemOptions? = nil,
      @resolve_provider : Bool? = nil,
      @trigger_characters : Array(String)? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Parameters for a `HoverRequest`.
  class HoverParams
    include JSON::Serializable

    # The position inside the text document.
    getter position : Position

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @position : Position?,
      @text_document : TextDocumentIdentifier?,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # The result of a hover request.
  class Hover
    include JSON::Serializable

    # The hover's content
    getter contents : Array(MarkedString) | MarkedString | MarkupContent

    # An optional range inside the text document that is used to
    # visualize the hover, e.g. by changing the background color.
    getter range : Range?

    def initialize(
      @contents : Array(MarkedString) | MarkedString | MarkupContent?,
      @range : Range? = nil,
    )
    end
  end

  # Hover options.
  class HoverOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a `HoverRequest`.
  class HoverRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Parameters for a `SignatureHelpRequest`.
  class SignatureHelpParams
    include JSON::Serializable

    # The signature help context. This is only available if the client specifies
    # to send this using the client capability `textDocument.signatureHelp.contextSupport === true`
    #
    # @since 3.15.0
    getter context : SignatureHelpContext?

    # The position inside the text document.
    getter position : Position

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @position : Position?,
      @text_document : TextDocumentIdentifier?,
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

    # The active parameter of the active signature.
    #
    # If `null`, no parameter of the signature is active (for example a named
    # argument that does not match any declared parameters). This is only valid
    # if the client specifies the client capability
    # `textDocument.signatureHelp.noActiveParameterSupport === true`
    #
    # If omitted or the value lies outside the range of
    # `signatures[activeSignature].parameters` defaults to 0 if the active
    # signature has parameters.
    #
    # If the active signature has no parameters it is ignored.
    #
    # In future version of the protocol this property might become
    # mandatory (but still nullable) to better express the active parameter if
    # the active signature does have any.
    @[JSON::Field(key: "activeParameter")]
    getter active_parameter : UInt32?

    # The active signature. If omitted or the value lies outside the
    # range of `signatures` the value defaults to zero or is ignored if
    # the `SignatureHelp` has no signatures.
    #
    # Whenever possible implementors should make an active decision about
    # the active signature and shouldn't rely on a default value.
    #
    # In future version of the protocol this property might become
    # mandatory to better express this.
    @[JSON::Field(key: "activeSignature")]
    getter active_signature : UInt32?

    # One or more signatures.
    getter signatures : Array(SignatureInformation)

    def initialize(
      @signatures : Array(SignatureInformation)?,
      @active_parameter : UInt32? = nil,
      @active_signature : UInt32? = nil,
    )
    end
  end

  # Server Capabilities for a `SignatureHelpRequest`.
  class SignatureHelpOptions
    include JSON::Serializable

    # List of characters that re-trigger signature help.
    #
    # These trigger characters are only active when signature help is already showing. All trigger characters
    # are also counted as re-trigger characters.
    #
    # @since 3.15.0
    @[JSON::Field(key: "retriggerCharacters")]
    getter retrigger_characters : Array(String)?

    # List of characters that trigger signature help automatically.
    @[JSON::Field(key: "triggerCharacters")]
    getter trigger_characters : Array(String)?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @retrigger_characters : Array(String)? = nil,
      @trigger_characters : Array(String)? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a `SignatureHelpRequest`.
  class SignatureHelpRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    # List of characters that re-trigger signature help.
    #
    # These trigger characters are only active when signature help is already showing. All trigger characters
    # are also counted as re-trigger characters.
    #
    # @since 3.15.0
    @[JSON::Field(key: "retriggerCharacters")]
    getter retrigger_characters : Array(String)?

    # List of characters that trigger signature help automatically.
    @[JSON::Field(key: "triggerCharacters")]
    getter trigger_characters : Array(String)?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @retrigger_characters : Array(String)? = nil,
      @trigger_characters : Array(String)? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Parameters for a `DefinitionRequest`.
  class DefinitionParams
    include JSON::Serializable

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # The position inside the text document.
    getter position : Position

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @position : Position?,
      @text_document : TextDocumentIdentifier?,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Server Capabilities for a `DefinitionRequest`.
  class DefinitionOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a `DefinitionRequest`.
  class DefinitionRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Parameters for a `ReferencesRequest`.
  class ReferenceParams
    include JSON::Serializable

    getter context : ReferenceContext

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # The position inside the text document.
    getter position : Position

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @context : ReferenceContext?,
      @position : Position?,
      @text_document : TextDocumentIdentifier?,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Reference options.
  class ReferenceOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a `ReferencesRequest`.
  class ReferenceRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Parameters for a `DocumentHighlightRequest`.
  class DocumentHighlightParams
    include JSON::Serializable

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # The position inside the text document.
    getter position : Position

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @position : Position?,
      @text_document : TextDocumentIdentifier?,
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

    # The highlight kind, default is `DocumentHighlightKind#Text`.
    getter kind : DocumentHighlightKind?

    # The range this highlight applies to.
    getter range : Range

    def initialize(
      @range : Range?,
      @kind : DocumentHighlightKind? = nil,
    )
    end
  end

  # Provider options for a `DocumentHighlightRequest`.
  class DocumentHighlightOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a `DocumentHighlightRequest`.
  class DocumentHighlightRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Parameters for a `DocumentSymbolRequest`.
  class DocumentSymbolParams
    include JSON::Serializable

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @text_document : TextDocumentIdentifier?,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # A base for all symbol information.
  class BaseSymbolInformation
    include JSON::Serializable

    # The name of the symbol containing this symbol. This information is for
    # user interface purposes (e.g. to render a qualifier in the user interface
    # if necessary). It can't be used to re-infer a hierarchy for the document
    # symbols.
    @[JSON::Field(key: "containerName")]
    getter container_name : String?

    # The kind of this symbol.
    getter kind : SymbolKind

    # The name of this symbol.
    getter name : String

    # Tags for this symbol.
    #
    # @since 3.16.0
    getter tags : Array(SymbolTag)?

    def initialize(
      @kind : SymbolKind?,
      @name : String?,
      @container_name : String? = nil,
      @tags : Array(SymbolTag)? = nil,
    )
    end
  end

  # Represents information about programming constructs like variables, classes,
  # interfaces etc.
  class SymbolInformation
    include JSON::Serializable

    # The name of the symbol containing this symbol. This information is for
    # user interface purposes (e.g. to render a qualifier in the user interface
    # if necessary). It can't be used to re-infer a hierarchy for the document
    # symbols.
    @[JSON::Field(key: "containerName")]
    getter container_name : String?

    # Indicates if this symbol is deprecated.
    #
    # @deprecated Use tags instead
    getter deprecated : Bool?

    # The kind of this symbol.
    getter kind : SymbolKind

    # The location of this symbol. The location's range is used by a tool
    # to reveal the location in the editor. If the symbol is selected in the
    # tool the range's start information is used to position the cursor. So
    # the range usually spans more than the actual symbol's name and does
    # normally include things like visibility modifiers.
    #
    # The range doesn't have to denote a node range in the sense of an abstract
    # syntax tree. It can therefore not be used to re-construct a hierarchy of
    # the symbols.
    getter location : Location

    # The name of this symbol.
    getter name : String

    # Tags for this symbol.
    #
    # @since 3.16.0
    getter tags : Array(SymbolTag)?

    def initialize(
      @kind : SymbolKind?,
      @location : Location?,
      @name : String?,
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

    # Children of this symbol, e.g. properties of a class.
    getter children : Array(DocumentSymbol)?

    # Indicates if this symbol is deprecated.
    #
    # @deprecated Use tags instead
    getter deprecated : Bool?

    # More detail for this symbol, e.g the signature of a function.
    getter detail : String?

    # The kind of this symbol.
    getter kind : SymbolKind

    # The name of this symbol. Will be displayed in the user interface and therefore must not be
    # an empty string or a string only consisting of white spaces.
    getter name : String

    # The range enclosing this symbol not including leading/trailing whitespace but everything else
    # like comments. This information is typically used to determine if the clients cursor is
    # inside the symbol to reveal in the symbol in the UI.
    getter range : Range

    # The range that should be selected and revealed when this symbol is being picked, e.g the name of a function.
    # Must be contained by the `range`.
    @[JSON::Field(key: "selectionRange")]
    getter selection_range : Range

    # Tags for this document symbol.
    #
    # @since 3.16.0
    getter tags : Array(SymbolTag)?

    def initialize(
      @kind : SymbolKind?,
      @name : String?,
      @range : Range?,
      @selection_range : Range?,
      @children : Array(DocumentSymbol)? = nil,
      @deprecated : Bool? = nil,
      @detail : String? = nil,
      @tags : Array(SymbolTag)? = nil,
    )
    end
  end

  # Provider options for a `DocumentSymbolRequest`.
  class DocumentSymbolOptions
    include JSON::Serializable

    # A human-readable string that is shown when multiple outlines trees
    # are shown for the same document.
    #
    # @since 3.16.0
    getter label : String?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @label : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a `DocumentSymbolRequest`.
  class DocumentSymbolRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    # A human-readable string that is shown when multiple outlines trees
    # are shown for the same document.
    #
    # @since 3.16.0
    getter label : String?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @label : String? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # The parameters of a `CodeActionRequest`.
  class CodeActionParams
    include JSON::Serializable

    # Context carrying additional information.
    getter context : CodeActionContext

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # The range for which the command was invoked.
    getter range : Range

    # The document in which the command was invoked.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @context : CodeActionContext?,
      @range : Range?,
      @text_document : TextDocumentIdentifier?,
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

    # Arguments that the command handler should be
    # invoked with.
    getter arguments : Array(LSPAny)?

    # The identifier of the actual command handler.
    getter command : String

    # Title of the command, like `save`.
    getter title : String

    # An optional tooltip.
    #
    # @since 3.18.0
    # @proposed
    getter tooltip : String?

    def initialize(
      @command : String?,
      @title : String?,
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

    # A command this code action executes. If a code action
    # provides an edit and a command, first the edit is
    # executed and then the command.
    getter command : Command?

    # A data entry field that is preserved on a code action between
    # a `textDocument/codeAction` and a `codeAction/resolve` request.
    #
    # @since 3.16.0
    getter data : LSPAny?

    # The diagnostics that this code action resolves.
    getter diagnostics : Array(Diagnostic)?

    # Marks that the code action cannot currently be applied.
    #
    # Clients should follow the following guidelines regarding disabled code actions:
    #
    #   - Disabled code actions are not shown in automatic [lightbulbs](https://code.visualstudio.com/docs/editor/editingevolved#_code-action)
    #     code action menus.
    #
    #   - Disabled actions are shown as faded out in the code action menu when the user requests a more specific type
    #     of code action, such as refactorings.
    #
    #   - If the user has a [keybinding](https://code.visualstudio.com/docs/editor/refactoring#_keybindings-for-code-actions)
    #     that auto applies a code action and only disabled code actions are returned, the client should show the user an
    #     error message with `reason` in the editor.
    #
    # @since 3.16.0
    getter disabled : CodeActionDisabled?

    # The workspace edit this code action performs.
    getter edit : WorkspaceEdit?

    # Marks this as a preferred action. Preferred actions are used by the `auto fix` command and can be targeted
    # by keybindings.
    #
    # A quick fix should be marked preferred if it properly addresses the underlying error.
    # A refactoring should be marked preferred if it is the most reasonable choice of actions to take.
    #
    # @since 3.15.0
    @[JSON::Field(key: "isPreferred")]
    getter is_preferred : Bool?

    # The kind of the code action.
    #
    # Used to filter code actions.
    getter kind : CodeActionKind | String?

    # A short, human-readable, title for this code action.
    getter title : String

    def initialize(
      @title : String?,
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

  # Provider options for a `CodeActionRequest`.
  class CodeActionOptions
    include JSON::Serializable

    # CodeActionKinds that this server may return.
    #
    # The list of kinds may be generic, such as `CodeActionKind.Refactor`, or the server
    # may list out every specific kind they provide.
    @[JSON::Field(key: "codeActionKinds")]
    getter code_action_kinds : Array(CodeActionKind | String)?

    # Static documentation for a class of code actions.
    #
    # Documentation from the provider should be shown in the code actions menu if either:
    #
    # - Code actions of `kind` are requested by the editor. In this case, the editor will show the documentation that
    #   most closely matches the requested code action kind. For example, if a provider has documentation for
    #   both `Refactor` and `RefactorExtract`, when the user requests code actions for `RefactorExtract`,
    #   the editor will use the documentation for `RefactorExtract` instead of the documentation for `Refactor`.
    #
    # - Any code actions of `kind` are returned by the provider.
    #
    # At most one documentation entry should be shown per provider.
    #
    # @since 3.18.0
    # @proposed
    getter documentation : Array(CodeActionKindDocumentation)?

    # The server provides support to resolve additional
    # information for a code action.
    #
    # @since 3.16.0
    @[JSON::Field(key: "resolveProvider")]
    getter resolve_provider : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @code_action_kinds : Array(CodeActionKind | String)? = nil,
      @documentation : Array(CodeActionKindDocumentation)? = nil,
      @resolve_provider : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a `CodeActionRequest`.
  class CodeActionRegistrationOptions
    include JSON::Serializable

    # CodeActionKinds that this server may return.
    #
    # The list of kinds may be generic, such as `CodeActionKind.Refactor`, or the server
    # may list out every specific kind they provide.
    @[JSON::Field(key: "codeActionKinds")]
    getter code_action_kinds : Array(CodeActionKind | String)?

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    # Static documentation for a class of code actions.
    #
    # Documentation from the provider should be shown in the code actions menu if either:
    #
    # - Code actions of `kind` are requested by the editor. In this case, the editor will show the documentation that
    #   most closely matches the requested code action kind. For example, if a provider has documentation for
    #   both `Refactor` and `RefactorExtract`, when the user requests code actions for `RefactorExtract`,
    #   the editor will use the documentation for `RefactorExtract` instead of the documentation for `Refactor`.
    #
    # - Any code actions of `kind` are returned by the provider.
    #
    # At most one documentation entry should be shown per provider.
    #
    # @since 3.18.0
    # @proposed
    getter documentation : Array(CodeActionKindDocumentation)?

    # The server provides support to resolve additional
    # information for a code action.
    #
    # @since 3.16.0
    @[JSON::Field(key: "resolveProvider")]
    getter resolve_provider : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @code_action_kinds : Array(CodeActionKind | String)? = nil,
      @documentation : Array(CodeActionKindDocumentation)? = nil,
      @resolve_provider : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # The parameters of a `WorkspaceSymbolRequest`.
  class WorkspaceSymbolParams
    include JSON::Serializable

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # A query string to filter symbols by. Clients may send an empty
    # string here to request all symbols.
    getter query : String

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @query : String?,
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
  class WorkspaceSymbol
    include JSON::Serializable

    # The name of the symbol containing this symbol. This information is for
    # user interface purposes (e.g. to render a qualifier in the user interface
    # if necessary). It can't be used to re-infer a hierarchy for the document
    # symbols.
    @[JSON::Field(key: "containerName")]
    getter container_name : String?

    # A data entry field that is preserved on a workspace symbol between a
    # workspace symbol request and a workspace symbol resolve request.
    getter data : LSPAny?

    # The kind of this symbol.
    getter kind : SymbolKind

    # The location of the symbol. Whether a server is allowed to
    # return a location without a range depends on the client
    # capability `workspace.symbol.resolveSupport`.
    #
    # See SymbolInformation#location for more details.
    getter location : Location | LocationUriOnly

    # The name of this symbol.
    getter name : String

    # Tags for this symbol.
    #
    # @since 3.16.0
    getter tags : Array(SymbolTag)?

    def initialize(
      @kind : SymbolKind?,
      @location : Location | LocationUriOnly?,
      @name : String?,
      @container_name : String? = nil,
      @data : LSPAny? = nil,
      @tags : Array(SymbolTag)? = nil,
    )
    end
  end

  # Server capabilities for a `WorkspaceSymbolRequest`.
  class WorkspaceSymbolOptions
    include JSON::Serializable

    # The server provides support to resolve additional
    # information for a workspace symbol.
    #
    # @since 3.17.0
    @[JSON::Field(key: "resolveProvider")]
    getter resolve_provider : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @resolve_provider : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a `WorkspaceSymbolRequest`.
  class WorkspaceSymbolRegistrationOptions
    include JSON::Serializable

    # The server provides support to resolve additional
    # information for a workspace symbol.
    #
    # @since 3.17.0
    @[JSON::Field(key: "resolveProvider")]
    getter resolve_provider : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @resolve_provider : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # The parameters of a `CodeLensRequest`.
  class CodeLensParams
    include JSON::Serializable

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # The document to request code lens for.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @text_document : TextDocumentIdentifier?,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # A code lens represents a `Command` that should be shown along with
  # source text, like the number of references, a way to run tests, etc.
  #
  # A code lens is _unresolved_ when no command is associated to it. For performance
  # reasons the creation of a code lens and resolving should be done in two stages.
  class CodeLens
    include JSON::Serializable

    # The command this code lens represents.
    getter command : Command?

    # A data entry field that is preserved on a code lens item between
    # a `CodeLensRequest` and a `CodeLensResolveRequest`
    getter data : LSPAny?

    # The range in which this code lens is valid. Should only span a single line.
    getter range : Range

    def initialize(
      @range : Range?,
      @command : Command? = nil,
      @data : LSPAny? = nil,
    )
    end
  end

  # Code Lens provider options of a `CodeLensRequest`.
  class CodeLensOptions
    include JSON::Serializable

    # Code lens has a resolve provider as well.
    @[JSON::Field(key: "resolveProvider")]
    getter resolve_provider : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @resolve_provider : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a `CodeLensRequest`.
  class CodeLensRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    # Code lens has a resolve provider as well.
    @[JSON::Field(key: "resolveProvider")]
    getter resolve_provider : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @resolve_provider : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # The parameters of a `DocumentLinkRequest`.
  class DocumentLinkParams
    include JSON::Serializable

    # An optional token that a server can use to report partial results (e.g. streaming) to
    # the client.
    @[JSON::Field(key: "partialResultToken")]
    getter partial_result_token : ProgressToken?

    # The document to provide document links for.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @text_document : TextDocumentIdentifier?,
      @partial_result_token : ProgressToken? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # A document link is a range in a text document that links to an internal or external resource, like another
  # text document or a web site.
  class DocumentLink
    include JSON::Serializable

    # A data entry field that is preserved on a document link between a
    # DocumentLinkRequest and a DocumentLinkResolveRequest.
    getter data : LSPAny?

    # The range this link applies to.
    getter range : Range

    # The uri this link points to. If missing a resolve request is sent later.
    getter target : URI?

    # The tooltip text when you hover over this link.
    #
    # If a tooltip is provided, is will be displayed in a string that includes instructions on how to
    # trigger the link, such as `{0} (ctrl + click)`. The specific instructions vary depending on OS,
    # user settings, and localization.
    #
    # @since 3.15.0
    getter tooltip : String?

    def initialize(
      @range : Range?,
      @data : LSPAny? = nil,
      @target : URI? = nil,
      @tooltip : String? = nil,
    )
    end
  end

  # Provider options for a `DocumentLinkRequest`.
  class DocumentLinkOptions
    include JSON::Serializable

    # Document links have a resolve provider as well.
    @[JSON::Field(key: "resolveProvider")]
    getter resolve_provider : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @resolve_provider : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a `DocumentLinkRequest`.
  class DocumentLinkRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    # Document links have a resolve provider as well.
    @[JSON::Field(key: "resolveProvider")]
    getter resolve_provider : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @resolve_provider : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # The parameters of a `DocumentFormattingRequest`.
  class DocumentFormattingParams
    include JSON::Serializable

    # The format options.
    getter options : FormattingOptions

    # The document to format.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @options : FormattingOptions?,
      @text_document : TextDocumentIdentifier?,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Provider options for a `DocumentFormattingRequest`.
  class DocumentFormattingOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a `DocumentFormattingRequest`.
  class DocumentFormattingRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # The parameters of a `DocumentRangeFormattingRequest`.
  class DocumentRangeFormattingParams
    include JSON::Serializable

    # The format options
    getter options : FormattingOptions

    # The range to format
    getter range : Range

    # The document to format.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @options : FormattingOptions?,
      @range : Range?,
      @text_document : TextDocumentIdentifier?,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Provider options for a `DocumentRangeFormattingRequest`.
  class DocumentRangeFormattingOptions
    include JSON::Serializable

    # Whether the server supports formatting multiple ranges at once.
    #
    # @since 3.18.0
    # @proposed
    @[JSON::Field(key: "rangesSupport")]
    getter ranges_support : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @ranges_support : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a `DocumentRangeFormattingRequest`.
  class DocumentRangeFormattingRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    # Whether the server supports formatting multiple ranges at once.
    #
    # @since 3.18.0
    # @proposed
    @[JSON::Field(key: "rangesSupport")]
    getter ranges_support : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @ranges_support : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # The parameters of a `DocumentRangesFormattingRequest`.
  #
  # @since 3.18.0
  # @proposed
  class DocumentRangesFormattingParams
    include JSON::Serializable

    # The format options
    getter options : FormattingOptions

    # The ranges to format
    getter ranges : Array(Range)

    # The document to format.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @options : FormattingOptions?,
      @ranges : Array(Range)?,
      @text_document : TextDocumentIdentifier?,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # The parameters of a `DocumentOnTypeFormattingRequest`.
  class DocumentOnTypeFormattingParams
    include JSON::Serializable

    # The character that has been typed that triggered the formatting
    # on type request. That is not necessarily the last character that
    # got inserted into the document since the client could auto insert
    # characters as well (e.g. like automatic brace completion).
    getter ch : String

    # The formatting options.
    getter options : FormattingOptions

    # The position around which the on type formatting should happen.
    # This is not necessarily the exact position where the character denoted
    # by the property `ch` got typed.
    getter position : Position

    # The document to format.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    def initialize(
      @ch : String?,
      @options : FormattingOptions?,
      @position : Position?,
      @text_document : TextDocumentIdentifier?,
    )
    end
  end

  # Provider options for a `DocumentOnTypeFormattingRequest`.
  class DocumentOnTypeFormattingOptions
    include JSON::Serializable

    # A character on which formatting should be triggered, like `{`.
    @[JSON::Field(key: "firstTriggerCharacter")]
    getter first_trigger_character : String

    # More trigger characters.
    @[JSON::Field(key: "moreTriggerCharacter")]
    getter more_trigger_character : Array(String)?

    def initialize(
      @first_trigger_character : String?,
      @more_trigger_character : Array(String)? = nil,
    )
    end
  end

  # Registration options for a `DocumentOnTypeFormattingRequest`.
  class DocumentOnTypeFormattingRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    # A character on which formatting should be triggered, like `{`.
    @[JSON::Field(key: "firstTriggerCharacter")]
    getter first_trigger_character : String

    # More trigger characters.
    @[JSON::Field(key: "moreTriggerCharacter")]
    getter more_trigger_character : Array(String)?

    def initialize(
      @document_selector : DocumentSelector?,
      @first_trigger_character : String?,
      @more_trigger_character : Array(String)? = nil,
    )
    end
  end

  # The parameters of a `RenameRequest`.
  class RenameParams
    include JSON::Serializable

    # The new name of the symbol. If the given name is not valid the
    # request must return a `ResponseError` with an
    # appropriate message set.
    @[JSON::Field(key: "newName")]
    getter new_name : String

    # The position at which this request was sent.
    getter position : Position

    # The document to rename.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @new_name : String?,
      @position : Position?,
      @text_document : TextDocumentIdentifier?,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # Provider options for a `RenameRequest`.
  class RenameOptions
    include JSON::Serializable

    # Renames should be checked and tested before being executed.
    #
    # @since version 3.12.0
    @[JSON::Field(key: "prepareProvider")]
    getter prepare_provider : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @prepare_provider : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a `RenameRequest`.
  class RenameRegistrationOptions
    include JSON::Serializable

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    # Renames should be checked and tested before being executed.
    #
    # @since version 3.12.0
    @[JSON::Field(key: "prepareProvider")]
    getter prepare_provider : Bool?

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @document_selector : DocumentSelector?,
      @prepare_provider : Bool? = nil,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class PrepareRenameParams
    include JSON::Serializable

    # The position inside the text document.
    getter position : Position

    # The text document.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentIdentifier

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @position : Position?,
      @text_document : TextDocumentIdentifier?,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # The parameters of a `ExecuteCommandRequest`.
  class ExecuteCommandParams
    include JSON::Serializable

    # Arguments that the command should be invoked with.
    getter arguments : Array(LSPAny)?

    # The identifier of the actual command handler.
    getter command : String

    # An optional token that a server can use to report work done progress.
    @[JSON::Field(key: "workDoneToken")]
    getter work_done_token : ProgressToken?

    def initialize(
      @command : String?,
      @arguments : Array(LSPAny)? = nil,
      @work_done_token : ProgressToken? = nil,
    )
    end
  end

  # The server capabilities of a `ExecuteCommandRequest`.
  class ExecuteCommandOptions
    include JSON::Serializable

    # The commands to be executed on the server
    getter commands : Array(String)

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @commands : Array(String)?,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # Registration options for a `ExecuteCommandRequest`.
  class ExecuteCommandRegistrationOptions
    include JSON::Serializable

    # The commands to be executed on the server
    getter commands : Array(String)

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    def initialize(
      @commands : Array(String)?,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  # The parameters passed via an apply workspace edit request.
  class ApplyWorkspaceEditParams
    include JSON::Serializable

    # The edits to apply.
    getter edit : WorkspaceEdit

    # An optional label of the workspace edit. This label is
    # presented in the user interface for example on an undo
    # stack to undo the workspace edit.
    getter label : String?

    # Additional data about the edit.
    #
    # @since 3.18.0
    # @proposed
    getter metadata : WorkspaceEditMetadata?

    def initialize(
      @edit : WorkspaceEdit?,
      @label : String? = nil,
      @metadata : WorkspaceEditMetadata? = nil,
    )
    end
  end

  # The result returned from the apply workspace edit request.
  #
  # @since 3.17 renamed from ApplyWorkspaceEditResponse
  class ApplyWorkspaceEditResult
    include JSON::Serializable

    # Indicates whether the edit was applied or not.
    getter applied : Bool

    # Depending on the client's failure handling strategy `failedChange` might
    # contain the index of the change that failed. This property is only available
    # if the client signals a `failureHandlingStrategy` in its client capabilities.
    @[JSON::Field(key: "failedChange")]
    getter failed_change : UInt32?

    # An optional textual description for why the edit was not applied.
    # This may be used by the server for diagnostic logging or to provide
    # a suitable error for a request that triggered the edit.
    @[JSON::Field(key: "failureReason")]
    getter failure_reason : String?

    def initialize(
      @applied : Bool?,
      @failed_change : UInt32? = nil,
      @failure_reason : String? = nil,
    )
    end
  end

  class WorkDoneProgressBegin
    include JSON::Serializable

    # Controls if a cancel button should show to allow the user to cancel the
    # long running operation. Clients that don't support cancellation are allowed
    # to ignore the setting.
    getter cancellable : Bool?

    getter kind : String

    # Optional, more detailed associated progress message. Contains
    # complementary information to the `title`.
    #
    # Examples: "3/25 files", "project/src/module2", "node_modules/some_dep".
    # If unset, the previous progress message (if any) is still valid.
    getter message : String?

    # Optional progress percentage to display (value 100 is considered 100%).
    # If not provided infinite progress is assumed and clients are allowed
    # to ignore the `percentage` value in subsequent in report notifications.
    #
    # The value should be steadily rising. Clients are free to ignore values
    # that are not following this rule. The value range is [0, 100].
    getter percentage : UInt32?

    # Mandatory title of the progress operation. Used to briefly inform about
    # the kind of operation being performed.
    #
    # Examples: "Indexing" or "Linking dependencies".
    getter title : String

    def initialize(
      @kind : String?,
      @title : String?,
      @cancellable : Bool? = nil,
      @message : String? = nil,
      @percentage : UInt32? = nil,
    )
    end
  end

  class WorkDoneProgressReport
    include JSON::Serializable

    # Controls enablement state of a cancel button.
    #
    # Clients that don't support cancellation or don't support controlling the button's
    # enablement state are allowed to ignore the property.
    getter cancellable : Bool?

    getter kind : String

    # Optional, more detailed associated progress message. Contains
    # complementary information to the `title`.
    #
    # Examples: "3/25 files", "project/src/module2", "node_modules/some_dep".
    # If unset, the previous progress message (if any) is still valid.
    getter message : String?

    # Optional progress percentage to display (value 100 is considered 100%).
    # If not provided infinite progress is assumed and clients are allowed
    # to ignore the `percentage` value in subsequent in report notifications.
    #
    # The value should be steadily rising. Clients are free to ignore values
    # that are not following this rule. The value range is [0, 100]
    getter percentage : UInt32?

    def initialize(
      @kind : String?,
      @cancellable : Bool? = nil,
      @message : String? = nil,
      @percentage : UInt32? = nil,
    )
    end
  end

  class WorkDoneProgressEnd
    include JSON::Serializable

    getter kind : String

    # Optional, a final message indicating to for example indicate the outcome
    # of the operation.
    getter message : String?

    def initialize(
      @kind : String?,
      @message : String? = nil,
    )
    end
  end

  class SetTraceParams
    include JSON::Serializable

    getter value : TraceValue

    def initialize(
      @value : TraceValue?,
    )
    end
  end

  class LogTraceParams
    include JSON::Serializable

    getter message : String

    getter verbose : String?

    def initialize(
      @message : String?,
      @verbose : String? = nil,
    )
    end
  end

  class CancelParams
    include JSON::Serializable

    # The request id to cancel.
    getter id : Int32 | String

    def initialize(
      @id : Int32 | String?,
    )
    end
  end

  class ProgressParams
    include JSON::Serializable

    # The progress token provided by the client or server.
    getter token : ProgressToken

    # The progress data.
    getter value : LSPAny

    def initialize(
      @token : ProgressToken?,
      @value : LSPAny?,
    )
    end
  end

  # Represents the connection of two locations. Provides additional metadata over normal `Location`,
  # including an origin range.
  class LocationLink
    include JSON::Serializable

    # Span of the origin of this link.
    #
    # Used as the underlined span for mouse interaction. Defaults to the word range at
    # the definition position.
    @[JSON::Field(key: "originSelectionRange")]
    getter origin_selection_range : Range?

    # The full target range of this link. If the target for example is a symbol then target range is the
    # range enclosing this symbol not including leading/trailing whitespace but everything else
    # like comments. This information is typically used to highlight the range in the editor.
    @[JSON::Field(key: "targetRange")]
    getter target_range : Range

    # The range that should be selected and revealed when this link is being followed, e.g the name of a function.
    # Must be contained by the `targetRange`. See also `DocumentSymbol#range`
    @[JSON::Field(key: "targetSelectionRange")]
    getter target_selection_range : Range

    # The target resource identifier of this link.
    @[JSON::Field(key: "targetUri")]
    getter target_uri : URI

    def initialize(
      @target_range : Range?,
      @target_selection_range : Range?,
      @target_uri : URI?,
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

    # The range's end position.
    getter end : Position

    # The range's start position.
    getter start : Position

    def initialize(
      @end : Position?,
      @start : Position?,
    )
    end
  end

  # The workspace folder change event.
  class WorkspaceFoldersChangeEvent
    include JSON::Serializable

    # The array of added workspace folders
    getter added : Array(WorkspaceFolder)

    # The array of the removed workspace folders
    getter removed : Array(WorkspaceFolder)

    def initialize(
      @added : Array(WorkspaceFolder)?,
      @removed : Array(WorkspaceFolder)?,
    )
    end
  end

  class ConfigurationItem
    include JSON::Serializable

    # The scope to get the configuration section for.
    @[JSON::Field(key: "scopeUri")]
    getter scope_uri : URI?

    # The configuration section asked for.
    getter section : String?

    def initialize(
      @scope_uri : URI? = nil,
      @section : String? = nil,
    )
    end
  end

  # A literal to identify a text document in the client.
  class TextDocumentIdentifier
    include JSON::Serializable

    # The text document's uri.
    getter uri : URI

    def initialize(
      @uri : URI?,
    )
    end
  end

  # Represents a color in RGBA space.
  class Color
    include JSON::Serializable

    # The alpha component of this color in the range [0-1].
    getter alpha : Float32

    # The blue component of this color in the range [0-1].
    getter blue : Float32

    # The green component of this color in the range [0-1].
    getter green : Float32

    # The red component of this color in the range [0-1].
    getter red : Float32

    def initialize(
      @alpha : Float32?,
      @blue : Float32?,
      @green : Float32?,
      @red : Float32?,
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
  class Position
    include JSON::Serializable

    # Character offset on a line in a document (zero-based).
    #
    # The meaning of this offset is determined by the negotiated
    # `PositionEncodingKind`.
    #
    # If the character value is greater than the line length it defaults back to the
    # line length.
    getter character : UInt32

    # Line position in a document (zero-based).
    #
    # If a line number is greater than the number of lines in a document, it defaults back to the number of lines in the document.
    # If a line number is negative, it defaults to 0.
    getter line : UInt32

    def initialize(
      @character : UInt32?,
      @line : UInt32?,
    )
    end
  end

  # @since 3.16.0
  class SemanticTokensEdit
    include JSON::Serializable

    # The elements to insert.
    getter data : Array(UInt32)?

    # The count of elements to remove.
    @[JSON::Field(key: "deleteCount")]
    getter delete_count : UInt32

    # The start offset of the edit.
    getter start : UInt32

    def initialize(
      @delete_count : UInt32?,
      @start : UInt32?,
      @data : Array(UInt32)? = nil,
    )
    end
  end

  # Represents information on a file/folder create.
  #
  # @since 3.16.0
  class FileCreate
    include JSON::Serializable

    # A file:// URI for the location of the file/folder being created.
    getter uri : String

    def initialize(
      @uri : String?,
    )
    end
  end

  # Describes textual changes on a text document. A TextDocumentEdit describes all changes
  # on a document version Si and after they are applied move the document to version Si+1.
  # So the creator of a TextDocumentEdit doesn't need to sort the array of edits or do any
  # kind of ordering. However the edits must be non overlapping.
  class TextDocumentEdit
    include JSON::Serializable

    # The edits to be applied.
    #
    # @since 3.16.0 - support for AnnotatedTextEdit. This is guarded using a
    # client capability.
    #
    # @since 3.18.0 - support for SnippetTextEdit. This is guarded using a
    # client capability.
    getter edits : Array(AnnotatedTextEdit | SnippetTextEdit | TextEdit)

    # The text document to change.
    @[JSON::Field(key: "textDocument")]
    getter text_document : OptionalVersionedTextDocumentIdentifier

    def initialize(
      @edits : Array(AnnotatedTextEdit | SnippetTextEdit | TextEdit)?,
      @text_document : OptionalVersionedTextDocumentIdentifier?,
    )
    end
  end

  # A generic resource operation.
  class ResourceOperation
    include JSON::Serializable

    # An optional annotation identifier describing the operation.
    #
    # @since 3.16.0
    @[JSON::Field(key: "annotationId")]
    getter annotation_id : ChangeAnnotationIdentifier?

    # The resource operation kind.
    getter kind : String

    def initialize(
      @kind : String?,
      @annotation_id : ChangeAnnotationIdentifier? = nil,
    )
    end
  end

  # Create file operation.
  class CreateFile
    include JSON::Serializable

    # An optional annotation identifier describing the operation.
    #
    # @since 3.16.0
    @[JSON::Field(key: "annotationId")]
    getter annotation_id : ChangeAnnotationIdentifier?

    # A create
    getter kind : String

    # Additional options
    getter options : CreateFileOptions?

    # The resource to create.
    getter uri : URI

    def initialize(
      @kind : String?,
      @uri : URI?,
      @annotation_id : ChangeAnnotationIdentifier? = nil,
      @options : CreateFileOptions? = nil,
    )
    end
  end

  # Rename file operation
  class RenameFile
    include JSON::Serializable

    # An optional annotation identifier describing the operation.
    #
    # @since 3.16.0
    @[JSON::Field(key: "annotationId")]
    getter annotation_id : ChangeAnnotationIdentifier?

    # A rename
    getter kind : String

    # The new location.
    @[JSON::Field(key: "newUri")]
    getter new_uri : URI

    # The old (existing) location.
    @[JSON::Field(key: "oldUri")]
    getter old_uri : URI

    # Rename options.
    getter options : RenameFileOptions?

    def initialize(
      @kind : String?,
      @new_uri : URI?,
      @old_uri : URI?,
      @annotation_id : ChangeAnnotationIdentifier? = nil,
      @options : RenameFileOptions? = nil,
    )
    end
  end

  # Delete file operation
  class DeleteFile
    include JSON::Serializable

    # An optional annotation identifier describing the operation.
    #
    # @since 3.16.0
    @[JSON::Field(key: "annotationId")]
    getter annotation_id : ChangeAnnotationIdentifier?

    # A delete
    getter kind : String

    # Delete options.
    getter options : DeleteFileOptions?

    # The file to delete.
    getter uri : URI

    def initialize(
      @kind : String?,
      @uri : URI?,
      @annotation_id : ChangeAnnotationIdentifier? = nil,
      @options : DeleteFileOptions? = nil,
    )
    end
  end

  # Additional information that describes document changes.
  #
  # @since 3.16.0
  class ChangeAnnotation
    include JSON::Serializable

    # A human-readable string which is rendered less prominent in
    # the user interface.
    getter description : String?

    # A human-readable string describing the actual change. The string
    # is rendered prominent in the user interface.
    getter label : String

    # A flag which indicates that user confirmation is needed
    # before applying the change.
    @[JSON::Field(key: "needsConfirmation")]
    getter needs_confirmation : Bool?

    def initialize(
      @label : String?,
      @description : String? = nil,
      @needs_confirmation : Bool? = nil,
    )
    end
  end

  # A filter to describe in which file operation requests or notifications
  # the server is interested in receiving.
  #
  # @since 3.16.0
  class FileOperationFilter
    include JSON::Serializable

    # The actual file operation pattern.
    getter pattern : FileOperationPattern

    # A Uri scheme like `file` or `untitled`.
    getter scheme : String?

    def initialize(
      @pattern : FileOperationPattern?,
      @scheme : String? = nil,
    )
    end
  end

  # Represents information on a file/folder rename.
  #
  # @since 3.16.0
  class FileRename
    include JSON::Serializable

    # A file:// URI for the new location of the file/folder being renamed.
    @[JSON::Field(key: "newUri")]
    getter new_uri : String

    # A file:// URI for the original location of the file/folder being renamed.
    @[JSON::Field(key: "oldUri")]
    getter old_uri : String

    def initialize(
      @new_uri : String?,
      @old_uri : String?,
    )
    end
  end

  # Represents information on a file/folder delete.
  #
  # @since 3.16.0
  class FileDelete
    include JSON::Serializable

    # A file:// URI for the location of the file/folder being deleted.
    getter uri : String

    def initialize(
      @uri : String?,
    )
    end
  end

  # @since 3.17.0
  class InlineValueContext
    include JSON::Serializable

    # The stack frame (as a DAP Id) where the execution has stopped.
    @[JSON::Field(key: "frameId")]
    getter frame_id : Int32

    # The document range where execution has stopped.
    # Typically the end position of the range denotes the line where the inline values are shown.
    @[JSON::Field(key: "stoppedLocation")]
    getter stopped_location : Range

    def initialize(
      @frame_id : Int32?,
      @stopped_location : Range?,
    )
    end
  end

  # Provide inline value as text.
  #
  # @since 3.17.0
  class InlineValueText
    include JSON::Serializable

    # The document range for which the inline value applies.
    getter range : Range

    # The text of the inline value.
    getter text : String

    def initialize(
      @range : Range?,
      @text : String?,
    )
    end
  end

  # Provide inline value through a variable lookup.
  # If only a range is specified, the variable name will be extracted from the underlying document.
  # An optional variable name can be used to override the extracted name.
  #
  # @since 3.17.0
  class InlineValueVariableLookup
    include JSON::Serializable

    # How to perform the lookup.
    @[JSON::Field(key: "caseSensitiveLookup")]
    getter case_sensitive_lookup : Bool

    # The document range for which the inline value applies.
    # The range is used to extract the variable name from the underlying document.
    getter range : Range

    # If specified the name of the variable to look up.
    @[JSON::Field(key: "variableName")]
    getter variable_name : String?

    def initialize(
      @case_sensitive_lookup : Bool?,
      @range : Range?,
      @variable_name : String? = nil,
    )
    end
  end

  # Provide an inline value through an expression evaluation.
  # If only a range is specified, the expression will be extracted from the underlying document.
  # An optional expression can be used to override the extracted expression.
  #
  # @since 3.17.0
  class InlineValueEvaluatableExpression
    include JSON::Serializable

    # If specified the expression overrides the extracted expression.
    getter expression : String?

    # The document range for which the inline value applies.
    # The range is used to extract the evaluatable expression from the underlying document.
    getter range : Range

    def initialize(
      @range : Range?,
      @expression : String? = nil,
    )
    end
  end

  # An inlay hint label part allows for interactive and composite labels
  # of inlay hints.
  #
  # @since 3.17.0
  class InlayHintLabelPart
    include JSON::Serializable

    # An optional command for this label part.
    #
    # Depending on the client capability `inlayHint.resolveSupport` clients
    # might resolve this property late using the resolve request.
    getter command : Command?

    # An optional source code location that represents this
    # label part.
    #
    # The editor will use this location for the hover and for code navigation
    # features: This part will become a clickable link that resolves to the
    # definition of the symbol at the given location (not necessarily the
    # location itself), it shows the hover that shows at the given location,
    # and it shows a context menu with further code navigation commands.
    #
    # Depending on the client capability `inlayHint.resolveSupport` clients
    # might resolve this property late using the resolve request.
    getter location : Location?

    # The tooltip text when you hover over this label part. Depending on
    # the client capability `inlayHint.resolveSupport` clients might resolve
    # this property late using the resolve request.
    getter tooltip : MarkupContent | String?

    # The value of this label part.
    getter value : String

    def initialize(
      @value : String?,
      @command : Command? = nil,
      @location : Location? = nil,
      @tooltip : MarkupContent | String? = nil,
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

    # The type of the Markup
    getter kind : MarkupKind

    # The content itself
    getter value : String

    def initialize(
      @kind : MarkupKind?,
      @value : String?,
    )
    end
  end

  # A diagnostic report with a full set of problems.
  #
  # @since 3.17.0
  class FullDocumentDiagnosticReport
    include JSON::Serializable

    # The actual items.
    getter items : Array(Diagnostic)

    # A full document diagnostic report.
    getter kind : String

    # An optional result id. If provided it will
    # be sent on the next diagnostic request for the
    # same document.
    @[JSON::Field(key: "resultId")]
    getter result_id : String?

    def initialize(
      @items : Array(Diagnostic)?,
      @kind : String?,
      @result_id : String? = nil,
    )
    end
  end

  # A full diagnostic report with a set of related documents.
  #
  # @since 3.17.0
  class RelatedFullDocumentDiagnosticReport
    include JSON::Serializable

    # The actual items.
    getter items : Array(Diagnostic)

    # A full document diagnostic report.
    getter kind : String

    # Diagnostics of related documents. This information is useful
    # in programming languages where code in a file A can generate
    # diagnostics in a file B which A depends on. An example of
    # such a language is C/C++ where marco definitions in a file
    # a.cpp and result in errors in a header file b.hpp.
    #
    # @since 3.17.0
    @[JSON::Field(key: "relatedDocuments")]
    getter related_documents : Hash(URI, FullDocumentDiagnosticReport | UnchangedDocumentDiagnosticReport)?

    # An optional result id. If provided it will
    # be sent on the next diagnostic request for the
    # same document.
    @[JSON::Field(key: "resultId")]
    getter result_id : String?

    def initialize(
      @items : Array(Diagnostic)?,
      @kind : String?,
      @related_documents : Hash(URI, FullDocumentDiagnosticReport | UnchangedDocumentDiagnosticReport)? = nil,
      @result_id : String? = nil,
    )
    end
  end

  # A diagnostic report indicating that the last returned
  # report is still accurate.
  #
  # @since 3.17.0
  class UnchangedDocumentDiagnosticReport
    include JSON::Serializable

    # A document diagnostic report indicating
    # no changes to the last result. A server can
    # only return `unchanged` if result ids are
    # provided.
    getter kind : String

    # A result id which will be sent on the next
    # diagnostic request for the same document.
    @[JSON::Field(key: "resultId")]
    getter result_id : String

    def initialize(
      @kind : String?,
      @result_id : String?,
    )
    end
  end

  # An unchanged diagnostic report with a set of related documents.
  #
  # @since 3.17.0
  class RelatedUnchangedDocumentDiagnosticReport
    include JSON::Serializable

    # A document diagnostic report indicating
    # no changes to the last result. A server can
    # only return `unchanged` if result ids are
    # provided.
    getter kind : String

    # Diagnostics of related documents. This information is useful
    # in programming languages where code in a file A can generate
    # diagnostics in a file B which A depends on. An example of
    # such a language is C/C++ where marco definitions in a file
    # a.cpp and result in errors in a header file b.hpp.
    #
    # @since 3.17.0
    @[JSON::Field(key: "relatedDocuments")]
    getter related_documents : Hash(URI, FullDocumentDiagnosticReport | UnchangedDocumentDiagnosticReport)?

    # A result id which will be sent on the next
    # diagnostic request for the same document.
    @[JSON::Field(key: "resultId")]
    getter result_id : String

    def initialize(
      @kind : String?,
      @result_id : String?,
      @related_documents : Hash(URI, FullDocumentDiagnosticReport | UnchangedDocumentDiagnosticReport)? = nil,
    )
    end
  end

  # A previous result id in a workspace pull request.
  #
  # @since 3.17.0
  class PreviousResultId
    include JSON::Serializable

    # The URI for which the client knowns a
    # result id.
    getter uri : URI

    # The value of the previous result id.
    getter value : String

    def initialize(
      @uri : URI?,
      @value : String?,
    )
    end
  end

  # A notebook document.
  #
  # @since 3.17.0
  class NotebookDocument
    include JSON::Serializable

    # The cells of a notebook.
    getter cells : Array(NotebookCell)

    # Additional metadata stored with the notebook
    # document.
    #
    # Note: should always be an object literal (e.g. LSPObject)
    getter metadata : LSPObject?

    # The type of the notebook.
    @[JSON::Field(key: "notebookType")]
    getter notebook_type : String

    # The notebook document's uri.
    getter uri : URI

    # The version number of this document (it will increase after each
    # change, including undo/redo).
    getter version : Int32

    def initialize(
      @cells : Array(NotebookCell)?,
      @notebook_type : String?,
      @uri : URI?,
      @version : Int32?,
      @metadata : LSPObject? = nil,
    )
    end
  end

  # An item to transfer a text document from the client to the
  # server.
  class TextDocumentItem
    include JSON::Serializable

    # The text document's language identifier.
    @[JSON::Field(key: "languageId")]
    getter language_id : LanguageKind | String

    # The content of the opened text document.
    getter text : String

    # The text document's uri.
    getter uri : URI

    # The version number of this document (it will increase after each
    # change, including undo/redo).
    getter version : Int32

    def initialize(
      @language_id : LanguageKind | String?,
      @text : String?,
      @uri : URI?,
      @version : Int32?,
    )
    end
  end

  # A versioned notebook document identifier.
  #
  # @since 3.17.0
  class VersionedNotebookDocumentIdentifier
    include JSON::Serializable

    # The notebook document's uri.
    getter uri : URI

    # The version number of this notebook document.
    getter version : Int32

    def initialize(
      @uri : URI?,
      @version : Int32?,
    )
    end
  end

  # A change event for a notebook document.
  #
  # @since 3.17.0
  class NotebookDocumentChangeEvent
    include JSON::Serializable

    # Changes to cells
    getter cells : NotebookDocumentCellChanges?

    # The changed meta data if any.
    #
    # Note: should always be an object literal (e.g. LSPObject)
    getter metadata : LSPObject?

    def initialize(
      @cells : NotebookDocumentCellChanges? = nil,
      @metadata : LSPObject? = nil,
    )
    end
  end

  # A literal to identify a notebook document in the client.
  #
  # @since 3.17.0
  class NotebookDocumentIdentifier
    include JSON::Serializable

    # The notebook document's uri.
    getter uri : URI

    def initialize(
      @uri : URI?,
    )
    end
  end

  # Provides information about the context in which an inline completion was requested.
  #
  # @since 3.18.0
  # @proposed
  class InlineCompletionContext
    include JSON::Serializable

    # Provides information about the currently selected item in the autocomplete widget if it is visible.
    @[JSON::Field(key: "selectedCompletionInfo")]
    getter selected_completion_info : SelectedCompletionInfo?

    # Describes how the inline completion was triggered.
    @[JSON::Field(key: "triggerKind")]
    getter trigger_kind : InlineCompletionTriggerKind

    def initialize(
      @trigger_kind : InlineCompletionTriggerKind?,
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
  class StringValue
    include JSON::Serializable

    # The kind of string value.
    getter kind : String

    # The snippet string.
    getter value : String

    def initialize(
      @kind : String?,
      @value : String?,
    )
    end
  end

  # General parameters to register for a notification or to register a provider.
  class Registration
    include JSON::Serializable

    # The id used to register the request. The id can be used to deregister
    # the request again.
    getter id : String

    # The method / capability to register for.
    getter method : String

    # Options necessary for the registration.
    @[JSON::Field(key: "registerOptions")]
    getter register_options : LSPAny?

    def initialize(
      @id : String?,
      @method : String?,
      @register_options : LSPAny? = nil,
    )
    end
  end

  # General parameters to unregister a request or notification.
  class Unregistration
    include JSON::Serializable

    # The id used to unregister the request or notification. Usually an id
    # provided during the register request.
    getter id : String

    # The method to unregister for.
    getter method : String

    def initialize(
      @id : String?,
      @method : String?,
    )
    end
  end

  # Defines the capabilities provided by a language
  # server.
  class ServerCapabilities
    include JSON::Serializable

    # The server provides call hierarchy support.
    #
    # @since 3.16.0
    @[JSON::Field(key: "callHierarchyProvider")]
    getter call_hierarchy_provider : Bool | CallHierarchyOptions | CallHierarchyRegistrationOptions?

    # The server provides code actions. CodeActionOptions may only be
    # specified if the client states that it supports
    # `codeActionLiteralSupport` in its initial `initialize` request.
    @[JSON::Field(key: "codeActionProvider")]
    getter code_action_provider : Bool | CodeActionOptions?

    # The server provides code lens.
    @[JSON::Field(key: "codeLensProvider")]
    getter code_lens_provider : CodeLensOptions?

    # The server provides color provider support.
    @[JSON::Field(key: "colorProvider")]
    getter color_provider : Bool | DocumentColorOptions | DocumentColorRegistrationOptions?

    # The server provides completion support.
    @[JSON::Field(key: "completionProvider")]
    getter completion_provider : CompletionOptions?

    # The server provides Goto Declaration support.
    @[JSON::Field(key: "declarationProvider")]
    getter declaration_provider : Bool | DeclarationOptions | DeclarationRegistrationOptions?

    # The server provides goto definition support.
    @[JSON::Field(key: "definitionProvider")]
    getter definition_provider : Bool | DefinitionOptions?

    # The server has support for pull model diagnostics.
    #
    # @since 3.17.0
    @[JSON::Field(key: "diagnosticProvider")]
    getter diagnostic_provider : DiagnosticOptions | DiagnosticRegistrationOptions?

    # The server provides document formatting.
    @[JSON::Field(key: "documentFormattingProvider")]
    getter document_formatting_provider : Bool | DocumentFormattingOptions?

    # The server provides document highlight support.
    @[JSON::Field(key: "documentHighlightProvider")]
    getter document_highlight_provider : Bool | DocumentHighlightOptions?

    # The server provides document link support.
    @[JSON::Field(key: "documentLinkProvider")]
    getter document_link_provider : DocumentLinkOptions?

    # The server provides document formatting on typing.
    @[JSON::Field(key: "documentOnTypeFormattingProvider")]
    getter document_on_type_formatting_provider : DocumentOnTypeFormattingOptions?

    # The server provides document range formatting.
    @[JSON::Field(key: "documentRangeFormattingProvider")]
    getter document_range_formatting_provider : Bool | DocumentRangeFormattingOptions?

    # The server provides document symbol support.
    @[JSON::Field(key: "documentSymbolProvider")]
    getter document_symbol_provider : Bool | DocumentSymbolOptions?

    # The server provides execute command support.
    @[JSON::Field(key: "executeCommandProvider")]
    getter execute_command_provider : ExecuteCommandOptions?

    # Experimental server capabilities.
    getter experimental : LSPAny?

    # The server provides folding provider support.
    @[JSON::Field(key: "foldingRangeProvider")]
    getter folding_range_provider : Bool | FoldingRangeOptions | FoldingRangeRegistrationOptions?

    # The server provides hover support.
    @[JSON::Field(key: "hoverProvider")]
    getter hover_provider : Bool | HoverOptions?

    # The server provides Goto Implementation support.
    @[JSON::Field(key: "implementationProvider")]
    getter implementation_provider : Bool | ImplementationOptions | ImplementationRegistrationOptions?

    # The server provides inlay hints.
    #
    # @since 3.17.0
    @[JSON::Field(key: "inlayHintProvider")]
    getter inlay_hint_provider : Bool | InlayHintOptions | InlayHintRegistrationOptions?

    # Inline completion options used during static registration.
    #
    # @since 3.18.0
    # @proposed
    @[JSON::Field(key: "inlineCompletionProvider")]
    getter inline_completion_provider : Bool | InlineCompletionOptions?

    # The server provides inline values.
    #
    # @since 3.17.0
    @[JSON::Field(key: "inlineValueProvider")]
    getter inline_value_provider : Bool | InlineValueOptions | InlineValueRegistrationOptions?

    # The server provides linked editing range support.
    #
    # @since 3.16.0
    @[JSON::Field(key: "linkedEditingRangeProvider")]
    getter linked_editing_range_provider : Bool | LinkedEditingRangeOptions | LinkedEditingRangeRegistrationOptions?

    # The server provides moniker support.
    #
    # @since 3.16.0
    @[JSON::Field(key: "monikerProvider")]
    getter moniker_provider : Bool | MonikerOptions | MonikerRegistrationOptions?

    # Defines how notebook documents are synced.
    #
    # @since 3.17.0
    @[JSON::Field(key: "notebookDocumentSync")]
    getter notebook_document_sync : NotebookDocumentSyncOptions | NotebookDocumentSyncRegistrationOptions?

    # The position encoding the server picked from the encodings offered
    # by the client via the client capability `general.positionEncodings`.
    #
    # If the client didn't provide any position encodings the only valid
    # value that a server can return is 'utf-16'.
    #
    # If omitted it defaults to 'utf-16'.
    #
    # @since 3.17.0
    @[JSON::Field(key: "positionEncoding")]
    getter position_encoding : PositionEncodingKind | String?

    # The server provides find references support.
    @[JSON::Field(key: "referencesProvider")]
    getter references_provider : Bool | ReferenceOptions?

    # The server provides rename support. RenameOptions may only be
    # specified if the client states that it supports
    # `prepareSupport` in its initial `initialize` request.
    @[JSON::Field(key: "renameProvider")]
    getter rename_provider : Bool | RenameOptions?

    # The server provides selection range support.
    @[JSON::Field(key: "selectionRangeProvider")]
    getter selection_range_provider : Bool | SelectionRangeOptions | SelectionRangeRegistrationOptions?

    # The server provides semantic tokens support.
    #
    # @since 3.16.0
    @[JSON::Field(key: "semanticTokensProvider")]
    getter semantic_tokens_provider : SemanticTokensOptions | SemanticTokensRegistrationOptions?

    # The server provides signature help support.
    @[JSON::Field(key: "signatureHelpProvider")]
    getter signature_help_provider : SignatureHelpOptions?

    # Defines how text documents are synced. Is either a detailed structure
    # defining each notification or for backwards compatibility the
    # TextDocumentSyncKind number.
    @[JSON::Field(key: "textDocumentSync")]
    getter text_document_sync : TextDocumentSyncKind | TextDocumentSyncOptions?

    # The server provides Goto Type Definition support.
    @[JSON::Field(key: "typeDefinitionProvider")]
    getter type_definition_provider : Bool | TypeDefinitionOptions | TypeDefinitionRegistrationOptions?

    # The server provides type hierarchy support.
    #
    # @since 3.17.0
    @[JSON::Field(key: "typeHierarchyProvider")]
    getter type_hierarchy_provider : Bool | TypeHierarchyOptions | TypeHierarchyRegistrationOptions?

    # Workspace specific server capabilities.
    getter workspace : WorkspaceOptions?

    # The server provides workspace symbol support.
    @[JSON::Field(key: "workspaceSymbolProvider")]
    getter workspace_symbol_provider : Bool | WorkspaceSymbolOptions?

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
      @text_document_sync : TextDocumentSyncKind | TextDocumentSyncOptions? = nil,
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
  class ServerInfo
    include JSON::Serializable

    # The name of the server as defined by the server.
    getter name : String

    # The server's version as defined by the server.
    getter version : String?

    def initialize(
      @name : String?,
      @version : String? = nil,
    )
    end
  end

  # A text document identifier to denote a specific version of a text document.
  class VersionedTextDocumentIdentifier
    include JSON::Serializable

    # The text document's uri.
    getter uri : URI

    # The version number of this document.
    getter version : Int32

    def initialize(
      @uri : URI?,
      @version : Int32?,
    )
    end
  end

  # An event describing a file change.
  class FileEvent
    include JSON::Serializable

    # The change type.
    getter type : FileChangeType

    # The file's uri.
    getter uri : URI

    def initialize(
      @type : FileChangeType?,
      @uri : URI?,
    )
    end
  end

  class FileSystemWatcher
    include JSON::Serializable

    # The glob pattern to watch. See `GlobPattern` for more detail.
    #
    # @since 3.17.0 support for relative patterns.
    @[JSON::Field(key: "globPattern")]
    getter glob_pattern : GlobPattern

    # The kind of events of interest. If omitted it defaults
    # to WatchKind.Create | WatchKind.Change | WatchKind.Delete
    # which is 7.
    getter kind : WatchKind | UInt32?

    def initialize(
      @glob_pattern : GlobPattern?,
      @kind : WatchKind | UInt32? = nil,
    )
    end
  end

  # Represents a diagnostic, such as a compiler error or warning. Diagnostic objects
  # are only valid in the scope of a resource.
  class Diagnostic
    include JSON::Serializable

    # The diagnostic's code, which usually appear in the user interface.
    getter code : Int32 | String?

    # An optional property to describe the error code.
    # Requires the code field (above) to be present/not null.
    #
    # @since 3.16.0
    @[JSON::Field(key: "codeDescription")]
    getter code_description : CodeDescription?

    # A data entry field that is preserved between a `textDocument/publishDiagnostics`
    # notification and `textDocument/codeAction` request.
    #
    # @since 3.16.0
    getter data : LSPAny?

    # The diagnostic's message. It usually appears in the user interface
    getter message : String

    # The range at which the message applies
    getter range : Range

    # An array of related diagnostic information, e.g. when symbol-names within
    # a scope collide all definitions can be marked via this property.
    @[JSON::Field(key: "relatedInformation")]
    getter related_information : Array(DiagnosticRelatedInformation)?

    # The diagnostic's severity. Can be omitted. If omitted it is up to the
    # client to interpret diagnostics as error, warning, info or hint.
    getter severity : DiagnosticSeverity?

    # A human-readable string describing the source of this
    # diagnostic, e.g. 'typescript' or 'super lint'. It usually
    # appears in the user interface.
    getter source : String?

    # Additional metadata about the diagnostic.
    #
    # @since 3.15.0
    getter tags : Array(DiagnosticTag)?

    def initialize(
      @message : String?,
      @range : Range?,
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

    # The trigger character (a single character) that has trigger code complete.
    # Is undefined if `triggerKind !== CompletionTriggerKind.TriggerCharacter`
    @[JSON::Field(key: "triggerCharacter")]
    getter trigger_character : String?

    # How the completion was triggered.
    @[JSON::Field(key: "triggerKind")]
    getter trigger_kind : CompletionTriggerKind

    def initialize(
      @trigger_kind : CompletionTriggerKind?,
      @trigger_character : String? = nil,
    )
    end
  end

  # Additional details for a completion item label.
  #
  # @since 3.17.0
  class CompletionItemLabelDetails
    include JSON::Serializable

    # An optional string which is rendered less prominently after `CompletionItem#detail`. Should be used
    # for fully qualified names and file paths.
    getter description : String?

    # An optional string which is rendered less prominently directly after `CompletionItem#label`,
    # without any spacing. Should be used for function signatures and type annotations.
    getter detail : String?

    def initialize(
      @description : String? = nil,
      @detail : String? = nil,
    )
    end
  end

  # A special text edit to provide an insert and a replace operation.
  #
  # @since 3.16.0
  class InsertReplaceEdit
    include JSON::Serializable

    # The range if the insert is requested
    getter insert : Range

    # The string to be inserted.
    @[JSON::Field(key: "newText")]
    getter new_text : String

    # The range if the replace is requested.
    getter replace : Range

    def initialize(
      @insert : Range?,
      @new_text : String?,
      @replace : Range?,
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
  class CompletionItemDefaults
    include JSON::Serializable

    # A default commit character set.
    #
    # @since 3.17.0
    @[JSON::Field(key: "commitCharacters")]
    getter commit_characters : Array(String)?

    # A default data value.
    #
    # @since 3.17.0
    getter data : LSPAny?

    # A default edit range.
    #
    # @since 3.17.0
    @[JSON::Field(key: "editRange")]
    getter edit_range : EditRangeWithInsertReplace | Range?

    # A default insert text format.
    #
    # @since 3.17.0
    @[JSON::Field(key: "insertTextFormat")]
    getter insert_text_format : InsertTextFormat?

    # A default insert text mode.
    #
    # @since 3.17.0
    @[JSON::Field(key: "insertTextMode")]
    getter insert_text_mode : InsertTextMode?

    def initialize(
      @commit_characters : Array(String)? = nil,
      @data : LSPAny? = nil,
      @edit_range : EditRangeWithInsertReplace | Range? = nil,
      @insert_text_format : InsertTextFormat? = nil,
      @insert_text_mode : InsertTextMode? = nil,
    )
    end
  end

  # Additional information about the context in which a signature help request was triggered.
  #
  # @since 3.15.0
  class SignatureHelpContext
    include JSON::Serializable

    # The currently active `SignatureHelp`.
    #
    # The `activeSignatureHelp` has its `SignatureHelp.activeSignature` field updated based on
    # the user navigating through available signatures.
    @[JSON::Field(key: "activeSignatureHelp")]
    getter active_signature_help : SignatureHelp?

    # `true` if signature help was already showing when it was triggered.
    #
    # Retriggers occurs when the signature help is already active and can be caused by actions such as
    # typing a trigger character, a cursor move, or document content changes.
    @[JSON::Field(key: "isRetrigger")]
    getter is_retrigger : Bool

    # Character that caused signature help to be triggered.
    #
    # This is undefined when `triggerKind !== SignatureHelpTriggerKind.TriggerCharacter`
    @[JSON::Field(key: "triggerCharacter")]
    getter trigger_character : String?

    # Action that caused signature help to be triggered.
    @[JSON::Field(key: "triggerKind")]
    getter trigger_kind : SignatureHelpTriggerKind

    def initialize(
      @is_retrigger : Bool?,
      @trigger_kind : SignatureHelpTriggerKind?,
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

    # The index of the active parameter.
    #
    # If `null`, no parameter of the signature is active (for example a named
    # argument that does not match any declared parameters). This is only valid
    # if the client specifies the client capability
    # `textDocument.signatureHelp.noActiveParameterSupport === true`
    #
    # If provided (or `null`), this is used in place of
    # `SignatureHelp.activeParameter`.
    #
    # @since 3.16.0
    @[JSON::Field(key: "activeParameter")]
    getter active_parameter : UInt32?

    # The human-readable doc-comment of this signature. Will be shown
    # in the UI but can be omitted.
    getter documentation : MarkupContent | String?

    # The label of this signature. Will be shown in
    # the UI.
    getter label : String

    # The parameters of this signature.
    getter parameters : Array(ParameterInformation)?

    def initialize(
      @label : String?,
      @active_parameter : UInt32? = nil,
      @documentation : MarkupContent | String? = nil,
      @parameters : Array(ParameterInformation)? = nil,
    )
    end
  end

  # Value-object that contains additional information when
  # requesting references.
  class ReferenceContext
    include JSON::Serializable

    # Include the declaration of the current symbol.
    @[JSON::Field(key: "includeDeclaration")]
    getter include_declaration : Bool

    def initialize(
      @include_declaration : Bool?,
    )
    end
  end

  # Contains additional diagnostic information about the context in which
  # a `CodeActionProvider#provideCodeActions` is run.
  class CodeActionContext
    include JSON::Serializable

    # An array of diagnostics known on the client side overlapping the range provided to the
    # `textDocument/codeAction` request. They are provided so that the server knows which
    # errors are currently presented to the user for the given range. There is no guarantee
    # that these accurately reflect the error state of the resource. The primary parameter
    # to compute code actions is the provided range.
    getter diagnostics : Array(Diagnostic)

    # Requested kind of actions to return.
    #
    # Actions not of this kind are filtered out by the client before being shown. So servers
    # can omit computing them.
    getter only : Array(CodeActionKind | String)?

    # The reason why code actions were requested.
    #
    # @since 3.17.0
    @[JSON::Field(key: "triggerKind")]
    getter trigger_kind : CodeActionTriggerKind?

    def initialize(
      @diagnostics : Array(Diagnostic)?,
      @only : Array(CodeActionKind | String)? = nil,
      @trigger_kind : CodeActionTriggerKind? = nil,
    )
    end
  end

  # Captures why the code action is currently disabled.
  #
  # @since 3.18.0
  class CodeActionDisabled
    include JSON::Serializable

    # Human readable description of why the code action is currently disabled.
    #
    # This is displayed in the code actions UI.
    getter reason : String

    def initialize(
      @reason : String?,
    )
    end
  end

  # Location with only uri and does not include range.
  #
  # @since 3.18.0
  class LocationUriOnly
    include JSON::Serializable

    getter uri : URI

    def initialize(
      @uri : URI?,
    )
    end
  end

  # Value-object describing what options formatting should use.
  class FormattingOptions
    include JSON::Serializable

    # Insert a newline character at the end of the file if one does not exist.
    #
    # @since 3.15.0
    @[JSON::Field(key: "insertFinalNewline")]
    getter insert_final_newline : Bool?

    # Prefer spaces over tabs.
    @[JSON::Field(key: "insertSpaces")]
    getter insert_spaces : Bool

    # Size of a tab in spaces.
    @[JSON::Field(key: "tabSize")]
    getter tab_size : UInt32

    # Trim all newlines after the final newline at the end of the file.
    #
    # @since 3.15.0
    @[JSON::Field(key: "trimFinalNewlines")]
    getter trim_final_newlines : Bool?

    # Trim trailing whitespace on a line.
    #
    # @since 3.15.0
    @[JSON::Field(key: "trimTrailingWhitespace")]
    getter trim_trailing_whitespace : Bool?

    def initialize(
      @insert_spaces : Bool?,
      @tab_size : UInt32?,
      @insert_final_newline : Bool? = nil,
      @trim_final_newlines : Bool? = nil,
      @trim_trailing_whitespace : Bool? = nil,
    )
    end
  end

  # @since 3.18.0
  class PrepareRenamePlaceholder
    include JSON::Serializable

    getter placeholder : String

    getter range : Range

    def initialize(
      @placeholder : String?,
      @range : Range?,
    )
    end
  end

  # @since 3.18.0
  class PrepareRenameDefaultBehavior
    include JSON::Serializable

    @[JSON::Field(key: "defaultBehavior")]
    getter default_behavior : Bool

    def initialize(
      @default_behavior : Bool?,
    )
    end
  end

  # Additional data about a workspace edit.
  #
  # @since 3.18.0
  # @proposed
  class WorkspaceEditMetadata
    include JSON::Serializable

    # Signal to the editor that this edit is a refactoring.
    @[JSON::Field(key: "isRefactoring")]
    getter is_refactoring : Bool?

    def initialize(
      @is_refactoring : Bool? = nil,
    )
    end
  end

  # @since 3.16.0
  class SemanticTokensLegend
    include JSON::Serializable

    # The token modifiers a server uses.
    @[JSON::Field(key: "tokenModifiers")]
    getter token_modifiers : Array(String)

    # The token types a server uses.
    @[JSON::Field(key: "tokenTypes")]
    getter token_types : Array(String)

    def initialize(
      @token_modifiers : Array(String)?,
      @token_types : Array(String)?,
    )
    end
  end

  # Semantic tokens options to support deltas for full documents
  #
  # @since 3.18.0
  class SemanticTokensFullDelta
    include JSON::Serializable

    # The server supports deltas for full documents.
    getter delta : Bool?

    def initialize(
      @delta : Bool? = nil,
    )
    end
  end

  # A text document identifier to optionally denote a specific version of a text document.
  class OptionalVersionedTextDocumentIdentifier
    include JSON::Serializable

    # The text document's uri.
    getter uri : URI

    # The version number of this document. If a versioned text document identifier
    # is sent from the server to the client and the file is not open in the editor
    # (the server has not received an open notification before) the server can send
    # `null` to indicate that the version is unknown and the content on disk is the
    # truth (as specified with document content ownership).
    getter version : Int32?

    def initialize(
      @uri : URI?,
      @version : Int32?,
    )
    end
  end

  # A special text edit with an additional change annotation.
  #
  # @since 3.16.0.
  class AnnotatedTextEdit
    include JSON::Serializable

    # The actual identifier of the change annotation
    @[JSON::Field(key: "annotationId")]
    getter annotation_id : ChangeAnnotationIdentifier

    # The string to be inserted. For delete operations use an
    # empty string.
    @[JSON::Field(key: "newText")]
    getter new_text : String

    # The range of the text document to be manipulated. To insert
    # text into a document create a range where start === end.
    getter range : Range

    def initialize(
      @annotation_id : ChangeAnnotationIdentifier?,
      @new_text : String?,
      @range : Range?,
    )
    end
  end

  # An interactive text edit.
  #
  # @since 3.18.0
  # @proposed
  class SnippetTextEdit
    include JSON::Serializable

    # The actual identifier of the snippet edit.
    @[JSON::Field(key: "annotationId")]
    getter annotation_id : ChangeAnnotationIdentifier?

    # The range of the text document to be manipulated.
    getter range : Range

    # The snippet to be inserted.
    getter snippet : StringValue

    def initialize(
      @range : Range?,
      @snippet : StringValue?,
      @annotation_id : ChangeAnnotationIdentifier? = nil,
    )
    end
  end

  # Options to create a file.
  class CreateFileOptions
    include JSON::Serializable

    # Ignore if exists.
    @[JSON::Field(key: "ignoreIfExists")]
    getter ignore_if_exists : Bool?

    # Overwrite existing file. Overwrite wins over `ignoreIfExists`
    getter overwrite : Bool?

    def initialize(
      @ignore_if_exists : Bool? = nil,
      @overwrite : Bool? = nil,
    )
    end
  end

  # Rename file options
  class RenameFileOptions
    include JSON::Serializable

    # Ignores if target exists.
    @[JSON::Field(key: "ignoreIfExists")]
    getter ignore_if_exists : Bool?

    # Overwrite target if existing. Overwrite wins over `ignoreIfExists`
    getter overwrite : Bool?

    def initialize(
      @ignore_if_exists : Bool? = nil,
      @overwrite : Bool? = nil,
    )
    end
  end

  # Delete file options
  class DeleteFileOptions
    include JSON::Serializable

    # Ignore the operation if the file doesn't exist.
    @[JSON::Field(key: "ignoreIfNotExists")]
    getter ignore_if_not_exists : Bool?

    # Delete the content recursively if a folder is denoted.
    getter recursive : Bool?

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
  class FileOperationPattern
    include JSON::Serializable

    # The glob pattern to match. Glob patterns can have the following syntax:
    # - `*` to match one or more characters in a path segment
    # - `?` to match on one character in a path segment
    # - `**` to match any number of path segments, including none
    # - `{}` to group sub patterns into an OR expression. (e.g. `**​/*.{ts,js}` matches all TypeScript and JavaScript files)
    # - `[]` to declare a range of characters to match in a path segment (e.g., `example.[0-9]` to match on `example.0`, `example.1`, …)
    # - `[!...]` to negate a range of characters to match in a path segment (e.g., `example.[!0-9]` to match on `example.a`, `example.b`, but not `example.0`)
    getter glob : String

    # Whether to match files or folders with this pattern.
    #
    # Matches both if undefined.
    getter matches : FileOperationPatternKind?

    # Additional options used during matching.
    getter options : FileOperationPatternOptions?

    def initialize(
      @glob : String?,
      @matches : FileOperationPatternKind? = nil,
      @options : FileOperationPatternOptions? = nil,
    )
    end
  end

  # A full document diagnostic report for a workspace diagnostic result.
  #
  # @since 3.17.0
  class WorkspaceFullDocumentDiagnosticReport
    include JSON::Serializable

    # The actual items.
    getter items : Array(Diagnostic)

    # A full document diagnostic report.
    getter kind : String

    # An optional result id. If provided it will
    # be sent on the next diagnostic request for the
    # same document.
    @[JSON::Field(key: "resultId")]
    getter result_id : String?

    # The URI for which diagnostic information is reported.
    getter uri : URI

    # The version number for which the diagnostics are reported.
    # If the document is not marked as open `null` can be provided.
    getter version : Int32?

    def initialize(
      @items : Array(Diagnostic)?,
      @kind : String?,
      @uri : URI?,
      @version : Int32?,
      @result_id : String? = nil,
    )
    end
  end

  # An unchanged document diagnostic report for a workspace diagnostic result.
  #
  # @since 3.17.0
  class WorkspaceUnchangedDocumentDiagnosticReport
    include JSON::Serializable

    # A document diagnostic report indicating
    # no changes to the last result. A server can
    # only return `unchanged` if result ids are
    # provided.
    getter kind : String

    # A result id which will be sent on the next
    # diagnostic request for the same document.
    @[JSON::Field(key: "resultId")]
    getter result_id : String

    # The URI for which diagnostic information is reported.
    getter uri : URI

    # The version number for which the diagnostics are reported.
    # If the document is not marked as open `null` can be provided.
    getter version : Int32?

    def initialize(
      @kind : String?,
      @result_id : String?,
      @uri : URI?,
      @version : Int32?,
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
  class NotebookCell
    include JSON::Serializable

    # The URI of the cell's text document
    # content.
    getter document : URI

    # Additional execution summary information
    # if supported by the client.
    @[JSON::Field(key: "executionSummary")]
    getter execution_summary : ExecutionSummary?

    # The cell's kind
    getter kind : NotebookCellKind

    # Additional metadata stored with the cell.
    #
    # Note: should always be an object literal (e.g. LSPObject)
    getter metadata : LSPObject?

    def initialize(
      @document : URI?,
      @kind : NotebookCellKind?,
      @execution_summary : ExecutionSummary? = nil,
      @metadata : LSPObject? = nil,
    )
    end
  end

  # @since 3.18.0
  class NotebookDocumentFilterWithNotebook
    include JSON::Serializable

    # The cells of the matching notebook to be synced.
    getter cells : Array(NotebookCellLanguage)?

    # The notebook to be synced If a string
    # value is provided it matches against the
    # notebook type. '*' matches every notebook.
    getter notebook : NotebookDocumentFilter | String

    def initialize(
      @notebook : NotebookDocumentFilter | String?,
      @cells : Array(NotebookCellLanguage)? = nil,
    )
    end
  end

  # @since 3.18.0
  class NotebookDocumentFilterWithCells
    include JSON::Serializable

    # The cells of the matching notebook to be synced.
    getter cells : Array(NotebookCellLanguage)

    # The notebook to be synced If a string
    # value is provided it matches against the
    # notebook type. '*' matches every notebook.
    getter notebook : NotebookDocumentFilter | String?

    def initialize(
      @cells : Array(NotebookCellLanguage)?,
      @notebook : NotebookDocumentFilter | String? = nil,
    )
    end
  end

  # Cell changes to a notebook document.
  #
  # @since 3.18.0
  class NotebookDocumentCellChanges
    include JSON::Serializable

    # Changes to notebook cells properties like its
    # kind, execution summary or metadata.
    getter data : Array(NotebookCell)?

    # Changes to the cell structure to add or
    # remove cells.
    getter structure : NotebookDocumentCellChangeStructure?

    # Changes to the text content of notebook cells.
    @[JSON::Field(key: "textContent")]
    getter text_content : Array(NotebookDocumentCellContentChanges)?

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
  class SelectedCompletionInfo
    include JSON::Serializable

    # The range that will be replaced if this completion item is accepted.
    getter range : Range

    # The text the range will be replaced with if this completion is accepted.
    getter text : String

    def initialize(
      @range : Range?,
      @text : String?,
    )
    end
  end

  # Information about the client
  #
  # @since 3.15.0
  # @since 3.18.0 ClientInfo type name added.
  class ClientInfo
    include JSON::Serializable

    # The name of the client as defined by the client.
    getter name : String

    # The client's version as defined by the client.
    getter version : String?

    def initialize(
      @name : String?,
      @version : String? = nil,
    )
    end
  end

  # Defines the capabilities provided by the client.
  class ClientCapabilities
    include JSON::Serializable

    # Experimental client capabilities.
    getter experimental : LSPAny?

    # General client capabilities.
    #
    # @since 3.16.0
    getter general : GeneralClientCapabilities?

    # Capabilities specific to the notebook document support.
    #
    # @since 3.17.0
    @[JSON::Field(key: "notebookDocument")]
    getter notebook_document : NotebookDocumentClientCapabilities?

    # Text document specific client capabilities.
    @[JSON::Field(key: "textDocument")]
    getter text_document : TextDocumentClientCapabilities?

    # Window specific client capabilities.
    getter window : WindowClientCapabilities?

    # Workspace specific client capabilities.
    getter workspace : WorkspaceClientCapabilities?

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

    # Change notifications are sent to the server. See TextDocumentSyncKind.None, TextDocumentSyncKind.Full
    # and TextDocumentSyncKind.Incremental. If omitted it defaults to TextDocumentSyncKind.None.
    getter change : TextDocumentSyncKind?

    # Open and close notifications are sent to the server. If omitted open close notification should not
    # be sent.
    @[JSON::Field(key: "openClose")]
    getter open_close : Bool?

    # If present save notifications are sent to the server. If omitted the notification should not be
    # sent.
    getter save : Bool | SaveOptions?

    # If present will save notifications are sent to the server. If omitted the notification should not be
    # sent.
    @[JSON::Field(key: "willSave")]
    getter will_save : Bool?

    # If present will save wait until requests are sent to the server. If omitted the request should not be
    # sent.
    @[JSON::Field(key: "willSaveWaitUntil")]
    getter will_save_wait_until : Bool?

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
  class WorkspaceOptions
    include JSON::Serializable

    # The server is interested in notifications/requests for operations on files.
    #
    # @since 3.16.0
    @[JSON::Field(key: "fileOperations")]
    getter file_operations : FileOperationOptions?

    # The server supports workspace folder.
    #
    # @since 3.6.0
    @[JSON::Field(key: "workspaceFolders")]
    getter workspace_folders : WorkspaceFoldersServerCapabilities?

    def initialize(
      @file_operations : FileOperationOptions? = nil,
      @workspace_folders : WorkspaceFoldersServerCapabilities? = nil,
    )
    end
  end

  # @since 3.18.0
  class TextDocumentContentChangePartial
    include JSON::Serializable

    # The range of the document that changed.
    getter range : Range

    # The optional length of the range that got replaced.
    #
    # @deprecated use range instead.
    @[JSON::Field(key: "rangeLength")]
    getter range_length : UInt32?

    # The new text for the provided range.
    getter text : String

    def initialize(
      @range : Range?,
      @text : String?,
      @range_length : UInt32? = nil,
    )
    end
  end

  # @since 3.18.0
  class TextDocumentContentChangeWholeDocument
    include JSON::Serializable

    # The new text of the whole document.
    getter text : String

    def initialize(
      @text : String?,
    )
    end
  end

  # Structure to capture a description for an error code.
  #
  # @since 3.16.0
  class CodeDescription
    include JSON::Serializable

    # An URI to open with more information about the diagnostic error.
    getter href : URI

    def initialize(
      @href : URI?,
    )
    end
  end

  # Represents a related message and source code location for a diagnostic. This should be
  # used to point to code locations that cause or related to a diagnostics, e.g when duplicating
  # a symbol in a scope.
  class DiagnosticRelatedInformation
    include JSON::Serializable

    # The location of this related diagnostic information.
    getter location : Location

    # The message of this related diagnostic information.
    getter message : String

    def initialize(
      @location : Location?,
      @message : String?,
    )
    end
  end

  # Edit range variant that includes ranges for insert and replace operations.
  #
  # @since 3.18.0
  class EditRangeWithInsertReplace
    include JSON::Serializable

    getter insert : Range

    getter replace : Range

    def initialize(
      @insert : Range?,
      @replace : Range?,
    )
    end
  end

  # @since 3.18.0
  class ServerCompletionItemOptions
    include JSON::Serializable

    # The server has support for completion item label
    # details (see also `CompletionItemLabelDetails`) when
    # receiving a completion item in a resolve call.
    #
    # @since 3.17.0
    @[JSON::Field(key: "labelDetailsSupport")]
    getter label_details_support : Bool?

    def initialize(
      @label_details_support : Bool? = nil,
    )
    end
  end

  # @since 3.18.0
  # @deprecated use MarkupContent instead.
  class MarkedStringWithLanguage
    include JSON::Serializable

    getter language : String

    getter value : String

    def initialize(
      @language : String?,
      @value : String?,
    )
    end
  end

  # Represents a parameter of a callable-signature. A parameter can
  # have a label and a doc-comment.
  class ParameterInformation
    include JSON::Serializable

    # The human-readable doc-comment of this parameter. Will be shown
    # in the UI but can be omitted.
    getter documentation : MarkupContent | String?

    # The label of this parameter information.
    #
    # Either a string or an inclusive start and exclusive end offsets within its containing
    # signature label. (see SignatureInformation.label). The offsets are based on a UTF-16
    # string representation as `Position` and `Range` does.
    #
    # To avoid ambiguities a server should use the [start, end] offset value instead of using
    # a substring. Whether a client support this is controlled via `labelOffsetSupport` client
    # capability.
    #
    # *Note*: a label of type string should be a substring of its containing signature label.
    # Its intended use case is to highlight the parameter label part in the `SignatureInformation.label`.
    getter label : Array(UInt32) | String

    def initialize(
      @label : Array(UInt32) | String?,
      @documentation : MarkupContent | String? = nil,
    )
    end
  end

  # Documentation for a class of code actions.
  #
  # @since 3.18.0
  # @proposed
  class CodeActionKindDocumentation
    include JSON::Serializable

    # Command that is ued to display the documentation to the user.
    #
    # The title of this documentation code action is taken from {@linkcode Command.title}
    getter command : Command

    # The kind of the code action being documented.
    #
    # If the kind is generic, such as `CodeActionKind.Refactor`, the documentation will be shown whenever any
    # refactorings are returned. If the kind if more specific, such as `CodeActionKind.RefactorExtract`, the
    # documentation will only be shown when extract refactoring code actions are returned.
    getter kind : CodeActionKind | String

    def initialize(
      @command : Command?,
      @kind : CodeActionKind | String?,
    )
    end
  end

  # A notebook cell text document filter denotes a cell text
  # document by different properties.
  #
  # @since 3.17.0
  class NotebookCellTextDocumentFilter
    include JSON::Serializable

    # A language id like `python`.
    #
    # Will be matched against the language id of the
    # notebook cell document. '*' matches every language.
    getter language : String?

    # A filter that matches against the notebook
    # containing the notebook cell. If a string
    # value is provided it matches against the
    # notebook type. '*' matches every notebook.
    getter notebook : NotebookDocumentFilter | String

    def initialize(
      @notebook : NotebookDocumentFilter | String?,
      @language : String? = nil,
    )
    end
  end

  # Matching options for the file operation pattern.
  #
  # @since 3.16.0
  class FileOperationPatternOptions
    include JSON::Serializable

    # The pattern should be matched ignoring casing.
    @[JSON::Field(key: "ignoreCase")]
    getter ignore_case : Bool?

    def initialize(
      @ignore_case : Bool? = nil,
    )
    end
  end

  class ExecutionSummary
    include JSON::Serializable

    # A strict monotonically increasing value
    # indicating the execution order of a cell
    # inside a notebook.
    @[JSON::Field(key: "executionOrder")]
    getter execution_order : UInt32

    # Whether the execution was successful or
    # not if known by the client.
    getter success : Bool?

    def initialize(
      @execution_order : UInt32?,
      @success : Bool? = nil,
    )
    end
  end

  # @since 3.18.0
  class NotebookCellLanguage
    include JSON::Serializable

    getter language : String

    def initialize(
      @language : String?,
    )
    end
  end

  # Structural changes to cells in a notebook document.
  #
  # @since 3.18.0
  class NotebookDocumentCellChangeStructure
    include JSON::Serializable

    # The change to the cell array.
    getter array : NotebookCellArrayChange

    # Additional closed cell text documents.
    @[JSON::Field(key: "didClose")]
    getter did_close : Array(TextDocumentIdentifier)?

    # Additional opened cell text documents.
    @[JSON::Field(key: "didOpen")]
    getter did_open : Array(TextDocumentItem)?

    def initialize(
      @array : NotebookCellArrayChange?,
      @did_close : Array(TextDocumentIdentifier)? = nil,
      @did_open : Array(TextDocumentItem)? = nil,
    )
    end
  end

  # Content changes to a cell in a notebook document.
  #
  # @since 3.18.0
  class NotebookDocumentCellContentChanges
    include JSON::Serializable

    getter changes : Array(TextDocumentContentChangeEvent)

    getter document : VersionedTextDocumentIdentifier

    def initialize(
      @changes : Array(TextDocumentContentChangeEvent)?,
      @document : VersionedTextDocumentIdentifier?,
    )
    end
  end

  # Workspace specific client capabilities.
  class WorkspaceClientCapabilities
    include JSON::Serializable

    # The client supports applying batch edits
    # to the workspace by supporting the request
    # 'workspace/applyEdit'
    @[JSON::Field(key: "applyEdit")]
    getter apply_edit : Bool?

    # Capabilities specific to the code lens requests scoped to the
    # workspace.
    #
    # @since 3.16.0.
    @[JSON::Field(key: "codeLens")]
    getter code_lens : CodeLensWorkspaceClientCapabilities?

    # The client supports `workspace/configuration` requests.
    #
    # @since 3.6.0
    getter configuration : Bool?

    # Capabilities specific to the diagnostic requests scoped to the
    # workspace.
    #
    # @since 3.17.0.
    getter diagnostics : DiagnosticWorkspaceClientCapabilities?

    # Capabilities specific to the `workspace/didChangeConfiguration` notification.
    @[JSON::Field(key: "didChangeConfiguration")]
    getter did_change_configuration : DidChangeConfigurationClientCapabilities?

    # Capabilities specific to the `workspace/didChangeWatchedFiles` notification.
    @[JSON::Field(key: "didChangeWatchedFiles")]
    getter did_change_watched_files : DidChangeWatchedFilesClientCapabilities?

    # Capabilities specific to the `workspace/executeCommand` request.
    @[JSON::Field(key: "executeCommand")]
    getter execute_command : ExecuteCommandClientCapabilities?

    # The client has support for file notifications/requests for user operations on files.
    #
    # Since 3.16.0
    @[JSON::Field(key: "fileOperations")]
    getter file_operations : FileOperationClientCapabilities?

    # Capabilities specific to the folding range requests scoped to the workspace.
    #
    # @since 3.18.0
    # @proposed
    @[JSON::Field(key: "foldingRange")]
    getter folding_range : FoldingRangeWorkspaceClientCapabilities?

    # Capabilities specific to the inlay hint requests scoped to the
    # workspace.
    #
    # @since 3.17.0.
    @[JSON::Field(key: "inlayHint")]
    getter inlay_hint : InlayHintWorkspaceClientCapabilities?

    # Capabilities specific to the inline values requests scoped to the
    # workspace.
    #
    # @since 3.17.0.
    @[JSON::Field(key: "inlineValue")]
    getter inline_value : InlineValueWorkspaceClientCapabilities?

    # Capabilities specific to the semantic token requests scoped to the
    # workspace.
    #
    # @since 3.16.0.
    @[JSON::Field(key: "semanticTokens")]
    getter semantic_tokens : SemanticTokensWorkspaceClientCapabilities?

    # Capabilities specific to the `workspace/symbol` request.
    getter symbol : WorkspaceSymbolClientCapabilities?

    # Capabilities specific to `WorkspaceEdit`s.
    @[JSON::Field(key: "workspaceEdit")]
    getter workspace_edit : WorkspaceEditClientCapabilities?

    # The client has support for workspace folders.
    #
    # @since 3.6.0
    @[JSON::Field(key: "workspaceFolders")]
    getter workspace_folders : Bool?

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

    # Capabilities specific to the various call hierarchy requests.
    #
    # @since 3.16.0
    @[JSON::Field(key: "callHierarchy")]
    getter call_hierarchy : CallHierarchyClientCapabilities?

    # Capabilities specific to the `textDocument/codeAction` request.
    @[JSON::Field(key: "codeAction")]
    getter code_action : CodeActionClientCapabilities?

    # Capabilities specific to the `textDocument/codeLens` request.
    @[JSON::Field(key: "codeLens")]
    getter code_lens : CodeLensClientCapabilities?

    # Capabilities specific to the `textDocument/documentColor` and the
    # `textDocument/colorPresentation` request.
    #
    # @since 3.6.0
    @[JSON::Field(key: "colorProvider")]
    getter color_provider : DocumentColorClientCapabilities?

    # Capabilities specific to the `textDocument/completion` request.
    getter completion : CompletionClientCapabilities?

    # Capabilities specific to the `textDocument/declaration` request.
    #
    # @since 3.14.0
    getter declaration : DeclarationClientCapabilities?

    # Capabilities specific to the `textDocument/definition` request.
    getter definition : DefinitionClientCapabilities?

    # Capabilities specific to the diagnostic pull model.
    #
    # @since 3.17.0
    getter diagnostic : DiagnosticClientCapabilities?

    # Capabilities specific to the `textDocument/documentHighlight` request.
    @[JSON::Field(key: "documentHighlight")]
    getter document_highlight : DocumentHighlightClientCapabilities?

    # Capabilities specific to the `textDocument/documentLink` request.
    @[JSON::Field(key: "documentLink")]
    getter document_link : DocumentLinkClientCapabilities?

    # Capabilities specific to the `textDocument/documentSymbol` request.
    @[JSON::Field(key: "documentSymbol")]
    getter document_symbol : DocumentSymbolClientCapabilities?

    # Capabilities specific to the `textDocument/foldingRange` request.
    #
    # @since 3.10.0
    @[JSON::Field(key: "foldingRange")]
    getter folding_range : FoldingRangeClientCapabilities?

    # Capabilities specific to the `textDocument/formatting` request.
    getter formatting : DocumentFormattingClientCapabilities?

    # Capabilities specific to the `textDocument/hover` request.
    getter hover : HoverClientCapabilities?

    # Capabilities specific to the `textDocument/implementation` request.
    #
    # @since 3.6.0
    getter implementation : ImplementationClientCapabilities?

    # Capabilities specific to the `textDocument/inlayHint` request.
    #
    # @since 3.17.0
    @[JSON::Field(key: "inlayHint")]
    getter inlay_hint : InlayHintClientCapabilities?

    # Client capabilities specific to inline completions.
    #
    # @since 3.18.0
    # @proposed
    @[JSON::Field(key: "inlineCompletion")]
    getter inline_completion : InlineCompletionClientCapabilities?

    # Capabilities specific to the `textDocument/inlineValue` request.
    #
    # @since 3.17.0
    @[JSON::Field(key: "inlineValue")]
    getter inline_value : InlineValueClientCapabilities?

    # Capabilities specific to the `textDocument/linkedEditingRange` request.
    #
    # @since 3.16.0
    @[JSON::Field(key: "linkedEditingRange")]
    getter linked_editing_range : LinkedEditingRangeClientCapabilities?

    # Client capabilities specific to the `textDocument/moniker` request.
    #
    # @since 3.16.0
    getter moniker : MonikerClientCapabilities?

    # Capabilities specific to the `textDocument/onTypeFormatting` request.
    @[JSON::Field(key: "onTypeFormatting")]
    getter on_type_formatting : DocumentOnTypeFormattingClientCapabilities?

    # Capabilities specific to the `textDocument/publishDiagnostics` notification.
    @[JSON::Field(key: "publishDiagnostics")]
    getter publish_diagnostics : PublishDiagnosticsClientCapabilities?

    # Capabilities specific to the `textDocument/rangeFormatting` request.
    @[JSON::Field(key: "rangeFormatting")]
    getter range_formatting : DocumentRangeFormattingClientCapabilities?

    # Capabilities specific to the `textDocument/references` request.
    getter references : ReferenceClientCapabilities?

    # Capabilities specific to the `textDocument/rename` request.
    getter rename : RenameClientCapabilities?

    # Capabilities specific to the `textDocument/selectionRange` request.
    #
    # @since 3.15.0
    @[JSON::Field(key: "selectionRange")]
    getter selection_range : SelectionRangeClientCapabilities?

    # Capabilities specific to the various semantic token request.
    #
    # @since 3.16.0
    @[JSON::Field(key: "semanticTokens")]
    getter semantic_tokens : SemanticTokensClientCapabilities?

    # Capabilities specific to the `textDocument/signatureHelp` request.
    @[JSON::Field(key: "signatureHelp")]
    getter signature_help : SignatureHelpClientCapabilities?

    # Defines which synchronization capabilities the client supports.
    getter synchronization : TextDocumentSyncClientCapabilities?

    # Capabilities specific to the `textDocument/typeDefinition` request.
    #
    # @since 3.6.0
    @[JSON::Field(key: "typeDefinition")]
    getter type_definition : TypeDefinitionClientCapabilities?

    # Capabilities specific to the various type hierarchy requests.
    #
    # @since 3.17.0
    @[JSON::Field(key: "typeHierarchy")]
    getter type_hierarchy : TypeHierarchyClientCapabilities?

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
  class NotebookDocumentClientCapabilities
    include JSON::Serializable

    # Capabilities specific to notebook document synchronization
    #
    # @since 3.17.0
    getter synchronization : NotebookDocumentSyncClientCapabilities

    def initialize(
      @synchronization : NotebookDocumentSyncClientCapabilities?,
    )
    end
  end

  class WindowClientCapabilities
    include JSON::Serializable

    # Capabilities specific to the showDocument request.
    #
    # @since 3.16.0
    @[JSON::Field(key: "showDocument")]
    getter show_document : ShowDocumentClientCapabilities?

    # Capabilities specific to the showMessage request.
    #
    # @since 3.16.0
    @[JSON::Field(key: "showMessage")]
    getter show_message : ShowMessageRequestClientCapabilities?

    # It indicates whether the client supports server initiated
    # progress using the `window/workDoneProgress/create` request.
    #
    # The capability also controls Whether client supports handling
    # of progress notifications. If set servers are allowed to report a
    # `workDoneProgress` property in the request specific server
    # capabilities.
    #
    # @since 3.15.0
    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

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
  class GeneralClientCapabilities
    include JSON::Serializable

    # Client capabilities specific to the client's markdown parser.
    #
    # @since 3.16.0
    getter markdown : MarkdownClientCapabilities?

    # The position encodings supported by the client. Client and server
    # have to agree on the same position encoding to ensure that offsets
    # (e.g. character position in a line) are interpreted the same on both
    # sides.
    #
    # To keep the protocol backwards compatible the following applies: if
    # the value 'utf-16' is missing from the array of position encodings
    # servers can assume that the client supports UTF-16. UTF-16 is
    # therefore a mandatory encoding.
    #
    # If omitted it defaults to ['utf-16'].
    #
    # Implementation considerations: since the conversion from one encoding
    # into another requires the content of the file / line the conversion
    # is best done where the file is read which is usually on the server
    # side.
    #
    # @since 3.17.0
    @[JSON::Field(key: "positionEncodings")]
    getter position_encodings : Array(PositionEncodingKind | String)?

    # Client capabilities specific to regular expressions.
    #
    # @since 3.16.0
    @[JSON::Field(key: "regularExpressions")]
    getter regular_expressions : RegularExpressionsClientCapabilities?

    # Client capability that signals how the client
    # handles stale requests (e.g. a request
    # for which the client will not process the response
    # anymore since the information is outdated).
    #
    # @since 3.17.0
    @[JSON::Field(key: "staleRequestSupport")]
    getter stale_request_support : StaleRequestSupportOptions?

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

    # Whether the server wants to receive workspace folder
    # change notifications.
    #
    # If a string is provided the string is treated as an ID
    # under which the notification is registered on the client
    # side. The ID can be used to unregister for these events
    # using the `client/unregisterCapability` request.
    @[JSON::Field(key: "changeNotifications")]
    getter change_notifications : Bool | String?

    # The server has support for workspace folders
    getter supported : Bool?

    def initialize(
      @change_notifications : Bool | String? = nil,
      @supported : Bool? = nil,
    )
    end
  end

  # Options for notifications/requests for user operations on files.
  #
  # @since 3.16.0
  class FileOperationOptions
    include JSON::Serializable

    # The server is interested in receiving didCreateFiles notifications.
    @[JSON::Field(key: "didCreate")]
    getter did_create : FileOperationRegistrationOptions?

    # The server is interested in receiving didDeleteFiles file notifications.
    @[JSON::Field(key: "didDelete")]
    getter did_delete : FileOperationRegistrationOptions?

    # The server is interested in receiving didRenameFiles notifications.
    @[JSON::Field(key: "didRename")]
    getter did_rename : FileOperationRegistrationOptions?

    # The server is interested in receiving willCreateFiles requests.
    @[JSON::Field(key: "willCreate")]
    getter will_create : FileOperationRegistrationOptions?

    # The server is interested in receiving willDeleteFiles file requests.
    @[JSON::Field(key: "willDelete")]
    getter will_delete : FileOperationRegistrationOptions?

    # The server is interested in receiving willRenameFiles requests.
    @[JSON::Field(key: "willRename")]
    getter will_rename : FileOperationRegistrationOptions?

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
  class RelativePattern
    include JSON::Serializable

    # A workspace folder or a base URI to which this pattern will be matched
    # against relatively.
    @[JSON::Field(key: "baseUri")]
    getter base_uri : URI | WorkspaceFolder

    # The actual glob pattern;
    getter pattern : Pattern

    def initialize(
      @base_uri : URI | WorkspaceFolder?,
      @pattern : Pattern?,
    )
    end
  end

  # A document filter where `language` is required field.
  #
  # @since 3.18.0
  class TextDocumentFilterLanguage
    include JSON::Serializable

    # A language id, like `typescript`.
    getter language : String

    # A glob pattern, like **​/*.{ts,js}. See TextDocumentFilter for examples.
    getter pattern : String?

    # A Uri `Uri#scheme`, like `file` or `untitled`.
    getter scheme : String?

    def initialize(
      @language : String?,
      @pattern : String? = nil,
      @scheme : String? = nil,
    )
    end
  end

  # A document filter where `scheme` is required field.
  #
  # @since 3.18.0
  class TextDocumentFilterScheme
    include JSON::Serializable

    # A language id, like `typescript`.
    getter language : String?

    # A glob pattern, like **​/*.{ts,js}. See TextDocumentFilter for examples.
    getter pattern : String?

    # A Uri `Uri#scheme`, like `file` or `untitled`.
    getter scheme : String

    def initialize(
      @scheme : String?,
      @language : String? = nil,
      @pattern : String? = nil,
    )
    end
  end

  # A document filter where `pattern` is required field.
  #
  # @since 3.18.0
  class TextDocumentFilterPattern
    include JSON::Serializable

    # A language id, like `typescript`.
    getter language : String?

    # A glob pattern, like **​/*.{ts,js}. See TextDocumentFilter for examples.
    getter pattern : String

    # A Uri `Uri#scheme`, like `file` or `untitled`.
    getter scheme : String?

    def initialize(
      @pattern : String?,
      @language : String? = nil,
      @scheme : String? = nil,
    )
    end
  end

  # A notebook document filter where `notebookType` is required field.
  #
  # @since 3.18.0
  class NotebookDocumentFilterNotebookType
    include JSON::Serializable

    # The type of the enclosing notebook.
    @[JSON::Field(key: "notebookType")]
    getter notebook_type : String

    # A glob pattern.
    getter pattern : String?

    # A Uri `Uri#scheme`, like `file` or `untitled`.
    getter scheme : String?

    def initialize(
      @notebook_type : String?,
      @pattern : String? = nil,
      @scheme : String? = nil,
    )
    end
  end

  # A notebook document filter where `scheme` is required field.
  #
  # @since 3.18.0
  class NotebookDocumentFilterScheme
    include JSON::Serializable

    # The type of the enclosing notebook.
    @[JSON::Field(key: "notebookType")]
    getter notebook_type : String?

    # A glob pattern.
    getter pattern : String?

    # A Uri `Uri#scheme`, like `file` or `untitled`.
    getter scheme : String

    def initialize(
      @scheme : String?,
      @notebook_type : String? = nil,
      @pattern : String? = nil,
    )
    end
  end

  # A notebook document filter where `pattern` is required field.
  #
  # @since 3.18.0
  class NotebookDocumentFilterPattern
    include JSON::Serializable

    # The type of the enclosing notebook.
    @[JSON::Field(key: "notebookType")]
    getter notebook_type : String?

    # A glob pattern.
    getter pattern : String

    # A Uri `Uri#scheme`, like `file` or `untitled`.
    getter scheme : String?

    def initialize(
      @pattern : String?,
      @notebook_type : String? = nil,
      @scheme : String? = nil,
    )
    end
  end

  # A change describing how to move a `NotebookCell`
  # array from state S to S'.
  #
  # @since 3.17.0
  class NotebookCellArrayChange
    include JSON::Serializable

    # The new cells, if any
    getter cells : Array(NotebookCell)?

    # The deleted cells
    @[JSON::Field(key: "deleteCount")]
    getter delete_count : UInt32

    # The start oftest of the cell that changed.
    getter start : UInt32

    def initialize(
      @delete_count : UInt32?,
      @start : UInt32?,
      @cells : Array(NotebookCell)? = nil,
    )
    end
  end

  class WorkspaceEditClientCapabilities
    include JSON::Serializable

    # Whether the client in general supports change annotations on text edits,
    # create file, rename file and delete file changes.
    #
    # @since 3.16.0
    @[JSON::Field(key: "changeAnnotationSupport")]
    getter change_annotation_support : ChangeAnnotationsSupportOptions?

    # The client supports versioned document changes in `WorkspaceEdit`s
    @[JSON::Field(key: "documentChanges")]
    getter document_changes : Bool?

    # The failure handling strategy of a client if applying the workspace edit
    # fails.
    #
    # @since 3.13.0
    @[JSON::Field(key: "failureHandling")]
    getter failure_handling : FailureHandlingKind?

    # Whether the client supports `WorkspaceEditMetadata` in `WorkspaceEdit`s.
    #
    # @since 3.18.0
    # @proposed
    @[JSON::Field(key: "metadataSupport")]
    getter metadata_support : Bool?

    # Whether the client normalizes line endings to the client specific
    # setting.
    # If set to `true` the client will normalize line ending characters
    # in a workspace edit to the client-specified new line
    # character.
    #
    # @since 3.16.0
    @[JSON::Field(key: "normalizesLineEndings")]
    getter normalizes_line_endings : Bool?

    # The resource operations the client supports. Clients should at least
    # support 'create', 'rename' and 'delete' files and folders.
    #
    # @since 3.13.0
    @[JSON::Field(key: "resourceOperations")]
    getter resource_operations : Array(ResourceOperationKind)?

    # Whether the client supports snippets as text edits.
    #
    # @since 3.18.0
    # @proposed
    @[JSON::Field(key: "snippetEditSupport")]
    getter snippet_edit_support : Bool?

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

    # Did change configuration notification supports dynamic registration.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  class DidChangeWatchedFilesClientCapabilities
    include JSON::Serializable

    # Did change watched files notification supports dynamic registration. Please note
    # that the current protocol doesn't support static configuration for file changes
    # from the server side.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    # Whether the client has support for `RelativePattern`
    # or not.
    #
    # @since 3.17.0
    @[JSON::Field(key: "relativePatternSupport")]
    getter relative_pattern_support : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
      @relative_pattern_support : Bool? = nil,
    )
    end
  end

  # Client capabilities for a `WorkspaceSymbolRequest`.
  class WorkspaceSymbolClientCapabilities
    include JSON::Serializable

    # Symbol request supports dynamic registration.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    # The client support partial workspace symbols. The client will send the
    # request `workspaceSymbol/resolve` to the server to resolve additional
    # properties.
    #
    # @since 3.17.0
    @[JSON::Field(key: "resolveSupport")]
    getter resolve_support : ClientSymbolResolveOptions?

    # Specific capabilities for the `SymbolKind` in the `workspace/symbol` request.
    @[JSON::Field(key: "symbolKind")]
    getter symbol_kind : ClientSymbolKindOptions?

    # The client supports tags on `SymbolInformation`.
    # Clients supporting tags have to handle unknown tags gracefully.
    #
    # @since 3.16.0
    @[JSON::Field(key: "tagSupport")]
    getter tag_support : ClientSymbolTagOptions?

    def initialize(
      @dynamic_registration : Bool? = nil,
      @resolve_support : ClientSymbolResolveOptions? = nil,
      @symbol_kind : ClientSymbolKindOptions? = nil,
      @tag_support : ClientSymbolTagOptions? = nil,
    )
    end
  end

  # The client capabilities of a `ExecuteCommandRequest`.
  class ExecuteCommandClientCapabilities
    include JSON::Serializable

    # Execute command supports dynamic registration.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # @since 3.16.0
  class SemanticTokensWorkspaceClientCapabilities
    include JSON::Serializable

    # Whether the client implementation supports a refresh request sent from
    # the server to the client.
    #
    # Note that this event is global and will force the client to refresh all
    # semantic tokens currently shown. It should be used with absolute care
    # and is useful for situation where a server for example detects a project
    # wide change that requires such a calculation.
    @[JSON::Field(key: "refreshSupport")]
    getter refresh_support : Bool?

    def initialize(
      @refresh_support : Bool? = nil,
    )
    end
  end

  # @since 3.16.0
  class CodeLensWorkspaceClientCapabilities
    include JSON::Serializable

    # Whether the client implementation supports a refresh request sent from the
    # server to the client.
    #
    # Note that this event is global and will force the client to refresh all
    # code lenses currently shown. It should be used with absolute care and is
    # useful for situation where a server for example detect a project wide
    # change that requires such a calculation.
    @[JSON::Field(key: "refreshSupport")]
    getter refresh_support : Bool?

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
  class FileOperationClientCapabilities
    include JSON::Serializable

    # The client has support for sending didCreateFiles notifications.
    @[JSON::Field(key: "didCreate")]
    getter did_create : Bool?

    # The client has support for sending didDeleteFiles notifications.
    @[JSON::Field(key: "didDelete")]
    getter did_delete : Bool?

    # The client has support for sending didRenameFiles notifications.
    @[JSON::Field(key: "didRename")]
    getter did_rename : Bool?

    # Whether the client supports dynamic registration for file requests/notifications.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    # The client has support for sending willCreateFiles requests.
    @[JSON::Field(key: "willCreate")]
    getter will_create : Bool?

    # The client has support for sending willDeleteFiles requests.
    @[JSON::Field(key: "willDelete")]
    getter will_delete : Bool?

    # The client has support for sending willRenameFiles requests.
    @[JSON::Field(key: "willRename")]
    getter will_rename : Bool?

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
  class InlineValueWorkspaceClientCapabilities
    include JSON::Serializable

    # Whether the client implementation supports a refresh request sent from the
    # server to the client.
    #
    # Note that this event is global and will force the client to refresh all
    # inline values currently shown. It should be used with absolute care and is
    # useful for situation where a server for example detects a project wide
    # change that requires such a calculation.
    @[JSON::Field(key: "refreshSupport")]
    getter refresh_support : Bool?

    def initialize(
      @refresh_support : Bool? = nil,
    )
    end
  end

  # Client workspace capabilities specific to inlay hints.
  #
  # @since 3.17.0
  class InlayHintWorkspaceClientCapabilities
    include JSON::Serializable

    # Whether the client implementation supports a refresh request sent from
    # the server to the client.
    #
    # Note that this event is global and will force the client to refresh all
    # inlay hints currently shown. It should be used with absolute care and
    # is useful for situation where a server for example detects a project wide
    # change that requires such a calculation.
    @[JSON::Field(key: "refreshSupport")]
    getter refresh_support : Bool?

    def initialize(
      @refresh_support : Bool? = nil,
    )
    end
  end

  # Workspace client capabilities specific to diagnostic pull requests.
  #
  # @since 3.17.0
  class DiagnosticWorkspaceClientCapabilities
    include JSON::Serializable

    # Whether the client implementation supports a refresh request sent from
    # the server to the client.
    #
    # Note that this event is global and will force the client to refresh all
    # pulled diagnostics currently shown. It should be used with absolute care and
    # is useful for situation where a server for example detects a project wide
    # change that requires such a calculation.
    @[JSON::Field(key: "refreshSupport")]
    getter refresh_support : Bool?

    def initialize(
      @refresh_support : Bool? = nil,
    )
    end
  end

  # Client workspace capabilities specific to folding ranges
  #
  # @since 3.18.0
  # @proposed
  class FoldingRangeWorkspaceClientCapabilities
    include JSON::Serializable

    # Whether the client implementation supports a refresh request sent from the
    # server to the client.
    #
    # Note that this event is global and will force the client to refresh all
    # folding ranges currently shown. It should be used with absolute care and is
    # useful for situation where a server for example detects a project wide
    # change that requires such a calculation.
    #
    # @since 3.18.0
    # @proposed
    @[JSON::Field(key: "refreshSupport")]
    getter refresh_support : Bool?

    def initialize(
      @refresh_support : Bool? = nil,
    )
    end
  end

  class TextDocumentSyncClientCapabilities
    include JSON::Serializable

    # The client supports did save notifications.
    @[JSON::Field(key: "didSave")]
    getter did_save : Bool?

    # Whether text document synchronization supports dynamic registration.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    # The client supports sending will save notifications.
    @[JSON::Field(key: "willSave")]
    getter will_save : Bool?

    # The client supports sending a will save request and
    # waits for a response providing text edits which will
    # be applied to the document before it is saved.
    @[JSON::Field(key: "willSaveWaitUntil")]
    getter will_save_wait_until : Bool?

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

    # The client supports the following `CompletionItem` specific
    # capabilities.
    @[JSON::Field(key: "completionItem")]
    getter completion_item : ClientCompletionItemOptions?

    @[JSON::Field(key: "completionItemKind")]
    getter completion_item_kind : ClientCompletionItemOptionsKind?

    # The client supports the following `CompletionList` specific
    # capabilities.
    #
    # @since 3.17.0
    @[JSON::Field(key: "completionList")]
    getter completion_list : CompletionListCapabilities?

    # The client supports to send additional context information for a
    # `textDocument/completion` request.
    @[JSON::Field(key: "contextSupport")]
    getter context_support : Bool?

    # Whether completion supports dynamic registration.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    # Defines how the client handles whitespace and indentation
    # when accepting a completion item that uses multi line
    # text in either `insertText` or `textEdit`.
    #
    # @since 3.17.0
    @[JSON::Field(key: "insertTextMode")]
    getter insert_text_mode : InsertTextMode?

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

    # Client supports the following content formats for the content
    # property. The order describes the preferred format of the client.
    @[JSON::Field(key: "contentFormat")]
    getter content_format : Array(MarkupKind)?

    # Whether hover supports dynamic registration.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    def initialize(
      @content_format : Array(MarkupKind)? = nil,
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # Client Capabilities for a `SignatureHelpRequest`.
  class SignatureHelpClientCapabilities
    include JSON::Serializable

    # The client supports to send additional context information for a
    # `textDocument/signatureHelp` request. A client that opts into
    # contextSupport will also support the `retriggerCharacters` on
    # `SignatureHelpOptions`.
    #
    # @since 3.15.0
    @[JSON::Field(key: "contextSupport")]
    getter context_support : Bool?

    # Whether signature help supports dynamic registration.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    # The client supports the following `SignatureInformation`
    # specific properties.
    @[JSON::Field(key: "signatureInformation")]
    getter signature_information : ClientSignatureInformationOptions?

    def initialize(
      @context_support : Bool? = nil,
      @dynamic_registration : Bool? = nil,
      @signature_information : ClientSignatureInformationOptions? = nil,
    )
    end
  end

  # @since 3.14.0
  class DeclarationClientCapabilities
    include JSON::Serializable

    # Whether declaration supports dynamic registration. If this is set to `true`
    # the client supports the new `DeclarationRegistrationOptions` return value
    # for the corresponding server capability as well.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    # The client supports additional metadata in the form of declaration links.
    @[JSON::Field(key: "linkSupport")]
    getter link_support : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
      @link_support : Bool? = nil,
    )
    end
  end

  # Client Capabilities for a `DefinitionRequest`.
  class DefinitionClientCapabilities
    include JSON::Serializable

    # Whether definition supports dynamic registration.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    # The client supports additional metadata in the form of definition links.
    #
    # @since 3.14.0
    @[JSON::Field(key: "linkSupport")]
    getter link_support : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
      @link_support : Bool? = nil,
    )
    end
  end

  # Since 3.6.0
  class TypeDefinitionClientCapabilities
    include JSON::Serializable

    # Whether implementation supports dynamic registration. If this is set to `true`
    # the client supports the new `TypeDefinitionRegistrationOptions` return value
    # for the corresponding server capability as well.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    # The client supports additional metadata in the form of definition links.
    #
    # Since 3.14.0
    @[JSON::Field(key: "linkSupport")]
    getter link_support : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
      @link_support : Bool? = nil,
    )
    end
  end

  # @since 3.6.0
  class ImplementationClientCapabilities
    include JSON::Serializable

    # Whether implementation supports dynamic registration. If this is set to `true`
    # the client supports the new `ImplementationRegistrationOptions` return value
    # for the corresponding server capability as well.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    # The client supports additional metadata in the form of definition links.
    #
    # @since 3.14.0
    @[JSON::Field(key: "linkSupport")]
    getter link_support : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
      @link_support : Bool? = nil,
    )
    end
  end

  # Client Capabilities for a `ReferencesRequest`.
  class ReferenceClientCapabilities
    include JSON::Serializable

    # Whether references supports dynamic registration.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # Client Capabilities for a `DocumentHighlightRequest`.
  class DocumentHighlightClientCapabilities
    include JSON::Serializable

    # Whether document highlight supports dynamic registration.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # Client Capabilities for a `DocumentSymbolRequest`.
  class DocumentSymbolClientCapabilities
    include JSON::Serializable

    # Whether document symbol supports dynamic registration.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    # The client supports hierarchical document symbols.
    @[JSON::Field(key: "hierarchicalDocumentSymbolSupport")]
    getter hierarchical_document_symbol_support : Bool?

    # The client supports an additional label presented in the UI when
    # registering a document symbol provider.
    #
    # @since 3.16.0
    @[JSON::Field(key: "labelSupport")]
    getter label_support : Bool?

    # Specific capabilities for the `SymbolKind` in the
    # `textDocument/documentSymbol` request.
    @[JSON::Field(key: "symbolKind")]
    getter symbol_kind : ClientSymbolKindOptions?

    # The client supports tags on `SymbolInformation`. Tags are supported on
    # `DocumentSymbol` if `hierarchicalDocumentSymbolSupport` is set to true.
    # Clients supporting tags have to handle unknown tags gracefully.
    #
    # @since 3.16.0
    @[JSON::Field(key: "tagSupport")]
    getter tag_support : ClientSymbolTagOptions?

    def initialize(
      @dynamic_registration : Bool? = nil,
      @hierarchical_document_symbol_support : Bool? = nil,
      @label_support : Bool? = nil,
      @symbol_kind : ClientSymbolKindOptions? = nil,
      @tag_support : ClientSymbolTagOptions? = nil,
    )
    end
  end

  # The Client Capabilities of a `CodeActionRequest`.
  class CodeActionClientCapabilities
    include JSON::Serializable

    # The client support code action literals of type `CodeAction` as a valid
    # response of the `textDocument/codeAction` request. If the property is not
    # set the request can only return `Command` literals.
    #
    # @since 3.8.0
    @[JSON::Field(key: "codeActionLiteralSupport")]
    getter code_action_literal_support : ClientCodeActionLiteralOptions?

    # Whether code action supports the `data` property which is
    # preserved between a `textDocument/codeAction` and a
    # `codeAction/resolve` request.
    #
    # @since 3.16.0
    @[JSON::Field(key: "dataSupport")]
    getter data_support : Bool?

    # Whether code action supports the `disabled` property.
    #
    # @since 3.16.0
    @[JSON::Field(key: "disabledSupport")]
    getter disabled_support : Bool?

    # Whether the client supports documentation for a class of
    # code actions.
    #
    # @since 3.18.0
    # @proposed
    @[JSON::Field(key: "documentationSupport")]
    getter documentation_support : Bool?

    # Whether code action supports dynamic registration.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    # Whether the client honors the change annotations in
    # text edits and resource operations returned via the
    # `CodeAction#edit` property by for example presenting
    # the workspace edit in the user interface and asking
    # for confirmation.
    #
    # @since 3.16.0
    @[JSON::Field(key: "honorsChangeAnnotations")]
    getter honors_change_annotations : Bool?

    # Whether code action supports the `isPreferred` property.
    #
    # @since 3.15.0
    @[JSON::Field(key: "isPreferredSupport")]
    getter is_preferred_support : Bool?

    # Whether the client supports resolving additional code action
    # properties via a separate `codeAction/resolve` request.
    #
    # @since 3.16.0
    @[JSON::Field(key: "resolveSupport")]
    getter resolve_support : ClientCodeActionResolveOptions?

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

  # The client capabilities  of a `CodeLensRequest`.
  class CodeLensClientCapabilities
    include JSON::Serializable

    # Whether code lens supports dynamic registration.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # The client capabilities of a `DocumentLinkRequest`.
  class DocumentLinkClientCapabilities
    include JSON::Serializable

    # Whether document link supports dynamic registration.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    # Whether the client supports the `tooltip` property on `DocumentLink`.
    #
    # @since 3.15.0
    @[JSON::Field(key: "tooltipSupport")]
    getter tooltip_support : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
      @tooltip_support : Bool? = nil,
    )
    end
  end

  class DocumentColorClientCapabilities
    include JSON::Serializable

    # Whether implementation supports dynamic registration. If this is set to `true`
    # the client supports the new `DocumentColorRegistrationOptions` return value
    # for the corresponding server capability as well.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # Client capabilities of a `DocumentFormattingRequest`.
  class DocumentFormattingClientCapabilities
    include JSON::Serializable

    # Whether formatting supports dynamic registration.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # Client capabilities of a `DocumentRangeFormattingRequest`.
  class DocumentRangeFormattingClientCapabilities
    include JSON::Serializable

    # Whether range formatting supports dynamic registration.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    # Whether the client supports formatting multiple ranges at once.
    #
    # @since 3.18.0
    # @proposed
    @[JSON::Field(key: "rangesSupport")]
    getter ranges_support : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
      @ranges_support : Bool? = nil,
    )
    end
  end

  # Client capabilities of a `DocumentOnTypeFormattingRequest`.
  class DocumentOnTypeFormattingClientCapabilities
    include JSON::Serializable

    # Whether on type formatting supports dynamic registration.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  class RenameClientCapabilities
    include JSON::Serializable

    # Whether rename supports dynamic registration.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    # Whether the client honors the change annotations in
    # text edits and resource operations returned via the
    # rename request's workspace edit by for example presenting
    # the workspace edit in the user interface and asking
    # for confirmation.
    #
    # @since 3.16.0
    @[JSON::Field(key: "honorsChangeAnnotations")]
    getter honors_change_annotations : Bool?

    # Client supports testing for validity of rename operations
    # before execution.
    #
    # @since 3.12.0
    @[JSON::Field(key: "prepareSupport")]
    getter prepare_support : Bool?

    # Client supports the default behavior result.
    #
    # The value indicates the default behavior used by the
    # client.
    #
    # @since 3.16.0
    @[JSON::Field(key: "prepareSupportDefaultBehavior")]
    getter prepare_support_default_behavior : PrepareSupportDefaultBehavior?

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

    # Whether implementation supports dynamic registration for folding range
    # providers. If this is set to `true` the client supports the new
    # `FoldingRangeRegistrationOptions` return value for the corresponding
    # server capability as well.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    # Specific options for the folding range.
    #
    # @since 3.17.0
    @[JSON::Field(key: "foldingRange")]
    getter folding_range : ClientFoldingRangeOptions?

    # Specific options for the folding range kind.
    #
    # @since 3.17.0
    @[JSON::Field(key: "foldingRangeKind")]
    getter folding_range_kind : ClientFoldingRangeKindOptions?

    # If set, the client signals that it only supports folding complete lines.
    # If set, client will ignore specified `startCharacter` and `endCharacter`
    # properties in a FoldingRange.
    @[JSON::Field(key: "lineFoldingOnly")]
    getter line_folding_only : Bool?

    # The maximum number of folding ranges that the client prefers to receive
    # per document. The value serves as a hint, servers are free to follow the
    # limit.
    @[JSON::Field(key: "rangeLimit")]
    getter range_limit : UInt32?

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

    # Whether implementation supports dynamic registration for selection range providers. If this is set to `true`
    # the client supports the new `SelectionRangeRegistrationOptions` return value for the corresponding server
    # capability as well.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # General diagnostics capabilities for pull and push model.
  class DiagnosticsCapabilities
    include JSON::Serializable

    # Client supports a codeDescription property
    #
    # @since 3.16.0
    @[JSON::Field(key: "codeDescriptionSupport")]
    getter code_description_support : Bool?

    # Whether code action supports the `data` property which is
    # preserved between a `textDocument/publishDiagnostics` and
    # `textDocument/codeAction` request.
    #
    # @since 3.16.0
    @[JSON::Field(key: "dataSupport")]
    getter data_support : Bool?

    # Whether the clients accepts diagnostics with related information.
    @[JSON::Field(key: "relatedInformation")]
    getter related_information : Bool?

    # Client supports the tag property to provide meta data about a diagnostic.
    # Clients supporting tags have to handle unknown tags gracefully.
    #
    # @since 3.15.0
    @[JSON::Field(key: "tagSupport")]
    getter tag_support : ClientDiagnosticsTagOptions?

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

    # Client supports a codeDescription property
    #
    # @since 3.16.0
    @[JSON::Field(key: "codeDescriptionSupport")]
    getter code_description_support : Bool?

    # Whether code action supports the `data` property which is
    # preserved between a `textDocument/publishDiagnostics` and
    # `textDocument/codeAction` request.
    #
    # @since 3.16.0
    @[JSON::Field(key: "dataSupport")]
    getter data_support : Bool?

    # Whether the clients accepts diagnostics with related information.
    @[JSON::Field(key: "relatedInformation")]
    getter related_information : Bool?

    # Client supports the tag property to provide meta data about a diagnostic.
    # Clients supporting tags have to handle unknown tags gracefully.
    #
    # @since 3.15.0
    @[JSON::Field(key: "tagSupport")]
    getter tag_support : ClientDiagnosticsTagOptions?

    # Whether the client interprets the version property of the
    # `textDocument/publishDiagnostics` notification's parameter.
    #
    # @since 3.15.0
    @[JSON::Field(key: "versionSupport")]
    getter version_support : Bool?

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
  class CallHierarchyClientCapabilities
    include JSON::Serializable

    # Whether implementation supports dynamic registration. If this is set to `true`
    # the client supports the new `(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
    # return value for the corresponding server capability as well.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # @since 3.16.0
  class SemanticTokensClientCapabilities
    include JSON::Serializable

    # Whether the client uses semantic tokens to augment existing
    # syntax tokens. If set to `true` client side created syntax
    # tokens and semantic tokens are both used for colorization. If
    # set to `false` the client only uses the returned semantic tokens
    # for colorization.
    #
    # If the value is `undefined` then the client behavior is not
    # specified.
    #
    # @since 3.17.0
    @[JSON::Field(key: "augmentsSyntaxTokens")]
    getter augments_syntax_tokens : Bool?

    # Whether implementation supports dynamic registration. If this is set to `true`
    # the client supports the new `(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
    # return value for the corresponding server capability as well.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    # The token formats the clients supports.
    getter formats : Array(TokenFormat)

    # Whether the client supports tokens that can span multiple lines.
    @[JSON::Field(key: "multilineTokenSupport")]
    getter multiline_token_support : Bool?

    # Whether the client supports tokens that can overlap each other.
    @[JSON::Field(key: "overlappingTokenSupport")]
    getter overlapping_token_support : Bool?

    # Which requests the client supports and might send to the server
    # depending on the server's capability. Please note that clients might not
    # show semantic tokens or degrade some of the user experience if a range
    # or full request is advertised by the client but not provided by the
    # server. If for example the client capability `requests.full` and
    # `request.range` are both set to true but the server only provides a
    # range provider the client might not render a minimap correctly or might
    # even decide to not show any semantic tokens at all.
    getter requests : ClientSemanticTokensRequestOptions

    # Whether the client allows the server to actively cancel a
    # semantic token request, e.g. supports returning
    # LSPErrorCodes.ServerCancelled. If a server does the client
    # needs to retrigger the request.
    #
    # @since 3.17.0
    @[JSON::Field(key: "serverCancelSupport")]
    getter server_cancel_support : Bool?

    # The token modifiers that the client supports.
    @[JSON::Field(key: "tokenModifiers")]
    getter token_modifiers : Array(String)

    # The token types that the client supports.
    @[JSON::Field(key: "tokenTypes")]
    getter token_types : Array(String)

    def initialize(
      @formats : Array(TokenFormat)?,
      @requests : ClientSemanticTokensRequestOptions?,
      @token_modifiers : Array(String)?,
      @token_types : Array(String)?,
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
  class LinkedEditingRangeClientCapabilities
    include JSON::Serializable

    # Whether implementation supports dynamic registration. If this is set to `true`
    # the client supports the new `(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
    # return value for the corresponding server capability as well.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # Client capabilities specific to the moniker request.
  #
  # @since 3.16.0
  class MonikerClientCapabilities
    include JSON::Serializable

    # Whether moniker supports dynamic registration. If this is set to `true`
    # the client supports the new `MonikerRegistrationOptions` return value
    # for the corresponding server capability as well.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # @since 3.17.0
  class TypeHierarchyClientCapabilities
    include JSON::Serializable

    # Whether implementation supports dynamic registration. If this is set to `true`
    # the client supports the new `(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
    # return value for the corresponding server capability as well.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # Client capabilities specific to inline values.
  #
  # @since 3.17.0
  class InlineValueClientCapabilities
    include JSON::Serializable

    # Whether implementation supports dynamic registration for inline value providers.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # Inlay hint client capabilities.
  #
  # @since 3.17.0
  class InlayHintClientCapabilities
    include JSON::Serializable

    # Whether inlay hints support dynamic registration.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    # Indicates which properties a client can resolve lazily on an inlay
    # hint.
    @[JSON::Field(key: "resolveSupport")]
    getter resolve_support : ClientInlayHintResolveOptions?

    def initialize(
      @dynamic_registration : Bool? = nil,
      @resolve_support : ClientInlayHintResolveOptions? = nil,
    )
    end
  end

  # Client capabilities specific to diagnostic pull requests.
  #
  # @since 3.17.0
  class DiagnosticClientCapabilities
    include JSON::Serializable

    # Client supports a codeDescription property
    #
    # @since 3.16.0
    @[JSON::Field(key: "codeDescriptionSupport")]
    getter code_description_support : Bool?

    # Whether code action supports the `data` property which is
    # preserved between a `textDocument/publishDiagnostics` and
    # `textDocument/codeAction` request.
    #
    # @since 3.16.0
    @[JSON::Field(key: "dataSupport")]
    getter data_support : Bool?

    # Whether implementation supports dynamic registration. If this is set to `true`
    # the client supports the new `(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
    # return value for the corresponding server capability as well.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    # Whether the clients supports related documents for document diagnostic pulls.
    @[JSON::Field(key: "relatedDocumentSupport")]
    getter related_document_support : Bool?

    # Whether the clients accepts diagnostics with related information.
    @[JSON::Field(key: "relatedInformation")]
    getter related_information : Bool?

    # Client supports the tag property to provide meta data about a diagnostic.
    # Clients supporting tags have to handle unknown tags gracefully.
    #
    # @since 3.15.0
    @[JSON::Field(key: "tagSupport")]
    getter tag_support : ClientDiagnosticsTagOptions?

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
  class InlineCompletionClientCapabilities
    include JSON::Serializable

    # Whether implementation supports dynamic registration for inline completion providers.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
    )
    end
  end

  # Notebook specific client capabilities.
  #
  # @since 3.17.0
  class NotebookDocumentSyncClientCapabilities
    include JSON::Serializable

    # Whether implementation supports dynamic registration. If this is
    # set to `true` the client supports the new
    # `(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
    # return value for the corresponding server capability as well.
    @[JSON::Field(key: "dynamicRegistration")]
    getter dynamic_registration : Bool?

    # The client supports sending execution summary data per cell.
    @[JSON::Field(key: "executionSummarySupport")]
    getter execution_summary_support : Bool?

    def initialize(
      @dynamic_registration : Bool? = nil,
      @execution_summary_support : Bool? = nil,
    )
    end
  end

  # Show message request client capabilities
  class ShowMessageRequestClientCapabilities
    include JSON::Serializable

    # Capabilities specific to the `MessageActionItem` type.
    @[JSON::Field(key: "messageActionItem")]
    getter message_action_item : ClientShowMessageActionItemOptions?

    def initialize(
      @message_action_item : ClientShowMessageActionItemOptions? = nil,
    )
    end
  end

  # Client capabilities for the showDocument request.
  #
  # @since 3.16.0
  class ShowDocumentClientCapabilities
    include JSON::Serializable

    # The client has support for the showDocument
    # request.
    getter support : Bool

    def initialize(
      @support : Bool?,
    )
    end
  end

  # @since 3.18.0
  class StaleRequestSupportOptions
    include JSON::Serializable

    # The client will actively cancel the request.
    getter cancel : Bool

    # The list of requests for which the client
    # will retry the request if it receives a
    # response with error code `ContentModified`
    @[JSON::Field(key: "retryOnContentModified")]
    getter retry_on_content_modified : Array(String)

    def initialize(
      @cancel : Bool?,
      @retry_on_content_modified : Array(String)?,
    )
    end
  end

  # Client capabilities specific to regular expressions.
  #
  # @since 3.16.0
  class RegularExpressionsClientCapabilities
    include JSON::Serializable

    # The engine's name.
    getter engine : RegularExpressionEngineKind

    # The engine's version.
    getter version : String?

    def initialize(
      @engine : RegularExpressionEngineKind?,
      @version : String? = nil,
    )
    end
  end

  # Client capabilities specific to the used markdown parser.
  #
  # @since 3.16.0
  class MarkdownClientCapabilities
    include JSON::Serializable

    # A list of HTML tags that the client allows / supports in
    # Markdown.
    #
    # @since 3.17.0
    @[JSON::Field(key: "allowedTags")]
    getter allowed_tags : Array(String)?

    # The name of the parser.
    getter parser : String

    # The version of the parser.
    getter version : String?

    def initialize(
      @parser : String?,
      @allowed_tags : Array(String)? = nil,
      @version : String? = nil,
    )
    end
  end

  # @since 3.18.0
  class ChangeAnnotationsSupportOptions
    include JSON::Serializable

    # Whether the client groups edits with equal labels into tree nodes,
    # for instance all edits labelled with "Changes in Strings" would
    # be a tree node.
    @[JSON::Field(key: "groupsOnLabel")]
    getter groups_on_label : Bool?

    def initialize(
      @groups_on_label : Bool? = nil,
    )
    end
  end

  # @since 3.18.0
  class ClientSymbolKindOptions
    include JSON::Serializable

    # The symbol kind values the client supports. When this
    # property exists the client also guarantees that it will
    # handle values outside its set gracefully and falls back
    # to a default value when unknown.
    #
    # If this property is not present the client only supports
    # the symbol kinds from `File` to `Array` as defined in
    # the initial version of the protocol.
    @[JSON::Field(key: "valueSet")]
    getter value_set : Array(SymbolKind)?

    def initialize(
      @value_set : Array(SymbolKind)? = nil,
    )
    end
  end

  # @since 3.18.0
  class ClientSymbolTagOptions
    include JSON::Serializable

    # The tags supported by the client.
    @[JSON::Field(key: "valueSet")]
    getter value_set : Array(SymbolTag)

    def initialize(
      @value_set : Array(SymbolTag)?,
    )
    end
  end

  # @since 3.18.0
  class ClientSymbolResolveOptions
    include JSON::Serializable

    # The properties that a client can resolve lazily. Usually
    # `location.range`
    getter properties : Array(String)

    def initialize(
      @properties : Array(String)?,
    )
    end
  end

  # @since 3.18.0
  class ClientCompletionItemOptions
    include JSON::Serializable

    # Client supports commit characters on a completion item.
    @[JSON::Field(key: "commitCharactersSupport")]
    getter commit_characters_support : Bool?

    # Client supports the deprecated property on a completion item.
    @[JSON::Field(key: "deprecatedSupport")]
    getter deprecated_support : Bool?

    # Client supports the following content formats for the documentation
    # property. The order describes the preferred format of the client.
    @[JSON::Field(key: "documentationFormat")]
    getter documentation_format : Array(MarkupKind)?

    # Client support insert replace edit to control different behavior if a
    # completion item is inserted in the text or should replace text.
    #
    # @since 3.16.0
    @[JSON::Field(key: "insertReplaceSupport")]
    getter insert_replace_support : Bool?

    # The client supports the `insertTextMode` property on
    # a completion item to override the whitespace handling mode
    # as defined by the client (see `insertTextMode`).
    #
    # @since 3.16.0
    @[JSON::Field(key: "insertTextModeSupport")]
    getter insert_text_mode_support : ClientCompletionItemInsertTextModeOptions?

    # The client has support for completion item label
    # details (see also `CompletionItemLabelDetails`).
    #
    # @since 3.17.0
    @[JSON::Field(key: "labelDetailsSupport")]
    getter label_details_support : Bool?

    # Client supports the preselect property on a completion item.
    @[JSON::Field(key: "preselectSupport")]
    getter preselect_support : Bool?

    # Indicates which properties a client can resolve lazily on a completion
    # item. Before version 3.16.0 only the predefined properties `documentation`
    # and `details` could be resolved lazily.
    #
    # @since 3.16.0
    @[JSON::Field(key: "resolveSupport")]
    getter resolve_support : ClientCompletionItemResolveOptions?

    # Client supports snippets as insert text.
    #
    # A snippet can define tab stops and placeholders with `$1`, `$2`
    # and `${3:foo}`. `$0` defines the final tab stop, it defaults to
    # the end of the snippet. Placeholders with equal identifiers are linked,
    # that is typing in one will update others too.
    @[JSON::Field(key: "snippetSupport")]
    getter snippet_support : Bool?

    # Client supports the tag property on a completion item. Clients supporting
    # tags have to handle unknown tags gracefully. Clients especially need to
    # preserve unknown tags when sending a completion item back to the server in
    # a resolve call.
    #
    # @since 3.15.0
    @[JSON::Field(key: "tagSupport")]
    getter tag_support : CompletionItemTagOptions?

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
  class ClientCompletionItemOptionsKind
    include JSON::Serializable

    # The completion item kind values the client supports. When this
    # property exists the client also guarantees that it will
    # handle values outside its set gracefully and falls back
    # to a default value when unknown.
    #
    # If this property is not present the client only supports
    # the completion items kinds from `Text` to `Reference` as defined in
    # the initial version of the protocol.
    @[JSON::Field(key: "valueSet")]
    getter value_set : Array(CompletionItemKind)?

    def initialize(
      @value_set : Array(CompletionItemKind)? = nil,
    )
    end
  end

  # The client supports the following `CompletionList` specific
  # capabilities.
  #
  # @since 3.17.0
  class CompletionListCapabilities
    include JSON::Serializable

    # The client supports the following itemDefaults on
    # a completion list.
    #
    # The value lists the supported property names of the
    # `CompletionList.itemDefaults` object. If omitted
    # no properties are supported.
    #
    # @since 3.17.0
    @[JSON::Field(key: "itemDefaults")]
    getter item_defaults : Array(String)?

    def initialize(
      @item_defaults : Array(String)? = nil,
    )
    end
  end

  # @since 3.18.0
  class ClientSignatureInformationOptions
    include JSON::Serializable

    # The client supports the `activeParameter` property on `SignatureInformation`
    # literal.
    #
    # @since 3.16.0
    @[JSON::Field(key: "activeParameterSupport")]
    getter active_parameter_support : Bool?

    # Client supports the following content formats for the documentation
    # property. The order describes the preferred format of the client.
    @[JSON::Field(key: "documentationFormat")]
    getter documentation_format : Array(MarkupKind)?

    # The client supports the `activeParameter` property on
    # `SignatureHelp`/`SignatureInformation` being set to `null` to
    # indicate that no parameter should be active.
    #
    # @since 3.18.0
    # @proposed
    @[JSON::Field(key: "noActiveParameterSupport")]
    getter no_active_parameter_support : Bool?

    # Client capabilities specific to parameter information.
    @[JSON::Field(key: "parameterInformation")]
    getter parameter_information : ClientSignatureParameterInformationOptions?

    def initialize(
      @active_parameter_support : Bool? = nil,
      @documentation_format : Array(MarkupKind)? = nil,
      @no_active_parameter_support : Bool? = nil,
      @parameter_information : ClientSignatureParameterInformationOptions? = nil,
    )
    end
  end

  # @since 3.18.0
  class ClientCodeActionLiteralOptions
    include JSON::Serializable

    # The code action kind is support with the following value
    # set.
    @[JSON::Field(key: "codeActionKind")]
    getter code_action_kind : ClientCodeActionKindOptions

    def initialize(
      @code_action_kind : ClientCodeActionKindOptions?,
    )
    end
  end

  # @since 3.18.0
  class ClientCodeActionResolveOptions
    include JSON::Serializable

    # The properties that a client can resolve lazily.
    getter properties : Array(String)

    def initialize(
      @properties : Array(String)?,
    )
    end
  end

  # @since 3.18.0
  class ClientFoldingRangeKindOptions
    include JSON::Serializable

    # The folding range kind values the client supports. When this
    # property exists the client also guarantees that it will
    # handle values outside its set gracefully and falls back
    # to a default value when unknown.
    @[JSON::Field(key: "valueSet")]
    getter value_set : Array(FoldingRangeKind | String)?

    def initialize(
      @value_set : Array(FoldingRangeKind | String)? = nil,
    )
    end
  end

  # @since 3.18.0
  class ClientFoldingRangeOptions
    include JSON::Serializable

    # If set, the client signals that it supports setting collapsedText on
    # folding ranges to display custom labels instead of the default text.
    #
    # @since 3.17.0
    @[JSON::Field(key: "collapsedText")]
    getter collapsed_text : Bool?

    def initialize(
      @collapsed_text : Bool? = nil,
    )
    end
  end

  # @since 3.18.0
  class ClientSemanticTokensRequestOptions
    include JSON::Serializable

    # The client will send the `textDocument/semanticTokens/full` request if
    # the server provides a corresponding handler.
    getter full : Bool | ClientSemanticTokensRequestFullDelta?

    # The client will send the `textDocument/semanticTokens/range` request if
    # the server provides a corresponding handler.
    getter range : Bool | JSON::Any??

    def initialize(
      @full : Bool | ClientSemanticTokensRequestFullDelta? = nil,
      @range : Bool | JSON::Any?? = nil,
    )
    end
  end

  # @since 3.18.0
  class ClientInlayHintResolveOptions
    include JSON::Serializable

    # The properties that a client can resolve lazily.
    getter properties : Array(String)

    def initialize(
      @properties : Array(String)?,
    )
    end
  end

  # @since 3.18.0
  class ClientShowMessageActionItemOptions
    include JSON::Serializable

    # Whether the client supports additional attributes which
    # are preserved and send back to the server in the
    # request's response.
    @[JSON::Field(key: "additionalPropertiesSupport")]
    getter additional_properties_support : Bool?

    def initialize(
      @additional_properties_support : Bool? = nil,
    )
    end
  end

  # @since 3.18.0
  class CompletionItemTagOptions
    include JSON::Serializable

    # The tags supported by the client.
    @[JSON::Field(key: "valueSet")]
    getter value_set : Array(CompletionItemTag)

    def initialize(
      @value_set : Array(CompletionItemTag)?,
    )
    end
  end

  # @since 3.18.0
  class ClientCompletionItemResolveOptions
    include JSON::Serializable

    # The properties that a client can resolve lazily.
    getter properties : Array(String)

    def initialize(
      @properties : Array(String)?,
    )
    end
  end

  # @since 3.18.0
  class ClientCompletionItemInsertTextModeOptions
    include JSON::Serializable

    @[JSON::Field(key: "valueSet")]
    getter value_set : Array(InsertTextMode)

    def initialize(
      @value_set : Array(InsertTextMode)?,
    )
    end
  end

  # @since 3.18.0
  class ClientSignatureParameterInformationOptions
    include JSON::Serializable

    # The client supports processing label offsets instead of a
    # simple label string.
    #
    # @since 3.14.0
    @[JSON::Field(key: "labelOffsetSupport")]
    getter label_offset_support : Bool?

    def initialize(
      @label_offset_support : Bool? = nil,
    )
    end
  end

  # @since 3.18.0
  class ClientCodeActionKindOptions
    include JSON::Serializable

    # The code action kind values the client supports. When this
    # property exists the client also guarantees that it will
    # handle values outside its set gracefully and falls back
    # to a default value when unknown.
    @[JSON::Field(key: "valueSet")]
    getter value_set : Array(CodeActionKind | String)

    def initialize(
      @value_set : Array(CodeActionKind | String)?,
    )
    end
  end

  # @since 3.18.0
  class ClientDiagnosticsTagOptions
    include JSON::Serializable

    # The tags supported by the client.
    @[JSON::Field(key: "valueSet")]
    getter value_set : Array(DiagnosticTag)

    def initialize(
      @value_set : Array(DiagnosticTag)?,
    )
    end
  end

  # @since 3.18.0
  class ClientSemanticTokensRequestFullDelta
    include JSON::Serializable

    # The client will send the `textDocument/semanticTokens/full/delta` request if
    # the server provides a corresponding handler.
    getter delta : Bool?

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
  enum SemanticTokenTypes
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

    # @since 3.17.0
    Decorator

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # A set of predefined token modifiers. This set is not fixed
  # an clients can specify additional token types via the
  # corresponding client capabilities.
  #
  # @since 3.16.0
  enum SemanticTokenModifiers
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

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # The document diagnostic report kinds.
  #
  # @since 3.17.0
  enum DocumentDiagnosticReportKind
    # A diagnostic report with a full
    # set of problems.
    Full

    # A report indicating that the last
    # returned report is still accurate.
    Unchanged

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # Predefined error codes.
  enum ErrorCodes
    ParseError     = -32700
    InvalidRequest = -32600
    MethodNotFound = -32601
    InvalidParams  = -32602
    InternalError  = -32603

    # Error code indicating that a server received a notification or
    # request before the server has received the `initialize` request.
    ServerNotInitialized = -32002
    UnknownErrorCode     = -32001

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  enum LSPErrorCodes
    # A request failed but it was syntactically correct, e.g the
    # method name was known and the parameters were valid. The error
    # message should contain human readable information about why
    # the request failed.
    #
    # @since 3.17.0
    RequestFailed = -32803

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

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # A set of predefined range kinds.
  enum FoldingRangeKind
    # Folding range for a comment
    Comment

    # Folding range for an import or include
    Imports

    # Folding range for a region (e.g. `#region`)
    Region

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # A symbol kind.
  enum SymbolKind
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

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # Symbol tags are extra annotations that tweak the rendering of a symbol.
  #
  # @since 3.16
  enum SymbolTag
    # Render a symbol as obsolete, usually using a strike-out.
    Deprecated = 1

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # Moniker uniqueness level to define scope of the moniker.
  #
  # @since 3.16.0
  enum UniquenessLevel
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

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # The moniker kind.
  #
  # @since 3.16.0
  enum MonikerKind
    # The moniker represent a symbol that is imported into a project
    Import

    # The moniker represents a symbol that is exported from a project
    Export

    # The moniker represents a symbol that is local to a project (e.g. a local
    # variable of a function, a class not visible outside the project, ...)
    Local

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # Inlay hint kinds.
  #
  # @since 3.17.0
  enum InlayHintKind
    # An inlay hint that for a type annotation.
    Type = 1

    # An inlay hint that is for a parameter.
    Parameter = 2

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # The message type
  enum MessageType
    # An error message.
    Error = 1

    # A warning message.
    Warning = 2

    # An information message.
    Info = 3

    # A log message.
    Log = 4

    # A debug message.
    #
    # @since 3.18.0
    # @proposed
    Debug = 5

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # Defines how the host (editor) should sync
  # document changes to the language server.
  enum TextDocumentSyncKind
    # Documents should not be synced at all.
    None_ = 0

    # Documents are synced by always sending the full content
    # of the document.
    Full = 1

    # Documents are synced by sending the full content on open.
    # After that only incremental updates to the document are
    # send.
    Incremental = 2

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # Represents reasons why a text document is saved.
  enum TextDocumentSaveReason
    # Manually triggered, e.g. by the user pressing save, by starting debugging,
    # or by an API call.
    Manual = 1

    # Automatic after a delay.
    AfterDelay = 2

    # When the editor lost focus.
    FocusOut = 3

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # The kind of a completion entry.
  enum CompletionItemKind
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

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # Completion item tags are extra annotations that tweak the rendering of a completion
  # item.
  #
  # @since 3.15.0
  enum CompletionItemTag
    # Render a completion as obsolete, usually using a strike-out.
    Deprecated = 1

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # Defines whether the insert text in a completion item should be interpreted as
  # plain text or a snippet.
  enum InsertTextFormat
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

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # How whitespace and indentation is handled during completion
  # item insertion.
  #
  # @since 3.16.0
  enum InsertTextMode
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

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # A document highlight kind.
  enum DocumentHighlightKind
    # A textual occurrence.
    Text = 1

    # Read-access of a symbol, like reading a variable.
    Read = 2

    # Write-access of a symbol, like writing to a variable.
    Write = 3

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # A set of predefined code action kinds
  enum CodeActionKind
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

    # Base kind for auto-fix source actions: `source.fixAll`.
    #
    # Fix all actions automatically fix errors that have a clear fix that do not require user input.
    # They should not suppress errors or perform unsafe fixes such as generating new types or classes.
    #
    # @since 3.15.0
    SourceFixAll

    # Base kind for all code actions applying to the entire notebook's scope. CodeActionKinds using
    # this should always begin with `notebook.`
    #
    # @since 3.18.0
    Notebook

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end

    def self.parse(string : String) : self
      case string
      when ""
        return self.new(Empty)
      when "refactor.extract"
        return self.new(RefactorExtract)
      when "refactor.inline"
        return self.new(RefactorInline)
      when "refactor.move"
        return self.new(RefactorMove)
      when "refactor.rewrite"
        return self.new(RefactorRewrite)
      when "source.organizeImports"
        return self.new(SourceOrganizeImports)
      when "source.fixAll"
        return self.new(SourceFixAll)
      end

      super
    end

    def to_s : String
      case self
      when Empty
        return ""
      when RefactorExtract
        return "refactor.extract"
      when RefactorInline
        return "refactor.inline"
      when RefactorMove
        return "refactor.move"
      when RefactorRewrite
        return "refactor.rewrite"
      when SourceOrganizeImports
        return "source.organizeImports"
      when SourceFixAll
        return "source.fixAll"
      end

      super
    end
  end

  enum TraceValue
    # Turn tracing off.
    Off

    # Trace messages only.
    Messages

    # Verbose message tracing.
    Verbose

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # Describes the content type that a client supports in various
  # result literals like `Hover`, `ParameterInfo` or `CompletionItem`.
  #
  # Please note that `MarkupKinds` must not start with a `$`. This kinds
  # are reserved for internal usage.
  enum MarkupKind
    # Plain text is supported as a content format
    PlainText

    # Markdown is supported as a content format
    Markdown

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # Predefined Language kinds
  # @since 3.18.0
  # @proposed
  enum LanguageKind
    Abap
    WindowsBat
    BibTeX
    Clojure
    Coffeescript
    C
    Cpp
    CSharp
    Css

    # @since 3.18.0
    # @proposed
    D

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

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end

    def self.parse(string : String) : self
      case string
      when "bat"
        return self.new(WindowsBat)
      when "pascal"
        return self.new(Delphi)
      when "git-commit"
        return self.new(GitCommit)
      when "rebase"
        return self.new(GitRebase)
      when "objective-c"
        return self.new(ObjectiveC)
      when "objective-cpp"
        return self.new(ObjectiveCpp)
      when "jade"
        return self.new(Pug)
      when "vb"
        return self.new(VisualBasic)
      end

      super
    end

    def to_s : String
      case self
      when WindowsBat
        return "bat"
      when Delphi
        return "pascal"
      when GitCommit
        return "git-commit"
      when GitRebase
        return "rebase"
      when ObjectiveC
        return "objective-c"
      when ObjectiveCpp
        return "objective-cpp"
      when Pug
        return "jade"
      when VisualBasic
        return "vb"
      end

      super
    end
  end

  # Describes how an `InlineCompletionItemProvider` was triggered.
  #
  # @since 3.18.0
  # @proposed
  enum InlineCompletionTriggerKind
    # Completion was triggered explicitly by a user gesture.
    Invoked = 1

    # Completion was triggered automatically while editing.
    Automatic = 2

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # A set of predefined position encoding kinds.
  #
  # @since 3.17.0
  enum PositionEncodingKind
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

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end

    def self.parse(string : String) : self
      case string
      when "utf-8"
        return self.new(Utf8)
      when "utf-16"
        return self.new(Utf16)
      when "utf-32"
        return self.new(Utf32)
      end

      super
    end

    def to_s : String
      case self
      when Utf8
        return "utf-8"
      when Utf16
        return "utf-16"
      when Utf32
        return "utf-32"
      end

      super
    end
  end

  # The file event type
  enum FileChangeType
    # The file got created.
    Created = 1

    # The file got changed.
    Changed = 2

    # The file got deleted.
    Deleted = 3

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  enum WatchKind
    # Interested in create events.
    Create = 1

    # Interested in change events
    Change = 2

    # Interested in delete events
    Delete = 4

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # The diagnostic's severity.
  enum DiagnosticSeverity
    # Reports an error.
    Error = 1

    # Reports a warning.
    Warning = 2

    # Reports an information.
    Information = 3

    # Reports a hint.
    Hint = 4

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # The diagnostic tags.
  #
  # @since 3.15.0
  enum DiagnosticTag
    # Unused or unnecessary code.
    #
    # Clients are allowed to render diagnostics with this tag faded out instead of having
    # an error squiggle.
    Unnecessary = 1

    # Deprecated or obsolete code.
    #
    # Clients are allowed to rendered diagnostics with this tag strike through.
    Deprecated = 2

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # How a completion was triggered
  enum CompletionTriggerKind
    # Completion was triggered by typing an identifier (24x7 code
    # complete), manual invocation (e.g Ctrl+Space) or via API.
    Invoked = 1

    # Completion was triggered by a trigger character specified by
    # the `triggerCharacters` properties of the `CompletionRegistrationOptions`.
    TriggerCharacter = 2

    # Completion was re-triggered as current completion list is incomplete
    TriggerForIncompleteCompletions = 3

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # How a signature help was triggered.
  #
  # @since 3.15.0
  enum SignatureHelpTriggerKind
    # Signature help was invoked manually by the user or by a command.
    Invoked = 1

    # Signature help was triggered by a trigger character.
    TriggerCharacter = 2

    # Signature help was triggered by the cursor moving or by the document content changing.
    ContentChange = 3

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # The reason why code actions were requested.
  #
  # @since 3.17.0
  enum CodeActionTriggerKind
    # Code actions were explicitly requested by the user or by an extension.
    Invoked = 1

    # Code actions were requested automatically.
    #
    # This typically happens when current selection in a file changes, but can
    # also be triggered when file content changes.
    Automatic = 2

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # A pattern kind describing if a glob pattern matches a file a folder or
  # both.
  #
  # @since 3.16.0
  enum FileOperationPatternKind
    # The pattern matches a file only.
    File

    # The pattern matches a folder only.
    Folder

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # A notebook cell kind.
  #
  # @since 3.17.0
  enum NotebookCellKind
    # A markup-cell is formatted source that is used for display.
    Markup = 1

    # A code-cell is source code.
    Code = 2

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  enum ResourceOperationKind
    # Supports creating new files and folders.
    Create

    # Supports renaming existing files and folders.
    Rename

    # Supports deleting existing files and folders.
    Delete

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  enum FailureHandlingKind
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

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  enum PrepareSupportDefaultBehavior
    # The client's default behavior is to select the identifier
    # according the to language's syntax rule.
    Identifier = 1

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  enum TokenFormat
    Relative

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end
  end

  # The definition of a symbol represented as one or many `Location`.
  # For most programming languages there is only one location at which a symbol is
  # defined.
  #
  # Servers should prefer returning `DefinitionLink` over `Definition` if supported
  # by the client.
  alias Definition = Array(Location) | Location

  # Information about where a symbol is defined.
  #
  # Provides additional metadata over normal `Location` definitions, including the range of
  # the defining symbol
  alias DefinitionLink = LocationLink

  # LSP arrays.
  # @since 3.17.0
  alias LSPArray = Array(LSPAny)

  # The LSP any type.
  # Please note that strictly speaking a property with the value `undefined`
  # can't be converted into JSON preserving the property name. However for
  # convenience it is allowed and assumed that all these properties are
  # optional as well.
  # @since 3.17.0
  alias LSPAny = JSON::Any?

  # The declaration of a symbol representation as one or many `Location`.
  alias Declaration = Array(Location) | Location

  # Information about where a symbol is declared.
  #
  # Provides additional metadata over normal `Location` declarations, including the range of
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
  alias InlineValue = InlineValueEvaluatableExpression | InlineValueText | InlineValueVariableLookup

  # The result of a document diagnostic pull request. A report can
  # either be a full report containing all diagnostics for the
  # requested document or an unchanged report indicating that nothing
  # has changed in terms of diagnostics in comparison to the last
  # pull request.
  #
  # @since 3.17.0
  alias DocumentDiagnosticReport = RelatedFullDocumentDiagnosticReport | RelatedUnchangedDocumentDiagnosticReport

  alias PrepareRenameResult = PrepareRenameDefaultBehavior | PrepareRenamePlaceholder | Range

  # A document selector is the combination of one or many document filters.
  #
  # @sample `let sel:DocumentSelector = [{ language: 'typescript' }, { language: 'json', pattern: '**∕tsconfig.json' }]`;
  #
  # The use of a string as a document filter is deprecated @since 3.16.0.
  alias DocumentSelector = Array(DocumentFilter)

  alias ProgressToken = Int32 | String

  # An identifier to refer to a change annotation stored with a workspace edit.
  alias ChangeAnnotationIdentifier = String

  # A workspace diagnostic document report.
  #
  # @since 3.17.0
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
  alias MarkedString = MarkedStringWithLanguage | String

  # A document filter describes a top level text document or
  # a notebook cell document.
  #
  # @since 3.17.0 - proposed support for NotebookCellTextDocumentFilter.
  alias DocumentFilter = NotebookCellTextDocumentFilter | TextDocumentFilter

  # LSP object definition.
  # @since 3.17.0
  alias LSPObject = JSON::Any?

  # The glob pattern. Either a string pattern or a relative pattern.
  #
  # @since 3.17.0
  alias GlobPattern = Pattern | RelativePattern

  # A document filter denotes a document by different properties like
  # the `TextDocument#languageId`, the `Uri#scheme` of
  # its resource, or a glob-pattern that is applied to the `TextDocument#fileName`.
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
  alias TextDocumentFilter = TextDocumentFilterLanguage | TextDocumentFilterPattern | TextDocumentFilterScheme

  # A notebook document filter denotes a notebook document by
  # different properties. The properties will be match
  # against the notebook's URI (same as with documents)
  #
  # @since 3.17.0
  alias NotebookDocumentFilter = NotebookDocumentFilterNotebookType | NotebookDocumentFilterPattern | NotebookDocumentFilterScheme

  # The glob pattern to watch relative to the base path. Glob patterns can have the following syntax:
  # - `*` to match one or more characters in a path segment
  # - `?` to match on one character in a path segment
  # - `**` to match any number of path segments, including none
  # - `{}` to group conditions (e.g. `**​/*.{ts,js}` matches all TypeScript and JavaScript files)
  # - `[]` to declare a range of characters to match in a path segment (e.g., `example.[0-9]` to match on `example.0`, `example.1`, …)
  # - `[!...]` to negate a range of characters to match in a path segment (e.g., `example.[!0-9]` to match on `example.a`, `example.b`, but not `example.0`)
  #
  # @since 3.17.0
  alias Pattern = String

  alias RegularExpressionEngineKind = String

  class TextDocumentColorPresentationOptions
    include JSON::Serializable

    @[JSON::Field(key: "workDoneProgress")]
    getter work_done_progress : Bool?

    # A document selector to identify the scope of the registration. If set to null
    # the document selector provided on the client side will be used.
    @[JSON::Field(key: "documentSelector")]
    getter document_selector : DocumentSelector?

    def initialize(
      @document_selector : DocumentSelector?,
      @work_done_progress : Bool? = nil,
    )
    end
  end

  class ResponseError
    include JSON::Serializable

    # A number indicating the error type that occurred.
    getter code : Int32
    # A string providing a short description of the error.
    getter message : String
    # A primitive or structured value that contains additional information about the error. Can be omitted.
    getter data : LSPAny?

    def initialize(@code : Int32, @message : String, @data : LSPAny? = nil)
    end
  end

  class ResponseErrorMessage
    include JSON::Serializable

    getter jsonrpc : String = "2.0"

    # The request id where the error occurred.
    getter id : Int32 | String

    # The error object in case a request fails.
    getter error : ResponseError?

    def initialize(@id : Int32 | String, @error : ResponseError? = nil)
    end
  end

  class ResponseMessage
    include JSON::Serializable

    getter jsonrpc : String = "2.0"

    # The request id where the error occurred.
    getter id : Int32 | String
    # The error object in case a request fails.

    @[JSON::Field(emit_null: true)]
    getter result : JSON::Any?

    def initialize(@id : Int32 | String, @result : JSON::Any? = nil)
    end
  end

  alias TextDocumentImplementationResult = Array(DefinitionLink) | Definition | Nil

  # A request to resolve the implementation locations of a symbol at a given text
  # document position. The request's parameter is of type `TextDocumentPositionParams`
  # the response is of type `Definition` or a Thenable that resolves to such.
  class TextDocumentImplementationRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : ImplementationParams

    # The method to be invoked.
    getter method : String = "textDocument/implementation"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : ImplementationParams)
    end
  end

  class TextDocumentImplementationResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentImplementationResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentImplementationResult)
    end
  end

  alias TextDocumentTypeDefinitionResult = Array(DefinitionLink) | Definition | Nil

  # A request to resolve the type definition locations of a symbol at a given text
  # document position. The request's parameter is of type `TextDocumentPositionParams`
  # the response is of type `Definition` or a Thenable that resolves to such.
  class TextDocumentTypeDefinitionRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : TypeDefinitionParams

    # The method to be invoked.
    getter method : String = "textDocument/typeDefinition"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : TypeDefinitionParams)
    end
  end

  class TextDocumentTypeDefinitionResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentTypeDefinitionResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentTypeDefinitionResult)
    end
  end

  alias WorkspaceWorkspaceFoldersResult = Array(WorkspaceFolder) | Nil

  # The `workspace/workspaceFolders` is sent from the server to the client to fetch the open workspace folders.
  class WorkspaceWorkspaceFoldersRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : Nil

    # The method to be invoked.
    getter method : String = "workspace/workspaceFolders"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : Nil)
    end
  end

  class WorkspaceWorkspaceFoldersResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : WorkspaceWorkspaceFoldersResult
    getter jsonrpc : String = "2.0"

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
    getter id : Int32 | String

    getter params : ConfigurationParams

    # The method to be invoked.
    getter method : String = "workspace/configuration"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : ConfigurationParams)
    end
  end

  class WorkspaceConfigurationResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : WorkspaceConfigurationResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : WorkspaceConfigurationResult)
    end
  end

  alias TextDocumentDocumentColorResult = Array(ColorInformation)

  # A request to list all color symbols found in a given text document. The request's
  # parameter is of type `DocumentColorParams` the
  # response is of type {@link ColorInformation ColorInformation[]} or a Thenable
  # that resolves to such.
  class TextDocumentDocumentColorRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : DocumentColorParams

    # The method to be invoked.
    getter method : String = "textDocument/documentColor"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DocumentColorParams)
    end
  end

  class TextDocumentDocumentColorResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentDocumentColorResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentDocumentColorResult)
    end
  end

  alias TextDocumentColorPresentationResult = Array(ColorPresentation)

  # A request to list all presentation for a color. The request's
  # parameter is of type `ColorPresentationParams` the
  # response is of type {@link ColorInformation ColorInformation[]} or a Thenable
  # that resolves to such.
  class TextDocumentColorPresentationRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : ColorPresentationParams

    # The method to be invoked.
    getter method : String = "textDocument/colorPresentation"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : ColorPresentationParams)
    end
  end

  class TextDocumentColorPresentationResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentColorPresentationResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentColorPresentationResult)
    end
  end

  alias TextDocumentFoldingRangeResult = Array(FoldingRange) | Nil

  # A request to provide folding ranges in a document. The request's
  # parameter is of type `FoldingRangeParams`, the
  # response is of type `FoldingRangeList` or a Thenable
  # that resolves to such.
  class TextDocumentFoldingRangeRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : FoldingRangeParams

    # The method to be invoked.
    getter method : String = "textDocument/foldingRange"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : FoldingRangeParams)
    end
  end

  class TextDocumentFoldingRangeResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentFoldingRangeResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentFoldingRangeResult)
    end
  end

  # @since 3.18.0
  # @proposed
  class WorkspaceFoldingRangeRefreshRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : Nil

    # The method to be invoked.
    getter method : String = "workspace/foldingRange/refresh"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : Nil)
    end
  end

  class WorkspaceFoldingRangeRefreshResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : Nil
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : Nil)
    end
  end

  alias TextDocumentDeclarationResult = Array(DeclarationLink) | Declaration | Nil

  # A request to resolve the type definition locations of a symbol at a given text
  # document position. The request's parameter is of type `TextDocumentPositionParams`
  # the response is of type `Declaration` or a typed array of `DeclarationLink`
  # or a Thenable that resolves to such.
  class TextDocumentDeclarationRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : DeclarationParams

    # The method to be invoked.
    getter method : String = "textDocument/declaration"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DeclarationParams)
    end
  end

  class TextDocumentDeclarationResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentDeclarationResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentDeclarationResult)
    end
  end

  alias TextDocumentSelectionRangeResult = Array(SelectionRange) | Nil

  # A request to provide selection ranges in a document. The request's
  # parameter is of type `SelectionRangeParams`, the
  # response is of type {@link SelectionRange SelectionRange[]} or a Thenable
  # that resolves to such.
  class TextDocumentSelectionRangeRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : SelectionRangeParams

    # The method to be invoked.
    getter method : String = "textDocument/selectionRange"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : SelectionRangeParams)
    end
  end

  class TextDocumentSelectionRangeResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentSelectionRangeResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentSelectionRangeResult)
    end
  end

  # The `window/workDoneProgress/create` request is sent from the server to the client to initiate progress
  # reporting from the server.
  class WindowWorkDoneProgressCreateRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : WorkDoneProgressCreateParams

    # The method to be invoked.
    getter method : String = "window/workDoneProgress/create"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : WorkDoneProgressCreateParams)
    end
  end

  class WindowWorkDoneProgressCreateResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : Nil
    getter jsonrpc : String = "2.0"

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
    getter id : Int32 | String

    getter params : CallHierarchyPrepareParams

    # The method to be invoked.
    getter method : String = "textDocument/prepareCallHierarchy"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : CallHierarchyPrepareParams)
    end
  end

  class TextDocumentPrepareCallHierarchyResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentPrepareCallHierarchyResult
    getter jsonrpc : String = "2.0"

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
    getter id : Int32 | String

    getter params : CallHierarchyIncomingCallsParams

    # The method to be invoked.
    getter method : String = "callHierarchy/incomingCalls"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : CallHierarchyIncomingCallsParams)
    end
  end

  class CallHierarchyIncomingCallsResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : CallHierarchyIncomingCallsResult
    getter jsonrpc : String = "2.0"

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
    getter id : Int32 | String

    getter params : CallHierarchyOutgoingCallsParams

    # The method to be invoked.
    getter method : String = "callHierarchy/outgoingCalls"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : CallHierarchyOutgoingCallsParams)
    end
  end

  class CallHierarchyOutgoingCallsResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : CallHierarchyOutgoingCallsResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : CallHierarchyOutgoingCallsResult)
    end
  end

  alias TextDocumentSemanticTokensFullResult = Nil | SemanticTokens

  # @since 3.16.0
  class TextDocumentSemanticTokensFullRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : SemanticTokensParams

    # The method to be invoked.
    getter method : String = "textDocument/semanticTokens/full"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : SemanticTokensParams)
    end
  end

  class TextDocumentSemanticTokensFullResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentSemanticTokensFullResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentSemanticTokensFullResult)
    end
  end

  alias TextDocumentSemanticTokensFullDeltaResult = Nil | SemanticTokens | SemanticTokensDelta

  # @since 3.16.0
  class TextDocumentSemanticTokensFullDeltaRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : SemanticTokensDeltaParams

    # The method to be invoked.
    getter method : String = "textDocument/semanticTokens/full/delta"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : SemanticTokensDeltaParams)
    end
  end

  class TextDocumentSemanticTokensFullDeltaResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentSemanticTokensFullDeltaResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentSemanticTokensFullDeltaResult)
    end
  end

  alias TextDocumentSemanticTokensRangeResult = Nil | SemanticTokens

  # @since 3.16.0
  class TextDocumentSemanticTokensRangeRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : SemanticTokensRangeParams

    # The method to be invoked.
    getter method : String = "textDocument/semanticTokens/range"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : SemanticTokensRangeParams)
    end
  end

  class TextDocumentSemanticTokensRangeResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentSemanticTokensRangeResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentSemanticTokensRangeResult)
    end
  end

  # @since 3.16.0
  class WorkspaceSemanticTokensRefreshRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : Nil

    # The method to be invoked.
    getter method : String = "workspace/semanticTokens/refresh"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : Nil)
    end
  end

  class WorkspaceSemanticTokensRefreshResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : Nil
    getter jsonrpc : String = "2.0"

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
    getter id : Int32 | String

    getter params : ShowDocumentParams

    # The method to be invoked.
    getter method : String = "window/showDocument"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : ShowDocumentParams)
    end
  end

  class WindowShowDocumentResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : ShowDocumentResult
    getter jsonrpc : String = "2.0"

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
    getter id : Int32 | String

    getter params : LinkedEditingRangeParams

    # The method to be invoked.
    getter method : String = "textDocument/linkedEditingRange"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : LinkedEditingRangeParams)
    end
  end

  class TextDocumentLinkedEditingRangeResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentLinkedEditingRangeResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentLinkedEditingRangeResult)
    end
  end

  alias WorkspaceWillCreateFilesResult = Nil | WorkspaceEdit

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
    getter id : Int32 | String

    getter params : CreateFilesParams

    # The method to be invoked.
    getter method : String = "workspace/willCreateFiles"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : CreateFilesParams)
    end
  end

  class WorkspaceWillCreateFilesResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : WorkspaceWillCreateFilesResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : WorkspaceWillCreateFilesResult)
    end
  end

  alias WorkspaceWillRenameFilesResult = Nil | WorkspaceEdit

  # The will rename files request is sent from the client to the server before files are actually
  # renamed as long as the rename is triggered from within the client.
  #
  # @since 3.16.0
  class WorkspaceWillRenameFilesRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : RenameFilesParams

    # The method to be invoked.
    getter method : String = "workspace/willRenameFiles"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : RenameFilesParams)
    end
  end

  class WorkspaceWillRenameFilesResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : WorkspaceWillRenameFilesResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : WorkspaceWillRenameFilesResult)
    end
  end

  alias WorkspaceWillDeleteFilesResult = Nil | WorkspaceEdit

  # The did delete files notification is sent from the client to the server when
  # files were deleted from within the client.
  #
  # @since 3.16.0
  class WorkspaceWillDeleteFilesRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : DeleteFilesParams

    # The method to be invoked.
    getter method : String = "workspace/willDeleteFiles"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DeleteFilesParams)
    end
  end

  class WorkspaceWillDeleteFilesResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : WorkspaceWillDeleteFilesResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : WorkspaceWillDeleteFilesResult)
    end
  end

  alias TextDocumentMonikerResult = Array(Moniker) | Nil

  # A request to get the moniker of a symbol at a given text document position.
  # The request parameter is of type `TextDocumentPositionParams`.
  # The response is of type {@link Moniker Moniker[]} or `null`.
  class TextDocumentMonikerRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : MonikerParams

    # The method to be invoked.
    getter method : String = "textDocument/moniker"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : MonikerParams)
    end
  end

  class TextDocumentMonikerResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentMonikerResult
    getter jsonrpc : String = "2.0"

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
    getter id : Int32 | String

    getter params : TypeHierarchyPrepareParams

    # The method to be invoked.
    getter method : String = "textDocument/prepareTypeHierarchy"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : TypeHierarchyPrepareParams)
    end
  end

  class TextDocumentPrepareTypeHierarchyResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentPrepareTypeHierarchyResult
    getter jsonrpc : String = "2.0"

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
    getter id : Int32 | String

    getter params : TypeHierarchySupertypesParams

    # The method to be invoked.
    getter method : String = "typeHierarchy/supertypes"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : TypeHierarchySupertypesParams)
    end
  end

  class TypeHierarchySupertypesResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TypeHierarchySupertypesResult
    getter jsonrpc : String = "2.0"

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
    getter id : Int32 | String

    getter params : TypeHierarchySubtypesParams

    # The method to be invoked.
    getter method : String = "typeHierarchy/subtypes"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : TypeHierarchySubtypesParams)
    end
  end

  class TypeHierarchySubtypesResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TypeHierarchySubtypesResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TypeHierarchySubtypesResult)
    end
  end

  alias TextDocumentInlineValueResult = Array(InlineValue) | Nil

  # A request to provide inline values in a document. The request's parameter is of
  # type `InlineValueParams`, the response is of type
  # {@link InlineValue InlineValue[]} or a Thenable that resolves to such.
  #
  # @since 3.17.0
  class TextDocumentInlineValueRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : InlineValueParams

    # The method to be invoked.
    getter method : String = "textDocument/inlineValue"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : InlineValueParams)
    end
  end

  class TextDocumentInlineValueResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentInlineValueResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentInlineValueResult)
    end
  end

  # @since 3.17.0
  class WorkspaceInlineValueRefreshRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : Nil

    # The method to be invoked.
    getter method : String = "workspace/inlineValue/refresh"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : Nil)
    end
  end

  class WorkspaceInlineValueRefreshResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : Nil
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : Nil)
    end
  end

  alias TextDocumentInlayHintResult = Array(InlayHint) | Nil

  # A request to provide inlay hints in a document. The request's parameter is of
  # type `InlayHintsParams`, the response is of type
  # {@link InlayHint InlayHint[]} or a Thenable that resolves to such.
  #
  # @since 3.17.0
  class TextDocumentInlayHintRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : InlayHintParams

    # The method to be invoked.
    getter method : String = "textDocument/inlayHint"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : InlayHintParams)
    end
  end

  class TextDocumentInlayHintResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentInlayHintResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentInlayHintResult)
    end
  end

  # A request to resolve additional properties for an inlay hint.
  # The request's parameter is of type `InlayHint`, the response is
  # of type `InlayHint` or a Thenable that resolves to such.
  #
  # @since 3.17.0
  class InlayHintResolveRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : InlayHint

    # The method to be invoked.
    getter method : String = "inlayHint/resolve"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : InlayHint)
    end
  end

  class InlayHintResolveResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : InlayHint
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : InlayHint)
    end
  end

  # @since 3.17.0
  class WorkspaceInlayHintRefreshRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : Nil

    # The method to be invoked.
    getter method : String = "workspace/inlayHint/refresh"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : Nil)
    end
  end

  class WorkspaceInlayHintRefreshResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : Nil
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : Nil)
    end
  end

  # The document diagnostic request definition.
  #
  # @since 3.17.0
  class TextDocumentDiagnosticRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : DocumentDiagnosticParams

    # The method to be invoked.
    getter method : String = "textDocument/diagnostic"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DocumentDiagnosticParams)
    end
  end

  class TextDocumentDiagnosticResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : DocumentDiagnosticReport
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : DocumentDiagnosticReport)
    end
  end

  # The workspace diagnostic request definition.
  #
  # @since 3.17.0
  class WorkspaceDiagnosticRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : WorkspaceDiagnosticParams

    # The method to be invoked.
    getter method : String = "workspace/diagnostic"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : WorkspaceDiagnosticParams)
    end
  end

  class WorkspaceDiagnosticResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : WorkspaceDiagnosticReport
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : WorkspaceDiagnosticReport)
    end
  end

  # The diagnostic refresh request definition.
  #
  # @since 3.17.0
  class WorkspaceDiagnosticRefreshRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : Nil

    # The method to be invoked.
    getter method : String = "workspace/diagnostic/refresh"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : Nil)
    end
  end

  class WorkspaceDiagnosticRefreshResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : Nil
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : Nil)
    end
  end

  alias TextDocumentInlineCompletionResult = Array(InlineCompletionItem) | InlineCompletionList | Nil

  # A request to provide inline completions in a document. The request's parameter is of
  # type `InlineCompletionParams`, the response is of type
  # {@link InlineCompletion InlineCompletion[]} or a Thenable that resolves to such.
  #
  # @since 3.18.0
  # @proposed
  class TextDocumentInlineCompletionRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : InlineCompletionParams

    # The method to be invoked.
    getter method : String = "textDocument/inlineCompletion"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : InlineCompletionParams)
    end
  end

  class TextDocumentInlineCompletionResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentInlineCompletionResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentInlineCompletionResult)
    end
  end

  # The `client/registerCapability` request is sent from the server to the client to register a new capability
  # handler on the client side.
  class ClientRegisterCapabilityRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : RegistrationParams

    # The method to be invoked.
    getter method : String = "client/registerCapability"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : RegistrationParams)
    end
  end

  class ClientRegisterCapabilityResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : Nil
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : Nil)
    end
  end

  # The `client/unregisterCapability` request is sent from the server to the client to unregister a previously registered capability
  # handler on the client side.
  class ClientUnregisterCapabilityRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : UnregistrationParams

    # The method to be invoked.
    getter method : String = "client/unregisterCapability"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : UnregistrationParams)
    end
  end

  class ClientUnregisterCapabilityResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : Nil
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : Nil)
    end
  end

  # The initialize request is sent from the client to the server.
  # It is sent once as the request after starting up the server.
  # The requests parameter is of type `InitializeParams`
  # the response if of type `InitializeResult` of a Thenable that
  # resolves to such.
  class InitializeRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : InitializeParams

    # The method to be invoked.
    getter method : String = "initialize"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : InitializeParams)
    end
  end

  class InitializeResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : InitializeResult
    getter jsonrpc : String = "2.0"

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
    getter id : Int32 | String

    getter params : Nil

    # The method to be invoked.
    getter method : String = "shutdown"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : Nil)
    end
  end

  class ShutdownResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : Nil
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : Nil)
    end
  end

  alias WindowShowMessageRequestResult = MessageActionItem | Nil

  # The show message request is sent from the server to the client to show a message
  # and a set of options actions to the user.
  class WindowShowMessageRequestRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : ShowMessageRequestParams

    # The method to be invoked.
    getter method : String = "window/showMessageRequest"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : ShowMessageRequestParams)
    end
  end

  class WindowShowMessageRequestResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : WindowShowMessageRequestResult
    getter jsonrpc : String = "2.0"

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
    getter id : Int32 | String

    getter params : WillSaveTextDocumentParams

    # The method to be invoked.
    getter method : String = "textDocument/willSaveWaitUntil"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : WillSaveTextDocumentParams)
    end
  end

  class TextDocumentWillSaveWaitUntilResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentWillSaveWaitUntilResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentWillSaveWaitUntilResult)
    end
  end

  alias TextDocumentCompletionResult = Array(CompletionItem) | CompletionList | Nil

  # Request to request completion at a given text document position. The request's
  # parameter is of type `TextDocumentPosition` the response
  # is of type {@link CompletionItem CompletionItem[]} or `CompletionList`
  # or a Thenable that resolves to such.
  #
  # The request can delay the computation of the `CompletionItem#detail`
  # and `CompletionItem#documentation` properties to the `completionItem/resolve`
  # request. However, properties that are needed for the initial sorting and filtering, like `sortText`,
  # `filterText`, `insertText`, and `textEdit`, must not be changed during resolve.
  class TextDocumentCompletionRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : CompletionParams

    # The method to be invoked.
    getter method : String = "textDocument/completion"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : CompletionParams)
    end
  end

  class TextDocumentCompletionResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentCompletionResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentCompletionResult)
    end
  end

  # Request to resolve additional information for a given completion item.The request's
  # parameter is of type `CompletionItem` the response
  # is of type `CompletionItem` or a Thenable that resolves to such.
  class CompletionItemResolveRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : CompletionItem

    # The method to be invoked.
    getter method : String = "completionItem/resolve"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : CompletionItem)
    end
  end

  class CompletionItemResolveResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : CompletionItem
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : CompletionItem)
    end
  end

  alias TextDocumentHoverResult = Hover | Nil

  # Request to request hover information at a given text document position. The request's
  # parameter is of type `TextDocumentPosition` the response is of
  # type `Hover` or a Thenable that resolves to such.
  class TextDocumentHoverRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : HoverParams

    # The method to be invoked.
    getter method : String = "textDocument/hover"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : HoverParams)
    end
  end

  class TextDocumentHoverResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentHoverResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentHoverResult)
    end
  end

  alias TextDocumentSignatureHelpResult = Nil | SignatureHelp

  #
  class TextDocumentSignatureHelpRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : SignatureHelpParams

    # The method to be invoked.
    getter method : String = "textDocument/signatureHelp"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : SignatureHelpParams)
    end
  end

  class TextDocumentSignatureHelpResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentSignatureHelpResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentSignatureHelpResult)
    end
  end

  alias TextDocumentDefinitionResult = Array(DefinitionLink) | Definition | Nil

  # A request to resolve the definition location of a symbol at a given text
  # document position. The request's parameter is of type `TextDocumentPosition`
  # the response is of either type `Definition` or a typed array of
  # `DefinitionLink` or a Thenable that resolves to such.
  class TextDocumentDefinitionRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : DefinitionParams

    # The method to be invoked.
    getter method : String = "textDocument/definition"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DefinitionParams)
    end
  end

  class TextDocumentDefinitionResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentDefinitionResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentDefinitionResult)
    end
  end

  alias TextDocumentReferencesResult = Array(Location) | Nil

  # A request to resolve project-wide references for the symbol denoted
  # by the given text document position. The request's parameter is of
  # type `ReferenceParams` the response is of type
  # {@link Location Location[]} or a Thenable that resolves to such.
  class TextDocumentReferencesRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : ReferenceParams

    # The method to be invoked.
    getter method : String = "textDocument/references"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : ReferenceParams)
    end
  end

  class TextDocumentReferencesResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentReferencesResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentReferencesResult)
    end
  end

  alias TextDocumentDocumentHighlightResult = Array(DocumentHighlight) | Nil

  # Request to resolve a `DocumentHighlight` for a given
  # text document position. The request's parameter is of type `TextDocumentPosition`
  # the request response is an array of type `DocumentHighlight`
  # or a Thenable that resolves to such.
  class TextDocumentDocumentHighlightRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : DocumentHighlightParams

    # The method to be invoked.
    getter method : String = "textDocument/documentHighlight"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DocumentHighlightParams)
    end
  end

  class TextDocumentDocumentHighlightResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentDocumentHighlightResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentDocumentHighlightResult)
    end
  end

  alias TextDocumentDocumentSymbolResult = Array(DocumentSymbol) | Array(SymbolInformation) | Nil

  # A request to list all symbols found in a given text document. The request's
  # parameter is of type `TextDocumentIdentifier` the
  # response is of type {@link SymbolInformation SymbolInformation[]} or a Thenable
  # that resolves to such.
  class TextDocumentDocumentSymbolRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : DocumentSymbolParams

    # The method to be invoked.
    getter method : String = "textDocument/documentSymbol"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DocumentSymbolParams)
    end
  end

  class TextDocumentDocumentSymbolResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentDocumentSymbolResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentDocumentSymbolResult)
    end
  end

  alias TextDocumentCodeActionResult = Array(CodeAction | Command) | Nil

  # A request to provide commands for the given text document and range.
  class TextDocumentCodeActionRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : CodeActionParams

    # The method to be invoked.
    getter method : String = "textDocument/codeAction"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : CodeActionParams)
    end
  end

  class TextDocumentCodeActionResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentCodeActionResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentCodeActionResult)
    end
  end

  # Request to resolve additional information for a given code action.The request's
  # parameter is of type `CodeAction` the response
  # is of type `CodeAction` or a Thenable that resolves to such.
  class CodeActionResolveRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : CodeAction

    # The method to be invoked.
    getter method : String = "codeAction/resolve"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : CodeAction)
    end
  end

  class CodeActionResolveResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : CodeAction
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : CodeAction)
    end
  end

  alias WorkspaceSymbolResult = Array(SymbolInformation) | Array(WorkspaceSymbol) | Nil

  # A request to list project-wide symbols matching the query string given
  # by the `WorkspaceSymbolParams`. The response is
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
    getter id : Int32 | String

    getter params : WorkspaceSymbolParams

    # The method to be invoked.
    getter method : String = "workspace/symbol"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : WorkspaceSymbolParams)
    end
  end

  class WorkspaceSymbolResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : WorkspaceSymbolResult
    getter jsonrpc : String = "2.0"

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
    getter id : Int32 | String

    getter params : WorkspaceSymbol

    # The method to be invoked.
    getter method : String = "workspaceSymbol/resolve"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : WorkspaceSymbol)
    end
  end

  class WorkspaceSymbolResolveResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : WorkspaceSymbol
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : WorkspaceSymbol)
    end
  end

  alias TextDocumentCodeLensResult = Array(CodeLens) | Nil

  # A request to provide code lens for the given text document.
  class TextDocumentCodeLensRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : CodeLensParams

    # The method to be invoked.
    getter method : String = "textDocument/codeLens"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : CodeLensParams)
    end
  end

  class TextDocumentCodeLensResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentCodeLensResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentCodeLensResult)
    end
  end

  # A request to resolve a command for a given code lens.
  class CodeLensResolveRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : CodeLens

    # The method to be invoked.
    getter method : String = "codeLens/resolve"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : CodeLens)
    end
  end

  class CodeLensResolveResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : CodeLens
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : CodeLens)
    end
  end

  # A request to refresh all code actions
  #
  # @since 3.16.0
  class WorkspaceCodeLensRefreshRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : Nil

    # The method to be invoked.
    getter method : String = "workspace/codeLens/refresh"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : Nil)
    end
  end

  class WorkspaceCodeLensRefreshResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : Nil
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : Nil)
    end
  end

  alias TextDocumentDocumentLinkResult = Array(DocumentLink) | Nil

  # A request to provide document links
  class TextDocumentDocumentLinkRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : DocumentLinkParams

    # The method to be invoked.
    getter method : String = "textDocument/documentLink"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DocumentLinkParams)
    end
  end

  class TextDocumentDocumentLinkResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentDocumentLinkResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentDocumentLinkResult)
    end
  end

  # Request to resolve additional information for a given document link. The request's
  # parameter is of type `DocumentLink` the response
  # is of type `DocumentLink` or a Thenable that resolves to such.
  class DocumentLinkResolveRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : DocumentLink

    # The method to be invoked.
    getter method : String = "documentLink/resolve"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DocumentLink)
    end
  end

  class DocumentLinkResolveResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : DocumentLink
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : DocumentLink)
    end
  end

  alias TextDocumentFormattingResult = Array(TextEdit) | Nil

  # A request to format a whole document.
  class TextDocumentFormattingRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : DocumentFormattingParams

    # The method to be invoked.
    getter method : String = "textDocument/formatting"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DocumentFormattingParams)
    end
  end

  class TextDocumentFormattingResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentFormattingResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentFormattingResult)
    end
  end

  alias TextDocumentRangeFormattingResult = Array(TextEdit) | Nil

  # A request to format a range in a document.
  class TextDocumentRangeFormattingRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : DocumentRangeFormattingParams

    # The method to be invoked.
    getter method : String = "textDocument/rangeFormatting"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DocumentRangeFormattingParams)
    end
  end

  class TextDocumentRangeFormattingResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentRangeFormattingResult
    getter jsonrpc : String = "2.0"

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
    getter id : Int32 | String

    getter params : DocumentRangesFormattingParams

    # The method to be invoked.
    getter method : String = "textDocument/rangesFormatting"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DocumentRangesFormattingParams)
    end
  end

  class TextDocumentRangesFormattingResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentRangesFormattingResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentRangesFormattingResult)
    end
  end

  alias TextDocumentOnTypeFormattingResult = Array(TextEdit) | Nil

  # A request to format a document on type.
  class TextDocumentOnTypeFormattingRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : DocumentOnTypeFormattingParams

    # The method to be invoked.
    getter method : String = "textDocument/onTypeFormatting"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : DocumentOnTypeFormattingParams)
    end
  end

  class TextDocumentOnTypeFormattingResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentOnTypeFormattingResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentOnTypeFormattingResult)
    end
  end

  alias TextDocumentRenameResult = Nil | WorkspaceEdit

  # A request to rename a symbol.
  class TextDocumentRenameRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : RenameParams

    # The method to be invoked.
    getter method : String = "textDocument/rename"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : RenameParams)
    end
  end

  class TextDocumentRenameResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentRenameResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentRenameResult)
    end
  end

  alias TextDocumentPrepareRenameResult = Nil | PrepareRenameResult

  # A request to test and perform the setup necessary for a rename.
  #
  # @since 3.16 - support for default behavior
  class TextDocumentPrepareRenameRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : PrepareRenameParams

    # The method to be invoked.
    getter method : String = "textDocument/prepareRename"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : PrepareRenameParams)
    end
  end

  class TextDocumentPrepareRenameResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : TextDocumentPrepareRenameResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : TextDocumentPrepareRenameResult)
    end
  end

  alias WorkspaceExecuteCommandResult = LSPAny | Nil

  # A request send from the client to the server to execute a command. The request might return
  # a workspace edit which the client will apply to the workspace.
  class WorkspaceExecuteCommandRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : ExecuteCommandParams

    # The method to be invoked.
    getter method : String = "workspace/executeCommand"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : ExecuteCommandParams)
    end
  end

  class WorkspaceExecuteCommandResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : WorkspaceExecuteCommandResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : WorkspaceExecuteCommandResult)
    end
  end

  # A request sent from the server to the client to modified certain resources.
  class WorkspaceApplyEditRequest
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String

    getter params : ApplyWorkspaceEditParams

    # The method to be invoked.
    getter method : String = "workspace/applyEdit"

    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @params : ApplyWorkspaceEditParams)
    end
  end

  class WorkspaceApplyEditResponse
    include JSON::Serializable

    # The request id.
    getter id : Int32 | String?
    getter result : ApplyWorkspaceEditResult
    getter jsonrpc : String = "2.0"

    def initialize(@id : Int32 | String, @result : ApplyWorkspaceEditResult)
    end
  end

  # The `workspace/didChangeWorkspaceFolders` notification is sent from the client to the server when the workspace
  # folder configuration changes.
  class WorkspaceDidChangeWorkspaceFoldersNotification
    include JSON::Serializable

    getter id : Int32 | String?
    getter params : DidChangeWorkspaceFoldersParams
    # The method to be invoked.
    getter method : String = "workspace/didChangeWorkspaceFolders"
    getter jsonrpc : String = "2.0"

    def initialize(@params : DidChangeWorkspaceFoldersParams)
    end
  end

  # The `window/workDoneProgress/cancel` notification is sent from  the client to the server to cancel a progress
  # initiated on the server side.
  class WindowWorkDoneProgressCancelNotification
    include JSON::Serializable

    getter id : Int32 | String?
    getter params : WorkDoneProgressCancelParams
    # The method to be invoked.
    getter method : String = "window/workDoneProgress/cancel"
    getter jsonrpc : String = "2.0"

    def initialize(@params : WorkDoneProgressCancelParams)
    end
  end

  # The did create files notification is sent from the client to the server when
  # files were created from within the client.
  #
  # @since 3.16.0
  class WorkspaceDidCreateFilesNotification
    include JSON::Serializable

    getter id : Int32 | String?
    getter params : CreateFilesParams
    # The method to be invoked.
    getter method : String = "workspace/didCreateFiles"
    getter jsonrpc : String = "2.0"

    def initialize(@params : CreateFilesParams)
    end
  end

  # The did rename files notification is sent from the client to the server when
  # files were renamed from within the client.
  #
  # @since 3.16.0
  class WorkspaceDidRenameFilesNotification
    include JSON::Serializable

    getter id : Int32 | String?
    getter params : RenameFilesParams
    # The method to be invoked.
    getter method : String = "workspace/didRenameFiles"
    getter jsonrpc : String = "2.0"

    def initialize(@params : RenameFilesParams)
    end
  end

  # The will delete files request is sent from the client to the server before files are actually
  # deleted as long as the deletion is triggered from within the client.
  #
  # @since 3.16.0
  class WorkspaceDidDeleteFilesNotification
    include JSON::Serializable

    getter id : Int32 | String?
    getter params : DeleteFilesParams
    # The method to be invoked.
    getter method : String = "workspace/didDeleteFiles"
    getter jsonrpc : String = "2.0"

    def initialize(@params : DeleteFilesParams)
    end
  end

  # A notification sent when a notebook opens.
  #
  # @since 3.17.0
  class NotebookDocumentDidOpenNotification
    include JSON::Serializable

    getter id : Int32 | String?
    getter params : DidOpenNotebookDocumentParams
    # The method to be invoked.
    getter method : String = "notebookDocument/didOpen"
    getter jsonrpc : String = "2.0"

    def initialize(@params : DidOpenNotebookDocumentParams)
    end
  end

  #
  class NotebookDocumentDidChangeNotification
    include JSON::Serializable

    getter id : Int32 | String?
    getter params : DidChangeNotebookDocumentParams
    # The method to be invoked.
    getter method : String = "notebookDocument/didChange"
    getter jsonrpc : String = "2.0"

    def initialize(@params : DidChangeNotebookDocumentParams)
    end
  end

  # A notification sent when a notebook document is saved.
  #
  # @since 3.17.0
  class NotebookDocumentDidSaveNotification
    include JSON::Serializable

    getter id : Int32 | String?
    getter params : DidSaveNotebookDocumentParams
    # The method to be invoked.
    getter method : String = "notebookDocument/didSave"
    getter jsonrpc : String = "2.0"

    def initialize(@params : DidSaveNotebookDocumentParams)
    end
  end

  # A notification sent when a notebook closes.
  #
  # @since 3.17.0
  class NotebookDocumentDidCloseNotification
    include JSON::Serializable

    getter id : Int32 | String?
    getter params : DidCloseNotebookDocumentParams
    # The method to be invoked.
    getter method : String = "notebookDocument/didClose"
    getter jsonrpc : String = "2.0"

    def initialize(@params : DidCloseNotebookDocumentParams)
    end
  end

  # The initialized notification is sent from the client to the
  # server after the client is fully initialized and the server
  # is allowed to send requests from the server to the client.
  class InitializedNotification
    include JSON::Serializable

    getter id : Int32 | String?
    getter params : InitializedParams
    # The method to be invoked.
    getter method : String = "initialized"
    getter jsonrpc : String = "2.0"

    def initialize(@params : InitializedParams)
    end
  end

  # The exit event is sent from the client to the server to
  # ask the server to exit its process.
  class ExitNotification
    include JSON::Serializable

    getter id : Int32 | String?
    getter params : Nil
    # The method to be invoked.
    getter method : String = "exit"
    getter jsonrpc : String = "2.0"

    def initialize(@params : Nil)
    end
  end

  # The configuration change notification is sent from the client to the server
  # when the client's configuration has changed. The notification contains
  # the changed configuration as defined by the language client.
  class WorkspaceDidChangeConfigurationNotification
    include JSON::Serializable

    getter id : Int32 | String?
    getter params : DidChangeConfigurationParams
    # The method to be invoked.
    getter method : String = "workspace/didChangeConfiguration"
    getter jsonrpc : String = "2.0"

    def initialize(@params : DidChangeConfigurationParams)
    end
  end

  # The show message notification is sent from a server to a client to ask
  # the client to display a particular message in the user interface.
  class WindowShowMessageNotification
    include JSON::Serializable

    getter id : Int32 | String?
    getter params : ShowMessageParams
    # The method to be invoked.
    getter method : String = "window/showMessage"
    getter jsonrpc : String = "2.0"

    def initialize(@params : ShowMessageParams)
    end
  end

  # The log message notification is sent from the server to the client to ask
  # the client to log a particular message.
  class WindowLogMessageNotification
    include JSON::Serializable

    getter id : Int32 | String?
    getter params : LogMessageParams
    # The method to be invoked.
    getter method : String = "window/logMessage"
    getter jsonrpc : String = "2.0"

    def initialize(@params : LogMessageParams)
    end
  end

  # The telemetry event notification is sent from the server to the client to ask
  # the client to log telemetry data.
  class TelemetryEventNotification
    include JSON::Serializable

    getter id : Int32 | String?
    getter params : LSPAny
    # The method to be invoked.
    getter method : String = "telemetry/event"
    getter jsonrpc : String = "2.0"

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

    getter id : Int32 | String?
    getter params : DidOpenTextDocumentParams
    # The method to be invoked.
    getter method : String = "textDocument/didOpen"
    getter jsonrpc : String = "2.0"

    def initialize(@params : DidOpenTextDocumentParams)
    end
  end

  # The document change notification is sent from the client to the server to signal
  # changes to a text document.
  class TextDocumentDidChangeNotification
    include JSON::Serializable

    getter id : Int32 | String?
    getter params : DidChangeTextDocumentParams
    # The method to be invoked.
    getter method : String = "textDocument/didChange"
    getter jsonrpc : String = "2.0"

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

    getter id : Int32 | String?
    getter params : DidCloseTextDocumentParams
    # The method to be invoked.
    getter method : String = "textDocument/didClose"
    getter jsonrpc : String = "2.0"

    def initialize(@params : DidCloseTextDocumentParams)
    end
  end

  # The document save notification is sent from the client to the server when
  # the document got saved in the client.
  class TextDocumentDidSaveNotification
    include JSON::Serializable

    getter id : Int32 | String?
    getter params : DidSaveTextDocumentParams
    # The method to be invoked.
    getter method : String = "textDocument/didSave"
    getter jsonrpc : String = "2.0"

    def initialize(@params : DidSaveTextDocumentParams)
    end
  end

  # A document will save notification is sent from the client to the server before
  # the document is actually saved.
  class TextDocumentWillSaveNotification
    include JSON::Serializable

    getter id : Int32 | String?
    getter params : WillSaveTextDocumentParams
    # The method to be invoked.
    getter method : String = "textDocument/willSave"
    getter jsonrpc : String = "2.0"

    def initialize(@params : WillSaveTextDocumentParams)
    end
  end

  # The watched files notification is sent from the client to the server when
  # the client detects changes to file watched by the language client.
  class WorkspaceDidChangeWatchedFilesNotification
    include JSON::Serializable

    getter id : Int32 | String?
    getter params : DidChangeWatchedFilesParams
    # The method to be invoked.
    getter method : String = "workspace/didChangeWatchedFiles"
    getter jsonrpc : String = "2.0"

    def initialize(@params : DidChangeWatchedFilesParams)
    end
  end

  # Diagnostics notification are sent from the server to the client to signal
  # results of validation runs.
  class TextDocumentPublishDiagnosticsNotification
    include JSON::Serializable

    getter id : Int32 | String?
    getter params : PublishDiagnosticsParams
    # The method to be invoked.
    getter method : String = "textDocument/publishDiagnostics"
    getter jsonrpc : String = "2.0"

    def initialize(@params : PublishDiagnosticsParams)
    end
  end

  #
  class SetTraceNotification
    include JSON::Serializable

    getter id : Int32 | String?
    getter params : SetTraceParams
    # The method to be invoked.
    getter method : String = "$/setTrace"
    getter jsonrpc : String = "2.0"

    def initialize(@params : SetTraceParams)
    end
  end

  #
  class LogTraceNotification
    include JSON::Serializable

    getter id : Int32 | String?
    getter params : LogTraceParams
    # The method to be invoked.
    getter method : String = "$/logTrace"
    getter jsonrpc : String = "2.0"

    def initialize(@params : LogTraceParams)
    end
  end

  #
  class CancelRequestNotification
    include JSON::Serializable

    getter id : Int32 | String?
    getter params : CancelParams
    # The method to be invoked.
    getter method : String = "$/cancelRequest"
    getter jsonrpc : String = "2.0"

    def initialize(@params : CancelParams)
    end
  end

  #
  class ProgressNotification
    include JSON::Serializable

    getter id : Int32 | String?
    getter params : ProgressParams
    # The method to be invoked.
    getter method : String = "$/progress"
    getter jsonrpc : String = "2.0"

    def initialize(@params : ProgressParams)
    end
  end

  enum MessageDirection
    Both
    ClientToServer
    ServerToClient

    def self.new(pull : JSON::PullParser) : self
      self.from_json(pull)
    end

    def self.from_json(pull : JSON::PullParser) : self
      case pull.kind
      when .int?
        from_value(pull.read_int)
      when .string?
        parse(pull.read_string)
      else
        {% if @type.annotation(Flags) %}
          pull.raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
        {% else %}
          pull.raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
        {% end %}
      end
    end

    def to_json(builder : JSON::Builder)
      builder.string self.to_s
    end

    def to_s(io : IO) : Nil
      io << self.to_s
    end

    def self.parse(string : String) : self
      case string
      when "clientToServer"
        return self.new(ClientToServer)
      when "serverToClient"
        return self.new(ServerToClient)
      when "both"
        return self.new(Both)
      end

      super
    end

    def to_s : String
      case self
      when ClientToServer
        return "clientToServer"
      when ServerToClient
        return "serverToClient"
      when Both
        return "both"
      end

      super
    end
  end
end
