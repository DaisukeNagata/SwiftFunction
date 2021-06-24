//
//  SetDesgin.swift
//  
//
//  Created by 永田大祐 on 2021/06/22.
//

import SwiftUI

@available(iOS 14.0, *)
struct ContentView: View {
    public var body: some View {
        VStack {
            SetDesgin(c: Color.red) { Text("name") }
            SetDesgin(c: Color.yellow) {Text("name") }
            SetDesgin(c: Color.green) {Text("name") }
        }
    }
}

@available(iOS 14.0, *)
struct SetDesgin<Content:View>: View {

    let c: Color
    let viewBuilder: () -> Content
    var body: some View {
        viewBuilder()
            .frame(maxWidth: .infinity, maxHeight: 100)
            .background(c)
            .padding(.horizontal)
    }
}

@available(iOS 14.0, *)
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
    ContentView()
  }
}
