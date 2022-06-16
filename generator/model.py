# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

import json
from typing import Any, Dict, Iterable, Optional, Union

import attrs

LSP_TYPE_SPEC = Union[
    "BaseType",
    "ReferenceType",
    "OrType",
    "AndType",
    "ArrayType",
    "LiteralType",
    "StringLiteralType",
    "MapType",
    "TupleType",
]


def enum_validator(instance: "Enum", attribute: Any, value: Any) -> bool:
    test_type = str if instance.type.name == "string" else int
    type_name = "str" if instance.type.name == "string" else "int"
    for e in value:
        if not isinstance(e.value, test_type):
            raise ValueError(
                f"Value of {instance.name}.{e.name} is not of type {type_name}: {e.value}."
            )
    return True


def convert_to_lsp_type(type_info: Optional[Dict[str, Any]]) -> Optional[LSP_TYPE_SPEC]:
    if type_info is None:
        return None
    lut: Dict[str, LSP_TYPE_SPEC] = {
        "base": BaseType,
        "reference": ReferenceType,
        "array": ArrayType,
        "or": OrType,
        "and": AndType,
        "literal": LiteralType,
        "map": MapType,
        "stringLiteral": StringLiteralType,
        "tuple": TupleType,
    }
    callable = lut.get(type_info["kind"])
    if not callable:
        raise ValueError(str(type_info))
    return callable(**type_info)


def type_validator(instance: Any, attribute: str, value: Any) -> bool:
    return isinstance(
        value,
        (
            BaseType,
            ReferenceType,
            ArrayType,
            OrType,
            LiteralType,
            AndType,
            MapType,
            StringLiteralType,
            TupleType,
        ),
    )


@attrs.define
class EnumItem:
    name: str = attrs.field(validator=attrs.validators.instance_of(str))
    value: Union[str, int] = attrs.field(
        validator=attrs.validators.instance_of((str, int))
    )
    proposed: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    documentation: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    since: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )


@attrs.define
class EnumValueType:
    kind: str = attrs.field(validator=attrs.validators.in_(["base"]))
    name: str = attrs.field(
        validator=attrs.validators.in_(["string", "integer", "uinteger"])
    )


@attrs.define
class Enum:
    name: str = attrs.field(validator=attrs.validators.instance_of(str))
    type: EnumValueType = attrs.field(converter=lambda x: EnumValueType(**x))
    values: Iterable[EnumItem] = attrs.field(
        validator=enum_validator,
        converter=lambda x: [EnumItem(**i) for i in x],
    )
    proposed: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    documentation: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    since: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    supportsCustomValues: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )


@attrs.define
class BaseType:
    kind: str = attrs.field(validator=attrs.validators.in_(["base"]))
    name: str = attrs.field(
        validator=attrs.validators.in_(
            [
                "Uri",
                "DocumentUri",
                "integer",
                "uinteger",
                "decimal",
                "RegExp",
                "string",
                "boolean",
                "null",
            ]
        )
    )


@attrs.define
class ReferenceType:
    kind: str = attrs.field(validator=attrs.validators.in_(["reference"]))
    name: str = attrs.field(validator=attrs.validators.instance_of(str))


@attrs.define
class StringLiteralType:
    kind: str = attrs.field(validator=attrs.validators.in_(["stringLiteral"]))
    value: str = attrs.field(validator=attrs.validators.instance_of(str))


@attrs.define
class OrType:
    kind: str = attrs.field(validator=attrs.validators.in_(["or"]))
    items: Iterable[LSP_TYPE_SPEC] = attrs.field(
        converter=lambda x: [convert_to_lsp_type(t) for t in x]
    )


@attrs.define
class AndType:
    kind: str = attrs.field(validator=attrs.validators.in_(["and"]))
    items: Iterable[LSP_TYPE_SPEC] = attrs.field(
        converter=lambda x: [convert_to_lsp_type(t) for t in x]
    )


@attrs.define
class ArrayType:
    kind: str = attrs.field(validator=attrs.validators.in_(["array"]))
    element: LSP_TYPE_SPEC = attrs.field(
        validator=type_validator, converter=convert_to_lsp_type
    )


@attrs.define
class TupleType:
    kind: str = attrs.field(validator=attrs.validators.in_(["tuple"]))
    items: Iterable[LSP_TYPE_SPEC] = attrs.field(
        converter=lambda x: [convert_to_lsp_type(t) for t in x]
    )


@attrs.define
class BaseMapKeyType:
    kind: str = attrs.field(validator=attrs.validators.in_(["base"]))
    name: str = attrs.field(
        validator=attrs.validators.in_(
            [
                "Uri",
                "DocumentUri",
                "integer",
                "string",
            ]
        )
    )


