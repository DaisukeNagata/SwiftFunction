//
//  ScaleEffectDesign.swift
//  
//
//  Created by 永田大祐 on 2021/06/26.
//
import SwiftUI

@available(iOS 14.0, *)
struct ScaleEffectContentView: View {
    @State private var scaledUp = true

    var body: some View {
        VStack {
            Text("Hello, world!")
                .scaleEffect(scaledUp ? 2 : 1)
                .animation(.linear(duration: 2), value: scaledUp)
                .onTapGesture { scaledUp.toggle() }
        }
    }
}

@available(iOS 14.0, *)
public struct ScaleEffectContentView_Previews : PreviewProvider {
    public static var previews: some View {
        ScaleEffectContentView()
  }
}
