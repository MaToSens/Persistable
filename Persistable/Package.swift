// swift-tools-version: 6.0

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "PersistableMacro",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        .macCatalyst(.v13)
    ],
    products: [
        .library(
            name: "Persistable",
            targets: ["Persistable"]
        ),
        .executable(
            name: "PersistableClient",
            targets: ["PersistableClient"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "600.0.0-latest"),
        .package(url: "https://github.com/realm/realm-swift.git", from: "10.0.0")
    ],
    targets: [
        .macro(
            name: "PersistableMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
            ]
        ),
        .target(
            name: "Persistable",
            dependencies: [
                "PersistableMacros",
                .product(name: "RealmSwift", package: "realm-swift")
            ]
        ),
        .executableTarget(
            name: "PersistableClient",
            dependencies: ["Persistable"]
        ),
        .testTarget(
            name: "PersistableTests",
            dependencies: [
                "PersistableMacros",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]
        )
    ]
)
