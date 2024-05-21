import Foundation

extension Array {

    /// Creates a new array from the given tuple.
    ///
    /// - Parameter tuple: The tuple to turn into an array. The items in the tuple must be representable by the `Element` type of which `array` to create.
    public init?<Tuple>(_ tuple: Tuple) {
        let mirror: Mirror = .init(reflecting: tuple)

        guard mirror.displayStyle == .tuple else {
            return nil
        }

        var sequence: [Element] = []

        for child in mirror.children {
            guard let value = child.value as? Element else {
                return nil
            }

            sequence.append(value)
        }

        self.init(sequence)
    }
}

extension Array where Element: CaseIterable & Equatable {

    /// Returns the index corresponding to the given enum value in the `AllCases`.
    ///
    /// - Parameter enumValue: The value of enum.
    /// - Returns: The index corresponding to the given `enumValue`.
    public func index(of enumValue: Element) -> Int {
        guard let index = self.firstIndex(of: enumValue) else {
            fatalError("This method was used where it was not appropriate.")
        }
        return index
    }

}
