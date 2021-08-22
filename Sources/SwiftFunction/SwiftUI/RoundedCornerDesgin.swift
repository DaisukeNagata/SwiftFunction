//
//  RoundedCornerDesgin.swift
//
//
//  Created by 永田大祐 on 2021/08/22.
//

import SwiftUI

@available(iOS 14.0, *)
struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
