//
//  ClosureFunction.swift
//  
//
//  Created by 永田大祐 on 2021/06/01.
//

import Foundation

public class ClosureFunction: NSObject {

    public var textNumberClosure: (() -> Int)?
    public var numberClosure = { (_ value: Int?) -> Int? in return value }

    public func numberComponent(value: Int?) -> Int? {
        return numberClosure(value)
    }
    
    public func escapingFunction(call: @escaping () -> Void) {
        call()
    }
}
