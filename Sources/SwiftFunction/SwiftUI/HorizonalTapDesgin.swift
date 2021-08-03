//
//  HorizonalTapDesgin.swift
//  
//
//  Created by 永田大祐 on 2021/06/23.
//

import SwiftUI
@available(iOS 14.0, *)
struct Event: Identifiable {
    let id: Int
    let name: String
    let emoji: String
    let color: Color
}

@available(iOS 14.0, *)
struct HorizonalTapContentView: View {

    let events = [
        Event(id: 0, name: "Happy", emoji: "🤞", color: Color.white),
        Event(id: 1, name: "NewYear", emoji: "🎉", color: Color.white),
        Event(id: 2, name: "Zodiac", emoji: "🐹", color: Color.white),
        Event(id: 3, name: "happiness", emoji: "👍", color: Color.white),
    ]

    @ObservedObject var viewModel = OrientationModel()

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(events) { event in
                    VStack {
                        Text(event.emoji)
                            .font(.system(size: 50))
                        Text(event.name)
                            .font(.system(.caption))
                        
                    }
                    .padding(40)
                    .background( event.id == viewModel.count ? viewModel.backColor : viewModel.indexColor[event.id])
                    .cornerRadius(10)
                    .onTapGesture {
                        var s = self
                        s.onCellEvent(.cellEvent(id: event))
                    }
                }
            }
        }
        .padding()
    }

    mutating func onCellEvent(_ event: CellEvent<Event>)  {
        switch event {
        case let .cellEvent(event):
            viewModel.backColor =
                viewModel.indexColor[event.id] == viewModel.setColor[event.id] ?
                    Color.white : viewModel.setColor[event.id]
            viewModel.count = event.id
            viewModel.indexColor[event.id] = viewModel.backColor
        }
    }
}

@available(iOS 14.0, *)
public struct HorizonalTapContentView_Previews : PreviewProvider {
    public static var previews: some View {
        HorizonalTapContentView()
  }
}

@available(iOS 14.0, *)
final class OrientationModel: ObservableObject {
    @Published var count = Int()
    @Published var backColor = Color.white
    @Published var setColor = [Color.red,Color.green,Color.blue,Color.yellow]
    @Published var indexColor = [Color.white,Color.white,Color.white,Color.white]
}
@available(iOS 14.0, *)
public enum CellEvent<Event> { case cellEvent(id: Event) }
