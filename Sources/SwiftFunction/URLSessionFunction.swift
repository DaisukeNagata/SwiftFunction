//
//  URLSessionFunction.swift
//  
//
//  Created by 永田大祐 on 2021/06/03.
//
import Foundation
import Combine

struct Time : Decodable {
    var statusCode: Int
    var count: String
    var os: String
    var uuid: String
}

@available(iOS 13.0, *)
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

    public func export(_ pathName: URL, completion: @escaping (URL) -> Void)  {
        URLSession.shared.dataTask(with: pathName) { data, response, error in
            guard let data = data, error == nil else { return }
            let tmpURL = FileManager.default.temporaryDirectory
                .appendingPathComponent(response?.suggestedFilename ?? "")
            do {
                try data.write(to: tmpURL)
                completion(tmpURL)
            } catch {
                print("\("🟢")",error)
            }
            
        }.resume()
    }

    public var cancellable: Cancellable? {
        didSet { oldValue?.cancel() }
    }

    public func combineResponse(urlPath: String, uuid: String, completion: @escaping () -> Void) {
        guard let url = URL(string: urlPath) else { return }

        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        cancellable = URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: Time.self, decoder: JSONDecoder())
            .map { $0 }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()

        .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }, receiveValue: { user in
            print("\("🟢combineResponse")",user)
            completion()
        })
    }
}

extension URLSession {
    @available(iOS 15.0, *)
    func data(with url: URL) async throws -> Data {
        try await withCheckedThrowingContinuation { continuation in
            dataTask(with: url) { data, response, error in
                if let error = error {
                    print("error: \(error.localizedDescription)")
                    continuation.resume(throwing: error)
                    return
                }

                guard let data = data, let response = response as? HTTPURLResponse else {
                    print("no data or no response")
                    return
                }
                print("response: \(response)")
                continuation.resume(returning: data)
            }
            .resume()
        }
    }
}
