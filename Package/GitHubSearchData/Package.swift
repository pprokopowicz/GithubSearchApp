// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GitHubSearchData",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "GitHubSearchData",
            targets: ["GitHubSearchData"]
        ),
    ],
    dependencies: [
        .package(name: "NetworkKit", path: "../NetworkKit"),
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "GitHubSearchData",
            dependencies: [
                .product(name: "NetworkKit", package: "NetworkKit"),
                .product(name: "Swinject", package: "Swinject")
            ]
        )
    ]
)
