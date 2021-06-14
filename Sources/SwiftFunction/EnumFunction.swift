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
        case .a: print("a","🟢abcEnuma")
        case .b: print("b","🟢abcEnumb")
        case .c: print("c","🟢abcEnumc")
        }
    }
    
    public enum Count: Int {
        case a,b,c
        
        public func countEnum() {
            switch self {
            case .a:
                print(1,"🟢Counta")
            case .b:
                print(2,"🟢Countb")
            case .c:
                print(3,"🟢Countc")
            }
        }
    }

    public enum Person {
        case Name(name: String)
        case Age(age: Int)
    }

    public func checkAttr(attr: Person) {
        switch attr {
        case .Age(age: 0...25):
            print("Age = 0...25", "🟢checkAttrAge")
        case .Name(let name):
            print("Name = \(name)", "🟢checkAttrName")
        default:
            break
        }
    }
}
