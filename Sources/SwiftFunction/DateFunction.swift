//
//  DateFunction.swift
//  
//
//  Created by 永田大祐 on 2021/06/10.
//

import Foundation

public class DateFunction {
    public func dateNowFunction(template: String, identifier: String) {
        let dt = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: template, options: 0, locale: Locale(identifier: identifier))
        print(dateFormatter.string(from: dt) , "🟢dateNowFunction")
    }
    
    public func afterDate(template: String,
                          identifier: String,
                          byAdding: Calendar.Component,
                          value: Int) {
        let now = Date()
        guard let hourLater = Calendar.current.date(byAdding: byAdding, value: value, to: now) else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: template, options: 0, locale: Locale(identifier: identifier))
        print(dateFormatter.string(from: hourLater), "🟢afterDate")
    }
    
    public func dateOrder() {
        let past = Date(timeIntervalSinceNow: -100)

        let now = Date()

        let future = Date(timeIntervalSinceNow: 100)

        if now.compare(future)  == .orderedAscending {
            print("🟢orderedAscending")
        }

        if now.compare(now) == .orderedSame {
            print("🟢orderedSame")
        }

        if now.compare(past) == .orderedDescending {
            print("🟢orderedDescending")
        }
    }

    public func preferredLanguages() -> String? {

        Locale.preferredLanguages.first
    }
    
    public func isoCountryCodes() -> [(name: String, flag: String)] {

        var countriesData = [(name: String, flag: String)]()
        let flag = String.emojiFlag(for: Locale.current.regionCode ?? "")
        let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: Locale.current.currencyCode ?? ""])
        
        let name = NSLocale(localeIdentifier: Locale.preferredLanguages.first ?? "").displayName(forKey: NSLocale.Key.identifier, value: id)
        
        countriesData.append((name: name ?? "", flag: flag ?? ""))
    
        return countriesData
    }
}

extension String {

    static func emojiFlag(for countryCode: String) -> String! {
        func isLowercaseASCIIScalar(_ scalar: Unicode.Scalar) -> Bool {
            return scalar.value >= 0x61 && scalar.value <= 0x7A
        }

        func regionalIndicatorSymbol(for scalar: Unicode.Scalar) -> Unicode.Scalar {
            precondition(isLowercaseASCIIScalar(scalar))

            // 0x1F1E6 marks the start of the Regional Indicator Symbol range and corresponds to 'A'
            // 0x61 marks the start of the lowercase ASCII alphabet: 'a'
            return Unicode.Scalar(scalar.value + (0x1F1E6 - 0x61))!
        }

        let lowercasedCode = countryCode.lowercased()
        guard lowercasedCode.count == 2 else { return nil }
        guard lowercasedCode.unicodeScalars.reduce(true, { accum, scalar in accum && isLowercaseASCIIScalar(scalar) }) else { return nil }

        let indicatorSymbols = lowercasedCode.unicodeScalars.map({ regionalIndicatorSymbol(for: $0) })
        return String(indicatorSymbols.map({ Character($0) }))
    }
}

extension TimeZone {

    static let japan = TimeZone(identifier: "Asia/Tokyo")!
}

extension Locale {
    
    static let japan = Locale(identifier: "ja_JP")
}

extension Date {

    init(year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil) {
            self.init(
                timeIntervalSince1970: Date().fixed(
                    year:   year,
                    month:  month,
                    day:    day,
                    hour:   hour,
                    minute: minute,
                    second: second
                ).timeIntervalSince1970
            )
        }

    var weekName: String {
        let index = calendar.component(.weekday, from: self) - 1 // index値を 1〜7 から 0〜6 にしている
        return ["日", "月", "火", "水", "木", "金", "土"][index]
    }

    var year: Int {
        return calendar.component(.year, from: self)
    }

    var month: Int {
        return calendar.component(.month, from: self)
    }

    var day: Int {
        return calendar.component(.day, from: self)
    }

    var hour: Int {
        return calendar.component(.hour, from: self)
    }

    var minute: Int {
        return calendar.component(.minute, from: self)
    }

    var second: Int {
        return calendar.component(.second, from: self)
    }

    var calendar: Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = .current
        calendar.locale   = .current
        return calendar
    }

    var oclock: Date {
        return fixed(minute: 0, second: 0)
    }

    var zeroclock: Date {
        return fixed(hour: 0, minute: 0, second: 0)
    }

    func fixed(year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil) -> Date {
        let calendar = self.calendar

        var comp = DateComponents()
        comp.year   = year   ?? calendar.component(.year,   from: self)
        comp.month  = month  ?? calendar.component(.month,  from: self)
        comp.day    = day    ?? calendar.component(.day,    from: self)
        comp.hour   = hour   ?? calendar.component(.hour,   from: self)
        comp.minute = minute ?? calendar.component(.minute, from: self)
        comp.second = second ?? calendar.component(.second, from: self)
        
        return calendar.date(from: comp)!
    }

    func added(year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil) -> Date {
        let calendar = self.calendar

        var comp = DateComponents()
        comp.year   = (year   ?? 0) + calendar.component(.year,   from: self)
        comp.month  = (month  ?? 0) + calendar.component(.month,  from: self)
        comp.day    = (day    ?? 0) + calendar.component(.day,    from: self)
        comp.hour   = (hour   ?? 0) + calendar.component(.hour,   from: self)
        comp.minute = (minute ?? 0) + calendar.component(.minute, from: self)
        comp.second = (second ?? 0) + calendar.component(.second, from: self)

        return calendar.date(from: comp)!
    }
}
