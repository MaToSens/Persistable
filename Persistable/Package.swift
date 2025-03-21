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
            name: "PersistableMacro",
            targets: ["PersistableMacro"]
        ),
        .executable(
            name: "PersistableMacroClient",
            targets: ["PersistableMacroClient"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "600.0.0-latest"),
        .package(url: "https://github.com/realm/realm-swift.git", from: "10.0.0")
    ],
    targets: [
        .macro(
            name: "PersistableMacroMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
            ]
        ),
        .target(
            name: "PersistableMacro",
            dependencies: [
                "PersistableMacroMacros",
                .product(name: "RealmSwift", package: "realm-swift")
            ]
        ),
        .executableTarget(
            name: "PersistableMacroClient",
            dependencies: ["PersistableMacro"]
        ),
        .testTarget(
            name: "PersistableMacroTests",
            dependencies: [
                "PersistableMacroMacros",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]
        )
    ]
)
