//
//  BatteryDesginView.swift
//  
//
//  Created by 永田大祐 on 2021/11/25.
//

import SwiftUI

@available(iOS 15.0, *)
struct BatteryDesginView: View {
    
    @State var levelText = ""
    @State var statusText = ""
    
    var body: some View {
        VStack {
            Text(levelText)
                .onAppear {
                    UIDevice.current.isBatteryMonitoringEnabled = true
                    let level = UIDevice.current.batteryLevel
                    levelText = "Battery Level:  \(level * 100) %".description
                }
            Text(statusText)
                .onAppear {
                    // Battery Status
                    statusText = "Battery Status: "
                    
                    if UIDevice.current.batteryState == UIDevice.BatteryState.unplugged {
                        statusText += "Unplugged"
                    }
                    
                    if UIDevice.current.batteryState == UIDevice.BatteryState.charging {
                        statusText += "Charging"
                    }
                    
                    if UIDevice.current.batteryState == UIDevice.BatteryState.full {
                        statusText += "Full"
                    }
                    
                    if UIDevice.current.batteryState == UIDevice.BatteryState.unknown {
                        statusText += "Unknown"
                    }
                }
        }
    }
}

@available(iOS 15.0, *)
struct BatteryDesginView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryDesginView()
    }
}
