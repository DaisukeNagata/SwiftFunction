//
//  JsonFunction.swift
//  
//
//  Created by 永田大祐 on 2021/06/02.
//

import Foundation

public class JsonFunction: NSObject {

    public struct Employee: Codable {
        var code: String
        var name: String
        var age: Int
        var absence: Bool
    }

    public func createJson(originalObject: Employee) {

        let encoder = JSONEncoder()
        guard let jsonValue = try? encoder.encode(originalObject) else {
            fatalError("Failed to encode to JSON.")
        }

        let decoder = JSONDecoder()
        guard let employee: Employee = try? decoder.decode(Employee.self, from: jsonValue) else {
            fatalError("Failed to decode from JSON.")
        }

        print(String(bytes: jsonValue, encoding: .utf8)!, "createJson")
        print(employee, "createJson")
    }
}
