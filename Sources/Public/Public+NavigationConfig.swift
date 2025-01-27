//
//  Public+NavigationConfig.swift of Navigattie
//
//  Created by Eugene Babenko

// 
//  Copyright ©2023 eugene. Licensed under MIT License. 

import SwiftUI

// MARK: - Content Customisation
public extension NavigationConfig {
    /// Ignores safe areas
    func ignoresSafeArea(_ edge: VerticalEdge.Set) -> Self { changing(path: \.ignoredSafeAreas, to: edge) }

    /// Changes the background colour of the selected view
    func backgroundColour(_ value: Color) -> Self { changing(path: \.backgroundColour, to: value) }

}

// MARK: - Internal
public struct NavigationConfig: Configurable {
    private(set) var ignoredSafeAreas: VerticalEdge.Set? = nil
    private(set) var backgroundColour: Color? = nil
}
