//
//  ListTableView.swift
//  
//
//  Created by 永田大祐 on 2021/07/19.
//

import SwiftUI

@available(iOS 15.0, *)
struct ListTableView: View {

    @State private var number = ["1"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(number, id: \.self) { name in
                    Button(action: {
                        tapAction()
                    }) {
                        Text(name)
                            .foregroundColor(.gray)
                    }
                }
                .onMove { indexSet, toOffset in
                    number.move(fromOffsets: indexSet,toOffset: toOffset)
                }
                .onDelete(perform: { indexSet in
                    number.remove(at: indexSet.first!)
                })
            }
            .toolbar { EditButton() }
        }
    }

    private func tapAction() {
        number.append((number.count+1).formatted())
    }
}

@available(iOS 15.0, *)
struct ListDeleteView_Previews: PreviewProvider {
    static var previews: some View {
        ListTableView()
    }
}
