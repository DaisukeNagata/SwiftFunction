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
        ZStack {
            Text("Hello").onTapGesture {
                viewModel.alertModel.flg.toggle()
            }
            AnyView(
                AlertChoiceView(viewModel: self.viewModel)
            ).isHidden(viewModel.alertModel.flg)
        }
    }
}

@available(iOS 14.0, *)
struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}

@available(iOS 14.0, *)
struct AlertModel: Identifiable {
    let id: Int
    var flg: Bool
    var edge: Edge
    var offSet: CGFloat
}

@available(iOS 14.0, *)
class AlertViewModel: ObservableObject {
    @Published var alertModel = AlertModel(id:0,
                                           flg: false,
                                           edge: Edge.bottom,
                                           offSet:UIScreen.main.bounds.height/2)
}

@available(iOS 14.0, *)
struct AlertChoiceView: View {

    @ObservedObject var viewModel: AlertViewModel

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.gray
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity)
                    .onTapGesture {
                        withAnimation {
                            windowAnimation()
                        }
                    }
                    .opacity(viewModel.alertModel.flg ? 0 : 0.5)
                    .edgesIgnoringSafeArea(.all)
                ZStack {
                    SetAlertDesgin(viewModel: viewModel) {
                        Color.white
                            .frame(width: geometry.size.width,
                                   height: geometry.size.height*1.2,
                                   alignment: .center)
                    }
                    SetAlertDesgin(viewModel: viewModel) {
                        Text("World")
                            .frame(width: geometry.size.width,
                                   alignment: .center)
                    }
                }
            }
        }
    }

    func opacity() -> Bool {
        viewModel.alertModel.offSet == UIScreen.main.bounds.height ? true : false
    }

    func windowAnimation() {

        withAnimation(.easeInOut(duration: 0.5)) {
            viewModel.alertModel.offSet = UIScreen.main.bounds.height*1.2
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
            self.viewModel.alertModel.offSet = UIScreen.main.bounds.height/2
            self.viewModel.alertModel.flg.toggle()
        }
    }
}

@available(iOS 14.0, *)
private struct SetAlertDesgin<Content:View>: View {

    @ObservedObject var viewModel: AlertViewModel
    let viewBuilder: () -> Content
    var body: some View {
        GeometryReader { geometry in
        viewBuilder()
            .transition(.move(edge: viewModel.alertModel.edge))
            .cornerRadius(15, corners: [.topLeft, .topRight])
            .gesture(DragGesture()
                        .onChanged({ value in
                viewModel.alertModel.offSet = (value.translation.height*0.1) + viewModel.alertModel.offSet
            }))
            .offset(y: viewModel.alertModel.offSet)
        }
    }
}
