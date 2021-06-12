//
//  ForFunction.swift
//
//
//  Created by 永田大祐 on 2021/05/30.
//

import Foundation

public class ForFunction: NSObject {
    public func forAction(start: Int, end: Int) {
        for i in start..<end {
            print(i, "🟢forAction")
        }
    }

    public func forEatchAction<I>(index: [I]) {
        index.forEach { i in
            print(i, "🟢forEatchAction")
        }
    }

    public func forInstanceAction<I>(instance: [I]) {
        for index in instance {
            print(index, "🟢forInstanceAction")
        }
    }

    public func forEnumerated<I>(instance: [I]) {
        for (i,v) in instance.enumerated() {
            print(i, "🟢forEnumerated")
            print(v, "🟢forEnumerated")
        }
    }
    
    public func forWhereInt(index: [Int], fix: Int) {
        for count in index where count == fix {
            print(count, "🟢forWhereInt")
        }
    }
}
