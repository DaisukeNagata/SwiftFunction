//
//  Rotation3DEffectView.swift
//  
//
//  Created by 永田大祐 on 2021/07/23.
//

import SwiftUI

@available(iOS 15.0, *)
struct Rotation3DEffectView: View {
    var body: some View {
        Text("HelloWorld")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .font(.system(size: 80))
            .rotation3DEffect(.degrees(45), axis: (x: 1, y: 0, z: 0))
            .foregroundColor(.white)
            .background(.black)
    }
}

@available(iOS 15.0, *)
struct Rotation3DEffectView_Previews: PreviewProvider {
    static var previews: some View {
        Rotation3DEffectView()
    }
}
