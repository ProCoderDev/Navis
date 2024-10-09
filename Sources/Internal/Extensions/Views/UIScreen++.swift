//
//  UIScreen++.swift of Navigattie
//
//  Created by Eugene Babenko

// 
//  Copyright ©2023 eugene. Licensed under MIT License. 

import SwiftUI

public extension UIScreen {
    static let width: CGFloat = main.bounds.size.width
    static let height: CGFloat = main.bounds.size.height
    static var safeArea: UIEdgeInsets = {
        UIApplication.shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap(\.windows)
            .first(where: \.isKeyWindow)?
            .safeAreaInsets ?? .zero
    }()
}
