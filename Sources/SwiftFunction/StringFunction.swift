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
    
    public func hyperlinkAtribute(termsTitle: String,
                                  lineSpacing: CGFloat,
                                  link: String,
                                  title: String) -> NSAttributedString {

        var attributedString = NSMutableAttributedString()
        let paragraphStyle   = NSMutableParagraphStyle()
        var attributes       : [NSAttributedString.Key: Any] = [:]

        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.alignment = .left
        attributes.updateValue(paragraphStyle, forKey: .paragraphStyle)
        attributedString = NSMutableAttributedString(string: termsTitle)
        attributedString.addAttribute(.link,
                                      value: link,
                                      range: NSString(string: termsTitle).range(of: title))

        let allLink  = NSString(string: termsTitle).range(of: termsTitle)
        attributedString.addAttributes(attributes, range: allLink)
        return attributedString
    }
}
