//
//  SpinnerView.swift
//  
//
//  Created by 永田大祐 on 2021/10/15.
//

import SwiftUI

@available(iOS 15.0, *)
struct SpinnerView: View {

    @State var anim = false

    var body: some View {
        Circle()
            .stroke(AngularGradient(gradient:
                            .init(colors:
                                    [Color.blue,
                                     Color.green
                                        .opacity(0.1)]),
                                    center:
                                        .center),
                
                                style: StrokeStyle(lineWidth: 10.0,
                                                   lineCap: .round))

                        .rotationEffect(Angle(degrees: anim ? 360 : 0 ))
                        .animation(Animation.linear(duration: 2)
                                    .repeatForever(autoreverses: false))
                        .onAppear(){
                            self.anim.toggle()
                        }
                        .frame(width: 200,
                               height: 200,
                               alignment: .center)

    }
}

@available(iOS 15.0, *)
struct SpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerView()
    }
}
