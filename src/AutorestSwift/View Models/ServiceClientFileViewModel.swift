// --------------------------------------------------------------------------
//
// Copyright (c) Microsoft Corporation. All rights reserved.
//
// The MIT License (MIT)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the ""Software""), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED *AS IS*, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.
//
// --------------------------------------------------------------------------

import Foundation

/// View Model for the service client file.
struct ServiceClientFileViewModel {
    let name: String
    let comment: ViewModelComment
    let operationGroups: [OperationGroupViewModel]
    let apiVersion: String
    let apiVersionName: String
    let protocols: String
    let paging: Language.PagingNames?
    let globalParameters: [ParameterViewModel]
    // A dictionary of all the named operation group. Key is the group name , Value is the operation group view model.
    let namedOperationGroups: [String: OperationGroupViewModel]
    // A key,Value pairs of all the named operation group for stencil template engine
    let namedOperationGroupShortcuts: [PropertyViewModel]
    let host: String

    init(from model: CodeModel) {
        self.name = "\(model.packageName)Client"
        self.comment = ViewModelComment(from: model.description)
        var operationGroups = [OperationGroupViewModel]()
        var namedOperationGroups = [String: OperationGroupViewModel]()
        var namedOperationGroupShortcuts = [PropertyViewModel]()
        for group in model.operationGroups {
            let viewModel = OperationGroupViewModel(from: group, with: model)
            if viewModel.name.isEmpty {
                operationGroups.append(viewModel)
            } else {
                namedOperationGroups[viewModel.name] = viewModel
            }
        }
        self.operationGroups = operationGroups
        self.namedOperationGroups = namedOperationGroups
        self.apiVersion = model.getApiVersion()
        /// Swift enums should contain only alphanumeric characters.
        self
            .apiVersionName =
            "v\(apiVersion.replacingOccurrences(of: "-", with: "").replacingOccurrences(of: ".", with: ""))"
        self.paging = model.pagingNames
        self.protocols = paging != nil ? "PipelineClient, PageableClient" : "PipelineClient"

        (self.globalParameters, self.host) = resolveGlobalParameters(from: model)

        for key in namedOperationGroups.keys.sorted() {
            namedOperationGroupShortcuts.append(PropertyViewModel(name: key.lowercasedFirst, type: key))
        }
        self.namedOperationGroupShortcuts = namedOperationGroupShortcuts
    }
}

func resolveGlobalParameters(from model: CodeModel) -> ([ParameterViewModel], String) {
    var globalParameters = [ParameterViewModel]()
    var host: String?
    var hostString: String
    for globalParameter in model.globalParameters ?? [] {
        if globalParameter.name == "$host" {
            host = globalParameter.value.clientDefaultValue
            // `endpoint` and `apiVersion` have different logic in generated code. Do not add them to the list of global parameters
        } else if !["endpoint", "apiVersion"].contains(globalParameter.variableName) {
            globalParameters.append(ParameterViewModel(from: globalParameter))
        }
    }

    if let hostValue = host {
        hostString = "\"\(hostValue)\""
    } else {
        hostString = ""
    }

    return (globalParameters, hostString)
}
