//
//  Public+View.swift of Navigattie
//
//  Created by Eugene Babenko

// 
//  Copyright ©2023 eugene. Licensed under MIT License. 

import SwiftUI

// MARK: - Removing Views From Stack
public extension View {
    /// Removes the presented view from the stack
    func pop() { NavigationManager.pop() }

    /// Removes all views up to the selected view in the stack. The view from the argument will be the new active view
    @discardableResult
    func pop<N: NavigatableView>(to view: N.Type) -> Bool { NavigationManager.pop(to: view) }

    /// Removes all views from the stack. Root view will be the new active view
    func popToRoot() { NavigationManager.popToRoot() }
}

// MARK: - Actions
public extension View {
    /// Triggers every time the popup is at the top of the stack
    func onFocus(_ view: some NavigatableView, perform action: @escaping () -> ()) -> some View {
        onReceive(NavigationManager.shared.$views) { views in
            if views.last?.id == view.id { action() }
        }
    }
}
