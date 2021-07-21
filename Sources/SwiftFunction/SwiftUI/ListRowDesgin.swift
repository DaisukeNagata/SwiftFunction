//
//  ListRowView.swift
//
//
//  Created by 永田大祐 on 2021/07/21.
//

import SwiftUI

@available(iOS 14.0, *)
// https://developer.apple.com/sf-symbols/
struct ListRowView: View {
    
    @State var image: Image
    @State var text: String

    var body: some View {
        HStack {
            image
                .resizable()
                .frame(width: 50, height: 50)
            Text(text)

            Spacer()
        }
    }
}

@available(iOS 14.0, *)
struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListRowView(image: Image(systemName: "pencil"),
                         text: "pencil")
            ListRowView(image: Image(systemName: "pencil.tip.crop.circle"),
                         text: "pencil.tip.crop.circle")
        }
        .previewLayout(.fixed(width: 300, height: 100))
    }
}
