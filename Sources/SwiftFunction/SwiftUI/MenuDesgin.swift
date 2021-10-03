//
//  MenuContentView.swift
//
//
//  Created by 永田大祐 on 2021/08/15.
//

import SwiftUI

@available(iOS 14.0, *)
struct MenuContentView: View {
    var body: some View {
        List {
            Text("A").onTapGesture {
                print("A")
            }
            Text("B").onTapGesture {
                print("B")
            }
            Text("C").onTapGesture {
                print("C")
            }
        }
    }
}

@available(iOS 14.0, *)
struct SideMenu: View {
    
    let texFlg: Bool
    let width: CGFloat
    let isOpen: Bool
    let menuClose: () -> Void
    let m = MenuContentView()
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(Animation.easeInOut.delay(0.25))
            .onTapGesture {
                self.menuClose()
            }
            
            HStack {
                if texFlg {
                    m
                        .frame(width: self.width)
                        .background(Color.white)
                        .offset(x: self.isOpen ? 0 : -self.width)
                        .animation(.default)
                    Spacer()
                } else {
                    Spacer()
                    m
                        .frame(width: self.width)
                        .background(Color.white)
                        .offset(x: self.isOpen ? 0 : self.width)
                        .animation(.default)
                }
            }
        }
    }
}

@available(iOS 14.0, *)
struct MenuSideContentView: View {
    @State var texFlg: Bool = false
    @State var menuOpen: Bool = false
    
    var body: some View {
        GeometryReader { g in
            ZStack {
                VStack {
                    Text("Left")
                        .foregroundColor(.blue)
                        .onTapGesture {
                            texFlg = true
                            self.openMenu()
                        }.padding()
                    Text("Right")
                        .foregroundColor(.green)
                        .onTapGesture {
                            texFlg = false
                            self.openMenu()
                        }
                }
                SideMenu(texFlg: texFlg,
                         width: g.frame(in: .global).width/2,
                         isOpen: self.menuOpen,
                         menuClose: self.openMenu)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }

    func openMenu() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.menuOpen.toggle()
        }
    }
}

@available(iOS 14.0, *)
struct MenuSideContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuSideContentView()
    }
}
