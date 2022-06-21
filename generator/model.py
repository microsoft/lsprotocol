# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

from __future__ import annotations

from typing import Any, Dict, Iterable, List, Optional, Union

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


def partial_apply(callable):
    def apply(x):
        return callable(**x)

    return apply


def list_converter(callable):
    def apply(x):
        return callable(**x)

    def converter(x: List[Any]) -> List[Any]:
        return map(apply, x)

    return converter


def enum_validator(instance: Enum, attribute: Any, value: Any) -> None:
    test_type = str if instance.type.name == "string" else int
    for e in value:
        if not isinstance(e.value, test_type):
            raise ValueError(
                f"Value of {instance.name}.{e.name} is not of type {test_type}: {e.value}."
            )


def convert_to_lsp_type(**type_info) -> Optional[LSP_TYPE_SPEC]:
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
    if callable:
        return callable(**type_info)

    raise ValueError(f"Unknown LSP type: {type_info}")


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
    type: EnumValueType = attrs.field(converter=partial_apply(EnumValueType))
    values: Iterable[EnumItem] = attrs.field(
        validator=enum_validator,
        converter=list_converter(EnumItem),
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
        converter=list_converter(convert_to_lsp_type)
    )


@attrs.define
class AndType:
    kind: str = attrs.field(validator=attrs.validators.in_(["and"]))
    items: Iterable[LSP_TYPE_SPEC] = attrs.field(
        converter=list_converter(convert_to_lsp_type),
    )


@attrs.define
class ArrayType:
    kind: str = attrs.field(validator=attrs.validators.in_(["array"]))
    element: LSP_TYPE_SPEC = attrs.field(
        validator=type_validator, converter=partial_apply(convert_to_lsp_type)
    )


@attrs.define
class TupleType:
    kind: str = attrs.field(validator=attrs.validators.in_(["tuple"]))
    items: Iterable[LSP_TYPE_SPEC] = attrs.field(
        converter=list_converter(convert_to_lsp_type)
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
        validator=type_validator, converter=partial_apply(convert_to_lsp_type)
    )


@attrs.define
class Property:
    name: str = attrs.field(validator=attrs.validators.instance_of(str))
    type: LSP_TYPE_SPEC = attrs.field(
        validator=type_validator,
        converter=partial_apply(convert_to_lsp_type),
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
        converter=list_converter(Property),
    )


@attrs.define
class LiteralType:
    kind: str = attrs.field(validator=attrs.validators.in_(["literal"]))
    value: LiteralValue = attrs.field(
        validator=attrs.validators.instance_of(LiteralValue),
        converter=partial_apply(LiteralValue),
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
        converter=partial_apply(convert_to_lsp_type),
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
        converter=list_converter(Property),
    )
    extends: Optional[Iterable[LSP_TYPE_SPEC]] = attrs.field(
        converter=list_converter(convert_to_lsp_type), default=[]
    )
    mixins: Optional[Iterable[LSP_TYPE_SPEC]] = attrs.field(
        converter=list_converter(convert_to_lsp_type), default=[]
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
        validator=type_validator,
        converter=partial_apply(convert_to_lsp_type),
        default=None,
    )
    registrationOptions: Optional[LSP_TYPE_SPEC] = attrs.field(
        validator=type_validator,
        converter=partial_apply(convert_to_lsp_type),
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
class Request:
    method: str = attrs.field(validator=attrs.validators.instance_of(str))
    params: Optional[LSP_TYPE_SPEC] = attrs.field(
        validator=type_validator,
        converter=partial_apply(convert_to_lsp_type),
        default=None,
    )
    result: Optional[LSP_TYPE_SPEC] = attrs.field(
        validator=type_validator,
        converter=partial_apply(convert_to_lsp_type),
        default=None,
    )
    partialResult: Optional[LSP_TYPE_SPEC] = attrs.field(
        validator=type_validator,
        converter=partial_apply(convert_to_lsp_type),
        default=None,
    )
    errorData: Optional[LSP_TYPE_SPEC] = attrs.field(
        validator=type_validator,
        converter=partial_apply(convert_to_lsp_type),
        default=None,
    )
    registrationOptions: Optional[LSP_TYPE_SPEC] = attrs.field(
        validator=type_validator,
        converter=partial_apply(convert_to_lsp_type),
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
class LSPModel:
    requests: Iterable[Request] = attrs.field(converter=list_converter(Request))
    notifications: Iterable[Notification] = attrs.field(
        converter=list_converter(Notification)
    )
    structures: Iterable[Structure] = attrs.field(converter=list_converter(Structure))
    enumerations: Iterable[Enum] = attrs.field(converter=list_converter(Enum))
    typeAliases: Iterable[TypeAlias] = attrs.field(converter=list_converter(TypeAlias))


def create_lsp_model(model: Dict[str, Any]) -> LSPModel:
    return LSPModel(**model)
