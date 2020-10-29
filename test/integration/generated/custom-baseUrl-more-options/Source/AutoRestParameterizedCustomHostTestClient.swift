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
// swiftlint:disable file_length
// swiftlint:disable cyclomatic_complexity
// swiftlint:disable function_body_length
// swiftlint:disable type_body_length

public final class AutoRestParameterizedCustomHostTestClient: PipelineClient {
    /// API version of the  to invoke. Defaults to the latest.
    public enum ApiVersion: String {
        /// API version ""
        case v = ""

        /// The most recent API version of the
        public static var latest: ApiVersion {
            return .v
        }
    }

    /// Options provided to configure this `AutoRestParameterizedCustomHostTestClient`.
    public let options: AutoRestParameterizedCustomHostTestClientOptions

    // MARK: Initializers

    /// Create a AutoRestParameterizedCustomHostTestClient client.
    /// - Parameters:
    ///   - baseUrl: Base URL for the AutoRestParameterizedCustomHostTestClient.
    ///   - authPolicy: An `Authenticating` policy to use for authenticating client requests.
    ///   - options: Options used to configure the client.
    public init(
        subscriptionId: String,
        dnsSuffix: String,
        baseUrl: URL,
        authPolicy: Authenticating,
        withOptions options: AutoRestParameterizedCustomHostTestClientOptions
    ) throws {
        self.subscriptionId = subscriptionId
        self.dnsSuffix = dnsSuffix
        self.options = options
        super.init(
            baseUrl: baseUrl,
            transport: URLSessionTransport(),
            policies: [
                UserAgentPolicy(
                    for: AutoRestParameterizedCustomHostTestClient.self,
                    telemetryOptions: options.telemetryOptions
                ),
                RequestIdPolicy(),
                AddDatePolicy(),
                authPolicy,
                ContentDecodePolicy(),
                LoggingPolicy(),
                NormalizeETagPolicy()
            ],
            logger: options.logger,
            options: options
        )
    }

    // /// The subscription id with value 'test12'.
    public var subscriptionId: String
    // /// A string value that is used as a global part of the parameterized host. Default value 'host'.
    public var dnsSuffix: String = "host"

    public lazy var paths: Paths = Paths(client: self)

    // MARK: Public Client Methods
}
