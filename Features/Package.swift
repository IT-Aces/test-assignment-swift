// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Features",
    products: [
        .library(name: "Chat", targets: ["Chat"]),
    ],
    dependencies: [
        .package(path: "../Core"),
    ],
    targets: [
        .target(name: "Chat", dependencies: [
            .product(name: "Repositories", package: "Core"),
            .product(name: "DataSource", package: "Core"),
            .product(name: "DesignSystem", package: "Core"),
        ]),
    ]
)
