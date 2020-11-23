// --------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for
// license information.
//
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is
// regenerated.
// --------------------------------------------------------------------------

import AzureCore
import Foundation
// swiftlint:disable superfluous_disable_command
// swiftlint:disable identifier_name
// swiftlint:disable line_length
// swiftlint:disable cyclomatic_complexity

public struct AnimalNotFound: Codable, Swift.Error {
    // MARK: Properties

    public let name: String?

    public let reason: String?

    public let whatNotFound: String

    public let someBaseProp: String?

    // MARK: Initializers

    /// Initialize a `AnimalNotFound` structure.
    /// - Parameters:
    ///   - name:
    ///   - reason:
    ///   - whatNotFound:
    ///   - someBaseProp:
    public init(
        name: String? = nil, reason: String? = nil, whatNotFound: String, someBaseProp: String? = nil
    ) {
        self.name = name
        self.reason = reason
        self.whatNotFound = whatNotFound
        self.someBaseProp = someBaseProp
    }

    // MARK: Codable

    enum CodingKeys: String, CodingKey {
        case name
        case reason
        case whatNotFound
        case someBaseProp
    }

    /// Initialize a `AnimalNotFound` structure from decoder
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try? container.decode(String.self, forKey: .name)
        self.reason = try? container.decode(String.self, forKey: .reason)
        self.whatNotFound = try container.decode(String.self, forKey: .whatNotFound)
        self.someBaseProp = try? container.decode(String.self, forKey: .someBaseProp)
    }

    /// Encode a `AnimalNotFound` structure
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if name != nil { try? container.encode(name, forKey: .name) }
        if reason != nil { try? container.encode(reason, forKey: .reason) }
        try container.encode(whatNotFound, forKey: .whatNotFound)
        if someBaseProp != nil { try? container.encode(someBaseProp, forKey: .someBaseProp) }
    }
}