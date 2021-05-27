    import XCTest
    @testable import SwiftFunction

    final class SwiftFunctionTests: XCTestCase {
        var f =  ForAction()
        func testExample() {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct
            // results.
//            XCTAssertEqual(SwiftFunction.text, "Hello, World!")
            f.forAction(start: 0, end: 10)
            f.forEatchAction(index: [1,2,3])
            f.forInstanceAction(instance: [1,2,3])
            f.forEnumerated(instance: [1,2,3])
                
        }
    }

    func forAction(start: Int, end: Int) {
        for i in start..<end {
            print(i)
        }
    }
    
    func forAction_2(start: Int, end: Int) {
        for i in start...end {
            print(i)
        }
    }
    
    func forEatchAction<I>(index: [I]) {
        index.forEach { i in
            print(i)
        }
    }

    func forInstanceAction<I>(instance: [I]) {
        for index in instance {
            print(index)
        }
    }
