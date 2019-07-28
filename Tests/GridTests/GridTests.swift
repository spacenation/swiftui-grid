import XCTest
@testable import Grid

final class GridTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Grid().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
