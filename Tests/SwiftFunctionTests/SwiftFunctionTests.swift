    import XCTest
    @testable import SwiftFunction

    final class SwiftFunctionTests: XCTestCase {
        var forFunction =  ForFunction()
        var enumFunction =  EnumFunction()
        var firstFunction = FirstFunction()
        var stringSplitFunction = StringSplitFunction()
        func testExample() {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct
            // results.
            // XCTAssertEqual(SwiftFunction.text, "Hello, World!")
            forFunction.forAction(start: 0, end: 10)
            forFunction.forEatchAction(index: [1,2,3])
            forFunction.forInstanceAction(instance: [1,2,3])
            forFunction.forEnumerated(instance: [1,2,3])
            enumFunction.abcEnum(e: EnumFunction.ABC.a)
            print(EnumFunction.Count(rawValue: 0)!)
            print(enumFunction.checkAttr(attr: EnumFunction.Person.Age(age: 20)))
            print(enumFunction.checkAttr(attr: EnumFunction.Person.Name(name: "D")))
            firstFunction.firstIndexFunction()
            stringSplitFunction.stringSplit(str: "Hell12o, p3laygrou4.5nd", rangeSt: "[0-9-.]")
        }
    }
