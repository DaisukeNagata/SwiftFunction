    import XCTest
    @testable import SwiftFunction

    final class SwiftFunctionTests: XCTestCase {
        let forFunction =  ForFunction()
        let enumFunction =  EnumFunction()
        let firstFunction = FirstIndexFunction()
        let stringSplitFunction = StringSplitFunction()
        let mapFunction = MapFunction()
        let sortedFunction = SortedFunction()
        let orderedSetFunction = OrderedSetFunction()
        let genericsFunction = GenericsFunction()
        let whileFunction = WhileFunction()
        let mathematicsFunction = MathematicsFunction(h: .zero, v:  .zero)
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
            
            
            let a = 10
            let b = 15
            let c = 20

            print(genericsFunction.bigger(a, val2: b, val3: c))

            print(genericsFunction.smaller(a, val2: b, val3: c))
            
            print(whileFunction.whileCount(value: 10))
            print(whileFunction.repeatCount(value: 10))
            print(whileFunction.whileJudge(value: 10))
            
            // 水平線からの角度を算出
            print(mathematicsFunction.angle(a: CGPoint(x: 50, y: 50), b: CGPoint(x: 100, y: 100)), "angle")

            // 放物線の距離を算出
            let p = MathematicsFunction(h: CGPoint(x: 50, y: 50), v: CGPoint(x: 100, y: 100))
            print(mathematicsFunction.angleLength(p1: CGPoint(x: 50, y: 50), p), "angleLength")

            // 座標に対する距離を算出
            print(mathematicsFunction.distance(a: CGPoint(x: 50, y: 50), b: CGPoint(x: 100, y: 100)), "distance")

            // sin 角度に対する 正弦に相当　　cos 角度に対する余弦に相当　　tan 角度に対する正接に相当
            print(mathematicsFunction.coordinate(cg: 100), "coordinate")
        }
    }
