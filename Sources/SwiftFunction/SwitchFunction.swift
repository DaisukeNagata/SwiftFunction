//
//  SwitchFunction.swift
//  
//
//  Created by 永田大祐 on 2021/06/08.
//

import Foundation

public class SwitchFunction {
    public func switchWhere(token: String?) {
        switch token {
        case let .some(value) where value.isEmpty:
            print(value.isEmpty)
        case let .some(value):
            print(value.isEmpty)
        case .none:
            print(token ?? "nil")
        }
    }
}
