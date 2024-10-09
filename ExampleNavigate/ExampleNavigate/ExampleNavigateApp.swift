//
//  ExampleNavigateApp.swift
//  ExampleNavigate
//

import SwiftUI
import Navis

@main
struct ExampleNavigateApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .implementNavigationView(config: nil)
        }
    }
}
