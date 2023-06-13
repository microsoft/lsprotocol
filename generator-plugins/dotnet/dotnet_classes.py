# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

from typing import Any, Dict, List, Optional, Tuple, Union

import cattrs

from generator import model

from .dotnet_commons import TypeData
from .dotnet_constants import NAMESPACE
from .dotnet_helpers import (
    class_wrapper,
    generate_extras,
    get_doc,
    get_special_case_class_name,
    get_special_case_property_name,
    get_usings,
    indent_lines,
    namespace_wrapper,
    to_camel_case,
    to_upper_camel_case,
)


def _get_enum(name: str, spec: model.LSPModel) -> Optional[model.Enum]:
    for enum in spec.enumerations:
        if enum.name == name:
            return enum
    return None


def _get_struct(name: str, spec: model.LSPModel) -> Optional[model.Structure]:
    for struct in spec.structures:
        if struct.name == name:
            return struct
    return None


def _is_str_enum(enum_def: model.Enum) -> bool:
    return all(isinstance(item.value, str) for item in enum_def.values)


def _is_int_enum(enum_def: model.Enum) -> bool:
    return all(isinstance(item.value, int) for item in enum_def.values)


def lsp_to_base_types(lsp_type: model.BaseType):
    if lsp_type.name in ["string", "RegExp"]:
        return "string"
    elif lsp_type.name in ["DocumentUri", "URI"]:
        return "Uri"
    elif lsp_type.name in ["decimal"]:
        return "float"
    elif lsp_type.name in ["integer"]:
        return "int"
    elif lsp_type.name in ["uinteger"]:
        return "uint"
    elif lsp_type.name in ["boolean"]:
        return "bool"

    # null should be handled by the caller as an Option<> type
    raise ValueError(f"Unknown base type: {lsp_type.name}")


def has_null_base_type(items: List[model.LSP_TYPE_SPEC]) -> bool:
    return any(item.kind == "base" and item.name == "null" for item in items)


def filter_null_base_type(
    items: List[model.LSP_TYPE_SPEC],
) -> List[model.LSP_TYPE_SPEC]:
    return [item for item in items if not (item.kind == "base" and item.name == "null")]


def get_type_name(
    type_def: model.LSP_TYPE_SPEC,
    types: TypeData,
    spec: model.LSPModel,
    name_context: Optional[str] = None,
) -> str:
    name = None
    if type_def.kind == "reference":
        enum_def = _get_enum(type_def.name, spec)
        if enum_def and enum_def.supportsCustomValues:
            if _is_str_enum(enum_def):
                name = f"string"
            elif _is_int_enum(enum_def):
                name = f"int"
        else:
            name = get_special_case_class_name(type_def.name)
    elif type_def.kind == "array":
        name = f"{get_type_name(type_def.element, types, spec, name_context)}[]"
    elif type_def.kind == "map":
        key_type = get_type_name(type_def.key, types, spec, name_context)
        value_type = get_type_name(type_def.value, types, spec, name_context)
        name = f"Dictionary<{key_type}, {value_type}>"
    elif type_def.kind == "base":
        name = lsp_to_base_types(type_def)
    elif type_def.kind == "literal":
        name = generate_literal_type(type_def, types, spec, name_context)
    elif type_def.kind == "stringLiteral":
        name = "string"
    elif type_def.kind == "tuple":
        subset = filter_null_base_type(type_def.items)
        subset_types = [
            get_type_name(item, types, spec, name_context) for item in subset
        ]
        name = f"({', '.join(subset_types)})"
    elif type_def.kind == "or":
        subset = filter_null_base_type(type_def.items)
        if len(subset) == 1:
            name = get_type_name(subset[0], types, spec, name_context)
        elif len(subset) >= 2:
            if are_variant_literals(subset):
                name = generate_class_from_variant_literals(
                    subset, spec, types, name_context
                )
            else:
                subset_types = [
                    get_type_name(item, types, spec, name_context) for item in subset
                ]
                name = f"OrType<{', '.join(subset_types)}>"
        else:
            raise ValueError(f"Unknown type kind: {type_def.kind}")
    else:
        raise ValueError(f"Unknown type kind: {type_def.kind}")
    return name


def get_converter(
    type_def: model.LSP_TYPE_SPEC,
    types: TypeData,
    spec: model.LSPModel,
    name_context: Optional[str] = None,
) -> Optional[str]:
    if type_def.kind == "base" and type_def.name in ["DocumentUri", "URI"]:
        return "[JsonConverter(typeof(CustomStringConverter<Uri>))]"
    elif type_def.kind == "reference" and type_def.name in [
        "Pattern",
        "ChangeAnnotationIdentifier",
    ]:
        return f"[JsonConverter(typeof(CustomStringConverter<{type_def.name}>))]"
    elif type_def.kind == "reference" and type_def.name == "DocumentSelector":
        return "[JsonConverter(typeof(DocumentSelectorConverter))]"
    elif type_def.kind == "or":
        subset = filter_null_base_type(type_def.items)
        if len(subset) >= 2:
            type_names = ", ".join(
                get_type_name(item, types, spec, name_context) for item in subset
            )
            return f"[JsonConverter(typeof(OrTypeConverter<{type_names}>))]"
    return None


