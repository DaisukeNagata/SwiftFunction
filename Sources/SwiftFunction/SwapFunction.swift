//
//  SwapFunction.swift
//  
//
//  Created by 永田大祐 on 2021/06/16.
//

import Foundation

public class SwapFunction {
    
    func swapFUnction(a: [Int], s: Int, e: Int) -> [Int] {
        var b = a
        b.swapAt(e, s)
        return b
    }
}
