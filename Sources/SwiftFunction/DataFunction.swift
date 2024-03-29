//
//  DataFunction.swift
//  
//
//  Created by 永田大祐 on 2021/06/16.
//

import Foundation

extension Data {

    var uint8: UInt8 {
        get {
            var number: UInt8 = 0
            self.copyBytes(to:&number, count: MemoryLayout<UInt8>.size)
            return number
        }
    }

    var uint16: UInt16 {
        get {
            let i16array = withUnsafeBytes { $0.load(as: UInt16.self) }
            return i16array
        }
    }

    var uint32: UInt32 {
        get {
            let i32array = withUnsafeBytes { $0.load(as: UInt32.self) }
            return i32array
        }
    }

    public var stringASCII: String? {
        get {
            return NSString(data: self, encoding: String.Encoding.ascii.rawValue) as String?
        }
    }

    public var stringUTF8: String? {
        get {
            return NSString(data: self, encoding: String.Encoding.utf8.rawValue) as String?
        }
    }

    struct HexEncodingOptions: OptionSet {
        public let rawValue: Int
        static let upperCase = HexEncodingOptions(rawValue: 1 << 0)
    }

    func hexEncodedString(options: HexEncodingOptions = []) -> String {
        let format = options.contains(.upperCase) ? "%02hhX" : "%02hhx"
        return map { String(format: format, $0) }.joined()
    }
    
}
