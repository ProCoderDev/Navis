// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Navis",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "Navis", targets: ["Navis"]),
    ],
    targets: [
        .target(name: "Navis", dependencies: [], path: "Sources")
    ]
)
