//
//  FirstIndexFunction.swift
//  
//
//  Created by 永田大祐 on 2021/05/30.
//

import Foundation

public class FirstIndexFunction: NSObject {

    public func firstIndexFunction() {
        let scheduleArray = ["00","01","02"]
        for i in 0..<scheduleArray.count{
            if let firstIndex = scheduleArray.firstIndex(of: scheduleArray[i]) {
                print(firstIndex)
            }
        }
    }
    
    public func checkIndexFunction(numArray: [Int?]) {
        for (i, v) in numArray.enumerated() {
            if ((numArray.firstIndex(where: { _ in 0 != v && v != nil })) != nil) {
                print("index: \(i)")
            }
        }
    }
}
