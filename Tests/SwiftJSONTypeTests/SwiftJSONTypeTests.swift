import XCTest
@testable import SwiftJSONType

final class SwiftJSONTypeTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftJSONType().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
