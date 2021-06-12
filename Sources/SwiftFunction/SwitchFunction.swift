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
            print(value.isEmpty, "🟢switchWhere")
        case let .some(value):
            print(value.isEmpty, "🟢switchWhere")
        case .none:
            print(token ?? "nil", "🟢switchWhere")
        }
    }
}