def generate_property(
    prop_def: model.Property,
    spec: model.LSPModel,
    types: TypeData,
    usings: List[str],
    class_name: str = "",
) -> Tuple[List[str], str]:
    name = to_upper_camel_case(prop_def.name)
    type_name = get_type_name(
        prop_def.type, types, spec, f"{class_name}_{prop_def.name}"
    )
    converter = get_converter(
        prop_def.type, types, spec, f"{class_name}_{prop_def.name}"
    )
    special_optional = prop_def.type.kind == "or" and has_null_base_type(
        prop_def.type.items
    )
    optional = "?" if prop_def.optional or special_optional else ""
    lines = (
        get_doc(prop_def.documentation)
        + generate_extras(prop_def)
        + ([converter] if converter else [])
        + (
            ["[JsonProperty(NullValueHandling = NullValueHandling.Ignore)]"]
            if optional and not special_optional
            else []
        )
        + [
            f'[DataMember(Name = "{prop_def.name}")]',
            f"public {type_name}{optional} {name} {{ get; set; }}",
        ]
    )
    usings.append("DataMember")
    if converter:
        usings.append("JsonConverter")
    if optional and not special_optional:
        usings.append("JsonProperty")
    return lines, type_name


def generate_name(name_context: str, types: TypeData) -> str:
    # If name context has a '_' it is likely a property.
    # Try name generation using just the property name
    parts = [to_upper_camel_case(p) for p in name_context.split("_") if len(p) > 3]

    # Try the last part of the name context
    name = parts[-1]
    if not types.get_by_name(name) and "info" in name_context.lower():
        return name

    # Combine all parts and try again
    name = "".join(parts)
    if not types.get_by_name(name):
        return name

    raise ValueError(f"Unable to generate name for {name_context}")


def generate_literal_type(
    literal: model.LiteralType,
    types: TypeData,
    spec: model.LSPModel,
    name_context: Optional[str] = None,
) -> str:
    if len(literal.value.properties) == 0:
        return "LSPObject"

    if types.get_by_name(literal.name) and not _get_struct(literal.name, spec):
        return literal.name

    if name_context is None:
        raise ValueError("name_context must be provided for literal types")

    if name_context.startswith("I") and name_context[1].isupper():
        # This is a interface name ISomething => Something
        name_context = name_context[1:]

    if "_" not in name_context:
        name_context = f"{name_context}_{get_context_from_literal(literal)}"

    literal.name = generate_name(name_context, types)

    usings = ["DataContract"]
    inner = []
    for prop in literal.value.properties:
        prop_code, _ = generate_property(prop, spec, types, usings, literal.name)
        inner += prop_code

    lines = namespace_wrapper(
        NAMESPACE,
        get_usings(usings),
        class_wrapper(literal, inner),
    )
    types.add_type_info(literal, literal.name, lines)
    print(f"{name_context} => {literal.name}")
    return literal.name


def generate_constructor(
    struct: model.Structure,
    types: TypeData,
    properties: List[Tuple[model.Property, str]],
) -> List[str]:
    class_name = get_special_case_class_name(struct.name)
    constructor = [
        "[JsonConstructor]",
        f"public {class_name}(",
    ]

    arguments = []
    optional_args = []
    assignments = []
    ctor_data = []
    for prop, prop_type in properties:
        name = get_special_case_property_name(to_camel_case(prop.name))
        special_optional = prop.type.kind == "or" and has_null_base_type(
            prop.type.items
        )
        if prop.optional or special_optional:
            optional_args += [f"{prop_type}? {name} = null"]
            ctor_data += [(prop_type, name, True)]
        else:
            arguments += [f"{prop_type} {name}"]
            ctor_data += [(prop_type, name, False)]
        assignments += [f"{to_upper_camel_case(prop.name)} = {name};"]

    # combine args with a '\n' to get comma with indent
    all_args = (",\n".join(indent_lines(arguments + optional_args))).splitlines()
    types.add_ctor(struct.name, ctor_data)

    # re-split args to get the right coma placement and indent
    constructor += all_args
    constructor += [")", "{"]
    constructor += indent_lines(assignments)
    constructor += ["}"]
    return constructor


