//
//  AnyNavigatableView.swift of Navigattie
//
//  Created by Eugene Babenko

// 
//  Copyright ©2023 eugene. Licensed under MIT License. 

import SwiftUI

struct AnyNavigatableView: NavigatableView, Equatable {
    var customID: String?
    
    let id: String
    let animation: TransitionAnimation
    private let _body: AnyView
    private let _configure: (NavigationConfig) -> (NavigationConfig)


    init(_ view: some NavigatableView, _ animation: TransitionAnimation) {
        self.id = view.id
        self.animation = animation
        self._body = AnyView(view)
        self._configure = view.configure
    }
}
extension AnyNavigatableView {
    static func == (lhs: AnyNavigatableView, rhs: AnyNavigatableView) -> Bool { lhs.id == rhs.id }
}
extension AnyNavigatableView {
    var body: some View { _body }
    func configure(view: NavigationConfig) -> NavigationConfig { _configure(view) }
}
