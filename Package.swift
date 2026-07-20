// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SampleSDK",
    platforms: [
        .iOS(.v13) // The minimum iOS version your SDK supports
    ],
    products: [
        // This is what users will see when they add the package
        .library(
            name: "SampleSDK",
            targets: ["SampleSDKTarget"])
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
            name: "SampleSDKBinary",
            path: "SampleSDK.xcframework"
        ),
        // 2. The wrapper target that bridges your binary and Google Mobile Ads
        .target(
            name: "SampleSDKTarget",
            dependencies: [
                .target(name: "SampleSDKBinary"),
                .product(name: "TapMindSDK", package: "TapMindSDK")
            ],
            path: "Sources/SampleSDK" // Points to your physical folder
        )
    ]
)
