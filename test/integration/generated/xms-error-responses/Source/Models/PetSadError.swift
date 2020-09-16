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

public struct PetSadError: Codable, Swift.Error {
    /// why is the pet sad
    public let reason: String?

    /// Initialize a `PetSadError` structure.
    /// - Parameters:
    ///   - reason: why is the pet sad
    public init(
        reason: String? = nil
    ) {
        self.reason = reason
    }

    enum CodingKeys: String, CodingKey {
        case reason
    }

    /// Initialize a `PetSadError` structure from decoder
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.reason = try? container.decode(String.self, forKey: .reason)
    }

    /// Encode a `PetSadError` structure
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if reason != nil { try? container.encode(reason, forKey: .reason) }
    }
}