import XCTest
@testable import DebugFormattingUtilities

final class DebugFormattingUtilitiesTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(DebugFormattingUtilities().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
