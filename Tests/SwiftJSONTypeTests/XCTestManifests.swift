import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SwiftJSONTypeTests.allTests),
    ]
}
#endif