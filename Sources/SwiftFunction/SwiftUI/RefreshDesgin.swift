//
//  RefreshView.swift
//  
//
//  Created by 永田大祐 on 2021/11/02.
//

import SwiftUI
import Combine

@available(iOS 15.0, *)
struct SearchUserResponse: Decodable {
    var items: [GitHUbStruct]
}

@available(iOS 15.0, *)
struct GitHUbStruct: Hashable, Identifiable, Decodable {
    var login: String
    var id: Int
    var avatar_url: String
    var html_url: String
}

@available(iOS 15.0, *)
struct RestaurantRow: View {
    var gitHUbStruct: GitHUbStruct
    @ObservedObject var model: gitHubModel
    
    var body: some View {
        HStack {
            ImageViewContainer(imageUrl: gitHUbStruct.avatar_url)
            Button(action: {
                model.invalid.toggle()
                model.urlPath = gitHUbStruct.html_url
            }, label: {
                Text("GitHub login Name \(String(describing: model.name == "" ? "" : self.model.name))" +
                     "\n" +
                     "GitHub ID \(String(describing:  gitHUbStruct.id.description == "" ? "" : gitHUbStruct.id.description))")
            })
        }
    }
}

@available(iOS 15.0, *)
struct ImageViewContainer: View {
    
    @ObservedObject var remoteImageURL: RemoteImageURL
    
    init(imageUrl: String) {
        remoteImageURL = RemoteImageURL(imageURL: imageUrl)
    }
    
    var body: some View {
        Image(uiImage: UIImage(data: remoteImageURL.data) ?? UIImage())
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.black,
                                lineWidth: 3.0))
            .frame(width: 70.0,
                   height: 70.0)
            .aspectRatio(CGSize(width: 70.0,
                                height: 70.0),
                         contentMode: .fit)
    }
}

@available(iOS 15.0, *)
class RemoteImageURL: ObservableObject {
    @Published var data = Data()
    
    init(imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            DispatchQueue.main.async { self.data = data }
            
        }.resume()
    }
}


@available(iOS 15.0, *)
final class gitHubModel: ObservableObject {
    
    @Published var urlPathSet = "https://api.github.com/search/users"
    @Published var users = [GitHUbStruct]()
    @Published var invalid = false
    @Published var urlPath = ""
    @Published var name = ""
    
    
    private var cancellable: Cancellable? {
        didSet { oldValue?.cancel() }
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func search() {
        
        guard !name.isEmpty else {
            return users = []
        }
        
        
        var urlComponents = URLComponents(string: urlPathSet)!
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: name)
        ]
        
        var request = URLRequest(url: urlComponents.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        cancellable = URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: SearchUserResponse.self, decoder: JSONDecoder())
            .map { $0.items }
            .replaceError(with: [])
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
                
                // this is sorted
                self.users =  user.sorted { (l, r) -> Bool in
                    if l.id < r.id {
                        return false
                    } else {
                        return true
                    }
                }
            })
    }
}

@available(iOS 15.0, *)
struct RefreshView: View {

    @ObservedObject var viewModel = gitHubModel()

    var body: some View {
        NavigationView {
            List(viewModel.users) { value in
                RestaurantRow(gitHUbStruct: value,
                              model: self.viewModel)
            }
            .refreshable {
                self.viewModel.name = "daisuke"
                self.viewModel.search()
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .navigationBarTitle(Text("Users"))
        }
    }
}

@available(iOS 15.0, *)
struct RefreshView_Previews: PreviewProvider {
    static var previews: some View {
        RefreshView()
    }
}
