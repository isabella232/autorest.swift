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

extension Paging {
    /// User-configurable options for the `AutoRestPagingTestService.GetMultiplePages` operation.
    public struct GetMultiplePagesOptions: RequestOptions {
        /// Parameter group
        public let pagingGetMultiplePagesOptions: PagingGetMultiplePagesOptions?
        /// Sets the maximum number of items to return in the response.
        public let maxresults: Int32?
        /// Sets the maximum time that the server can spend processing the request, in seconds. The default is 30 seconds.
        public let timeout: Int32?

        /// A client-generated, opaque value with 1KB character limit that is recorded in analytics logs.
        /// Highly recommended for correlating client-side activites with requests received by the server.
        public let clientRequestId: String?

        /// A token used to make a best-effort attempt at canceling a request.
        public let cancellationToken: CancellationToken?

        /// A dispatch queue on which to call the completion handler. Defaults to `DispatchQueue.main`.
        public var dispatchQueue: DispatchQueue?

        /// A `PipelineContext` object to associate with the request.
        public var context: PipelineContext?

        /// Initialize a `GetMultiplePagesOptions` structure.
        /// - Parameters:
        ///   - pagingGetMultiplePagesOptions: Parameter group
        ///   - maxresults: Sets the maximum number of items to return in the response.
        ///   - timeout: Sets the maximum time that the server can spend processing the request, in seconds. The default is 30 seconds.
        ///   - clientRequestId: A client-generated, opaque value with 1KB character limit that is recorded in analytics logs.
        ///   - cancellationToken: A token used to make a best-effort attempt at canceling a request.
        ///   - dispatchQueue: A dispatch queue on which to call the completion handler. Defaults to `DispatchQueue.main`.
        ///   - context: A `PipelineContext` object to associate with the request.
        public init(
            pagingGetMultiplePagesOptions: PagingGetMultiplePagesOptions? = nil,
            maxresults: Int32? = nil,
            timeout: Int32? = nil,
            clientRequestId: String? = nil,
            cancellationToken: CancellationToken? = nil,
            dispatchQueue: DispatchQueue? = nil,
            context: PipelineContext? = nil
        ) {
            self.pagingGetMultiplePagesOptions = pagingGetMultiplePagesOptions
            self.maxresults = maxresults
            self.timeout = timeout
            self.clientRequestId = clientRequestId
            self.cancellationToken = cancellationToken
            self.dispatchQueue = dispatchQueue
            self.context = context
        }
    }
}
