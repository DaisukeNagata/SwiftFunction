//
//  PreviewDeviceView.swift
//  PreviewDeviceView
//
//  Created by 永田大祐 on 2021/09/19.
//

import SwiftUI

@available(iOS 15.0, *)
struct PreviewDeviceView: View {
    var body: some View {
        PreviewDeviceView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
    }
}

@available(iOS 15.0, *)
struct CPreviewDeviceView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewDeviceView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .previewDisplayName("iPhone 12")

        PreviewDeviceView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
            .previewDisplayName("iPhone 12 Pro Max")
    }
}
