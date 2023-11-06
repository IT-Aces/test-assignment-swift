// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    products: [
        .library(name: "DesignSystem", targets: ["DesignSystem"]),
        .library(name: "IDataSource", targets: ["IDataSource"]),
        .library(name: "DataSource", targets: ["DataSource"]),
        .library(name: "IRepositories", targets: ["IRepositories"]),
        .library(name: "Repositories", targets: ["Repositories"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/AlamofireImage.git", .upToNextMajor(from: "4.3.0"))
    ],
    targets: [
        .target(
            name: "DesignSystem",
            dependencies: ["AlamofireImage"],            
            resources: [.process("Resources/Images.xcassets")]
        ),
        .target(name: "IDataSource"),
        .target(name: "DataSource", dependencies: ["IDataSource"]),
        .target(name: "IRepositories"),
        .target(name: "Repositories", dependencies: [
            "IDataSource",
            "IRepositories",
        ]),
    ]
)
