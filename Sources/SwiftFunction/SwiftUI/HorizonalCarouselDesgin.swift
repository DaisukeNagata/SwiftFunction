//
//  HorizonalCarouselDesgin.swift
//  
//
//  Created by 永田大祐 on 2021/09/24.
//

import SwiftUI

@available(iOS 15.0.0, *)
struct HorizonalCarouselView: View {
    
    @State private var currentIndex = 0
    @GestureState private var dragOffset: CGFloat = 0
    @State private var examples = ["1", "2", "3", "4"]
    
    let itemPadding: CGFloat = 20
    
    var body: some View {
        GeometryReader { bodyView in
            LazyHStack(spacing: itemPadding) {
                ForEach(examples, id:\.self) { index in
                    // カルーセル対象のView
                    Text(index)
                        .foregroundColor(Color.white)
                        .font(.system(size: 50, weight: .bold))
                        .frame(width: bodyView.size.width * 0.8, height: 300)
                        .background(Color.gray)
                        .padding(.leading, index == "1" ? bodyView.size.width * 0.1 : 0)
                }
            }
            .offset(x: -CGFloat(self.currentIndex) * (bodyView.size.width * 0.8 + itemPadding))
            .gesture(
                DragGesture()
                    .onEnded({ value in
                        // ドラッグ幅からページングを判定
                        if abs(value.translation.width) > bodyView.size.width * 0.3 {
                            self.currentIndex = value.translation.width > 0 ? self.currentIndex - 1 : self.currentIndex + 1
                        }
                        
                        // 最小ページ、最大ページを超えないようチェック
                        if self.currentIndex < 0 {
                            self.currentIndex = 0
                        } else if self.currentIndex > (self.examples.count - 1) {
                            self.currentIndex = self.examples.count - 1
                        }
                    })
            )
        }
        .animation(.interpolatingSpring(mass: 0.6, stiffness: 150, damping: 80, initialVelocity: 0.1))
    }
 }

@available(iOS 15.0.0, *)
struct HorizonalCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        HorizonalCarouselView()
    }
}
