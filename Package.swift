// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "brotli-spm",
  products: [
    .library(name: "brotlicommon", targets: ["brotlicommon"]),
    .library(name: "brotlidec", targets: ["brotlidec"]),
    .library(name: "brotlienc", targets: ["brotlienc"]),
  ],
  targets: [
    .target(name: "brotlicommon", path: "Sources/common"),
    .target(name: "brotlidec", dependencies: ["brotlicommon"]),
    .target(name: "brotlienc", dependencies: ["brotlicommon"]),
    .testTarget(name: "BrotliTests", dependencies: ["brotlidec", "brotlienc"]),
  ],
  cLanguageStandard: .c11
)

#if os(macOS)
package.products.append(.executable(name: "brotli", targets: ["brotli"]))
package.targets.append(.executableTarget(name: "brotli", dependencies: ["brotlienc", "brotlidec"]))
#endif
