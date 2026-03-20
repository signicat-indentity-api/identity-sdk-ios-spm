// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "IdentitySDK",
    platforms: [
        .iOS("15.1")
    ],
    products: [
       .library(
           name: "IdentitySDK",
           targets: ["IdentitySDKWrapper"]
       )
    ],
    dependencies: [
        .package(url: "https://github.com/signicat/videoidskd-spm.git", exact: "26.4.0")
    ],
    targets: [
        .target(
           name: "IdentitySDKWrapper",
           dependencies: [
               .target(name: "IdentitySDK"),
               .product(name: "VideoIDSDK", package: "videoidskd-spm")
           ],
           path: "Sources/IdentitySDKWrapper"
       ),

       /// The binary XCFramework target
       .binaryTarget(
           name: "IdentitySDK",
           url: "https://github.com/signicat-indentity-api/identity-sdk-ios/archive/refs/tags/v3.7.0.zip",
           checksum: "d3e1d1895fa2fc407da7f3d1c00bccac52e8c4dc90cb74ce94b36bcb69b8e7ff"
       )
    ]
)
