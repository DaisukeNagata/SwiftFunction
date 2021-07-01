//
//  StaticMemberFunction.swift
//  
//
//  Created by 永田大祐 on 2021/07/01.
//

public protocol Copyable {
    func copy22() -> Self
    func copy222(count: Int) -> Self
}

public class StaticMemberFunction {

    public func test(c: Copyable) {
        let copy: Copyable = c.copy22() // OK
        let copies: Copyable = c.copy222(count: 5) // also OK
        print(copy, "🟢copy")
        print(copies, "🟢copies")
    }
}
