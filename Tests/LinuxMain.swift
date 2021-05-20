import XCTest

import CSecp256k1Tests

var tests = [XCTestCaseEntry]()
tests += CSecp256k1Tests.__allTests()

XCTMain(tests)
