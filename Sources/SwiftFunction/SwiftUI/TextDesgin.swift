//
//  TextDesgin.swift
//  
//
//  Created by 永田大祐 on 2021/07/14.
//

import SwiftUI

@available(iOS 14.0, *)
struct TextView: View {
    var body: some View {
        Text("Hello World")
            .frame(minWidth: 0,
                   idealWidth: 100,
                   maxWidth: .infinity,
                   minHeight: 0,
                   idealHeight: 100,
                   maxHeight: .infinity,
                   alignment: .center)
            .font(.largeTitle)
            .foregroundColor(Color.black)
            .padding()
    }
}

@available(iOS 14.0, *)
struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
