//
//  NavigationSegueView.swift
//  
//
//  Created by 永田大祐 on 2021/07/21.
//

import SwiftUI

@available(iOS 14.0, *)
struct NavigationSegueView: View {
    var body: some View {
        VStack() {
            NavigationView {
                NavigationLink(destination: SegueView()) {
                    VStack {
                        Text("Hello")
                    }
                }
                .navigationTitle("Title")
            }
        }
    }
}

@available(iOS 14.0, *)
struct SegueView: View {
    var body: some View {
        Text("Next")
    }
}

@available(iOS 14.0, *)
struct NavigationSegueView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationSegueView()
    }
}
