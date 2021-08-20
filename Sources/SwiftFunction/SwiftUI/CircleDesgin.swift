//
//  CirecleView.swift
//  SwiftUIView
//
//  Created by 永田大祐 on 2021/08/20.
//

import SwiftUI

@available(iOS 14.0, *)
struct CirecleView: View {
    @State private var flag = true
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .scaleEffect(flag ? 1.0 : 2.0)
                .animation(.default)
 
            VStack {
                Spacer()
                Button("アニメーション") {
                    self.flag.toggle()
                }
            }
        }
    }
}
 
@available(iOS 14.0, *)
struct CirecleView_Previews: PreviewProvider {
    static var previews: some View {
        CirecleView()
    }
}
