//
//  ColorFunction.swift
//  
//
//  Created by 永田大祐 on 2021/07/05.
//

import SwiftUI

@available(iOS 14.0, *)
extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
