//
//  WhileFunction.swift
//  
//
//  Created by 永田大祐 on 2021/05/31.
//

import Foundation

final class WhileFunction: NSObject {

    public func whileCount(value: Int) {
        var count = 0
        var total = 0
        while count < value {
            count += 1
            total += count
        }
        print(total)
    }
    
    public func repeatCount(value: Int) {
        var count = 0
        var total = 0
        repeat {
            count += 1
            total += count
        } while count < value
        print(total)
    }
}
