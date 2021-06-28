//
//  WrapperFunction.swift
//  
//
//  Created by 永田大祐 on 2021/06/29.
//

import SwiftUI

public class WrapperFunction {
    @propertyWrapper
    public struct Wrapper<Value> {
        public var wrappedValue: Value
        
        public var projectedValue: Self {
            
            return self
        }
        
        public init(wrappedValue: Value) {
            self.wrappedValue = wrappedValue
        }
        
        public init(projectedValue: Self) {
            self.wrappedValue = projectedValue.wrappedValue
            
        }
    }
    
    public func wrapperTest(@Wrapper value: Int) {
        print(value, "🟢wrapperTest")
        print($value, "🟢wrapperTest")
        print(_value, "🟢wrapperTest")
    }
    
    public func wrapperTestA() {
        wrapperTest(value: 10)
        let projection = Wrapper(wrappedValue: 10)
        wrapperTest($value: projection)
    }
}
