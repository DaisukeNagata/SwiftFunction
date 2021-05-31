//
//  ClosureFunction.swift
//  
//
//  Created by 永田大祐 on 2021/06/01.
//

import Foundation

public class ClosureFunction: NSObject {

    public var rowsInComponent = { (_ value: Int?) -> Int? in return value }

    public func nomberComponent(value: Int?) -> Int? {
        return rowsInComponent(value)
    }
}
