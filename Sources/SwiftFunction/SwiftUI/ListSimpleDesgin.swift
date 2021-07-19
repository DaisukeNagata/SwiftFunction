//
//  ListSimpleView.swift
//  
//
//  Created by 永田大祐 on 2021/07/19.
//

import SwiftUI

@available(iOS 14.0, *)
struct Item: Identifiable, Hashable {
    let name: String
    let id = UUID()
}

@available(iOS 14.0, *)
struct ListSimpleView: View {
    private var items = [
        Item(name: "1"),
        Item(name: "2"),
        Item(name: "3"),
        Item(name: "4"),
        Item(name: "5")
    ]
    @State private var multiSelection = Set<UUID>()

    var body: some View {
        NavigationView {
            List(items, selection: $multiSelection) {
                Text($0.name)
            }
            .navigationTitle("Title")
            .toolbar { EditButton() }
        }
    }
}

@available(iOS 14.0, *)
struct ListSimpleView_Previews: PreviewProvider {
    static var previews: some View {
        ListSimpleView()
    }
}
