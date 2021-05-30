//
//  MapFunction.swift
//  
//
//  Created by 永田大祐 on 2021/05/31.
//

import Foundation

public class MapFunction: NSObject {

    public func totalFunction() {
        let array = [1, 2, 3, 4, 5]

        let total = array.map { $0 }.reduce(.zero, +)

        let average = array.map { $0 }.reduce(.zero, +)/array.count

        print(total)
        print(average)
    }
}
