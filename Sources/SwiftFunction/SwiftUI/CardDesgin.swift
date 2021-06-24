//
//  CardListDesgin.swift
//  
//
//  Created by 永田大祐 on 2021/06/25.
//

import SwiftUI
@available(iOS 14.0, *)
final class CardListViewModel: ObservableObject {
    @Published var spIndex = [""]
}
@available(iOS 14.0, *)
struct CardListContentView: View {
    @ObservedObject var viewModel = CardListViewModel()

    init() {
        // backcolor
        UITableView.appearance().backgroundColor = .clear
        
        self.viewModel.spIndex = ["Apple",
                                  "Pear",
                                  "Orange",
                                  "Cake", "Apple"+"\n"+"Pear"+"\n"+"Orange"+"\n"+"Cake"]
    }

    var body: some View {
        List {
            ForEach(self.viewModel.spIndex.indices, id: \.self) { tex in
                CardListRow(tx: self.viewModel.spIndex[tex])
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .listRowInsets(EdgeInsets())
                        .background(Color.white)
            }
        }
    }
}
@available(iOS 14.0, *)
struct CardListContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardListContentView()
    }
}
@available(iOS 14.0, *)
struct CardListRow: View {
    @State var tx: String
    var body: some View {
        VStack {
            Text(tx)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 6)
        .padding()
    }
}
