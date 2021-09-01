//
//  DragAndDropDesgin.swift
//  DragAndDropDesgin
//
//  Created by 永田大祐 on 2021/09/01.
//

import SwiftUI
import MobileCoreServices

@available(iOS 14.0, *)
struct Img: Identifiable {
    var id: Int
    var image: String
}
@available(iOS 14.0, *)
struct DragAndDropView_Previews: PreviewProvider {
    static var previews: some View {
        DragAndDropView()
    }
}

@available(iOS 14.0, *)
struct DragAndDropView: View {
    var body: some View {
        NavigationView {
            Home()
                .navigationTitle("DropImage")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

@available(iOS 14.0, *)
struct Home: View {
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    @ObservedObject var delegate = ImageData()
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                ZStack {
                    
                    if delegate.selectedImages.isEmpty {
                        
                        Text("Here")
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                    }
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack {
                            ForEach(delegate.selectedImages, id:\.image) { image in
                                if !image.image.isEmpty {
                                    ZStack(alignment: Alignment(horizontal: .trailing,
                                                                vertical: .top)) {
                                            Image(image.image)
                                                .resizable()
                                                .frame(width: 100, height: 100)
                                                .cornerRadius(15)
                                            
                                            Button(action: {
                                                withAnimation(.easeOut) {
                                                    self.delegate.selectedImages.removeAll {
                                                        (check) -> Bool in
                                                        
                                                        if check.id == image.id{return true}
                                                        else {return false}
                                                    }
                                                }
                                            }) {
                                                Image(systemName: "xmark")
                                                    .foregroundColor(.white)
                                                    .padding(10)
                                                    .background(Color.black)
                                                    .clipShape(Circle())
                                            }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(height: 200)
                .onDrop(of: [String(kUTTypeURL)], delegate: delegate)
                .padding(.all)
                .padding(.all)
                .padding(.all)
                .padding(.all)
            }
            List(delegate.totalImages, id: \.image) { image in
                HStack {
                    Text((image.id + 1).description)
                    Image(image.image)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(15)
                        .onDrag {
                            NSItemProvider(item: .some(URL(string: image.image)! as NSSecureCoding),
                                           typeIdentifier: String(kUTTypeURL))
                        }
                }
            }
            .padding(.all)
        }
        .background(Color.black.opacity(0.5))
        .edgesIgnoringSafeArea(.all)
        
    }
}

@available(iOS 14.0, *)
class ImageData: ObservableObject, DropDelegate {
    @Published var totalImages: [Img] = [
        Img(id: 0, image: "p1"),
        Img(id: 1, image: "p2"),
        Img(id: 2, image: "p3"),
        Img(id: 3, image: "p4")
    ]
    @Published var selectedImages: [Img] = []
    
    func performDrop(info: DropInfo) -> Bool {
        
        for provider in info.itemProviders(for: [String(kUTTypeURL)]) {
            if provider.canLoadObject(ofClass: URL.self) {
                print("url loaded")
                
                let _ = provider.loadObject(ofClass: URL.self) { (url, err) in
//                    print(url!)
//                    let status = self.selectedImages.contains { (check) -> Bool in
//                        if check.image == "\(url!)" {return true}
//                        else{return false}
//                    }
                    
//                    if !status {
                        DispatchQueue.main.async {
                            withAnimation(.easeOut) {
                                self.selectedImages.append(Img(id: self.selectedImages.count,
                                                               image: "\(url!)"))
                            }
                        }
                    }
                }
//            } else {
//                return false
//            }
        }
        return true
    }
}
