//
//  LazyHGridDesgin.swift
//  
//
//  Created by 永田大祐 on 2021/07/10.
//

import SwiftUI

@available(iOS 14.0, *)
struct LazyVHtackContentView: View {
    var rows: [GridItem] =
    Array(repeating: .init(.fixed(20)), count: 2)
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, alignment: .top) {
                ForEach((0...79), id: \.self) {
                    let codepoint = $0 + 0x1f600
                    let codepointString = String(format: "%02X", codepoint)
                    Text("\(codepointString)")
                        .font(.footnote)
                    let emoji = String(Character(UnicodeScalar(codepoint)!))
                    Text("\(emoji)")
                        .font(.largeTitle)
                }
            }
        }
    }
}

@available(iOS 14.0, *)
struct LazyVHtackContentView_Previews: PreviewProvider {
    static var previews: some View {
        LazyVHtackContentView()
    }
}
