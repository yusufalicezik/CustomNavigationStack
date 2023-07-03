//
//  CustomNavigationContainerView.swift
//  CustomNavigationStack
//
//  Created by Yusuf Ali Cezik on 3.07.2023.
//

import SwiftUI

struct CustomNavigationContainerView<Content: View>: View {
    
    let content: Content
    @State var customContentView: CustomNavViewContentPreferenceKey.ContentType?
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            if case .customView(_, let content) = customContentView {
                content.body
            }
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(CustomNavViewContentPreferenceKey.self, perform: { value in
            self.customContentView = value
        })
    }
}

#Preview {
    CustomNavigationContainerView {
        Text("")
    }
}


struct CustomNavViewContentPreferenceKey: PreferenceKey {
    enum ContentType: Equatable {
        case customView(id: UUID = .init(), CustomView<AnyView>)
        //default/common navigation bar
        //..
        //..
        
        static func == (lhs: CustomNavViewContentPreferenceKey.ContentType, rhs: CustomNavViewContentPreferenceKey.ContentType) -> Bool {
            switch (lhs, rhs) {
            case (let .customView(lId, _), let .customView(rId, _)):
                return lId == rId
            }
        }
    }
    
    static var defaultValue: ContentType = .customView(.init(customView: AnyView(Text(""))))
    
    static func reduce(value: inout ContentType, nextValue: () -> ContentType) {
        value = nextValue()
    }

}

struct CustomView<CustomView: View>: View {
    var customView: CustomView

    var body: some View {
        customView
    }
}
