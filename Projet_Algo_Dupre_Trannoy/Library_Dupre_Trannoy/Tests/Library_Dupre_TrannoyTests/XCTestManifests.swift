import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Library_Dupre_TrannoyTests.allTests),
    ]
}
#endif