//
//  TopBottomCheckSizeDesgin.swift
//  
//
//  Created by 永田大祐 on 2022/01/08.
//

import SwiftUI

@available(iOS 15.0, *)
struct TabBarAccessor: UIViewControllerRepresentable {
    var callback: (UITabBar) -> Void
    private let proxyController = ViewController()
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<TabBarAccessor>) ->
    UIViewController {
        proxyController.callback = callback
        return proxyController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<TabBarAccessor>) {
    }
    
    typealias UIViewControllerType = UIViewController
    
    private class ViewController: UIViewController {
        var callback: (UITabBar) -> Void = { _ in }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            if let tabBar = self.tabBarController {
                self.callback(tabBar.tabBar)
            }
        }
    }
}

@available(iOS 15.0, *)
struct NavBarAccessor: UIViewControllerRepresentable {
    var callback: (UINavigationBar) -> Void
    private let proxyController = ViewController()
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<NavBarAccessor>) ->
    UIViewController {
        proxyController.callback = callback
        return proxyController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavBarAccessor>) {
    }
    
    typealias UIViewControllerType = UIViewController
    
    private class ViewController: UIViewController {
        var callback: (UINavigationBar) -> Void = { _ in }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            if let navBar = self.navigationController {
                self.callback(navBar.navigationBar)
            }
        }
    }
}

@available(iOS 15.0, *)
struct TopBottomCheckSizeDesgin: View {
    @State private var tabBarHeight: CGFloat = 0
    @State private var naviBarHeight: CGFloat = 0
    @State var b = UIColor.blue
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = b
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    var body: some View {
        NavigationView {
            TabView {
                Text("\(tabBarHeight)")
                    .background(TabBarAccessor { tabBar in
                        tabBarHeight = tabBar.bounds.height
                        print(">> TabBar height: \(tabBar.bounds.height)")
                    })
                    .tabItem { Image(systemName: "1.circle") }
                    .tag(0)
                Text("\(naviBarHeight)")
                    .tabItem { Image(systemName: "2.circle") }
                    .tag(1)
            }
            .background(Color.gray)
            .navigationBarTitle("Title", displayMode: .inline)
            .background(NavBarAccessor { navBar in
                naviBarHeight = navBar.bounds.height
                print(">> NavBar height: \(navBar.bounds.height)")
                // !! use as needed, in calculations, @State, etc.
            })
        }
    }
}

@available(iOS 15.0, *)
struct TopBottomCheckSizeDesgin_Previews: PreviewProvider {
    static var previews: some View {
        TopBottomCheckSizeDesgin()
    }
}
