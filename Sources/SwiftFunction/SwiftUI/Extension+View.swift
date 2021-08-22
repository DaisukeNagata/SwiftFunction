//
//  Extension+View.swift
//  
//
//  Created by 永田大祐 on 2021/08/22.
//

import SwiftUI

@available(iOS 14.0, *)
extension View {
    func isHidden(_ bool: Bool) -> some View {
        modifier(HiddenModifier(isHidden: bool))
    }
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
