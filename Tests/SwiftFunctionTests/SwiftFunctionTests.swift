    import XCTest
    @testable import SwiftFunction

    final class SwiftFunctionTests: XCTestCase {
        var f =  ForAction()
        var e =  EnumFunction()
        func testExample() {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct
            // results.
            // XCTAssertEqual(SwiftFunction.text, "Hello, World!")
            f.forAction(start: 0, end: 10)
            f.forEatchAction(index: [1,2,3])
            f.forInstanceAction(instance: [1,2,3])
            f.forEnumerated(instance: [1,2,3])
            e.abcEnum(e: EnumFunction.ABC.a)
            print(EnumFunction.Count(rawValue: 0)!)
            print(e.checkAttr(attr: EnumFunction.Person.Age(age: 20)))
            print(e.checkAttr(attr: EnumFunction.Person.Name(name: "D")))
        }
    }
