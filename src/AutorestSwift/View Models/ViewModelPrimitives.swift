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

/// formatted version of comment
struct ViewModelComment: CustomStringConvertible {
    var withoutPrefix: String
    var description: String

    init(from descVal: String?) {
        guard let desc = descVal,
            desc.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
            self.description = ""
            self.withoutPrefix = ""
            return
        }
        // ensure multi-line comments are each commented
        let lines = desc.split(whereSeparator: \.isNewline).map { "/// \($0)" }
        description = lines.joined(separator: "\n")
        /// save a version without the leading /// for use in doc comments.
        withoutPrefix = String(description.dropFirst("/// ".count))
    }
}

/// formatted version of a default value
struct ViewModelDefault: CustomStringConvertible {
    var description: String

    init(from defaultValue: String?, isString: Bool, isOptional: Bool) {
        self.description = isOptional ? " = nil" : ""
        guard let val = defaultValue else { return }
        guard val.trimmingCharacters(in: .whitespacesAndNewlines) != "" else { return }
        self.description = isString ? " = \"\(val)\"" : " = \(val)"
    }
}
