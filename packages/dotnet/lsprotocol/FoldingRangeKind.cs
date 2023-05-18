// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.
// 
// THIS FILE IS AUTOGENERATED, DO NOT MODIFY IT

using System.Runtime.Serialization;


namespace LSProtocol {
    /// <summary>
    /// A set of predefined range kinds.
    /// </summary>
    public enum FoldingRangeKind 
    {
        /// <summary>
        /// Folding range for a comment
        /// </summary>
        [EnumMember(Value = "comment")]Comment,

        /// <summary>
        /// Folding range for an import or include
        /// </summary>
        [EnumMember(Value = "imports")]Imports,

        /// <summary>
        /// Folding range for a region (e.g. `#region`)
        /// </summary>
        [EnumMember(Value = "region")]Region,

    }
}
