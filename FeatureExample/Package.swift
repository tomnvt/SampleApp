// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let name = "FeatureExample"

let package = Package(
    name: name,
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: name,
            targets: [name]),
    ],
    dependencies: [
        .package(path: "../CommonData"),
        .package(path: "../SharedDomain"),
        .package(path: "../SharedUI"),
    ],
    targets: [
        .target(
            name: name,
            dependencies: [
                "CommonData",
                "SharedDomain",
                "SharedUI",
            ],
            resources: []),
        .testTarget(
            name: "\(name)Tests",
            dependencies: [.init(stringLiteral: name)]
        ),
    ]
)
