//
//  Collection+isNotEmpty.swift
//  ItsME
//
//  Created by Jaewon Yun on 2023/03/24.
//

import Foundation

extension Collection {

    @available(*, deprecated, renamed: "hasElements", message: "It is possible that double negation is used.")
    /// A Boolean value indicating whether the collection is not empty.
    public var isNotEmpty: Bool {
        !isEmpty
    }

    /// A Boolean value indicating whether the collection has elements.
    public var hasElements: Bool {
        !isEmpty
    }
}
