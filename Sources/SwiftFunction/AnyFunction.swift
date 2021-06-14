//
//  AnyFunction.swift
//  
//
//  Created by 永田大祐 on 2021/06/15.
//

import UIKit

struct abc1 {
   var asd = 1
}

struct abc2 {
    var asd = 2
}

struct abc3 {
    var asd = 3
}

public class AnyFunction {

    public func anyCheck() {
        var sampleAny: [Any] = []
        var sampleAny2: [Any] = []
        var sampleAny3: [Any] = []

        sampleAny = [abc1(), abc3(), abc3(), abc1(), abc2(), abc3()]
        for value in sampleAny {
            if cast(value: value, type: abc1.self) != nil || cast(value: value, type: abc3.self) != nil {
                sampleAny2.append(value)
            } else {
                sampleAny3.append(value)
            }
        }
        print(sampleAny2, "🟢anyFunction")
        print(sampleAny3, "🟢anyFunction")
    }

    func cast<A>(value: Any?, type: A.Type) -> A? { return value as? A }
}
