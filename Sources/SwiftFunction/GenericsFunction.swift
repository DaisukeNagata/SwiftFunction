//
//  GenericsFunction.swift
//  
//
//  Created by 永田大祐 on 2021/05/31.
//

import Foundation

public class GenericsFunction: NSObject {

    func bigger<T:Comparable>(_ val1: T, val2: T,val3: T) -> T {
        return max(val1, val2,val3)
    }

    func smaller<T:Comparable>(_ val1: T, val2: T,val3: T) -> T {
        return min(val1, val2,val3)
    }
}
