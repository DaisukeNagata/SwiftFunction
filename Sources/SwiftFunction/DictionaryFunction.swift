//
//  DictionaryFunction.swift
//  
//
//  Created by 永田大祐 on 2021/06/18.
//

import Foundation

public class DictionaryFunction {
    public func dictinarySetFunction<K, V>(_ key: K, _ value: V) -> (key: K, value: V) {
        return (key: key, value: value)
    }
}