def generate_class_from_struct(
    struct: model.Structure, spec: model.LSPModel, types: TypeData
):
    if types.get_by_name(struct.name) or struct.name.startswith("_"):
        return

    inner = []
    usings = ["DataContract", "JsonConstructor"]

    properties = get_all_properties(struct, spec)
    prop_types = []
    for prop in properties:
        prop_code, prop_type = generate_property(prop, spec, types, usings, struct.name)
        inner += prop_code
        prop_types += [prop_type]

    ctor = generate_constructor(struct, types, zip(properties, prop_types))
    inner = ctor + inner

    lines = namespace_wrapper(
        NAMESPACE,
        get_usings(usings),
        class_wrapper(struct, inner),
    )
    types.add_type_info(struct, struct.name, lines)


def get_context_from_literal(literal: model.LiteralType) -> str:
    if len(literal.value.properties) == 0:
        return "LSPObject"

    skipped = 0
    skip = [
        "range",
        "rangeLength",
        "position",
        "position",
        "location",
        "locationLink",
        "text",
    ]
    for prop in literal.value.properties:
        if prop.name in skip:
            skipped += 1
            continue
        return prop.name

    if skipped == len(literal.value.properties):
        # pick property with longest name
        names = sorted([p.name for p in literal.value.properties])
        return sorted(names, key=lambda n: len(n))[-1]

    return ""


def generate_type_alias_constructor(
    type_def: model.TypeAlias, spec: model.LSPModel, types: TypeData
) -> List[str]:
    constructor = []

    if type_def.type.kind == "or":
        subset = filter_null_base_type(type_def.type.items)
        if len(subset) == 1:
            raise ValueError("Unable to generate constructor for single item union")
        elif len(subset) >= 2:
            type_name = to_upper_camel_case(type_def.name)
            for t in subset:
                sub_type = get_type_name(t, types, spec, type_def.name)
                arg = get_special_case_property_name(to_camel_case(sub_type))
                if arg.endswith("[]"):
                    arg = f"{arg[:-2]}s"

                constructor += [
                    f"public {type_name}({sub_type} {arg}): base({arg}) {{}}",
                ]
        else:
            raise ValueError("Unable to generate constructor for empty union")
    elif type_def.type.kind == "reference":
        type_name = to_upper_camel_case(type_def.name)
        ctor_data = types.get_ctor(type_def.type.name)
        required = [
            (prop_type, prop_name)
            for prop_type, prop_name, optional in ctor_data
            if not optional
        ]
        optional = [
            (prop_type, prop_name)
            for prop_type, prop_name, optional in ctor_data
            if optional
        ]

        ctor_args = [f"{prop_type} {prop_name}" for prop_type, prop_name in required]
        ctor_args += [
            f"{prop_type}? {prop_name} = null" for prop_type, prop_name in optional
        ]

        base_args = [f"{prop_name}" for _, prop_name in required + optional]
        constructor += [
            f"public {type_name}({','.join(ctor_args)}): base({','.join(base_args)}) {{}}",
        ]

    return constructor


def generate_class_from_type_alias(
    type_def: model.TypeAlias, spec: model.LSPModel, types: TypeData
) -> None:
    if types.get_by_name(type_def.name):
        return

    usings = ["DataContract"]
    type_name = get_type_name(type_def.type, types, spec, type_def.name)
    class_attributes = []
    if type_def.type.kind == "or":
        class_attributes += [f"[JsonConverter(typeof({type_name}))]"]
        usings.append("JsonConverter")

    inner = generate_type_alias_constructor(type_def, spec, types)
    lines = namespace_wrapper(
        NAMESPACE,
        get_usings(usings),
        class_wrapper(type_def, inner, type_name, class_attributes),
    )
    types.add_type_info(type_def, type_def.name, lines)


def generate_class_from_variant_literals(
    literals: List[model.LiteralType],
    spec: model.LSPModel,
    types: TypeData,
    name_context: Optional[str] = None,
) -> str:
    name = generate_name(name_context, types)
    if types.get_by_name(name):
        raise ValueError(f"Name {name} already exists")

    struct = model.Structure(
        **{
            "name": name,
            "properties": get_properties_from_literals(literals),
        }
    )

    lines = generate_code_for_variant_struct(struct, spec, types)
    types.add_type_info(struct, struct.name, lines)
    print(f"{name_context} => {struct.name}")
    return struct.name


def get_properties_from_literals(literals: List[model.LiteralType]) -> Dict[str, Any]:
    properties = []
    for literal in literals:
        assert literal.kind == "literal"
        for prop in literal.value.properties:
            if prop.name not in [p["name"] for p in properties]:
                properties.append(
                    {
                        "name": prop.name,
                        "type": cattrs.unstructure(prop.type),
                        "optional": has_optional_variant(literals, prop.name),  #
                    }
                )
    return properties


