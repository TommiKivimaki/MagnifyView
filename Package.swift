// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MagnifyView",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "MagnifyView",
            targets: ["MagnifyView"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "MagnifyView",
            dependencies: [],
            resources: [.process("Resources"),]),
        .testTarget(
            name: "MagnifyViewTests",
            dependencies: ["MagnifyView"]),
    ]
)
