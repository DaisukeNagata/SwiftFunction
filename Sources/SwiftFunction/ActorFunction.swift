//
//  ActorFunction.swift
//  
//
//  Created by 永田大祐 on 2021/06/29.
//

import SwiftUI

public class ActorFunction {
    public actor Counter {
        var value = 0
        
        public func increment() {
            value = value + 1
        }
    }
    
    public func useCounter(counter: Counter) async {
        await counter.increment()
        print(await counter.value, "🟢useCounter")
    }
}
