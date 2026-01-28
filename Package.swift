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
        .package(url: "https://github.com/signicat/videoidskd-spm.git", exact: "1.47.0")
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
           url: "https://github.com/signicat-indentity-api/identity-sdk-ios/archive/refs/tags/v3.5.0.zip",
           checksum: "2131a090d8b0fe85cc50122ef0c3004f5cba7b9de0a6fddfb0663f44d807373c"
       )
    ]
)
