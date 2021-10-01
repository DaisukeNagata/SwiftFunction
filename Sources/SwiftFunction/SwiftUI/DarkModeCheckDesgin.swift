//
//  DarkModeCheckView.swift
//  
//
//  Created by 永田大祐 on 2021/10/02.
//

import SwiftUI

@available(iOS 15.0, *)
struct DarkModeCheckView: View {
    var body: some View {
        DarkModeCheckDesginView().environment(\.colorScheme, .dark)
    }
}

@available(iOS 15.0, *)
struct DarkModeCheckDesginView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            Text(colorScheme == .dark ? "In dark mode" : "In light mode")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        
    }
}

@available(iOS 15.0, *)
struct DarkModeCheckView_Previews: PreviewProvider {
    static var previews: some View {
        DarkModeCheckView()
    }
}
