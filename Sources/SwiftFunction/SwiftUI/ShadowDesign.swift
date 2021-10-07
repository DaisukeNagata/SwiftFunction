//
//  ShadowView.swift
//  
//
//  Created by 永田大祐 on 2021/10/08.
//

import SwiftUI

@available(iOS 15.0, *)
struct ShadowView: View {
    var body: some View {
        VStack {
            Text("SwiftUI")
                .shadow(color: .gray,
                        radius: 1,
                        x: 0,
                        y: 30)
                .font(.largeTitle)
        }
    }
}

@available(iOS 15.0, *)
struct ShadowView_Previews: PreviewProvider {
    static var previews: some View {
        ShadowView()
    }
}
