//
//  SheetView.swift
//  
//
//  Created by 永田大祐 on 2021/08/25.
//

import SwiftUI

@available(iOS 14.0, *)
struct SheetView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
            NavigationView { // Mandatory for Title and Button
                Form {
                    Text("1")
                    Text("2")
                }
                .navigationBarTitle(Text("Title"))
                .navigationBarItems(
                    trailing: Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Some thing")
                })
            }.environment(\.horizontalSizeClass, .compact)
    }
}

@available(iOS 14.0, *)
struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
