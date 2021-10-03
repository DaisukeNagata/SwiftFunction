//
//  HoraizonalDragDesginView.swift
//  
//
//  Created by 永田大祐 on 2021/08/25.
//

import SwiftUI
import UniformTypeIdentifiers

@available(iOS 15.0.0, *)
struct HoraizonalDragDesginView: View {

    @State var items = ["1","2","3","4","5","6","7","8","9"]
    @State var draggedItem : String?
    var body: some View {
        VStack {
            Spacer()
            GeometryReader { geometry in
                ScrollView(.horizontal) {
                    LazyHStack(spacing : 15) {
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
                                        delegate: MyDropDelegate(item: item,
                                                                 items: $items,
                                                                 draggedItem: $draggedItem))
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(Color.black)
        }
    }
}

@available(iOS 15.0.0, *)
struct MyDropDelegate : DropDelegate {
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
struct HoraizonalDragDesginView_Previews: PreviewProvider {
    static var previews: some View {
        HoraizonalDragDesginView()
    }
}
