//
//  CameraDesgin.swift
//  
//
//  Created by 永田大祐 on 2021/06/23.
//

import SwiftUI

@available(iOS 14.0, *)
struct CameraContentView: View {
    var body: some View {
        VStack {
            Color.yellow
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

            CameraButtonsView(index: 3, text: ["Trim","","OCR"])
                .padding()

        }
    }
}

@available(iOS 14.0, *)
struct CameraContentView_Previews: PreviewProvider {
    static var previews: some View {
        CameraContentView()
    }
}

@available(iOS 14.0, *)
struct CameraButtonsView: View {

    private var index: Int
    private var text: [String]

    init(index: Int, text: [String]) {
        self.index = index
        self.text = text
    }

    var body: some View {
        HStack {
            ForEach(0..<index) { i in
                Button(action: {
                    print(i)
                }) {
                    if self.text[i].isEmpty {
                        Image(systemName: "camera.circle.fill")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                    } else {
                        Spacer()
                        Text(self.text[i])
                            .frame(width: 50, height: 50, alignment: .center)
                        Spacer()
                    }
                }
            }
        }
    }
}

