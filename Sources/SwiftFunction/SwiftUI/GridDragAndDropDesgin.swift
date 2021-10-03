//
//  GridContentView.swift
//  
//
//  Created by 永田大祐 on 2021/08/29.
//

import SwiftUI
import MobileCoreServices

@available(iOS 14.0, *)
struct GridContentView: View {
    var body: some View {
        NavigationView {
            GridDragAndDropView()
                .navigationTitle("DropImage")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

@available(iOS 14.0, *)
struct GridDragAndDropView: View {
    var body: some View {
        VStack(spacing: 5) {
            Color.clear.frame(height: UIScreen.main.bounds.height/9)
            ForEach((0...5), id: \.self) { row in
                HStack {
                    ForEach((1...5), id: \.self) { column in
                        GridDragAndDropDesgin(delegate: GridImageData())
                            .frame(width: UIScreen.main.bounds.width/7,
                                   height: UIScreen.main.bounds.width/7)
                            .background(Color.blue)
                    }
                }
            }

            List(GridImageData().totalImages, id: \.image) { image in
                HStack {
                    Text((image.id + 1).description)
                    Image(image.image)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width/8, height: UIScreen.main.bounds.width/8)
                        .cornerRadius(15)
                        .onDrag {
                            NSItemProvider(item: .some(URL(string: image.image)! as NSSecureCoding),
                                           typeIdentifier: String(kUTTypeURL))
                        }
                }
            }
        }
        .padding(.horizontal, UIScreen.main.bounds.width/10)
        .background(Color.black.opacity(0.5))
        .edgesIgnoringSafeArea(.all)
    }
}

@available(iOS 14.0, *)
struct GridDragAndDropDesgin: View {
    
    @ObservedObject var delegate: GridImageData
    var columns: [GridItem] = Array(repeating: .init(.fixed(0)), count: 1)
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: columns) {
                ForEach(delegate.selectedImages) { image in
                    ZStack(alignment: Alignment(horizontal: .center,
                                                vertical: .top)) {
                        Image(image.image)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width/15,
                                   height: UIScreen.main.bounds.width/15)
                            .cornerRadius(5).onAppear {
                                print(image.image)
                            }
                            .onTapGesture {
                                withAnimation(.easeOut) {
                                    self.delegate.selectedImages.removeAll {
                                        (check) -> Bool in
                                        if check.id == image.id{return true}
                                        else {return false}
                                    }
                                }
                            }
                    }
                }
            }
        }
        .offset(x: (UIScreen.main.bounds.width/7)/4)
        .onDrop(of: [String(kUTTypeURL)], delegate: delegate)
    }
}

@available(iOS 14.0, *)
class GridImageData: ObservableObject, DropDelegate {
    @Published var totalImages: [GridImg] = [
        GridImg(id: 0, image: "p1"),
        GridImg(id: 1, image: "p2"),
        GridImg(id: 2, image: "p3"),
        GridImg(id: 3, image: "p4")
    ]
    @Published var selectedImages: [GridImg] = []
    
    func performDrop(info: DropInfo) -> Bool {
        for provider in info.itemProviders(for: [String(kUTTypeURL)]) {
            guard provider.canLoadObject(ofClass: URL.self) else { return false}
            print("url loaded")
            let _ = provider.loadObject(ofClass: URL.self) { (url, err) in
                DispatchQueue.main.async {
                    self.selectedImages.append(GridImg(id: self.selectedImages.count,
                                                       image: "\(url!)"))
                }
            }
        }
        return true
    }
}

@available(iOS 14.0, *)
struct GridImg: Identifiable {
    var id: Int
    var image: String
}

@available(iOS 14.0, *)
struct GridContentView_Previews: PreviewProvider {
    static var previews: some View {
        GridContentView()
    }
}
