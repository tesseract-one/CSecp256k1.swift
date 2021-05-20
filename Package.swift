// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CSecp256k1",
    products: [
        .library(
            name: "CSecp256k1",
            targets: ["CSecp256k1"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CSecp256k1",
            dependencies: [],
            sources: [
                "secp256k1/src/secp256k1.c"
            ],
            publicHeadersPath: "include",
            cSettings: [
                .define("HAVE_CONFIG_H"),
                .headerSearchPath("include"),
                .headerSearchPath("config"),
                .headerSearchPath("secp256k1/include"),
                .headerSearchPath("secp256k1/src")
            ])
    ]
)
