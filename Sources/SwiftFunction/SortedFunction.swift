//
//  SortedFunction.swift
//  
//
//  Created by 永田大祐 on 2021/05/31.
//

import Foundation

public class SortedFunction: NSObject {

    public func dicSorted(dic: Dictionary<String, Int>) {
        let thisissorted =  dic.sorted { (l, r) -> Bool in
            return l.value < r.value ? false : true
        }
        print(thisissorted, "🟢dicSorted")
    }
}
