// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "uXBPS",
  products: [
    .library(name: "XBPS", targets: ["XBPS"]),
    .executable(name: "uXBPS", targets: ["uXBPS"]),
  ],
  dependencies: [
    .package(url: "https://github.com/stackotter/swift-cross-ui", branch: "main"),
    .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),

  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "XBPS",
      dependencies: [
        .product(name: "Logging", package: "swift-log")
      ]),

    .testTarget(
      name: "XBPSTests",
      dependencies: [
        "XBPS",
        .product(name: "Logging", package: "swift-log"),
      ]),

    .executableTarget(
      name: "uXBPS",
      dependencies: [
        "XBPS",
        .product(name: "QtBackend", package: "swift-cross-ui"),
      ]),
  ]
)
