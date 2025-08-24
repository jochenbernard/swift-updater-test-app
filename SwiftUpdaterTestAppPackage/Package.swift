// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "SwiftUpdaterTestAppPackage",
    platforms: [.macOS(.v14)],
    products: [
        .library(
            name: "SwiftUpdaterTestAppPackage",
            targets: ["SwiftUpdaterTestAppPackage"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/jochenbernard/swift-updater-github-releases",
            branch: "main"
        )
    ],
    targets: [
        .target(
            name: "SwiftUpdaterTestAppPackage",
            dependencies: [
                .product(
                    name: "SwiftUpdaterGitHubReleases",
                    package: "swift-updater-github-releases"
                ),
                .product(
                    name: "SwiftUpdaterGitHubReleasesUI",
                    package: "swift-updater-github-releases"
                )
            ]
        )
    ]
)
