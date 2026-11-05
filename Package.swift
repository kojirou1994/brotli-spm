// swift-tools-version: 6.2

import PackageDescription

let package = Package(
  name: "brotli-spm",
  products: [
    .library(name: "brotlicommon", targets: ["brotlicommon"]),
    .library(name: "brotlidec", targets: ["brotlidec"]),
    .library(name: "brotlienc", targets: ["brotlienc"]),
    .executable(name: "brotli", targets: ["brotli"]),
  ],
  targets: [
    .target(name: "brotlicommon", path: "Sources/common"),
    .target(name: "brotlidec", dependencies: ["brotlicommon"]),
    .target(
      name: "brotlienc",
      dependencies: ["brotlicommon"],
      linkerSettings: [.linkedLibrary("m", .when(platforms: [.linux]))],
    ),
    .testTarget(name: "BrotliTests", dependencies: ["brotlidec", "brotlienc"]),
    .executableTarget(
      name: "brotli",
      dependencies: ["brotlienc", "brotlidec"],
    ),
  ],
)
