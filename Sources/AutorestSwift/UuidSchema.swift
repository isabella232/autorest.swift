//
//  UuidSchema.swift
//  
//
//  Created by Sam Cheung on 2020-07-13.
//

import Foundation

/// a schema that represents a Uuid value
public struct UuidSchema: CodeModelProperty {
    public let properties = [String: String]()

    public let defaultProperties = [String]()

    public let additionalProperties = false

    public let allOf: [PrimitiveSchema]
}
