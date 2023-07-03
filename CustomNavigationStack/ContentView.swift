//
//  ContentView.swift
//  CustomNavigationStack
//
//  Created by Yusuf Ali Cezik on 3.07.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var navigation = Navigation()
    
    var body: some View {
        CustomNavigationView(path: $navigation.routes) {
            ZStack {
                Color.orange.ignoresSafeArea()
                
                Button {
                    navigation.routes.append(.home)
                } label: {
                    Text("Navigate to home")
                }
            }.preference(key: CustomNavViewContentPreferenceKey.self, value: .customView( .init(customView: customHeader())))
                .navigationDestination(for: Route.self) { route in
                    CustomNavigationContainerView {
                        switch route {
                        case .login:
                            Text("Login")
                        case .home:
                            HomeView()
                        default:
                            Text("Todo")
                        }
                    }.navigationBarHidden(true)
                }
        }
    }
    
    private func customHeader() -> AnyView {
        .init(
            ZStack {
                RoundedRectangle(cornerRadius: 1).fill(Color.red).frame(height: 100)
            }
        )
    }
    
    private func customHeader2() -> AnyView {
        .init(
            RoundedRectangle(cornerRadius: 1).fill(Color.yellow).frame(height: 150)
        )
    }
}

#Preview {
    ContentView()
}



//MARK: - Route
enum Route {
    case login
    case register
    case home
    case profile
    case settings
    //..
    //..
}

final class Navigation: ObservableObject {
    @Published var routes: [Route] = []
}

