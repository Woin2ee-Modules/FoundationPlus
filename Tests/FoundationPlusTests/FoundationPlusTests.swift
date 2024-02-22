import XCTest
@testable import FoundationPlus

final class FoundationPlusTests: XCTestCase {

    func test_isNotEmpty() {
        XCTAssertEqual("Test".isNotEmpty, true)
        XCTAssertEqual("".isNotEmpty, false)
    }

    func test_hasElements() {
        XCTAssertTrue([1, 2, 3].hasElements)
    }

    func test_indexOfCaseIterable() {
        // Given
        let testCase: TestEnum = .test2

        // When
        let index = TestEnum.allCases.index(of: testCase)

        // Then
        XCTAssertEqual(TestEnum.allCases.firstIndex(of: testCase), index)
    }

    @available(iOS 13.0, *)
    func test_asyncForEach() async {
        // Given
        var numberSet: Set<Int> = .init()

        func add(_ number: Int) async {
            numberSet.insert(number)
        }

        // When
        await (1...5).asyncForEach { number in
            await add(number)
        }

        // Then
        XCTAssertEqual(numberSet, .init([1, 2, 3, 4, 5]))
    }

    @available(iOS 13.0, *)
    func test_catchErrorInTask() {
        Task {
            throw TestError.testError
        } catch: { error in
            XCTAssertEqual(error as? TestError, TestError.testError)
        }
    }

    func test_tupleToArray_whenSameTypes() {
        let tuple = (first: 1, 2, last: 3)
        let array = [Int](tuple)
        XCTAssertEqual(array, [1, 2, 3])
    }

    func test_tupleToArray_whenDifferentTypes() {
        let tuple = (first: 1, 2, "3")
        let array = [Int](tuple)
        XCTAssertNil(array)
    }

    func test_tupleToArray_whenAllElementsConformProtocol() {
        let tuple = (1, 2.2, "A")
        let array = [CustomStringConvertible](tuple)
        XCTAssertEqual(array?.map { $0.description }, ["1", "2.2", "A"])
    }

    func test_tupleToArray_whenAnyElementNotConformProtocol() {
        struct Human {
            var name: String
        }
        let tuple = (1, 2.2, Human(name: "Tom"))
        let array = [CustomStringConvertible](tuple)
        XCTAssertNil(array)
    }
}
