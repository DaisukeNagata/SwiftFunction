    import XCTest
    @testable import SwiftFunction

    final class SwiftFunctionTests: XCTestCase {
        let closureFunction =  ClosureFunction()
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
        let sortedFunction = SortedFunction()
        let stringSplitFunction = StringSplitFunction()
        let whileFunction = WhileFunction()
        let uRLSessionFunction = URLSessionFunction()
        func testExample() {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct
            // results.
            // XCTAssertEqual(SwiftFunction.text, "Hello, World!")

            // ClosureFunction
            print(closureFunction.numberComponent(value: 777) ?? 0)

            // EnumFunction
            enumFunction.abcEnum(e: EnumFunction.ABC.a)
            print(EnumFunction.Count(rawValue: 0)!)
            print(enumFunction.checkAttr(attr: EnumFunction.Person.Age(age: 20)))
            print(enumFunction.checkAttr(attr: EnumFunction.Person.Name(name: "D")))

            // FirstIndexFunction
            firstIndexFunction.firstIndexFunction()
            firstIndexFunction.checkIndexFunction(numArray: [60, 70, 90, nil, 90, 0, 80, 80, 0, 80])

            // ForFunction
            forFunction.forAction(start: 0, end: 10)
            forFunction.forEatchAction(index: [1,2,3])
            forFunction.forInstanceAction(instance: [1,2,3])
            forFunction.forEnumerated(instance: [1,2,3])

            // GenericsFunction
            let a = 10
            let b = 15
            let c = 20

            print(genericsFunction.bigger(a, val2: b, val3: c))
            print(genericsFunction.smaller(a, val2: b, val3: c))

            // HashFunction
            let h = HashFunction.init(sectionID: "123", itemID: "345E")
            var hasher = Hasher()
            hasher.combine(h.sectionIDHash)
            hasher.combine(h.itemIDHash)

            let hash = hasher.finalize()
            print(h.sectionIDHash, "sectionIDHash")
            print(h.itemIDHash, "itemIDHash")
            print(hash, "hash")

            // JsonFunction
            /// ①初期オブジェクト生成
            let originalObject = JsonFunction.Employee(code: "001", name: "山田", age: 45, absence: false)
            jsonFunction.createJson(originalObject: originalObject)
    
            // MapFunction
            mapFunction.totalFunction()

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
            print(memoryUsage.checkPointer())
            print(memoryUsage.reportMemory())

            // StringSplitFunction
            stringSplitFunction.stringSplit(str: "Hell12o, p3laygrou4.5nd", rangeSt: "[0-9-.]")

            // SortedFunction
            sortedFunction.dicSorted(dic: ["111": 111, "222": 222, "333": 333, "444": 444, "555": 555])

            // OrderedSetFunction
            orderedSetFunction.orderedSet(searchWords: ["a","b","c","d","d","c","e","e"])
            // WhileFunction
            print(whileFunction.whileCount(value: 10))
            print(whileFunction.repeatCount(value: 10))
            print(whileFunction.whileJudge(value: 10))
        }
        
        func testAsync() {
            delay(testCase: self, seconds: 10)
        }

        func delay(testCase: XCTestCase, seconds: Float) {
            let delay = testCase.expectation(description: "URLSessionFunction")
            let url = URL(string: "https://7tslpj7nwg.execute-api.ap-northeast-1.amazonaws.com/default/DateTime?&os=\(UIDevice.current.systemVersion.description)&uuid=\(UIDevice.current.identifierForVendor?.uuidString ?? "")&type=ios")
            uRLSessionFunction.request(url: url!, completion:{ data, res, error in
                do{
                    if let data = data {
                        let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                        print(json)
                        delay.fulfill()
                        XCTAssert(true, "Sucsess")
                    }
                } catch{
                    XCTAssert(false, "Serialize Error.")
                }
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(seconds)) {
                delay.fulfill()
            }
            testCase.waitForExpectations(timeout: TimeInterval(seconds))
        }
    }
