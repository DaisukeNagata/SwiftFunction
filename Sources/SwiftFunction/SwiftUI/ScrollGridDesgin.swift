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
            ForEach((0...4), id: \.self) { row in
                HStack {
                    ForEach((0...4), id: \.self) { column in
                        Text("\(row*4+column)")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(.trailing, 5)
                            .padding(.top, 30)
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
