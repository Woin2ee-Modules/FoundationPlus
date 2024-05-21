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

extension Collection where Element: Comparable & SignedNumeric {
    
    /// Returns a closest element with passed `value` parameter.
    ///
    /// This method will figure closest value through numerical difference.
    /// If the elements with the same diff exist, returns element that it is first in the index.
    ///
    /// - Parameter value: A baseline value.
    /// - Returns: A closest element.
    public func closest(with value: Element) -> Element? {
        guard self.hasElements else { return nil }

        var closestSet: (element: Element, diff: Element)?
        
        self.forEach { element in
            let currentDiff = abs(element - value)
            
            if closestSet == nil {
                closestSet = (element, currentDiff)
                return
            }

            if currentDiff < closestSet!.diff {
                closestSet = (element, currentDiff)
            }
        }
        
        return closestSet?.element
    }
}
