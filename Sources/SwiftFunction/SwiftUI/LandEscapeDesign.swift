//
//  LandEscapeDesign.swift
//  
//
//  Created by 永田大祐 on 2021/08/09.
//

import SwiftUI

@available(iOS 14.0, *)
struct LandEscapeView: View {
    var body: some View {
        NavigationView {
            Text("Sidebar")
            Text("Detail")
        }
        
    }
}
// https://qiita.com/MYamate_jp/items/9f26ad6f78f347ebd629
@available(iOS 15.0, *)
struct LandEscapeView_Previews: PreviewProvider {
    static var previews: some View {
        LandEscapeView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewInterfaceOrientation(.landscapeRight)
        LandEscapeView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
            .previewInterfaceOrientation(.landscapeRight)
        LandEscapeView()
            .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
