//
//  HoraizonalDragCarouselView.swift
//  
//
//  Created by 永田大祐 on 2021/09/26.
//

import SwiftUI
import UniformTypeIdentifiers

@available(iOS 15.0.0, *)
struct HoraizonalDragCarouselView: View {

    @State var draggedItem: String?
    let itemPadding: CGFloat = 20
    @State private var currentIndex = 0
    @State var items = ["1","2","3","4","5","6","7","8","9"]

    var body: some View {
        VStack {
            Spacer()
            GeometryReader { geometry in
                LazyHStack(spacing: itemPadding) {
                    ForEach(items, id:\.self) { item in
                        Text(item)
                            .frame(width: geometry.size.width/2, height: 50)
                            .border(Color.blue)
                            .background(Color.red)
                            .cornerRadius(10)
                            .onDrag({
                                self.draggedItem = item
                                return NSItemProvider(item: nil, typeIdentifier: item)
                            })
                            .onDrop(of: [UTType.text],
                                    delegate: HoraizonalDragCarouselDelegate(item: item,
                                                             items: $items,
                                                             draggedItem: $draggedItem))
                    }
                }
                .offset(x: -CGFloat(self.currentIndex) * (geometry.size.width * 0.5 + itemPadding))
                .gesture(
                    DragGesture()
                        .onEnded({ value in
                            // ドラッグ幅からページングを判定
                            if abs(value.translation.width) > geometry.size.width * 0.3 {
                                self.currentIndex = value.translation.width > 0 ? self.currentIndex - 1 : self.currentIndex + 1
                            }
                            
                            // 最小ページ、最大ページを超えないようチェック
                            if self.currentIndex < 0 {
                                self.currentIndex = 0
                            } else if self.currentIndex > (self.items.count - 1) {
                                self.currentIndex = self.items.count - 1
                            }
                        })
                )
                .animation(.interpolatingSpring(mass: 0.6, stiffness: 150, damping: 80, initialVelocity: 0.1))
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(Color.black)
        }
    }
}
@available(iOS 15.0, *)
struct HoraizonalDragCarouselDelegate : DropDelegate {
    let item : String
    @Binding var items : [String]
    @Binding var draggedItem : String?

    func performDrop(info: DropInfo) -> Bool {
        return true
    }

    func dropEntered(info: DropInfo) {
    
        guard let draggedItem = self.draggedItem,
              draggedItem != item,
              let from = items.firstIndex(of: draggedItem),
              let to = items.firstIndex(of: item) else {
            return
        }

        withAnimation(.easeIn) {
            self.items.move(fromOffsets: IndexSet(integer: from),
                            toOffset: to > from ? to + 1 : to)
        }
    }
}


@available(iOS 15.0.0, *)
struct HoraizonalDragCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        HoraizonalDragCarouselView()
    }
}
