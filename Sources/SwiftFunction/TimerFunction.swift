//
//  TimerFunction.swift
//  
//
//  Created by 永田大祐 on 2021/07/11.
//

import Foundation

public class TimerFunction {
    public var timer: Timer!

    public func timerFunction() {
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.startTimer), userInfo: nil, repeats: true)
    }
    
    public func timerStop() {
        timer.invalidate()
        print("🟢timerStop")
    }

    @objc func startTimer() {
        print("🟢timerFunction")
    }
}
