//
//  TextFieldDesginView.swift
//  
//
//  Created by 永田大祐 on 2021/07/19.
//

import SwiftUI

@available(iOS 14.0, *)
struct TextFieldDesginView: View {

    @State private var name: String = ""

    var body: some View {
        VStack(alignment: .center) {
            TextField("TextFieldDesginView", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(Color.gray)
                .accentColor(Color.gray)
                .padding()
            Text("\(name) ")
        }
    }
}

@available(iOS 14.0, *)
struct TextFieldDesginView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldDesginView()
    }
}
