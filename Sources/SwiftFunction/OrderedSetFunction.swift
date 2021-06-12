//
//  OrderedSetFunction.swift
//  
//
//  Created by 永田大祐 on 2021/05/31.
//

import Foundation

public class OrderedSetFunction: NSObject {

    public func orderedSet(searchWords: [String]) {
        let orderedSet = NSOrderedSet(array: searchWords)
        let orderArray = (orderedSet.array as? [String])!
        var indexCheckArray = [String]()
        for (i, v) in orderArray.enumerated() {
            if let firstIndex = searchWords.firstIndex(where: {$0 == orderArray[i]}) {
                indexCheckArray.append(v)
                print("index: \(firstIndex)", "firstIndex")
            }
        }
        print(indexCheckArray, "orderedSet")
    }
}
