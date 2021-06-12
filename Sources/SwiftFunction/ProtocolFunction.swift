//
//  ProtocolFunction.swift
//  
//
//  Created by 永田大祐 on 2021/06/05.
//

import Foundation

public protocol ProtocolFunction {
     func protocolFunction<T>(type: T)
}

public class ProtocolFunctionA: NSObject, ProtocolFunction {

    public func protocolFunction<T>(type: T) {
        print(type, "🟢protocolFunctionA")
    }
}

public class ProtocolFunctionB: NSObject {
    public var delegate: ProtocolFunction?
}
