import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Main_Dupre_TrannoyTests.allTests),
    ]
}
#endif