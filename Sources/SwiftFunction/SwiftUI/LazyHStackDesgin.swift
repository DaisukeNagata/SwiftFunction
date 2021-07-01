//
//  LazyVHtackView.swift
//  
//
//  Created by 永田大祐 on 2021/07/02.
//

import SwiftUI

@available(iOS 14.0, *)
struct LazyVHtackView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .top, spacing: 10) {
                ForEach(1...100, id: \.self) {
                    Text("Column \($0)")
                }
            }
        }
    }
}

@available(iOS 14.0, *)
struct LazyVHtackView_Previews: PreviewProvider {
    static var previews: some View {
        LazyVHtackView()
    }
}
