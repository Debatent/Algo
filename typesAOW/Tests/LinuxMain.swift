import XCTest

import ProtocoleCarteTests
import ProtocoleChampsDeBatailleTests
import ProtocoleCimetiereTests
import ProtocoleMainTests
import ProtocolePiocheTest
import ProtocolePositionTest
import ProtocoleRoyaumeTests

var tests = [XCTestCaseEntry]()
tests += ProtocoleCarteTests.allTestsCarte()
tests += ProtocoleChampsDeBatailleTests.allTestsChampsDeBataille()
tests += ProtocoleCimetiereTests.allTestsCimetiere()
tests += ProtocoleMainTests.allTestsMain()
tests += ProtocolePiocheTest.allTestsPioche()
tests += ProtocolePositionTest.allTestsPosition()
tests += ProtocoleRoyaume.allTestsRoyaume()

XCTMain(tests)