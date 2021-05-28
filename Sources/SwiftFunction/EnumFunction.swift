//
//  EnumFunction.swift
//  
//
//  Created by 永田大祐 on 2021/05/28.
//

import Foundation

public class EnumFunction: NSObject {

    public enum ABC<E> {
        case a,b,c
    }

    public func abcEnum(e: ABC<Any>) {
        switch e {
        case .a: print("a")
        case .b: print("b")
        case .c: print("c")
        }
    }
    
    public enum Count: Int {
        case a,b,c
        
        public func countEnum() {
            switch self {
            case .a:
                print(1)
            case .b:
                print(2)
            case .c:
                print(3)
            }
        }
    }
}