@attrs.define
class ReferenceMapKeyType:
    kind: str = attrs.field(validator=attrs.validators.in_(["reference"]))
    name: str = attrs.field(validator=attrs.validators.instance_of(str))


def convert_map_key(
    key_info: Dict[str, Any]
) -> Union[BaseMapKeyType, ReferenceMapKeyType]:
    if key_info["kind"] == "base":
        return BaseMapKeyType(**key_info)
    return ReferenceMapKeyType(**key_info)


@attrs.define
class MapType:
    kind: str = attrs.field(validator=attrs.validators.in_(["map"]))
    key: Union[BaseMapKeyType, ReferenceMapKeyType] = attrs.field(
        converter=convert_map_key
    )
    value: LSP_TYPE_SPEC = attrs.field(
        validator=type_validator, converter=convert_to_lsp_type
    )


@attrs.define
class Property:
    name: str = attrs.field(validator=attrs.validators.instance_of(str))
    type: LSP_TYPE_SPEC = attrs.field(
        validator=type_validator,
        converter=convert_to_lsp_type,
    )
    optional: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    proposed: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    documentation: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    since: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )


@attrs.define
class LiteralValue:
    properties: Iterable[Property] = attrs.field(
        converter=lambda x: [Property(**t) for t in x],
    )


@attrs.define
class LiteralType:
    kind: str = attrs.field(validator=attrs.validators.in_(["literal"]))
    value: LiteralValue = attrs.field(
        validator=attrs.validators.instance_of(LiteralValue),
        converter=lambda x: LiteralValue(**x),
    )
    name: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    proposed: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    documentation: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    since: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )


@attrs.define
class TypeAlias:
    name: str = attrs.field(validator=attrs.validators.instance_of(str))
    type: LSP_TYPE_SPEC = attrs.field(
        validator=type_validator,
        converter=convert_to_lsp_type,
    )
    proposed: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    documentation: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    since: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )


@attrs.define
class Structure:
    name: str = attrs.field(validator=attrs.validators.instance_of(str))
    properties: Iterable[Property] = attrs.field(
        converter=lambda x: [Property(**p) for p in x],
    )
    extends: Optional[Iterable[LSP_TYPE_SPEC]] = attrs.field(
        converter=lambda x: [convert_to_lsp_type(t) for t in x], default=[]
    )
    mixins: Optional[Iterable[LSP_TYPE_SPEC]] = attrs.field(
        converter=lambda x: [convert_to_lsp_type(t) for t in x], default=[]
    )
    proposed: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    documentation: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    since: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )


@attrs.define
class Notification:
    method: str = attrs.field(validator=attrs.validators.instance_of(str))
    params: Optional[LSP_TYPE_SPEC] = attrs.field(
        validator=type_validator, converter=convert_to_lsp_type, default=None
    )
    registrationOptions: Optional[LSP_TYPE_SPEC] = attrs.field(
        validator=type_validator, converter=convert_to_lsp_type, default=None
    )
    proposed: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    documentation: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    since: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )


@attrs.define
class Request:
    method: str = attrs.field(validator=attrs.validators.instance_of(str))
    params: Optional[LSP_TYPE_SPEC] = attrs.field(
        validator=type_validator, converter=convert_to_lsp_type, default=None
    )
    result: Optional[LSP_TYPE_SPEC] = attrs.field(
        validator=type_validator, converter=convert_to_lsp_type, default=None
    )
    partialResult: Optional[LSP_TYPE_SPEC] = attrs.field(
        validator=type_validator, converter=convert_to_lsp_type, default=None
    )
    errorData: Optional[LSP_TYPE_SPEC] = attrs.field(
        validator=type_validator, converter=convert_to_lsp_type, default=None
    )
    registrationOptions: Optional[LSP_TYPE_SPEC] = attrs.field(
        validator=type_validator, converter=convert_to_lsp_type, default=None
    )
    proposed: Optional[bool] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(bool)),
        default=None,
    )
    documentation: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )
    since: Optional[str] = attrs.field(
        validator=attrs.validators.optional(attrs.validators.instance_of(str)),
        default=None,
    )


@attrs.define
class LSPModel:
    requests: Iterable[Request] = attrs.field(
        converter=lambda x: [Request(**r) for r in x]
    )
    notifications: Iterable[Notification] = attrs.field(
        converter=lambda x: [Notification(**n) for n in x]
    )
    structures: Iterable[Structure] = attrs.field(
        converter=lambda x: [Structure(**s) for s in x]
    )
    enumerations: Iterable[Enum] = attrs.field(
        converter=lambda x: [Enum(**e) for e in x]
    )
    typeAliases: Iterable[TypeAlias] = attrs.field(
        converter=lambda x: [TypeAlias(**t) for t in x]
    )


def create_lsp_model(text: str) -> LSPModel:
    return LSPModel(**json.loads(text))
