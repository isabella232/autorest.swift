//
//  File.swift
//
//
//  Created by Travis Prescott on 7/9/20.
//

import Foundation

/// Code model information
public struct Info: Codable {
    /// the title of this service
    public let title: String

    /// a text description of the service
    public let description: String?

    /// a URI to the terms of service specified to access the service
    public let termsOfService: String?

    /// contact information for the service
    public let contact: Contact?

    /// license information for the service
    public let license: License?

    /// external documentation
    public let externalDocs: ExternalDocumentation?

    /// additional metadata extensions dictionary
    // TODO: Not Codable
    // public let extensions: Dictionary<AnyHashable, Codable>?
}