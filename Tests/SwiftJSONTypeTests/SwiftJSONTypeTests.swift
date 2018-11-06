import XCTest

@testable import SwiftJSONType

final class SwiftJSONTypeTests: XCTestCase {
    func testJSONTypeExpressibleByArrayLiteral() {
        let jsonType = JSONType(value: [1])
        XCTAssertNotNil(jsonType.value)
        XCTAssertEqual(jsonType.value as? [Int], [1])

        let array: [JSONType] = [1]
        let values = array.map({$0.value as? Int})
        XCTAssertEqual(values, [1])
    }

    func testJSONTypeExpressibleByBooleanLiteral() {
        let jsonType = JSONType(booleanLiteral: true)
        XCTAssertTrue(jsonType.value as? Bool ?? false)
    }

    }

    static var allTests = [
        ("testJSONTypeExpressibleByArrayLiteral", testJSONTypeExpressibleByArrayLiteral),
        ("testJSONTypeExpressibleByBooleanLiteral", testJSONTypeExpressibleByBooleanLiteral),
        ]
}
