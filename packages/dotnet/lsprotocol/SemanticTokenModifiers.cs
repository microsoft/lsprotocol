// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.
// 
// THIS FILE IS AUTOGENERATED, DO NOT MODIFY IT

using System.Runtime.Serialization;


namespace LSProtocol
{
    /// <summary>
    /// A set of predefined token modifiers. This set is not fixed
    /// an clients can specify additional token types via the
    /// corresponding client capabilities.
    /// 
    /// </summary>
    public enum SemanticTokenModifiers
    {
        [EnumMember(Value = "declaration")] Declaration,

        [EnumMember(Value = "definition")] Definition,

        [EnumMember(Value = "readonly")] Readonly,

        [EnumMember(Value = "static")] Static,

        [EnumMember(Value = "deprecated")] Deprecated,

        [EnumMember(Value = "abstract")] Abstract,

        [EnumMember(Value = "async")] Async,

        [EnumMember(Value = "modification")] Modification,

        [EnumMember(Value = "documentation")] Documentation,

        [EnumMember(Value = "defaultLibrary")] DefaultLibrary,

    }
}
