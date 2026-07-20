// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VKASampleSDK",
    platforms: [
        .iOS(.v13) // The minimum iOS version your SDK supports
    ],
    products: [
        // This is what users will see when they add the package
        .library(
            name: "VKASampleSDK",
            targets: ["VKASampleSDKTarget"])
    ],
    dependencies: [
        // Google Mobile Ads official Swift Package
        .package(
            url: "https://github.com/kishantuvoc/TapMindSDK.git",
            from: "1.2.8"
        )
    ],
    targets: [
        // 1. The actual binary framework
        .binaryTarget(
            name: "VKASampleSDKBinary",
            path: "VKASampleSDK.xcframework"
        ),
        // 2. The wrapper target that bridges your binary and Google Mobile Ads
        .target(
            name: "VKASampleSDKTarget",
            dependencies: [
                .target(name: "VKASampleSDKBinary"),
                .product(name: "TapMindSDK", package: "TapMindSDK")
            ],
            path: "Sources/VKASampleSDK" // Points to your physical folder
        )
    ]
)
