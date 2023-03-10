// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "generate-resources",
    platforms: [.macOS(.v11)],
    products: [
        .executable(
            name: "tuist-generate-resources",
            targets: ["GenerateResourcesPlugin"]
        ),
        .library(
            name: "GenerateResourcesFramework",
            targets: ["GenerateResourcesFramework"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0"),
        .package(url: "https://github.com/tuist/ProjectAutomation", .upToNextMajor(from: "3.14.0")),
        .package(url: "https://github.com/kylef/PathKit.git", exact: "1.0.1"),
        .package(url: "https://github.com/SwiftGen/SwiftGen.git", exact: "6.6.2"),
    ],
    targets: [
        .executableTarget(
            name: "GenerateResourcesPlugin",
            dependencies: [
                "GenerateResourcesFramework",
            ]
        ),
        .target(
            name: "GenerateResourcesFramework",
            dependencies: [
                .product(name: "ProjectAutomation", package: "ProjectAutomation"),
                .product(name: "PathKit", package: "PathKit"),
                .product(name: "SwiftGenCLI", package: "SwiftGen"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
    ]
)
