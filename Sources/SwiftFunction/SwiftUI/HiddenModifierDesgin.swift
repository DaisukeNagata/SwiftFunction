//
//  SwiftUIView.swift
//  SwiftUIView
//
//  Created by 永田大祐 on 2021/08/22.
//

import SwiftUI

@available(iOS 14.0, *)
struct HiddenModifier: ViewModifier {

    let isHidden: Bool

    func body(content: Content) -> some View {
        Group {
            if isHidden {
                content.hidden()
            } else {
                content
            }
        }
    }
}
