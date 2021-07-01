//
//  OutlineGroupDesginView.swift
//  
//
//  Created by 永田大祐 on 2021/07/02.
//

import SwiftUI
@available(iOS 14.0, *)
struct OutlineGroupDesginView: View {
    
    let data =
        FileItem(name: "users", children: [FileItem(name: "user1234", children: [FileItem(name:"Photos")])])
    
    var body: some View {
        OutlineGroup(data, children: \.children) { item in
            Text ("\(item.description)")
        }
    }
}
@available(iOS 14.0, *)
struct OutlineGroupDesginView_Previews: PreviewProvider {
    static var previews: some View {
        OutlineGroupDesginView()
    }
}
@available(iOS 14.0, *)
struct FileItem: Hashable, Identifiable, CustomStringConvertible {
    var id: Self { self }
    var name: String
    var children: [FileItem]? = nil
    var description: String {
        switch (children) {
        case nil:
            return "📄 \(name)"
        case .some(let children):
            return children.count > 0 ? "📂 \(name)" : "📁 \(name)"
        }
    }
}

