//
//  AsyncAwaitFunction.swift
//  
//
//  Created by 永田大祐 on 2021/07/06.
//

import Foundation

public class AsyncAwaitFunction {

    public func process() async {
        let records = await fetch()
        let average = await average(for: records)
        let response = await upload(result: average)
        print("🟢response: \(response)")
    }

    public func fetch() async -> [Double] {
        [Double.random(in: 1...100)]
    }

    public func average(for value: [Double]) async -> Double {
        let average = value.map { $0 }.reduce(0.0, +)/Double(value.count)
        return average
    }

    public func upload(result: Double) async -> String {
        "success\(String(format: "%.01f", result))%"
    }
}
