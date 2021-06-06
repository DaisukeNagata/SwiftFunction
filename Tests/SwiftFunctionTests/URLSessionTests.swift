//
//  URLSessionTests.swift
//  
//
//  Created by 永田大祐 on 2021/06/04.
//

import XCTest
@testable import SwiftFunction

@available(iOS 13.0, *)
final class URLSessionTests: XCTestCase {

    let uRLSessionFunction = URLSessionFunction()

    func testAsync() {
        delay(testCase: self, seconds: 10)
        delayFileManager(testCase: self, seconds: 10)
        delayCombine(testCase: self, seconds: 10)
    }

    func delay(testCase: XCTestCase, seconds: Float) {
        let delay = testCase.expectation(description: "delay")
        guard let url = URL(string: "https://7tslpj7nwg.execute-api.ap-northeast-1.amazonaws.com/default/DateTime?&os=\(UIDevice.current.systemVersion.description)&uuid=\(UIDevice.current.identifierForVendor?.uuidString ?? "")&type=ios") else { return }
        uRLSessionFunction.request(url: url, completion:{ data, res, error in
            do{
                if let data = data {
                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                    print(json)
                    delay.fulfill()
                    XCTAssert(true, "Sucsess")
                }
            } catch{
                XCTAssert(false, "Serialize Error.")
            }
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(seconds)) {
            delay.fulfill()
        }
        testCase.waitForExpectations(timeout: TimeInterval(seconds))
    }

    func delayFileManager(testCase: XCTestCase, seconds: Float) {
        let delayFileManager = testCase.expectation(description: "delayFileManager")
        guard let url = URL(string: "https://7tslpj7nwg.execute-api.ap-northeast-1.amazonaws.com/default/DateTime?&os=\(UIDevice.current.systemVersion.description)&uuid=\(UIDevice.current.identifierForVendor?.uuidString ?? "")&type=ios") else { return }
        uRLSessionFunction.export(url) { url in
            print(url)
            delayFileManager.fulfill()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(seconds)) {
            delayFileManager.fulfill()
        }
        testCase.waitForExpectations(timeout: TimeInterval(seconds))
    }
    
    func delayCombine(testCase: XCTestCase, seconds: Float) {
        let delayCombine = testCase.expectation(description: "delayCombine")
        let myURL = "https://7tslpj7nwg.execute-api.ap-northeast-1.amazonaws.com/default/DateTime?&os=\(UIDevice.current.systemVersion.description)&uuid=\(UIDevice.current.identifierForVendor?.uuidString ?? "")&type=ios"
        uRLSessionFunction.combineResponse(urlPath: myURL, uuid: UIDevice.current.identifierForVendor?.uuidString ?? "") {
            delayCombine.fulfill()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(seconds)) {
            delayCombine.fulfill()
        }
        testCase.waitForExpectations(timeout: TimeInterval(seconds))
    }
}
