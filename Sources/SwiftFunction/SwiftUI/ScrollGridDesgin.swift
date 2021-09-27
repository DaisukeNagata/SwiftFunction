//
//  ScrollGridView.swift
//
//
//  Created by 永田大祐 on 2021/09/15.
//

import SwiftUI

@available(iOS 15.0, *)
struct ScrollGridView: View {
    var body: some View {
        ScrollView {
            ForEach((0...9), id: \.self) { row in
                HStack {
                    ForEach((1...10), id: \.self) { column in
                        Text("\(row*10+column)")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(.vertical, 20)
                    }
                }
            }
        }
    }
}

@available(iOS 15.0, *)
struct ScrollGridView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollGridView()
    }
}
