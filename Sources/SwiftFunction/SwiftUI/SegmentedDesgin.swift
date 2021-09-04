//
//  SegmentedView.swift
//  SegmentedView
//
//  Created by 永田大祐 on 2021/09/04.
//

import SwiftUI

@available(iOS 14.0, *)
struct SegmentedView: View {
    @State private var edgeFront = Edge.leading
    @State private var edgeBack = Edge.trailing
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
                Text("\(3)")
                    .tag(3)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            switch selectedIndex {
            case 0:
                viewA
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)
                        ))
                    .animation(.default)
            case 1:
                viewB
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: edgeFront),
                            removal: .move(edge: edgeBack)
                        ))
                    .animation(.easeInOut)
            case 2:
                viewC
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: edgeFront),
                            removal: .move(edge: edgeBack)
                        ))
                    .animation(.easeInOut)
            case 3:
                viewD
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .leading),
                            removal: .move(edge: .trailing)
                        ))
                    .animation(.default)
            default:
                viewA
            }
        }
    }
    
    private var viewA: some View {
        ZStack {
            Color(.blue).edgesIgnoringSafeArea(.all)
            Text("A").foregroundColor(.black)
                .onAppear{
                    edgeFront = Edge.leading
                    edgeBack = Edge.trailing
                }
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
    
    private var viewD: some View {
        ZStack {
            Color(.orange).edgesIgnoringSafeArea(.all)
            Text("D").foregroundColor(.black)
                .onAppear{
                    edgeFront = Edge.trailing
                    edgeBack = Edge.leading
                }
        }
    }
}

@available(iOS 14.0, *)
struct SegmentedView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedView()
    }
}
