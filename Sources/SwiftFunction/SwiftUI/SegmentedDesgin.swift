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
                viewSet(edgeFront: .trailing,
                        edgeBack: .leading,
                        color: .blue,
                        text: "A")
            case 1:
                viewSet(edgeFront: edgeFront,
                        edgeBack: edgeBack,
                        color: .red,
                        text: "B")
                    .onAppear{
                        edgeFront = Edge.leading
                        edgeBack = Edge.trailing
                }
            case 2:
                viewSet(edgeFront: edgeFront,
                        edgeBack: edgeBack,
                        color: .green,
                        text: "C")
                    .onAppear{
                        edgeFront = Edge.trailing
                        edgeBack = Edge.leading
                }
            case 3:
                viewSet(edgeFront: .leading,
                        edgeBack: .trailing,
                        color: .orange,
                        text: "D")
            default:
                viewSet(edgeFront: .trailing,
                        edgeBack: .leading,
                        color: .blue,
                        text: "A")
            }
        }
    }
    
    func viewSet(edgeFront: Edge,
                 edgeBack: Edge,
                 color: UIColor,
                 text: String) -> some View {
        return SegmentedDesgin(edgeFront: edgeFront,
                               edgeBack: edgeBack) {
            SegmentedViewDesgin(color: color,
                                text: text,
                                edgeFront: edgeFront,
                                edgeBack: edgeBack)
        }
    }
}

@available(iOS 14.0, *)
struct SegmentedViewDesgin: View {

    @State var color: UIColor
    @State var text: String
    @State var edgeFront: Edge
    @State var edgeBack: Edge

    var body: some View {
         ZStack {
            Color(color).edgesIgnoringSafeArea(.all)
            Text(text).foregroundColor(.black)
                .onAppear{
                    edgeFront = edgeFront
                    edgeBack = edgeFront
                }
        }
    }
}
@available(iOS 14.0, *)
struct SegmentedDesgin<Content:View>: View {

    @State var edgeFront: Edge
    @State var edgeBack: Edge

        let viewBuilder: () -> Content
        var body: some View {
            viewBuilder()
                .transition(
                    .asymmetric(
                        insertion: .move(edge: edgeFront),
                        removal: .move(edge: edgeBack)
                    ))
                .animation(.default)
        }
}

@available(iOS 14.0, *)
struct SegmentedView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedView()
    }
}
