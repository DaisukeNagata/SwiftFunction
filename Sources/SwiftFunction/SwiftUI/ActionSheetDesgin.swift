//
//  AlertView.swift
//  
//
//  Created by 永田大祐 on 2021/08/22.
//

import SwiftUI

@available(iOS 14.0, *)
struct ActionSheetView: View {
    @ObservedObject private var viewModel = ActionSheetViewModel()
    var body: some View {
        ZStack {
            Text("Hello").onTapGesture {
                viewModel.alertModel.flg.toggle()
            }
            AnyView(
                ActionSheetChoiceView(viewModel: self.viewModel)
            ).isHidden(viewModel.alertModel.flg)
        }
    }
}

@available(iOS 14.0, *)
struct ActionSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetView()
    }
}

@available(iOS 14.0, *)
struct ActionSheetModel: Identifiable {
    let id: Int
    var flg: Bool
    var edge: Edge
    var offSet: CGFloat
}

@available(iOS 14.0, *)
class ActionSheetViewModel: ObservableObject {
    @Published var alertModel = ActionSheetModel(id:0,
                                           flg: false,
                                           edge: Edge.bottom,
                                           offSet:UIScreen.main.bounds.height/2)
}

@available(iOS 14.0, *)
struct ActionSheetChoiceView: View {

    @ObservedObject var viewModel: ActionSheetViewModel

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.gray
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity)
                    .onTapGesture {
                        closeAnimation()
                    }
                    .opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                ZStack {
                    ActionSheetDesgin(viewModel: viewModel) {
                        Color.white
                            .frame(width: geometry.size.width,
                                   height: geometry.size.height*1.2,
                                   alignment: .center)
                    }
                    ActionSheetDesgin(viewModel: viewModel) {
                        Text("World")
                            .frame(width: geometry.size.width,
                                   alignment: .center)
                    }
                }
            }
            .onAppear {
                if !viewModel.alertModel.flg {
                    openAnimation()
                }
            }
        }
    }

    func closeAnimation() {
        withAnimation(.easeInOut(duration: 0.5)) {
            viewModel.alertModel.offSet = UIScreen.main.bounds.height*1.2
        }
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
            viewModel.alertModel.offSet = UIScreen.main.bounds.height/2
            viewModel.alertModel.flg
                .toggle()
        }
    }

    func openAnimation() {
        viewModel.alertModel.offSet = UIScreen.main.bounds.height*1.2
        withAnimation(.easeInOut(duration: 0.5)) {
            viewModel.alertModel.offSet = UIScreen.main.bounds.height/2
        }
    }
}

@available(iOS 14.0, *)
private struct ActionSheetDesgin<Content:View>: View {

    @ObservedObject var viewModel: ActionSheetViewModel
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
