//
//  SwiftUIView.swift
//  
//
//  Created by 永田大祐 on 2021/09/29.
//

import SwiftUI

@available(iOS 15.0, *)
struct SearchView: View {

    @State var searchTextEntered: String = ""
    var allCatNames = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

    var body: some View {
        NavigationView {
            Form {
                List {
                    ForEach(allCatNames, id: \.self) { catName in
                        if searchTextEntered == catName {
                            Text(catName)
                        }
                    }
                }
                .searchable(text: $searchTextEntered,
                            placement: .navigationBarDrawer(displayMode: .always))
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

@available(iOS 15.0, *)
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
