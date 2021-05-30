    import XCTest
    @testable import SwiftFunction

    final class SwiftFunctionTests: XCTestCase {
        let forFunction =  ForFunction()
        let enumFunction =  EnumFunction()
        let firstFunction = FirstFunction()
        let stringSplitFunction = StringSplitFunction()
        let mapFunction = MapFunction()
        let sortedFunction = SortedFunction()
        let orderedSetFunction = OrderedSetFunction()
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
            firstFunction.checkIndexFunction(numArray: [60, 70, 90, nil, 90, 0, 80, 80, 0, 80])
            stringSplitFunction.stringSplit(str: "Hell12o, p3laygrou4.5nd", rangeSt: "[0-9-.]")
            mapFunction.totalFunction()
            sortedFunction.dicSorted(dic: ["111": 111, "222": 222, "333": 333, "444": 444, "555": 555])
            
            let h = HashFunction.init(sectionID: "123", itemID: "345E")


            var hasher = Hasher()
            hasher.combine(h.sectionIDHash)
            hasher.combine(h.itemIDHash)

            let hash = hasher.finalize()
            print(h.sectionIDHash, "sectionIDHash")
            print(h.itemIDHash, "itemIDHash")
            print(hash, "hash")
            
            orderedSetFunction.orderedSet(searchWords: ["a","b","c","d","d","c","e","e"])
        }
    }
