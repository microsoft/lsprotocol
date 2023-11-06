# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.


import pathlib

import generator.model as model

from .rust_commons import get_message_type_name


def generate_test_code(spec: model.LSPModel, test_path: pathlib.Path) -> str:
    """Generate the code for the given spec."""
    lines = []
    for request in spec.requests:
        request_name = get_message_type_name(request)
        lines += [
            f'"{request_name}" =>' "{",
            f"return validate_type::<{request_name}>(result_type, data)",
            "}",
        ]
    for notification in spec.notifications:
        notification_name = get_message_type_name(notification)
        lines += [
            f'"{notification_name}" =>' "{",
            f"return validate_type::<{notification_name}>(result_type, data)",
            "}",
        ]

    tests = "\n".join(lines)
    code = test_path.read_text(encoding="utf-8")
    code = code.replace("/*@@_LSP_GENERATED_TESTS_@@*/", tests)
    test_path.write_text(code, encoding="utf-8")