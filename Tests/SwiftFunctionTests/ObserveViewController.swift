//
//  ObserveViewController.swift
//  
//
//  Created by 永田大祐 on 2021/06/02.
//

import UIKit
import AVFoundation
import XCTest
@testable import SwiftFunction

class TestController: XCTestCase {
    
    let observeFunction = ObserveFunction()
    
    func testExample() {

        let fileURL = URL(fileURLWithPath: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4")
        let avAsset = AVURLAsset(url: fileURL)
        let playerItem: AVPlayerItem = AVPlayerItem(asset: avAsset)

        observeFunction.videoPlayer = AVPlayer(playerItem: playerItem)
        observeFunction.videoPlayer?.play()
        observeFunction.observeValue { call in
            print(call ?? Float(0), "🟢call")
            self.observeFunction.stopObserver()
        }
        
        delay(testCase: self, seconds: 2)
    }
    
    func delay(testCase: XCTestCase, seconds: Float) {
        let delay = testCase.expectation(description: "animation finished")

        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(seconds)) { [self] in
            delay.fulfill()
            observeFunction.videoPlayer?.pause()
        }
        testCase.waitForExpectations(timeout: TimeInterval(seconds))
    }
}
