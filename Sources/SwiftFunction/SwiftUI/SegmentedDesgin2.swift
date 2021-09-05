//
//  SegmentedDesgin2.swift
//  SegmentedDesgin2
//
//  Created by 永田大祐 on 2021/09/06.
//

import SwiftUI

@available(iOS 15.0, *)
struct Segmented2View: View {
    
    @State private var selection = 0
    
    private let colors: [Color] = [.red, .blue, .green, .orange, .pink, .purple]
    
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                Picker("123", selection: $selection) {
                    ForEach(0..<self.colors.count) { num in
                        Text("List \(num)")
                            .font(.headline)
                            .padding(.init(top: 4, leading: 8, bottom: 4, trailing: 8))
                            .background(num == selection ? self.colors[num] : .clear)
                            .cornerRadius(8)
                            .id(num)
                            .tag(num)
                            .onTapGesture(perform: {
                                withAnimation {
                                    selection = num
                                }
                            })
                    }
                }
                .onChange(of: selection, perform: { index in
                    withAnimation {
                        proxy.scrollTo(index, anchor: .center)
                    }
                })
                .pickerStyle(SegmentedPickerStyle())
                TabView(selection: $selection) {
                    ForEach(0..<self.colors.count) { num in
                        ZStack {
                            colors[num]
                            Text("\(num)")
                        }
                        .tag(num)
                    }
                }
                .transition(
                    .asymmetric(
                        insertion: .move(edge:  .leading),
                        removal: .move(edge: .trailing)
                    ))
                .animation(.default)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
        }
    }
}

@available(iOS 15.0, *)
struct Segmented2View_Previews: PreviewProvider {
    static var previews: some View {
        Segmented2View()
    }
}
