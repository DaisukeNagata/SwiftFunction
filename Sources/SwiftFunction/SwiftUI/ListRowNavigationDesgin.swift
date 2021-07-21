//
//  ListRowNavigationView.swift
//  
//
//  Created by 永田大祐 on 2021/07/21.
//

import SwiftUI

@available(iOS 14.0, *)
struct ListRowModel: Hashable {
    var image: String
    var text: String
}

@available(iOS 14.0, *)
struct ListRowNavigationView: View {

    @State var luangageObject = [
        ListRowModel(image: "pencil.circle", text: "Swift"),
        ListRowModel(image: "lasso.and.sparkles", text: "Objective-c"),
        ListRowModel(image: "square.and.pencil", text: "C++"),
        ListRowModel(image: "rectangle.and.pencil.and.ellipsis", text: "Ruby"),
        ListRowModel(image: "pencil", text: "Kotlin"),
        ListRowModel(image: "pencil.tip", text: "Java"),
        ListRowModel(image: "pencil.and.outline", text: "Fultter"),
        ListRowModel(image: "highlighter", text: "JavaScript"),
        ListRowModel(image: "scribble.variable", text: "PHP"),
        
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(luangageObject, id: \.self) { value in
                    NavigationLink(destination: SegueView()) {
                        ListRowView(image: Image(systemName: value.image), text: value.text)
                    }
                }
            }
            .navigationTitle("Title")
        }
    }
}

@available(iOS 14.0, *)
struct ListRowNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            ListRowNavigationView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
