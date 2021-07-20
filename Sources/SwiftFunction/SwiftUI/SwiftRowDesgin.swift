//
//  SwiftRowView.swift
//  
//
//  Created by 永田大祐 on 2021/07/21.
//

import SwiftUI

@available(iOS 14.0, *)
// https://developer.apple.com/sf-symbols/
struct SwiftRowView: View {
    
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
struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SwiftRowView(image: Image(systemName: "pencil"),
                         text: "pencil")
            SwiftRowView(image: Image(systemName: "pencil.tip.crop.circle"),
                         text: "pencil.tip.crop.circle")
        }
        .previewLayout(.fixed(width: 400, height: 100))
    }
}
