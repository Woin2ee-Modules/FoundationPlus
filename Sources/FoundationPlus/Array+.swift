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

    /// AllCases 배열에서 주어진 열거형 값에 해당하는 index 를 반환합니다.
    /// - Parameter element: 열거형 값
    /// - Returns: 주어진 열거형 값에 해당하는 index
    public func index(of element: Element) -> Int {
        guard let index = self.firstIndex(of: element) else {
            fatalError("This method was used where it was not appropriate.")
        }
        return index
    }

}
