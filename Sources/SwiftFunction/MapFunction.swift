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
    
    public func compactMapFunction(value: [Int?]) -> [Int]{
        let list: [Int] = value.compactMap { $0 }
        return list
    }
}

public extension Array where Element: Equatable {
    func indexes(of element: Element) -> [Int] {
        return self.enumerated().filter({ element == $0.element }).map({ $0.offset })
    }
}
