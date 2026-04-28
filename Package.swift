// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "OktaOidc",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "OktaOidc",
            targets: ["OktaOidc"]
        )
    ],
    targets: [
        .target(
            name: "AppAuth",
            path: "Okta/AppAuth",
            exclude: [
                "macOS"
            ],
            publicHeadersPath: ".",
            cSettings: [
                .define("TARGET_OS_IOS", to: "1")
            ]
        ),
        .target(
            name: "OktaUserAgent",
            path: "Okta/OktaUserAgent",
            publicHeadersPath: "."
        ),
        .target(
            name: "OktaOidc",
            dependencies: [
                "AppAuth",
                "OktaUserAgent"
            ],
            path: "Okta/OktaOidc",
            exclude: [
                "macOS",
                "Internal/macOS",
                "Internal/Tasks/macOS"
            ]
        )
    ]
)
