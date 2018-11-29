import XCTest

import SwiftJSONTypeTests

var tests = [XCTestCaseEntry]()
tests += SwiftJSONTypeTests.allTests()
XCTMain(tests)