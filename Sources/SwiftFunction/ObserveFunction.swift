//
//  ObserveFunction.swift
//  
//
//  Created by 永田大祐 on 2021/06/02.
//

import Foundation
import AVFoundation

 public class ObserveFunction: NSObject {

    public var videoPlayer: AVPlayer?
    public var observation: NSKeyValueObservation?

    public func stopObserver() {
        NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: nil)
    }

    public func observeValue(call: @escaping (Float?) -> Void) {
        observation = videoPlayer?.observe(\.rate, options: [.new, .old], changeHandler: { (moviePlayer, value) in
            call(moviePlayer.rate)
        })
    }
}
