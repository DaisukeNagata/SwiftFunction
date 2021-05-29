//
//  FirstFunction.swift
//  
//
//  Created by 永田大祐 on 2021/05/30.
//

import Foundation

public class FirstFunction: NSObject {

    public func firstIndexFunction() {
        let scheduleArray = ["00","01","02"]
        for i in 0..<scheduleArray.count{
            if let firstIndex = scheduleArray.firstIndex(of: scheduleArray[i]) {
                print(firstIndex)
            }
        }
    }
}
