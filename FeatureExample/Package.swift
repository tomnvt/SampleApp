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
        .package(path: "../CommonDomain"),
        .package(path: "../CommonPresentation"),
    ],
    targets: [
        .target(
            name: name,
            dependencies: [
                "CommonData",
                "CommonDomain",
                "CommonPresentation",
            ],
            resources: []),
        .testTarget(
            name: "\(name)Tests",
            dependencies: [.init(stringLiteral: name)]
        ),
    ]
)
