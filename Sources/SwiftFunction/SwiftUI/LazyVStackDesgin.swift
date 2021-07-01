//
//  LazyVStackView.swift
//  
//
//  Created by 永田大祐 on 2021/07/02.
//

import SwiftUI

@available(iOS 14.0, *)
struct LazyVStackView: View {
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(1...100, id: \.self) {
                    Text("Row \($0)")
                }
            }
        }
    }
}

@available(iOS 14.0, *)
struct LazyVStackView_Previews: PreviewProvider {
    static var previews: some View {
        LazyVStackView()
    }
}
