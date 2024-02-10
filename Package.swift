// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FoundationPlus",
    products: [
        .library(
            name: "FoundationPlus",
            targets: ["FoundationPlus"])
    ],
    targets: [
        .target(
            name: "FoundationPlus"),
        .testTarget(
            name: "FoundationPlusTests",
            dependencies: ["FoundationPlus"])
    ]
)
