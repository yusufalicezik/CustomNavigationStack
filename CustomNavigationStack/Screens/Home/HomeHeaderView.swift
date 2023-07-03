//
//  HomeHeaderView.swift
//  CustomNavigationStack
//
//  Created by Yusuf Ali Cezik on 4.07.2023.
//

import SwiftUI

struct HomeHeaderView: View {
    var updateButtonAction: (() -> Void)?
    @Binding var shouldUpdateText: Bool
    
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            HStack {
                Spacer()
                Button {
                    shouldUpdateText.toggle()
                    updateButtonAction?()
                } label: {
                    Text("UPDATE").foregroundStyle(.white)
                }
            }
        }.frame(height: 100)
    }
}

#Preview {
    HomeHeaderView(shouldUpdateText: .constant(false))
}
