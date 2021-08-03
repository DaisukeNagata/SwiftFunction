//
//  NavigationTitleDesgin.swift
//  
//
//  Created by 永田大祐 on 2021/07/02.
//

import SwiftUI

@available(iOS 14.0, *)
struct NavigationTitleView: View {

    var body: some View {
        self.modifier(NavigationModifier(st: "Modifier"))
    }
}

@available(iOS 14.0, *)
struct NavigationModifier: ViewModifier {

    @State var st: String
    @State var flg = false
    @State var c = UIColor.blue

    func body(content: Content) -> some View {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = c
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance

        return
            NavigationView {
                Text("Tap")
                    .navigationTitle(st)
                    .onTapGesture {
                        flg.toggle()
                    }
                    .onChange(of: flg) { value in
                        guard value else {
                            c = c == UIColor.blue ? UIColor.orange : UIColor.blue
                            return
                        }
                    }
                    .frame(maxHeight:.infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .navigationBarHidden(flg)
                    .edgesIgnoringSafeArea(.all)
            }.background(Color.clear)
    }
}

@available(iOS 14.0, *)
struct NavigationTitleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTitleView()
    }
}
