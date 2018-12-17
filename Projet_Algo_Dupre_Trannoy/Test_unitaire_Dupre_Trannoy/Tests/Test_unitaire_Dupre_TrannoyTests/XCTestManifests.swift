import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Test_unitaire_Dupre_TrannoyTests.allTests),
    ]
}
#endif