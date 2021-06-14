//
//  AnyFunction.swift
//  
//
//  Created by 永田大祐 on 2021/06/15.
//

public struct Abc1 {
    public var asd = 1
}

public struct Abc2 {
    public var asd = 2
}

public struct Abc3 {
    public var asd = 3
}

public class AnyFunction {

    public func anyIndexDataCheck() {
        var sampleAny: [Any] = []
        var sampleAny2: [Any] = []
        var sampleAny3: [Any] = []

        sampleAny = [Abc1(), Abc3(), Abc3(), Abc1(), Abc2(), Abc3()]
        for value in sampleAny {
            if cast(value: value, type: Abc1.self) != nil || cast(value: value, type: Abc3.self) != nil {
                sampleAny2.append(value)
            } else {
                sampleAny3.append(value)
            }
        }
        print(sampleAny2, "🟢anyFunction")
        guard let sample = sampleAny3 as? [Abc2] else { return }
        sample.forEach { s in
            print(s.asd, "🟢anyFunction")
        }
    }

    func cast<A>(value: Any?, type: A.Type) -> A? { return value as? A }
}
