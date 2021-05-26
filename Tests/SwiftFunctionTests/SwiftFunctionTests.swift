    import XCTest
    @testable import SwiftFunction

    final class SwiftFunctionTests: XCTestCase {
        func testExample() {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct
            // results.
            XCTAssertEqual(SwiftFunction().text, "Hello, World!")
        }
    }

    func forAction(start: Int, end: Int) {
        for i in start..<end {
            print(i)
        }
    }
