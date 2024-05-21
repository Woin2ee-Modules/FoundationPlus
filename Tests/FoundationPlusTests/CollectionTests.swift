import FoundationPlus
import XCTest

final class CollectionTests: XCTestCase {
}

// MARK: closest(with:)

extension CollectionTests {
    
    func testClosestValueAmongSortedDecimalNumbers() {
        let arr: [CGFloat] = [0.1, 0.2, 0.3, 0.4, 0.5]
        let closestValue = arr.closest(with: 0.31)
        XCTAssertEqual(closestValue, 0.3)
    }
    
    func testClosestValueToDownAmongSortedIntegers() {
        let arr: [CGFloat] = [-5, -4, -3, -2, -1, 0, 1, 2, 3, 4]
        let closestValue = arr.closest(with: -1.9)
        XCTAssertEqual(closestValue, -2)
    }
    
    func testClosestValueToUpAmongSortedIntegers() {
        let arr: [CGFloat] = [-5, -4, -3, -2, -1, 0, 1, 2, 3, 4]
        let closestValue = arr.closest(with: -0.45)
        XCTAssertEqual(closestValue, 0)
    }
    
    func testClosestValueWhenOnlyOneNegativeElement() {
        let arr: [CGFloat] = [-3]
        let closestValue = arr.closest(with: -9999)
        XCTAssertEqual(closestValue, -3)
    }
    
    func testClosestValueWhenOnlyOnePositiveElement() {
        let arr: [CGFloat] = [3]
        let closestValue = arr.closest(with: 9999)
        XCTAssertEqual(closestValue, 3)
    }
    
    func testClosestValueWhenNoElements() {
        let arr: [CGFloat] = []
        let closestValue = arr.closest(with: 123)
        XCTAssertNil(closestValue)
    }
    
    func test_closest_whenDiffsEqual() {
        let arr = [-1, 1]
        let closestValue = arr.closest(with: 0)
        XCTAssertEqual(closestValue, -1)
    }
    
    func test_closest_whenComplexList() {
        let arr = [
            -7088.69,
             -1940.42,
             -4565.73,
             -5650.56,
             4613.19,
             -2994.63,
             -4369.85,
             8510.62,
             -4421.08,
             -5813.07
        ]
        let closestValue = arr.closest(with: -5228.64)
        XCTAssertEqual(closestValue, -5650.56)
    }
}
