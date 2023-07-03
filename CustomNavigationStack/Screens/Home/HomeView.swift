//
//  HomeView.swift
//  CustomNavigationStack
//
//  Created by Yusuf Ali Cezik on 4.07.2023.
//

import SwiftUI

struct HomeView: View {
    @State var shouldUpdateText: Bool = false
    @State var text: String = "Home"

    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            VStack {
                Text(text)
                Spacer()
            }
        }.preference(key: CustomNavViewContentPreferenceKey.self, value: .customView(.init(customView: .init(HomeHeaderView(updateButtonAction: self.updateText, shouldUpdateText: $shouldUpdateText)))))
    }
    
    private func updateText() {
        if shouldUpdateText {
            text = "Updated text, home"
        } else {
            text = "Home"
        }
    }
}

#Preview {
    HomeView()
}
