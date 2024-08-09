// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

#[cfg(test)]
mod tests {
    use glob::glob;
    use lsprotocol::*;
    use serde::Deserialize;
    use std::fs;

    fn get_all_json_files(root: &str) -> Vec<String> {
        let pattern = format!("{}/*.json", root);
        glob(&pattern)
            .expect("Failed to read glob pattern")
            .filter_map(Result::ok)
            .map(|path| path.to_str().unwrap().to_string())
            .collect()
    }

    fn validate_type<T: for<'de> Deserialize<'de>>(result_type: &str, data: &str) {
        match serde_json::from_str::<T>(data) {
            Ok(_) => assert_eq!(
                result_type, "True",
                "Expected error, but succeeded deserializing:\r\n{}",
                data
            ),
            Err(e) => assert_eq!(
                result_type,
                "False",
                "Expected success, but failed deserializing: {}\r\nJSON data:\r\n{}",
                e.to_string(),
                data
            ),
        }
    }

    fn validate(lsp_type: &str, result_type: &str, data: &str) {
        println!("Validating: {}", lsp_type);
        match lsp_type {
            // Sample Generated Code:
            // "CallHierarchyIncomingCallsRequest" => {
            //     return validate_type::<CallHierarchyIncomingCallsRequest>(result_type, data)
            // }
            // GENERATED_TEST_CODE:start
            "ImplementationRequest" => {
                return validate_type::<ImplementationRequest>(result_type, data)
            }
            "TypeDefinitionRequest" => {
                return validate_type::<TypeDefinitionRequest>(result_type, data)
            }
            "WorkspaceFoldersRequest" => {
                return validate_type::<WorkspaceFoldersRequest>(result_type, data)
            }
            "ConfigurationRequest" => {
                return validate_type::<ConfigurationRequest>(result_type, data)
            }
            "DocumentColorRequest" => {
                return validate_type::<DocumentColorRequest>(result_type, data)
            }
            "ColorPresentationRequest" => {
                return validate_type::<ColorPresentationRequest>(result_type, data)
            }
            "FoldingRangeRequest" => {
                return validate_type::<FoldingRangeRequest>(result_type, data)
            }
            "FoldingRangeRefreshRequest" => {
                return validate_type::<FoldingRangeRefreshRequest>(result_type, data)
            }
            "DeclarationRequest" => return validate_type::<DeclarationRequest>(result_type, data),
            "SelectionRangeRequest" => {
                return validate_type::<SelectionRangeRequest>(result_type, data)
            }
            "WorkDoneProgressCreateRequest" => {
                return validate_type::<WorkDoneProgressCreateRequest>(result_type, data)
            }
            "CallHierarchyPrepareRequest" => {
                return validate_type::<CallHierarchyPrepareRequest>(result_type, data)
            }
            "CallHierarchyIncomingCallsRequest" => {
                return validate_type::<CallHierarchyIncomingCallsRequest>(result_type, data)
            }
            "CallHierarchyOutgoingCallsRequest" => {
                return validate_type::<CallHierarchyOutgoingCallsRequest>(result_type, data)
            }
            "SemanticTokensRequest" => {
                return validate_type::<SemanticTokensRequest>(result_type, data)
            }
            "SemanticTokensDeltaRequest" => {
                return validate_type::<SemanticTokensDeltaRequest>(result_type, data)
            }
            "SemanticTokensRangeRequest" => {
                return validate_type::<SemanticTokensRangeRequest>(result_type, data)
            }
            "SemanticTokensRefreshRequest" => {
                return validate_type::<SemanticTokensRefreshRequest>(result_type, data)
            }
            "ShowDocumentRequest" => {
                return validate_type::<ShowDocumentRequest>(result_type, data)
            }
            "LinkedEditingRangeRequest" => {
                return validate_type::<LinkedEditingRangeRequest>(result_type, data)
            }
            "WillCreateFilesRequest" => {
                return validate_type::<WillCreateFilesRequest>(result_type, data)
            }
            "WillRenameFilesRequest" => {
                return validate_type::<WillRenameFilesRequest>(result_type, data)
            }
            "WillDeleteFilesRequest" => {
                return validate_type::<WillDeleteFilesRequest>(result_type, data)
            }
            "MonikerRequest" => return validate_type::<MonikerRequest>(result_type, data),
            "TypeHierarchyPrepareRequest" => {
                return validate_type::<TypeHierarchyPrepareRequest>(result_type, data)
            }
            "TypeHierarchySupertypesRequest" => {
                return validate_type::<TypeHierarchySupertypesRequest>(result_type, data)
            }
            "TypeHierarchySubtypesRequest" => {
                return validate_type::<TypeHierarchySubtypesRequest>(result_type, data)
            }
            "InlineValueRequest" => return validate_type::<InlineValueRequest>(result_type, data),
            "InlineValueRefreshRequest" => {
                return validate_type::<InlineValueRefreshRequest>(result_type, data)
            }
            "InlayHintRequest" => return validate_type::<InlayHintRequest>(result_type, data),
            "InlayHintResolveRequest" => {
                return validate_type::<InlayHintResolveRequest>(result_type, data)
            }
            "InlayHintRefreshRequest" => {
                return validate_type::<InlayHintRefreshRequest>(result_type, data)
            }
            "DocumentDiagnosticRequest" => {
                return validate_type::<DocumentDiagnosticRequest>(result_type, data)
            }
            "WorkspaceDiagnosticRequest" => {
                return validate_type::<WorkspaceDiagnosticRequest>(result_type, data)
            }
            "DiagnosticRefreshRequest" => {
                return validate_type::<DiagnosticRefreshRequest>(result_type, data)
            }
            "InlineCompletionRequest" => {
                return validate_type::<InlineCompletionRequest>(result_type, data)
            }
            "RegistrationRequest" => {
                return validate_type::<RegistrationRequest>(result_type, data)
            }
            "UnregistrationRequest" => {
                return validate_type::<UnregistrationRequest>(result_type, data)
            }
            "InitializeRequest" => return validate_type::<InitializeRequest>(result_type, data),
            "ShutdownRequest" => return validate_type::<ShutdownRequest>(result_type, data),
            "ShowMessageRequest" => return validate_type::<ShowMessageRequest>(result_type, data),
            "WillSaveTextDocumentWaitUntilRequest" => {
                return validate_type::<WillSaveTextDocumentWaitUntilRequest>(result_type, data)
            }
            "CompletionRequest" => return validate_type::<CompletionRequest>(result_type, data),
            "CompletionResolveRequest" => {
                return validate_type::<CompletionResolveRequest>(result_type, data)
            }
            "HoverRequest" => return validate_type::<HoverRequest>(result_type, data),
            "SignatureHelpRequest" => {
                return validate_type::<SignatureHelpRequest>(result_type, data)
            }
            "DefinitionRequest" => return validate_type::<DefinitionRequest>(result_type, data),
            "ReferencesRequest" => return validate_type::<ReferencesRequest>(result_type, data),
            "DocumentHighlightRequest" => {
                return validate_type::<DocumentHighlightRequest>(result_type, data)
            }
            "DocumentSymbolRequest" => {
                return validate_type::<DocumentSymbolRequest>(result_type, data)
            }
            "CodeActionRequest" => return validate_type::<CodeActionRequest>(result_type, data),
            "CodeActionResolveRequest" => {
                return validate_type::<CodeActionResolveRequest>(result_type, data)
            }
            "WorkspaceSymbolRequest" => {
                return validate_type::<WorkspaceSymbolRequest>(result_type, data)
            }
            "WorkspaceSymbolResolveRequest" => {
                return validate_type::<WorkspaceSymbolResolveRequest>(result_type, data)
            }
            "CodeLensRequest" => return validate_type::<CodeLensRequest>(result_type, data),
            "CodeLensResolveRequest" => {
                return validate_type::<CodeLensResolveRequest>(result_type, data)
            }
            "CodeLensRefreshRequest" => {
                return validate_type::<CodeLensRefreshRequest>(result_type, data)
            }
            "DocumentLinkRequest" => {
                return validate_type::<DocumentLinkRequest>(result_type, data)
            }
            "DocumentLinkResolveRequest" => {
                return validate_type::<DocumentLinkResolveRequest>(result_type, data)
            }
            "DocumentFormattingRequest" => {
                return validate_type::<DocumentFormattingRequest>(result_type, data)
            }
            "DocumentRangeFormattingRequest" => {
                return validate_type::<DocumentRangeFormattingRequest>(result_type, data)
            }
            "DocumentRangesFormattingRequest" => {
                return validate_type::<DocumentRangesFormattingRequest>(result_type, data)
            }
            "DocumentOnTypeFormattingRequest" => {
                return validate_type::<DocumentOnTypeFormattingRequest>(result_type, data)
            }
            "RenameRequest" => return validate_type::<RenameRequest>(result_type, data),
            "PrepareRenameRequest" => {
                return validate_type::<PrepareRenameRequest>(result_type, data)
            }
            "ExecuteCommandRequest" => {
                return validate_type::<ExecuteCommandRequest>(result_type, data)
            }
            "ApplyWorkspaceEditRequest" => {
                return validate_type::<ApplyWorkspaceEditRequest>(result_type, data)
            }
            "DidChangeWorkspaceFoldersNotification" => {
                return validate_type::<DidChangeWorkspaceFoldersNotification>(result_type, data)
            }
            "WorkDoneProgressCancelNotification" => {
                return validate_type::<WorkDoneProgressCancelNotification>(result_type, data)
            }
            "DidCreateFilesNotification" => {
                return validate_type::<DidCreateFilesNotification>(result_type, data)
            }
            "DidRenameFilesNotification" => {
                return validate_type::<DidRenameFilesNotification>(result_type, data)
            }
            "DidDeleteFilesNotification" => {
                return validate_type::<DidDeleteFilesNotification>(result_type, data)
            }
            "DidOpenNotebookDocumentNotification" => {
                return validate_type::<DidOpenNotebookDocumentNotification>(result_type, data)
            }
            "DidChangeNotebookDocumentNotification" => {
                return validate_type::<DidChangeNotebookDocumentNotification>(result_type, data)
            }
            "DidSaveNotebookDocumentNotification" => {
                return validate_type::<DidSaveNotebookDocumentNotification>(result_type, data)
            }
            "DidCloseNotebookDocumentNotification" => {
                return validate_type::<DidCloseNotebookDocumentNotification>(result_type, data)
            }
            "InitializedNotification" => {
                return validate_type::<InitializedNotification>(result_type, data)
            }
            "ExitNotification" => return validate_type::<ExitNotification>(result_type, data),
            "DidChangeConfigurationNotification" => {
                return validate_type::<DidChangeConfigurationNotification>(result_type, data)
            }
            "ShowMessageNotification" => {
                return validate_type::<ShowMessageNotification>(result_type, data)
            }
            "LogMessageNotification" => {
                return validate_type::<LogMessageNotification>(result_type, data)
            }
            "TelemetryEventNotification" => {
                return validate_type::<TelemetryEventNotification>(result_type, data)
            }
            "DidOpenTextDocumentNotification" => {
                return validate_type::<DidOpenTextDocumentNotification>(result_type, data)
            }
            "DidChangeTextDocumentNotification" => {
                return validate_type::<DidChangeTextDocumentNotification>(result_type, data)
            }
            "DidCloseTextDocumentNotification" => {
                return validate_type::<DidCloseTextDocumentNotification>(result_type, data)
            }
            "DidSaveTextDocumentNotification" => {
                return validate_type::<DidSaveTextDocumentNotification>(result_type, data)
            }
            "WillSaveTextDocumentNotification" => {
                return validate_type::<WillSaveTextDocumentNotification>(result_type, data)
            }
            "DidChangeWatchedFilesNotification" => {
                return validate_type::<DidChangeWatchedFilesNotification>(result_type, data)
            }
            "PublishDiagnosticsNotification" => {
                return validate_type::<PublishDiagnosticsNotification>(result_type, data)
            }
            "SetTraceNotification" => {
                return validate_type::<SetTraceNotification>(result_type, data)
            }
            "LogTraceNotification" => {
                return validate_type::<LogTraceNotification>(result_type, data)
            }
            "CancelNotification" => return validate_type::<CancelNotification>(result_type, data),
            "ProgressNotification" => {
                return validate_type::<ProgressNotification>(result_type, data)
            }
            // GENERATED_TEST_CODE:end
            _ => (),
        }
    }

    fn validate_file(file_path: &str) {
        let basename = std::path::Path::new(&file_path)
            .file_name()
            .unwrap()
            .to_str()
            .unwrap();
        let type_name_result_type: Vec<&str> = basename.split("-").collect();
        let lsp_type = type_name_result_type[0];
        let result_type = type_name_result_type[1];
        let data = &fs::read_to_string(file_path).unwrap();

        validate(&lsp_type, &result_type, &data);
    }

    #[test]

    fn test_generated_data() {
        println!("Running generated data tests");
        let cwd = std::env::current_dir()
            .unwrap()
            .join("../../packages/testdata");
        let env_value = std::env::var("LSP_TEST_DATA_PATH")
            .unwrap_or_else(|_| cwd.to_str().unwrap().to_string());
        println!("TEST_DATA_ROOT: {}", env_value);
        for json_file in get_all_json_files(env_value.as_str()) {
            validate_file(&json_file);
        }
    }
}

fn main() {
    // Use data from test error report here to debug
    // let json_data = "";

    // Update the type here to debug
    // serde_json::from_str::<lsprotocol::TextDocumentCompletionRequest>(json_data).unwrap();
}
