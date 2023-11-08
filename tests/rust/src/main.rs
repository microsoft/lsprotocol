// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

#[cfg(test)]
mod tests {
    use glob::glob;
    use lsprotocol::*;
    use serde::Deserialize;
    use serde_json::Value;
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
                "Expected error, but succeeded deserializing"
            ),
            Err(e) => assert_eq!(
                result_type, "False",
                "Expected success, but failed deserializing: {e}",
            ),
        }
    }

    fn validate(lsp_type: &str, result_type: &str, data: &str) {
        match lsp_type {
            "CallHierarchyIncomingCallsRequest" => {
                return validate_type::<CallHierarchyIncomingCallsRequest>(result_type, data)
            }

            _ => (),
        }
    }

    #[test]

    fn test_generated_data() {
        println!("Running generated data tests");
        let cwd = std::env::current_dir()
            .unwrap()
            .join("../../packages/testdata");
        let env_value =
            std::env::var("TEST_DATA_ROOT").unwrap_or_else(|_| cwd.to_str().unwrap().to_string());
        println!("TEST_DATA_ROOT: {}", env_value);
        for json_file in get_all_json_files(env_value.as_str()) {
            let basename = std::path::Path::new(&json_file)
                .file_name()
                .unwrap()
                .to_str()
                .unwrap();
            let type_name_result_type: Vec<&str> = basename.split("-").collect();
            let lsp_type = type_name_result_type[0];
            let result_type = type_name_result_type[1];
            println!("Validating: {}", json_file);
            let data = &fs::read_to_string(json_file.clone()).unwrap();

            validate(&lsp_type, &result_type, &data);
        }
    }
}

use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize, PartialEq, Debug, Eq, Clone)]
enum MyEnum {
    Something = 1,
}

#[derive(Debug, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
struct MyStruct {
    pub kind: MyEnum,
}

fn main() {
    let json_str = "{\"kind\": 1}";
    let _result: MyStruct = serde_json::from_str(json_str).unwrap();
}

// let file_path: String = "".to_string();
// let data = &fs::read_to_string(file_path.clone()).unwrap();
// let result: CallHierarchyIncomingCallsRequest = serde_json::from_str(data).unwrap();
