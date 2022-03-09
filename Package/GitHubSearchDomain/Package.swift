// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GitHubSearchDomain",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "GitHubSearchDomain",
            targets: ["GitHubSearchDomain"]
        ),
    ],
    dependencies: [
        .package(name: "GitHubSearchData", path: "../GitHubSearchData"),
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.0.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "9.0.0"),
        .package(url: "https://github.com/Quick/Quick.git", from: "4.0.0")
    ],
    targets: [
        .target(
            name: "GitHubSearchDomain",
            dependencies: [
                .product(name: "GitHubSearchData", package: "GitHubSearchData"),
                .product(name: "Swinject", package: "Swinject")
            ]
        ),
        .testTarget(
            name: "GitHubSearchDomainTests",
            dependencies: [
                .target(name: "GitHubSearchDomain"),
                .product(name: "Nimble", package: "Nimble"),
                .product(name: "Quick", package: "Quick"),
            ]
        ),
    ]
)
