//
//  SliderDesginView.swift
//  
//
//  Created by 永田大祐 on 2021/08/25.
//

import SwiftUI

@available(iOS 14.0, *)
struct SliderDesginView: View {
    @State var littleValue: Float = 0.5
    @State var bigValue: Float = 50
    @State var isEditing: Bool = false
    var body: some View {
        ZStack {
            VStack {
                Slider(value: $littleValue)
                Text("Float: \(littleValue)")
                
                Slider(value: $bigValue, in: 0...100, step: 5) { editing in
                    isEditing = editing
                }
                .accentColor(.red)
                Text("Int: \(bigValue)")
                if isEditing {
                    Text("Editing!")
                } else {
                    Text(" ")
                }
            }
        }
    }
}

@available(iOS 14.0, *)
struct SliderDesginView_Previews: PreviewProvider {
    static var previews: some View {
        SliderDesginView()
    }
}
