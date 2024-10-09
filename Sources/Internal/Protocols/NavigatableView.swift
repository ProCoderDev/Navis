//
//  NavigatableView.swift of Navigattie
//
//  Created by Eugene Babenko

// 
//  Copyright ©2023 eugene. Licensed under MIT License. 

import SwiftUI

public protocol NavigatableView: View {
    var customID: String? { get set }
    func configure(view: NavigationConfig) -> NavigationConfig
}

// MARK: - Internals
extension NavigatableView {
    public var id: String {
            return customID ?? String(describing: Self.self) + "_" + randomString(length: 8)
        }

    private func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map { _ in letters.randomElement()! })
    }
}
