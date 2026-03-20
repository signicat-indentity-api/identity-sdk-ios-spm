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
           url: "https://github.com/signicat-indentity-api/identity-sdk-ios/archive/refs/tags/v3.7.1.zip",
           checksum: "3dbecbc7d10ce4aebb33040fe79b5b1c3271d2abcaee109aa4092ee372584526"
       )
    ]
)
