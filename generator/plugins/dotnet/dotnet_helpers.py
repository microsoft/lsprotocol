# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

import re
from typing import List, Optional, Union

from generator import model

BASIC_LINK_RE = re.compile(r"{@link +(\w+) ([\w ]+)}")
BASIC_LINK_RE2 = re.compile(r"{@link +(\w+)\.(\w+) ([\w \.`]+)}")
BASIC_LINK_RE3 = re.compile(r"{@link +(\w+)}")
BASIC_LINK_RE4 = re.compile(r"{@link +(\w+)\.(\w+)}")
PARTS_RE = re.compile(r"(([a-z0-9])([A-Z]))")


def _fix_links(line: str) -> str:
    line = BASIC_LINK_RE.sub(r'<see cref="\1">\2</see>', line)
    line = BASIC_LINK_RE2.sub(r'<see cref="\1.\2">\3</see>', line)
    line = BASIC_LINK_RE3.sub(r'<see cref="\1" />', line)
    line = BASIC_LINK_RE4.sub(r'<see cref="\1.\2" />', line)
    return line


def lines_to_doc_comments(lines: List[str]) -> List[str]:
    if not lines:
        return []

    return (
        ["/// <summary>"]
        + [f"/// {_fix_links(line)}" for line in lines if not line.startswith("@")]
        + ["/// </summary>"]
    )


def get_parts(name: str) -> List[str]:
    name = name.replace("_", " ")
    return PARTS_RE.sub(r"\2 \3", name).split()


def to_camel_case(name: str) -> str:
    parts = get_parts(name)
    return parts[0] + "".join([p.capitalize() for p in parts[1:]])


def to_upper_camel_case(name: str) -> str:
    return "".join([c.capitalize() for c in get_parts(name)])


def lsp_method_to_name(method: str) -> str:
    if method.startswith("$"):
        method = method[1:]
    method = method.replace("/", "_")
    return to_upper_camel_case(method)


def file_header() -> List[str]:
    return [
        "// Copyright (c) Microsoft Corporation. All rights reserved.",
        "// Licensed under the MIT License.",
        "// ",
        "// THIS FILE IS AUTOGENERATED, DO NOT MODIFY IT",
        "",
    ]


def namespace_wrapper(
    namespace: str, imports: List[str], lines: List[str]
) -> List[str]:
    indent = " " * 4
    return (
        file_header()
        + imports
        + [""]
        + ["namespace " + namespace + " {"]
        + [(f"{indent}{line}" if line else line) for line in lines]
        + ["}", ""]
    )


def get_doc(doc: Optional[str]) -> str:
    if doc:
        return lines_to_doc_comments(doc.splitlines(keepends=False))
    return []


def get_special_case_class_name(name: str) -> str:
    # This is because C# does not allow class name and property name to be the same.
    # public class Command{ public string Command { get; set; }} is not valid.
    if name == "Command":
        return "CommandAction"
    return name


def get_special_case_property_name(name: str) -> str:
    if name == "string":
        return "stringValue"
    if name == "int":
        return "intValue"
    if name == "event":
        return "eventArgs"
    if name == "params":
        return "paramsValue"
    return name


def class_wrapper(
    type_def: Union[model.Structure, model.Notification, model.Request],
    inner: List[str],
    derived: Optional[str] = None,
    class_attributes: Optional[List[str]] = None,
    is_record=True,
) -> List[str]:
    if hasattr(type_def, "name"):
        name = get_special_case_class_name(type_def.name)
    else:
        raise ValueError(f"Unknown type: {type_def}")

    rec_or_cls = "record" if is_record else "class"
    lines = (
        get_doc(type_def.documentation)
        + generate_extras(type_def)
        + (class_attributes if class_attributes else [])
        + [
            "[DataContract]",
            f"public {rec_or_cls} {name}: {derived}"
            if derived
            else f"public {rec_or_cls} {name}",
            "{",
        ]
    )
    lines += indent_lines(inner)
    lines += ["}", ""]
    return lines


def property_wrapper(prop_def: model.Property, content: List[str]) -> List[str]:
    lines = (get_doc(prop_def.documentation) + generate_extras(prop_def) + content,)
    lines += indent_lines(content)
    return lines


def indent_lines(lines: List[str], indent: str = " " * 4) -> List[str]:
    return [(f"{indent}{line}" if line else line) for line in lines]


def cleanup_str(text: str) -> str:
    return text.replace("\r", "").replace("\n", "")


def get_deprecated(text: Optional[str]) -> Optional[str]:
    if not text:
        return None

    lines = text.splitlines(keepends=False)
    for line in lines:
        if line.startswith("@deprecated"):
            return line.replace("@deprecated", "").strip()
    return None


def generate_extras(
    type_def: Union[
        model.Enum,
        model.EnumItem,
        model.Property,
        model.TypeAlias,
        model.Structure,
        model.Request,
        model.Notification,
    ],
) -> List[str]:
    deprecated = get_deprecated(type_def.documentation)
    extras = []
    if type_def.deprecated:
        extras += [f'[Obsolete("{cleanup_str(type_def.deprecated)}")]']
    elif deprecated:
        extras += [f'[Obsolete("{cleanup_str(deprecated)}")]']
    if type_def.proposed:
        extras += ["[Proposed]"]
    if type_def.since:
        extras += [f'[Since("{cleanup_str(type_def.since)}")]']

    if hasattr(type_def, "messageDirection"):
        if type_def.since:
            extras += [
                f"[Direction(MessageDirection.{to_upper_camel_case(type_def.messageDirection)})]"
            ]

    return extras


def get_usings(types: List[str]) -> List[str]:
    usings = []

    for t in ["DataMember", "DataContract"]:
        if t in types:
            usings.append("using System.Runtime.Serialization;")

    for t in ["JsonConverter", "JsonConstructor", "JsonProperty", "NullValueHandling"]:
        if t in types:
            usings.append("using Newtonsoft.Json;")

    for t in ["JToken", "JObject", "JArray"]:
        if t in types:
            usings.append("using Newtonsoft.Json.Linq;")

    for t in ["List", "Dictionary"]:
        if t in types:
            usings.append("using System.Collections.Generic;")

    for t in ["ImmutableArray", "ImmutableDictionary"]:
        if t in types:
            usings.append("using System.Collections.Immutable;")

    return sorted(list(set(usings)))
