// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FoundationPrelude",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [
        .library(
            name: "FoundationPrelude",
            targets: ["FoundationPrelude"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "FoundationPrelude",
            dependencies: []),
        .testTarget(
            name: "FoundationPreludeTests",
            dependencies: ["FoundationPrelude"]),
    ]
)
