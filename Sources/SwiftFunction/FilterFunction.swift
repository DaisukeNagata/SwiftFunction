//
//  FilterFunction.swift
//  
//
//  Created by 永田大祐 on 2021/06/25.
//

import Foundation

public class FilterFunction {
    public func filterFunction(numbers: [Int]) {
        let evenNumber = numbers.filter { $0 % 2 == 0 }
        print(evenNumber, "🟢evenNumber") // [2, 4, 6, 8, 10]
         
        let oddNumber = numbers.filter{ $0 % 2 != 0 }
        print(oddNumber, "🟢oddNumber") // [1, 3, 5, 7, 9]

        let overEight = numbers.filter{ $0 >= 8 }
        print(overEight, "🟢overEight")
    }
}
