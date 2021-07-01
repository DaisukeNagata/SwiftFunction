//
//  LazyVGridDesginView.swift
//  
//
//  Created by 永田大祐 on 2021/07/02.
//

import SwiftUI

@available(iOS 14.0, *)
struct LazyVGridDesginView: View {
    var columns: [GridItem] =
             Array(repeating: .init(.flexible()), count: 2)
    var body: some View {
        ScrollView {
             LazyVGrid(columns: columns) {
                 ForEach((0...79), id: \.self) {
                     let codepoint = $0 + 0x1f600
                     let emoji = String(Character(UnicodeScalar(codepoint)!))
                     Text("\(emoji)")

                 }
             }.font(.largeTitle)
         }
    }
}

@available(iOS 14.0, *)
struct LazyVGridDesginView_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGridDesginView()
    }
}
