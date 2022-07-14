// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "localized-strings-symbols",
    platforms: [.macOS("12.0")],
    products: [
        .plugin(name: "Generate Strings File Symbols", targets: ["Generate Strings File Symbols"]),
        .executable(name: "generate-symbols-tool", targets: ["generate-symbols-tool"]),
    ],
    dependencies: [
        .package(url: "https://github.com/danielctull-playground/FileGenerator", branch: "main")
    ],
    targets: [
        .executableTarget(name: "generate-symbols-tool", dependencies: [
            .product(name: "FileGenerator", package: "FileGenerator"),
        ]),
        .testTarget(name: "GenerateTests", dependencies: [
            .product(name: "FileGenerator", package: "FileGenerator"),
        ]),
        .plugin(name: "Generate Strings File Symbols", capability: .buildTool(), dependencies: ["generate-symbols-tool"]),
    ]
)
