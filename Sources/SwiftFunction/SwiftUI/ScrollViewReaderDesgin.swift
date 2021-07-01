//
//  ScrollViewReaderView.swift
//  
//
//  Created by 永田大祐 on 2021/07/02.
//

import SwiftUI

@available(iOS 14.0, *)
struct ScrollViewReaderView: View {
    var body: some View {
        ScrollViewReader { scrollOffset in
            ScrollView {
                LazyVStack(alignment: .center) {
                    ForEach(1...100, id: \.self) {
                        Text("Row \($0)")
                        
                    }
                    .onChange(of: /*@START_MENU_TOKEN@*/"Value"/*@END_MENU_TOKEN@*/) { value in
                        print(scrollOffset.scrollTo(77, anchor: .center))
                    }
                }
            }
        }
    }
}
@available(iOS 14.0, *)
struct ScrollViewReaderView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderView()
    }
}
