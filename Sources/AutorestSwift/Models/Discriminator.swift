//
//  Discriminator.swift
//
//
//  Created by Sam Cheung on 2020-07-13.
//

import Foundation

public struct Discriminator: Codable {
    public let property: Property

    public let immediate: [String: ComplexSchema]

    public let all: [String: ComplexSchema]
}
