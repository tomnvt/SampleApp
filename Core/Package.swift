// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Core",
            targets: ["Core"]
        ),
    ],
    dependencies: [
        .package(path: "../SharedData"),
        .package(path: "../SharedDomain"),
        .package(path: "../SharedUI"),
    ],
    targets: [
        .target(
            name: "Core",
            dependencies: [
                "SharedData",
                "SharedDomain",
                "SharedUI",
            ]
        )
    ]
)
