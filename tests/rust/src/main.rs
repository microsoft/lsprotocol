// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.
use glob::glob;
use lsprotocol::*;
use serde_json::Value;
use std::fs;
use std::path::Path;
use std::str::FromStr;

const TEST_DATA_ROOT: &str = std::env::var("TEST_DATA_ROOT").unwrap().as_str();

fn get_all_json_files(root: &str) -> Vec<String> {
    let pattern = format!("{}/**/*.json", root);
    glob(&pattern)
        .expect("Failed to read glob pattern")
        .filter_map(Result::ok)
        .map(|path| path.to_str().unwrap().to_string())
        .collect()
}

fn validate_type<T>(data: &Value) {
    match serde_json::from_value::<T>(data.clone()) {
        Ok(_) => assert_eq!(
            result_type, "True",
            "Expected error, but succeeded structuring"
        ),
        Err(_) => assert_eq!(
            result_type, "False",
            "Expected success, but failed structuring"
        ),
    }
}

fn validate(lsp_type: &str, data: &Value) {
    match lsp_type {
        "CallHierarchyIncomingCallsRequest" => {
            validate_type::<CallHierarchyIncomingCallsRequest>(data)
        }
        _ => (),
    }
}

fn test_generated_data(json_file: &str) {
    let type_name_result_type: Vec<&str> = json_file.split("-").collect();
    let lsp_type = type_name_result_type[0];
    let result_type = type_name_result_type[1];

    let data: Value = serde_json::from_str(&fs::read_to_string(json_file).unwrap()).unwrap();

    validate(&lsp_type, &data);
}

fn main() {
    for json_file in get_all_json_files(TEST_DATA_ROOT) {
        test_generated_data(&json_file);
    }
}
