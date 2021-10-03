//
//  TimerDesgin.swift
// 
//
//  Created by 永田大祐 on 2021/08/19.
//

import SwiftUI

@available(iOS 14.0, *)
struct TimerDesginView: View {
    @State var timeRemaining = 10
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text("\(timeRemaining)")
            .onReceive(timer) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
            }
    }
}

@available(iOS 14.0, *)
struct TimerDesginView_Previews: PreviewProvider {
    static var previews: some View {
        TimerDesginView()
    }
}

