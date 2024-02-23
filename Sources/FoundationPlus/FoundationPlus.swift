import Foundation

/// <#Description#>
/// - Parameter item: <#item description#>
/// - Returns: <#description#>
public func allEmpty<each T: Collection>(_ item: repeat each T) -> Bool {
    let tuple = Tuple(repeat each item)
    let anyCollections = Array<any Collection>(tuple)!
    return anyCollections.allSatisfy { $0.isEmpty }
}

/// <#Description#>
/// - Parameter item: <#item description#>
/// - Returns: <#description#>
public func Tuple<each T>(_ item: repeat each T) -> (repeat each T) {
    return (repeat each item)
}
