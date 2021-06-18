//
//  File.swift
//  
//
//  Created by 永田大祐 on 2021/06/19.
//

import Foundation

let json = """
    {
        "public": false,
        "files": {
            "gist": {
                "content": "Toukou!"
            }
        }
    }
"""

public struct PostGist: Codable {
    let `public`: Bool
    let files: Nestetd

    struct Nestetd: Codable {
        let gist: Nestetd2
    }

    struct Nestetd2: Codable {
        let content: String
    }
}

public class CodableFunction {
    
    public func codableDecoderfunction() {
        let d = JSONDecoder()
        if let jsonData = json.data(using: .utf8) {
            do {
                let results = try d.decode(PostGist.self, from: jsonData)
                print(results.public, "🟢codableDecoderfunction")
                print(results.files.gist, "🟢codableDecoderfunction")
            } catch {
                print(error, "🟢error")
            }
        }
    }
}
