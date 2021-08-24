//
//  ShutterDesginView.swift
//  ShutterDesginView
//
//  Created by 永田大祐 on 2021/08/25.
//

import SwiftUI

@available(iOS 14.0, *)
struct ShutterView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        content
            .transition(.move(edge: .top))
            .animation(.easeInOut)
    }
}

@available(iOS 14.0, *)
struct ShutterDesginView: View {
    @State private var notificationShown = false
    
    var body: some View {
        ZStack {
        GeometryReader { geometry in
                if self.notificationShown {
                    ShutterView {
                        ZStack {
                            Color.gray
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                                       maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                                       alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            Text("Some Thing.....")
                                .offset(y: -geometry.size.width/8)
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
                }
            }
            Button("toggle") {
                self.notificationShown.toggle()
            }
        }
    }
}

@available(iOS 14.0, *)
struct ShutterDesginView_Previews: PreviewProvider {
    static var previews: some View {
        ShutterDesginView()
    }
}
