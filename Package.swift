// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "MacroImportWarningRepro",
    platforms: [.macOS(.v14)],
    products: [
        .library(
            name: "MacroImportWarningRepro",
            targets: ["MacroImportWarningRepro"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/fetch-rewards/swift-mocking.git", from: "0.2.2")
    ],
    targets: [
        .target(
            name: "MacroImportWarningRepro",
            dependencies: [
                .product(name: "Mocking", package: "swift-mocking")
            ]
        ),
    ]
)
