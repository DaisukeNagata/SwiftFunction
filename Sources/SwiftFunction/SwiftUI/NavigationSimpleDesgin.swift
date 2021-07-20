//
//  NavigationSimpleView.swift
//  
//
//  Created by 永田大祐 on 2021/07/21.
//

import SwiftUI

@available(iOS 14.0, *)
struct NavigationSimpleView: View {
    var body: some View {
        VStack() {
            NavigationView {
                Text("item")
                    // large
                    // automatic
                    // inline
                    .navigationBarTitleDisplayMode(.automatic)
                    .navigationTitle("Title")
            }
        }
    }
}

@available(iOS 14.0, *)
struct NavigationSimple_Previews: PreviewProvider {
    static var previews: some View {
        NavigationSimpleView()
    }
}
