//
//  DateFunction.swift
//  
//
//  Created by 永田大祐 on 2021/06/10.
//

import Foundation

public class DateFunction {
    public func dateNowFunction(template: String, identifier: String) {
        let dt = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: template, options: 0, locale: Locale(identifier: identifier))
        print(dateFormatter.string(from: dt))
    }
}
