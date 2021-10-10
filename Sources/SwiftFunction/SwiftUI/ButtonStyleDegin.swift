//
//  ButtonStyleView.swift
//  
//
//  Created by 永田大祐 on 2021/09/30.
//

import SwiftUI

@available(iOS 15.0, *)
struct ButtonStyleView: View {

    var body: some View {
        VStack {

            Button(action: {}) {
                Text("Buy me a coffee")
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.purple)
            .clipShape(RoundedRectangle(cornerRadius: 5))
        }
    }
}

@available(iOS 15.0, *)
struct ButtonStyleView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleView()
    }
}
