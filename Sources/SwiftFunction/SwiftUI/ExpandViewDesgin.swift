//
//  ExpandView.swift
//  
//
//  Created by 永田大祐 on 2021/10/11.
//

import SwiftUI

@available(iOS 15.0, *)
struct ExpandView: View {

    @State private var flags: [Bool] = [false, false, false]
    
    var body: some View {
        List {
            DisclosureGroup("Test", isExpanded: $flags[0]) {
                Group {
                    DisclosureGroup("Sample", isExpanded: $flags[1]) {
                        Text("1")
                        Text("2")
                        Text("3")
                    }
                    DisclosureGroup("Sample", isExpanded: $flags[2]) {
                        Text("1")
                        Text("2")
                        Text("3")
                    }
                }
            }
        }
    }
}

@available(iOS 15.0, *)
struct ExpandView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandView()
    }
}
