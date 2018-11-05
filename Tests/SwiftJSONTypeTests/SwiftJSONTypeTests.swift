import XCTest
@testable import SwiftJSONType

final class SwiftJSONTypeTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertNil(JSONType(nil).value)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
