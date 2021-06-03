//
//  StringFunction.swift
//  
//
//  Created by 永田大祐 on 2021/06/04.
//

import UIKit

public class StringFunction: NSObject {

    public func stringAttributes(title: String, color: UIColor, size: CGFloat) -> NSAttributedString {
        let stringAttributes: [NSAttributedString.Key : Any] = [
            .foregroundColor : color,
            .font : UIFont.systemFont(ofSize: size)
        ]
        let string = NSAttributedString(string: title, attributes:stringAttributes)
        return string
    }
}
