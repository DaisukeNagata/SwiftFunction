    import XCTest
    @testable import SwiftFunction

    final class SwiftFunctionTests: XCTestCase {
        let closureFunction =  ClosureFunction()
        let dateFunction = DateFunction()
        let enumFunction =  EnumFunction()
        let firstIndexFunction = FirstIndexFunction()
        let forFunction =  ForFunction()
        let genericsFunction = GenericsFunction()
        let hashFunction = HashFunction(sectionID: "123", itemID: "456")
        let jsonFunction = JsonFunction()
        let mapFunction = MapFunction()
        let mathematicsFunction = MathematicsFunction(h: .zero, v:  .zero)
        let memoryUsage = MemoryUsage()
        let orderedSetFunction = OrderedSetFunction()
        let protocolFunctionA = ProtocolFunctionA()
        let protocolFunctionB = ProtocolFunctionB()
        let sortedFunction = SortedFunction()
        let stringFunction = StringFunction()
        let switchFunction = SwitchFunction()
        let stringSplitFunction = StringSplitFunction()
        let whileFunction = WhileFunction()

        func testExample() {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct
            // results.
            // XCTAssertEqual(SwiftFunction.text, "Hello, World!")

            // ClosureFunction
            print("--ClosureFunction--")
            print(closureFunction.numberComponent(value: 777) ?? 0)

            //DateFunction
            print("--DateFunction--")
            dateFunction.dateNowFunction(template: "yMMMdHms" ,identifier: "ja_JP")
            // EnumFunction
            print("--EnumFunction--")
            enumFunction.abcEnum(e: EnumFunction.ABC.a)
            print(EnumFunction.Count(rawValue: 0)!)
            print(enumFunction.checkAttr(attr: EnumFunction.Person.Age(age: 20)))
            print(enumFunction.checkAttr(attr: EnumFunction.Person.Name(name: "D")))

            // FirstIndexFunction
            print("--FirstIndexFunction--")
            firstIndexFunction.firstIndexFunction()
            firstIndexFunction.checkIndexFunction(numArray: [60, 70, 90, nil, 90, 0, 80, 80, 0, 80])

            // ForFunction
            print("--ForFunction--")
            forFunction.forAction(start: 0, end: 10)
            forFunction.forEatchAction(index: [1,2,3])
            forFunction.forInstanceAction(instance: [1,2,3])
            forFunction.forEnumerated(instance: [1,2,3])
            forFunction.forWhereInt(index: [1,2,3], fix: 3)

            // GenericsFunction
            print("--GenericsFunction--")
            let a = 10
            let b = 15
            let c = 20

            print(genericsFunction.bigger(a, val2: b, val3: c))
            print(genericsFunction.smaller(a, val2: b, val3: c))

            // HashFunction
            print("--HashFunction--")
            let h = HashFunction.init(sectionID: "123", itemID: "345E")
            var hasher = Hasher()
            hasher.combine(h.sectionIDHash)
            hasher.combine(h.itemIDHash)

            let hash = hasher.finalize()
            print(h.sectionIDHash, "sectionIDHash")
            print(h.itemIDHash, "itemIDHash")
            print(hash, "hash")

            // JsonFunction
            print("--JsonFunction--")
            /// ①初期オブジェクト生成
            let originalObject = JsonFunction.Employee(code: "001", name: "山田", age: 45, absence: false)
            jsonFunction.createJson(originalObject: originalObject)
    
            // MapFunction
            print("--MapFunction--")
            mapFunction.totalFunction()
            let items = ["A", "B", "C", "D", "A", "A"]
            print(items.indexes(of: "A"))
            // MathematicsFunction
            // 水平線からの角度を算出
            print(mathematicsFunction.angle(a: CGPoint(x: 50, y: 50), b: CGPoint(x: 100, y: 100)), "angle")

            // 放物線の距離を算出
            let p = MathematicsFunction(h: CGPoint(x: 50, y: 50), v: CGPoint(x: 100, y: 100))
            print(mathematicsFunction.angleLength(p1: CGPoint(x: 50, y: 50), p), "angleLength")

            // 座標に対する距離を算出
            print(mathematicsFunction.distance(a: CGPoint(x: 50, y: 50), b: CGPoint(x: 100, y: 100)), "distance")

            // sin 角度に対する 正弦に相当　　cos 角度に対する余弦に相当　　tan 角度に対する正接に相当
            print(mathematicsFunction.coordinate(cg: 100), "coordinate")

            // MemoryUsage
            print("--MemoryUsage--")
            print(memoryUsage.checkPointer())
            print(memoryUsage.reportMemory())

            // StringSplitFunction
            print("--StringSplitFunction--")
            stringSplitFunction.stringSplit(str: "Hell12o, p3laygrou4.5nd", rangeSt: "[0-9-.]")

            // SwitchFunction
            print("--SwitchFunction--")
            switchFunction.switchWhere(token: "123")
            switchFunction.switchWhere(token: "")
            switchFunction.switchWhere(token: nil)

            // SortedFunction
            print("--SortedFunction--")
            sortedFunction.dicSorted(dic: ["111": 111, "222": 222, "333": 333, "444": 444, "555": 555])

            // StringFunction
            print("--StringFunction--")
            let attributedStr = stringFunction.stringAttributes(title: "123", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), size: 17)
            let hyperlinkAtribute = stringFunction.hyperlinkAtribute(termsTitle: "Google",
                                                                     lineSpacing: 5,
                                                                     link: "https://google.com",
                                                                     title: "Google")
            print(attributedStr.string)
            print(hyperlinkAtribute.string)

            // OrderedSetFunction
            print("--OrderedSetFunction--")
            orderedSetFunction.orderedSet(searchWords: ["a","b","c","d","d","c","e","e"])
            
            // ProtocolFunction
            print("--ProtocolFunction--")
            protocolFunctionB.delegate = protocolFunctionA
            protocolFunctionB.delegate?.protocolFunction(type: "type")

            // WhileFunction
            print("--WhileFunction--")
            print(whileFunction.whileCount(value: 10))
            print(whileFunction.repeatCount(value: 10))
            print(whileFunction.whileJudge(value: 10))
        }
    }
