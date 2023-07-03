//
//  CustomNavigationView.swift
//  CustomNavigationStack
//
//  Created by Yusuf Ali Cezik on 3.07.2023.
//

import SwiftUI

struct CustomNavigationView<Content: View>: View {
    let path: Binding<[Route]>
    let content: Content
    
    init(path: Binding<[Route]>, @ViewBuilder content: () -> Content) {
        self.path = path
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: path) {
            CustomNavigationContainerView {
                content
            }.navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    CustomNavigationView(path: .constant([.home, .login])) {
        Text("Test")
    }
}

extension UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
