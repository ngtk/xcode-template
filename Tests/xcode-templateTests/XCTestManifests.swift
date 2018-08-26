import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(xcode_templateTests.allTests),
    ]
}
#endif