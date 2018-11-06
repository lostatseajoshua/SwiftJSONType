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

    func testJSONTypeExpressibleByDictionaryLiteral() {
        let jsonType = JSONType(dictionaryLiteral: ("foo", 1))
        XCTAssertEqual((jsonType.value as? [String: JSONType])?.mapValues {$0.value as? Int}, ["foo": 1])
    }

    func testJSONTypeExpressibleByFloatLiteral() {
        let jsonType = JSONType(floatLiteral: 2.0)
        XCTAssertEqual(jsonType.value as? Double, 2.0)
    }

    func testJSONTypeExpressibleByGraphemeClusterLiteral() {
        let jsonType = JSONType(extendedGraphemeClusterLiteral: "❄︎")
        XCTAssertEqual(jsonType.value as? String, "❄︎")
    }

    }

    static var allTests = [
        ("testJSONTypeExpressibleByArrayLiteral", testJSONTypeExpressibleByArrayLiteral),
        ("testJSONTypeExpressibleByBooleanLiteral", testJSONTypeExpressibleByBooleanLiteral),
        ("testJSONTypeExpressibleByDictionaryLiteral", testJSONTypeExpressibleByDictionaryLiteral),
        ("testJSONTypeExpressibleByGraphemeClusterLiteral", testJSONTypeExpressibleByGraphemeClusterLiteral),
        ]
}
