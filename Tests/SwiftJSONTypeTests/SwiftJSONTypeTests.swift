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

        let trueBool: Bool = (true as JSONType).getValue() ?? false
        XCTAssertTrue(trueBool)
        XCTAssertFalse(((false as JSONType).value as? Bool) ?? true)
    }

    func testJSONTypeExpressibleByDictionaryLiteral() {
        let jsonType = JSONType(dictionaryLiteral: ("foo", 1))
        XCTAssertEqual((jsonType.value as? [String: JSONType])?.mapValues {$0.value as? Int}, ["foo": 1])

        var dictionary = [String: JSONType]()

        let keys = ["a", "b", "c", "d", "e", "f"]
        let values: [JSONType] = [true, 1, 2.0, "❄︎", nil, "foo"]

        for i in 0..<keys.count {
            dictionary[keys[i]] = values[i]
        }

        let jsonDictionaryType: JSONType = ["a": true, "b": 1, "d": 2.0, "c": nil, "e": "foo"]
        XCTAssertNotNil(jsonDictionaryType.getValue())
        XCTAssertNotNil(JSONType((dictionary as Encodable)).value)
    }

    func testJSONTypeExpressibleByFloatLiteral() {
        let jsonType = JSONType(floatLiteral: 2.0)
        XCTAssertEqual(jsonType.value as? Double, 2.0)
    }

    func testJSONTypeExpressibleByGraphemeClusterLiteral() {
        let jsonType = JSONType(extendedGraphemeClusterLiteral: "❄︎")
        XCTAssertEqual(jsonType.value as? String, "❄︎")
    }

    func testJSONTypeExpressibleByIntegerLiteral() {
        let jsonType = JSONType(integerLiteral: 1)
        XCTAssertEqual(jsonType.value as? Int, 1)
    }

    func testJSONTypeExpressibleByNilLiteral() {
        let jsonType = JSONType(nilLiteral: ())
        XCTAssertNil(jsonType.value)

        let nilJsonType: JSONType = nil
        XCTAssertNil(nilJsonType.value)
    }

    func testJSONTypeExpressibleByStringLiteral() {
        let jsonType = JSONType(stringLiteral: "Foo")
        XCTAssertEqual(jsonType.value as? String, "Foo")
    }

    func testEncodableObject() {
        let dict0: [String: JSONType] = ["baz": 100, "rect": Json(CGRect(x: 12, y: 12, width: 12, height: 12))]
        do {
            let encodedData = try JSONEncoder().encode(dict0)
            XCTAssertFalse(encodedData.isEmpty)
            let bar = try JSONDecoder().decode(Bar.self, from: encodedData)
            XCTAssertNotNil(bar)
            XCTAssertEqual(bar.baz, 100)
            XCTAssertEqual(bar.rect, CGRect(x: 12, y: 12, width: 12, height: 12))
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    static var allTests = [
        ("testJSONTypeExpressibleByArrayLiteral", testJSONTypeExpressibleByArrayLiteral),
        ("testJSONTypeExpressibleByBooleanLiteral", testJSONTypeExpressibleByBooleanLiteral),
        ("testJSONTypeExpressibleByDictionaryLiteral", testJSONTypeExpressibleByDictionaryLiteral),
        ("testJSONTypeExpressibleByFloatLiteral", testJSONTypeExpressibleByFloatLiteral),
        ("testJSONTypeExpressibleByGraphemeClusterLiteral", testJSONTypeExpressibleByGraphemeClusterLiteral),
        ("testJSONTypeExpressibleByIntegerLiteral", testJSONTypeExpressibleByIntegerLiteral),
        ("testJSONTypeExpressibleByNilLiteral", testJSONTypeExpressibleByNilLiteral),
        ("testJSONTypeExpressibleByStringLiteral", testJSONTypeExpressibleByStringLiteral),
        ]
}

// MARK: - Test Codable Class

class Bar: Codable {
    let baz: Int?
    let rect: CGRect

    init(baz: Int?) {
        self.baz = baz
        self.rect = .zero
    }
}
