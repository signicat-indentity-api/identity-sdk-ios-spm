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
           url: "https://github.com/signicat-indentity-api/identity-sdk-ios/archive/refs/tags/v3.6.0.zip",
           checksum: "e501d428705ef4a61b9e93b9f2683cb82900e3f62276d21420a6836dace794e6"
       )
    ]
)
