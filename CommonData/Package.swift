// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CommonData",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "CommonData",
            targets: ["CommonData"]),
    ],
    dependencies: [
        .package(path: "../SharedDomain"),
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess", .upToNextMajor(from: "4.2.2"))
    ],
    targets: [
        .target(
            name: "CommonData",
            dependencies: [
                "SharedDomain",
                "KeychainAccess",
            ],
            resources: [.process("Resources/")]
        ),
        .testTarget(
            name: "CommonDataTests",
            dependencies: ["CommonData"]),
    ]
)
