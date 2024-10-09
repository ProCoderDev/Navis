//
//  ContentView.swift
//  ExampleNavigate
//
//

import SwiftUI
import Navis

struct ContentView: NavigatableView {
    var customID: String?

    init(customID: String? = nil) {
        self.customID = "ContentView"
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
            VStack {
                Button(action: {ContentView1().push()}, label: {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, world!")
                })
            }
        }
    }
}

struct ContentView1: NavigatableView {
    var customID: String?

    init(customID: String? = nil) {
        self.customID = "ContentView1"
    }

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.yellow)
            VStack {
                Button(action: {
                    pop()
                    ContentView2().push()
                }, label: {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, second!")
                })
            }
        }
    }
}

struct ContentView2: NavigatableView {
    var customID: String?

    init(customID: String? = nil) {
        self.customID = "ContentView2"
    }

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.red)
            VStack {
                Button(action: {
                    if pop(to: ContentView.self) {
                        print("Success")
                    } else {
                        pop()
                    }
                }, label: {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, laste!")
                })
            }
        }
    }
}

#Preview {
    ContentView()
}
