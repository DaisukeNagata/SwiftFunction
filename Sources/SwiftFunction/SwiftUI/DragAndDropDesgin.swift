//
//  DragAndDropView.swift
//  DragandDrop
//
//  Created by 永田大祐 on 2021/08/29.
//

import SwiftUI
import MobileCoreServices

@available(iOS 15.0.0, *)
struct DragAndDropViewPreView: View {
    var body: some View {
        NavigationView {
            DragAndDropView()
                .navigationTitle("DropImage")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

@available(iOS 15.0.0, *)
struct DragAndDropView: View {

    var body: some View {
        VStack(spacing: 0) {
            Color.clear.frame(height: 100)
            ZStack {
                VStack(spacing: 0) {
                    DragAndDropDesgin(delegate: ImageData())
                        .frame(height: 150)
                        .background(Color.blue)
                    DragAndDropDesgin(delegate: ImageData())
                        .frame(height: 150)
                        .background(Color.red)
                }
            }
            List(ImageData().totalImages, id: \.image) { image in
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

@available(iOS 15.0.0, *)
struct DragAndDropDesgin: View {

    @ObservedObject var delegate: ImageData
    var columns: [GridItem] = Array(repeating: .init(.fixed(20)), count: 1)

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: columns, alignment: .center) {
                ForEach(delegate.selectedImages) { image in
                    ZStack(alignment: Alignment(horizontal: .trailing,
                                                vertical: .top)) {
                        Image(image.image)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(15).onAppear {
                                print(image.image)
                            }
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .padding(5)
                            .background(Color.white)
                            .clipShape(Circle())
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
        .padding(.horizontal)
        .onDrop(of: [String(kUTTypeURL)], delegate: delegate)
    }
}

@available(iOS 15.0.0, *)
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
            guard provider.canLoadObject(ofClass: URL.self) else { return false}
            print("url loaded")
            let _ = provider.loadObject(ofClass: URL.self) { (url, err) in
                DispatchQueue.main.async {
                    self.selectedImages.append(Img(id: self.selectedImages.count,
                                                   image: "\(url!)"))
                }
            }
        }
        return true
    }
}

@available(iOS 15.0.0, *)
struct Img: Identifiable {
    var id: Int
    var image: String
}

@available(iOS 15.0.0, *)
struct DragAndDropViewPreView_Previews: PreviewProvider {
    static var previews: some View {
        DragAndDropViewPreView()
    }
}
