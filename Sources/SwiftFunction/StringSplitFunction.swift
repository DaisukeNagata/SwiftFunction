//
//  StringSplitFunction.swift
//  
//
//  Created by 永田大祐 on 2021/05/31.
//
import Foundation

public class StringSplitFunction: NSObject {

    public func stringSplit(str: String, rangeSt: String) {
        var ans = ""
        var ans2 = ""
            str.forEach { s in
            if (s.description.range(of: rangeSt,
                                     options: .regularExpression,
                                     range: nil,
                                     locale: nil) != nil) {

                ans += s.description
            } else {
                ans2 += s.description
            }
        }
        print(ans, "🟢stringSplit")
        print(ans2, "🟢stringSplit")
    }
}
