//
//  ListButtonView.swift
//  
//
//  Created by 永田大祐 on 2021/08/01.
//

import SwiftUI
struct ListButtonData: Identifiable {
    var id: Int = 0
    var title = String()
    var titlefFlg = Bool()
    var subTitle = String()
    var subTitlefFlg = Bool()
}

@available(iOS 14.0, *)
struct ListButtonView: View {
    @State private var listButtonData =
    [ListButtonData(id: 0,
                    title: "A",
                    titlefFlg: false,
                    subTitle: "subTitle1",
                    subTitlefFlg: false),
     ListButtonData(id: 1,
                    title: "B",
                    titlefFlg: false,
                    subTitle: "subTitle2",
                    subTitlefFlg: false),
     ListButtonData(id: 2,
                    title: "C",
                    titlefFlg: false,
                    subTitle: "subTitle2",
                    subTitlefFlg: false)]
    
    var body: some View {
        List(listButtonData, id: \.title) { i in
            HStack(alignment: .center) {
                Text(i.id.description)
                Spacer()
                Button {
                    listButtonData[i.id].titlefFlg.toggle()
                } label: {
                    Text(i.title)
                        .foregroundColor(listButtonData[i.id].titlefFlg ? .blue : .red)
                        .padding()
                }
                .buttonStyle(PlainButtonStyle())

                Button {
                    listButtonData[i.id].subTitlefFlg.toggle()
                } label: {
                    Text(i.subTitle)
                        .foregroundColor(listButtonData[i.id].subTitlefFlg ? .blue : .red)
                        .padding()
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

@available(iOS 14.0, *)
struct ListButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ListButtonView()
    }
}
