// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "IdentitySDK",
    platforms: [
        .iOS(.v15)
    ],
    products: [
       .library(
           name: "IdentitySDK",
           targets: ["IdentitySDKWrapper"]
       )
    ],
    dependencies: [
        .package(url: "https://github.com/signicat/videoidskd-spm.git", exact: "1.38.1")
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
           url: "https://github.com/signicat-indentity-api/identity-sdk-ios/archive/refs/tags/v3.2.3.zip",
           checksum: "eb3781a2f6a01fcb97612d8f4978db22774c917cf8cdda810b13ba1acce53064"
       )
    ]
)
