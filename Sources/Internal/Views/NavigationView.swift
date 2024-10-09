//
//  NavigationView.swift of Navigattie
//
//  Created by Eugene Babenko

// 
//  Copyright ©2023 eugene. Licensed under MIT License. 

import SwiftUI

struct NavigationView: View {
    @Namespace var namespace
    private let config: NavigationGlobalConfig


    init(rootView: some NavigatableView, config: NavigationGlobalConfig?) { self.config = config ?? .init(); NavigationManager.setRoot(rootView) }
    var body: some View { NavigationStackView(namespace: namespace, config: config) }
}
