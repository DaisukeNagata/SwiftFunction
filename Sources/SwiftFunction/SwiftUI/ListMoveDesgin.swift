//
//  ListMoveDesginView.swift
//  
//
//  Created by 永田大祐 on 2021/07/19.
//

import SwiftUI

@available(iOS 14.0, *)
struct ListMoveDesginView: View {
    @State private var numbers = ["1",
                                  "2",
                                  "3",
                                  "4",
                                  "5",
                                  "6",
                                  "7",
                                  "8",
                                  "9",
                                  "10"]
    var body: some View {
        NavigationView {
            List {
                ForEach(numbers,
                        id: \.self) { region in
                    Text(region)
                }
                .onMove { indexSet,
                    toOffset in
                    numbers.move(fromOffsets: indexSet,
                                 toOffset: toOffset)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("番号")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { EditButton() }
        }
    }
}

@available(iOS 14.0, *)
struct ListMoveDesginView_Previews: PreviewProvider {
    static var previews: some View {
        ListMoveDesginView()
    }
}
