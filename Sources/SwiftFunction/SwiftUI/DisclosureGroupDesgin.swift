//
//  DisclosureGroupDesginView.swift
//  
//
//  Created by 永田大祐 on 2021/07/02.
//

import SwiftUI

@available(iOS 14.0, *)
struct ToggleStates {
    var oneIsOn: Bool = false
    var twoIsOn: Bool = true
}

@available(iOS 14.0, *)
struct DisclosureGroupDesginView: View {
    
    @State private var toggleStates = ToggleStates()
    @State private var topExpanded: Bool = true
    
    var body: some View {
        DisclosureGroup("Items", isExpanded: $topExpanded) {
            Toggle("Toggle 1", isOn: $toggleStates.oneIsOn)
            Toggle("Toggle 2", isOn: $toggleStates.twoIsOn)
            DisclosureGroup("Sub-items") {
                Text("Sub-item 1")
            }
        }
    }
}

@available(iOS 14.0, *)
struct DisclosureGroupDesginView_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureGroupDesginView()
    }
}
