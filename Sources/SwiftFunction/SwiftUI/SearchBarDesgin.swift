//
//  SearchBarView.swift
//  
//
//  Created by 永田大祐 on 2021/10/17.
//

import SwiftUI

@available(iOS 15.0, *)
struct SearchBarView: View {
    let stArray: [String] = ["A", "B", "C", "D"]
    @State var text: String = ""
    var texArray: [String] {
        if text.isEmpty {
            return stArray
        } else {
            return stArray.filter {$0.uppercased().contains(text.uppercased())}
        }
    }
    var body: some View {
        ScrollView {
            LazyVStack{
                TextField("Type your search",text: $text)
                    .padding(.horizontal)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                ForEach(texArray, id: \.self) { tex in
                    VStack(alignment: .leading) {
                        Text(tex)
                            .padding(.leading)
                        Divider()
                    }
                }
            }
        }
    }
}

@available(iOS 15.0, *)
struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
