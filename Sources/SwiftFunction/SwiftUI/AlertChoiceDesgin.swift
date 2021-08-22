//
//  AlertView.swift
//  SwiftUIView
//
//  Created by 永田大祐 on 2021/08/22.
//

import SwiftUI

@available(iOS 14.0, *)
struct AlertView: View {
    @ObservedObject private var viewModel = AlertViewModel()
    var body: some View {
        self.modifier(AlertModifer(view:  AnyView(AlertChoiceView(viewModel: self.viewModel))))
    }
}

@available(iOS 14.0, *)
struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}


@available(iOS 14.0, *)
class AlertViewModel: ObservableObject {
    @Published var alertModel = AlertModel(id:0, edge: Edge.bottom, offSet: UIScreen.main.bounds.height/2)
}

@available(iOS 14.0, *)
struct AlertModifer: ViewModifier {
    var view: AnyView? = AnyView( EmptyView() ) {
        didSet {
            print("AlertModifer")
            
        }
    }
    func body(content: Content) -> some View {
        return view
    }
}

@available(iOS 14.0, *)
struct AlertModel: Identifiable {
    let id: Int
    var edge: Edge
    var offSet: CGFloat
}

@available(iOS 14.0, *)
struct AlertChoiceView: View {

    @ObservedObject var viewModel: AlertViewModel

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.gray
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .onTapGesture {
                        withAnimation {
                            viewModel.alertModel.offSet == UIScreen.main.bounds.height ?
                            windowAnimation(divide: 2) :
                            windowAnimation(divide: 1)
                        }
                    }
                    .opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                
                Color.white
                    .transition(.move(edge: viewModel.alertModel.edge))
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    .cornerRadius(15, corners: [.topLeft, .topRight])
                    
                    .gesture(DragGesture()
                                .onChanged({ value in
                        viewModel.alertModel.offSet = (value.translation.height*0.1) + viewModel.alertModel.offSet
                    }))
                    .offset(y: viewModel.alertModel.offSet)
            }
        }
    }

    func windowAnimation(divide: CGFloat) {
        withAnimation(.easeInOut(duration: 0.5)) {
            self.viewModel.alertModel.offSet = UIScreen.main.bounds.height / divide
        }
    }
}
