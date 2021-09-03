//
//  SegmentedView.swift
//  SegmentedView
//
//  Created by 永田大祐 on 2021/09/04.
//

import SwiftUI

@available(iOS 14.0, *)
struct SegmentedView: View {
    
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack(spacing:0) {
            Picker("123", selection: self.$selectedIndex) {
                Text("\(0)")
                    .tag(0)
                Text("\(1)")
                    .tag(1)
                Text("\(2)")
                    .tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            switch selectedIndex {
            case 0:
                viewA
            case 1:
                viewB
            case 2:
                viewC
            default:
                viewA
            }
        }
    }
    
    private var viewA: some View {
        ZStack {
            Color(.blue).edgesIgnoringSafeArea(.all)
            Text("A").foregroundColor(.black)
        }
    }
    private var viewB: some View {
        ZStack {
            Color(.red).edgesIgnoringSafeArea(.all)
            Text("B").foregroundColor(.black)
        }
    }
    private var viewC: some View {
        ZStack {
            Color(.green).edgesIgnoringSafeArea(.all)
            Text("C").foregroundColor(.black)
        }
    }
}

@available(iOS 14.0, *)
struct SegmentedView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedView()
    }
}
