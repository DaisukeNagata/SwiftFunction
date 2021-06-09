//
//  DateFunction.swift
//  
//
//  Created by 永田大祐 on 2021/06/10.
//

import Foundation

public class DateFunction {
    public func dateNowFunction() {
        let dt = Date()
        let dateFormatter = DateFormatter()
        // DateFormatter を使用して書式とロケールを指定する
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMdHms", options: 0, locale: Locale(identifier: "ja_JP"))
        print(dateFormatter.string(from: dt))
    }
}
