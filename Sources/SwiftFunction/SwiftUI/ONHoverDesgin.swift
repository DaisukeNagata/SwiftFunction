//
//  ONHoverView.swift
//  
//
//  Created by 永田大祐 on 2021/07/30.
//

import SwiftUI

@available(iOS 14.0, *)
struct ONHoverView: View {
    
    @State private var hovering = false

    var body: some View {
        Button(action: {
            self.hovering.toggle()
        }) {
            Text("Button")
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(hovering ? 1.5 : 1.0)
        .animation(.spring())
        .padding()
        .background(Color.green)
        .cornerRadius(10)
        .onHover { isHovered in
            self.hovering = isHovered
        }
    }
}

@available(iOS 14.0, *)
struct ONHoverView_Previews: PreviewProvider {
    static var previews: some View {
        ONHoverView()
    }
}
