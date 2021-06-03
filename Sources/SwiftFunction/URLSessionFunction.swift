//
//  URLSessionFunction.swift
//  
//
//  Created by 永田大祐 on 2021/06/03.
//
import Foundation

public class URLSessionFunction {
    public func request(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let request = URLRequest(url: url)
        let configuration = URLSessionConfiguration.default
        let session = URLSession(
            configuration: configuration,
            delegate: nil,
            delegateQueue: OperationQueue.main
        )
        let task = session.dataTask(with: request) {  data, response, error in do {
            if let data = data, let response = response { completion(data, response, error) }
            }
        }
        task.resume()
    }
    
    @available(iOS 10.0, *)
    public func export(_ pathName: URL, completion: @escaping (URL) -> Void)  {
        URLSession.shared.dataTask(with: pathName) { data, response, error in
            guard let data = data, error == nil else { return }
            let tmpURL = FileManager.default.temporaryDirectory
                .appendingPathComponent(response?.suggestedFilename ?? "")
            do {
                try data.write(to: tmpURL)
                completion(tmpURL)
            } catch {
                print(error)
            }
            
        }.resume()
    }
}