def generate_code_for_variant_struct(
    struct: model.Structure,
    spec: model.LSPModel,
    types: TypeData,
) -> None:
    prop_types = []
    inner = []
    usings = ["DataContract", "JsonConstructor"]
    for prop in struct.properties:
        prop_code, prop_type = generate_property(prop, spec, types, usings, struct.name)
        inner += prop_code
        prop_types += [prop_type]

    ctor_data = []
    constructor_args = []
    conditions = []
    for prop, prop_type in zip(struct.properties, prop_types):
        name = get_special_case_property_name(to_camel_case(prop.name))
        constructor_args += [f"{prop_type}? {name}"]
        ctor_data = [(prop_type)]
        conditions += [f"({name} is null)"]

    sig = ", ".join(constructor_args)
    types.add_ctor(struct.name, ctor_data)
    ctor = [
        f"[JsonConstructor]",
        f"public {struct.name}({sig})",
        "{",
        *indent_lines(
            [
                f"if ({'&&'.join(conditions)})",
                "{",
                *indent_lines(
                    [
                        f'throw new ArgumentException("At least one of the arguments must be non-null");'
                    ]
                ),
                "}",
            ]
        ),
        *indent_lines(
            [
                f"{to_upper_camel_case(prop.name)} = {get_special_case_property_name(to_camel_case(prop.name))};"
                for prop in struct.properties
            ]
        ),
        "}",
    ]

    inner = ctor + inner

    return namespace_wrapper(
        NAMESPACE,
        get_usings(usings),
        class_wrapper(struct, inner, None),
    )


def generate_class_from_variant_type_alias(
    type_def: model.TypeAlias,
    spec: model.LSPModel,
    types: TypeData,
    name_context: Optional[str] = None,
) -> None:
    struct = model.Structure(
        **{
            "name": type_def.name,
            "properties": get_properties_from_literals(type_def.type.items),
            "documentation": type_def.documentation,
            "since": type_def.since,
            "deprecated": type_def.deprecated,
            "proposed": type_def.proposed,
        }
    )

    lines = generate_code_for_variant_struct(struct, spec, types)
    types.add_type_info(type_def, type_def.name, lines)


def has_optional_variant(literals: List[model.LiteralType], property_name: str) -> bool:
    count = 0
    optional = False
    for literal in literals:
        for prop in literal.value.properties:
            if prop.name == property_name:
                count += 1
                optional = optional or prop.optional
    return optional and count == len(literals)


def are_variant_literals(literals: List[model.LiteralType]) -> bool:
    if all(i.kind == "literal" for i in literals):
        return all(
            has_optional_variant(literals, prop.name)
            for prop in literals[0].value.properties
        )
    return False


def is_variant_type_alias(type_def: model.TypeAlias) -> bool:
    if type_def.type.kind == "or" and all(
        i.kind == "literal" for i in type_def.type.items
    ):
        literals = type_def.type.items
        return all(
            has_optional_variant(literals, prop.name)
            for prop in literals[0].value.properties
        )
    return False


def copy_struct(struct_def: model.Structure, new_name: str):
    converter = cattrs.GenConverter()
    obj = converter.unstructure(struct_def, model.Structure)
    obj["name"] = new_name
    return model.Structure(**obj)


def copy_property(prop_def: model.Property):
    converter = cattrs.GenConverter()
    obj = converter.unstructure(prop_def, model.Property)
    return model.Property(**obj)


def get_all_extends(struct_def: model.Structure, spec) -> List[model.Structure]:
    extends = []
    for extend in struct_def.extends:
        extends.append(_get_struct(extend.name, spec))
        for struct in get_all_extends(_get_struct(extend.name, spec), spec):
            if not any(struct.name == e.name for e in extends):
                extends.append(struct)
    return extends


def get_all_properties(struct: model.Structure, spec) -> List[model.Structure]:
    properties = []
    for prop in struct.properties:
        properties.append(copy_property(prop))

    for extend in get_all_extends(struct, spec):
        for prop in get_all_properties(extend, spec):
            if not any(prop.name == p.name for p in properties):
                properties.append(copy_property(prop))

    if not all(mixin.kind == "reference" for mixin in struct.mixins):
        raise ValueError(f"Struct {struct.name} has non-reference mixins")
    for mixin in [_get_struct(mixin.name, spec) for mixin in struct.mixins]:
        for prop in get_all_properties(mixin, spec):
            if not any(prop.name == p.name for p in properties):
                properties.append(copy_property(prop))

    return properties


def generate_all_classes(spec: model.LSPModel, types: TypeData):
    for struct in spec.structures:
        generate_class_from_struct(struct, spec, types)

    for type_alias in spec.typeAliases:
        if is_variant_type_alias(type_alias):
            generate_class_from_variant_type_alias(type_alias, spec, types)
        else:
            generate_class_from_type_alias(type_alias, spec, types)
