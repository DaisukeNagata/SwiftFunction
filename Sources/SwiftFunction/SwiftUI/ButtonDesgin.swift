//
//  ButtonDesgin.swift
//  
//
//  Created by 永田大祐 on 2021/07/01.
//

import SwiftUI
@available(iOS 14.0, *)
struct ButtonContentView: View {
 
    @State var buttonText = "Button"
 
    var body: some View {
        Button(action: {
            buttonText = buttonText ==
            "Button" ?
            "Button Tapped" :
            "Button"
        }){
            Text(buttonText)
               .font(.largeTitle)
        }
    }
}

@available(iOS 14.0, *)
struct ButtonContentView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonContentView()
    }
}
