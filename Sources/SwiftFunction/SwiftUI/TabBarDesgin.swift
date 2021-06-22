//
//  TabBarDesgin.swift
//  
//
//  Created by 永田大祐 on 2021/06/23.
//

import SwiftUI
@available(iOS 14.0, *)
struct TabBarContentView: View {

    @ObservedObject var viewRouter = ViewRouter()
    @State private var selection: Int = 1

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack {
                    self.modifier(TabModifier(selection:  self.$selection, viewRouter: self.viewRouter, tag: 1))
                    self.modifier(TabModifier(selection:  self.$selection,viewRouter: self.viewRouter, tag: 2))
                    self.modifier(TabModifier(selection:  self.$selection, viewRouter: self.viewRouter, tag: 3))
                    self.modifier(TabModifier(selection:  self.$selection,viewRouter: self.viewRouter, tag: 4))
                }
                .frame(width: geometry.size.width, height: geometry.size.height/10)
            }
        }
    }
}

@available(iOS 14.0, *)
struct TabBarContentView_Previews : PreviewProvider {
    public static var previews: some View {
        TabBarContentView()
  }
}
@available(iOS 14.0, *)
class ViewRouter: ObservableObject {
    @Published var heartView = "heart.fill"
    @Published var flg = false
}
@available(iOS 14.0, *)
struct Icon: Identifiable {
    let id: Int
    let name: String
}
@available(iOS 14.0, *)
struct TabModifier: ViewModifier {

    let icon = [
        Icon(id: 0, name: ""),
        Icon(id: 1, name: "clock.fill"),
        Icon(id: 2, name: "heart"),
        Icon(id: 3, name: "arkit"),
        Icon(id: 4, name: "arrow.up.right.video"),
    ]

    let selection: Binding<Int>
    var viewRouter: ViewRouter
    var tag: Int
    var width = UIScreen.main.bounds.width
    
    func body(content: Content) -> some View {
        
        return GeometryReader { geometry in
            VStack {
                if self.tag == 1 {
                    Divider()
                        .frame(width: self.width, alignment: .bottom).offset(y: -8)
                }
            }
            HStack {
                Image(systemName: self.iconName())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
                    .frame(width: geometry.size.width, height: self.width/4 - 20)
                    .foregroundColor(self.fgColor())
                    .onTapGesture {
                        self.selection.wrappedValue = self.tag
                }
            }
        }
    }

    private func fgColor() -> Color {
        return selection.wrappedValue == self.tag ? Color(UIColor.systemBlue) : Color(UIColor.systemGray)
    }
    
    private func iconName() -> String {
        return selection.wrappedValue == self.tag ? icon[self.tag].name : viewRouter.heartView
    }
}
