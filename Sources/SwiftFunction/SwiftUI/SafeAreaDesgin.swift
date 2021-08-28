//
//  SafeAreaDesgin.swift
//  
//
//  Created by 永田大祐 on 2021/06/24.
//

import SwiftUI

@available(iOS 14.0, *)
struct SafeAreaContentView: View {
    var body: some View {
        GeometryReader { geometry in
            Text("123")
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                .background(Color(hex: 0x123456, alpha: 1))
                .onAppear {
                    allSafeArea(geometry)?.compactMap { m in
                        print(m, "allSafeArea")
                    }.first
            }
        }
    }
    
    func allSafeArea(_ safeArea: GeometryProxy) -> [CGFloat]? {
        var safeAreaArray = [CGFloat]()
        safeAreaArray.append(safeArea.safeAreaInsets.top)
        safeAreaArray.append(safeArea.safeAreaInsets.bottom)
        safeAreaArray.append(safeArea.safeAreaInsets.leading)
        safeAreaArray.append(safeArea.safeAreaInsets.trailing)
        return safeAreaArray
    }
}

@available(iOS 14.0, *)
struct SafeAreaContentView_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaContentView()
    }
}
