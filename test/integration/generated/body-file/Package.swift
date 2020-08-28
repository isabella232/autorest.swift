// swift-tools-version:5.1
//  The swift-tools-version declares the minimum version of Swift required to build this package.
//
// --------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for
// license information.
//
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is
// regenerated.
// --------------------------------------------------------------------------

import PackageDescription

let package = Package(
    name: "AutoRestSwaggerBatFile",
    platforms: [
        .macOS(.v10_15), .iOS(.v12), .tvOS(.v12)
    ],
    products: [
        .library(name: "AutoRestSwaggerBatFile", type: .static, targets: ["AutoRestSwaggerBatFile"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/Azure/azure-sdk-for-ios.git",
            .branch("master")
        )
    ],
    targets: [
        // Build targets
        .target(
            name: "AutoRestSwaggerBatFile",
            dependencies: ["AzureCore"],
            path: "Source"
        )
        // TODO: Add test targets when test code is generated
        // Test targets
        // .testTarget(
        //    name: "AutoRestSwaggerBatFileTests",
        //    dependencies: ["AutoRestSwaggerBatFile"],
        //    sources: ["Tests"]
        // ),
    ],
    swiftLanguageVersions: [.v5]
)
