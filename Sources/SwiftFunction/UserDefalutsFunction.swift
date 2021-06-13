//
//  UserDefalutsFunction.swift
//  
//
//  Created by 永田大祐 on 2021/06/14.
//

import Foundation

final class UserDefalutsFunction {
    let userDefaults = UserDefaults.standard
    
    public func userDefalutsSave() {
        userDefaults.set(0, forKey: "IntKey")
        userDefaults.set(Float(0), forKey: "FloatKey")
        userDefaults.set(0.0, forKey: "DoubleKey")
        userDefaults.set(false, forKey: "BoolKey")
        userDefaults.set(URL(string: "https://www.apple.com"), forKey: "URLKey")
        userDefaults.set("https://www.apple.com", forKey: "StringKey")
        userDefaults.set(["https://www.apple.com"], forKey: "StringArrayKey")
        userDefaults.set(["key":"https://www.apple.com"], forKey: "DictionaryKey")
        userDefaults.set(Data.init(capacity:1), forKey: "DataKey")
        userDefaults.set(["https://www.apple.com"], forKey: "ArrayKey")
                                  
        print(userDefaults.integer(forKey: "IntKey"), "🟢UserDefalutsSave")
        print(userDefaults.float(forKey: "FloatKey"), "🟢UserDefalutsSave")
        print(userDefaults.double(forKey: "DoubleKey"), "🟢UserDefalutsSave")
        print(userDefaults.bool(forKey: "BoolKey"), "🟢UserDefalutsSave")
        guard let uRLKey = userDefaults.url(forKey: "URLKey") else { return }
        print(uRLKey, "🟢UserDefalutsSave")
        guard let stringKey = userDefaults.string(forKey: "StringKey") else { return }
        print(stringKey, "🟢UserDefalutsSave")
        guard let stringArrayKey = userDefaults.stringArray(forKey: "StringArrayKey") else { return }
        print(stringArrayKey, "🟢UserDefalutsSave")
        guard let dictionaryKey = userDefaults.dictionary(forKey: "DictionaryKey") else { return }
        print(dictionaryKey, "🟢UserDefalutsSave")
        guard let dataKey = userDefaults.data(forKey: "DataKey") else { return }
        print(dataKey, "🟢UserDefalutsSave")
        guard let stringKey = userDefaults.object(forKey: "StringKey") else { return }
        print(stringKey, "🟢UserDefalutsSave")
        guard let arrayKey = userDefaults.array(forKey: "ArrayKey") else { return }
        print(arrayKey, "🟢UserDefalutsSave")
    }
}
