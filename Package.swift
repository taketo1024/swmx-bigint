// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwmxBigInt",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwmxBigInt",
            targets: ["SwmxBigInt"]),
    ],
    dependencies: [
        .package(
//            url: "https://github.com/taketo1024/swm-core.git",
//            from: "1.2.7"
            path: "../swm-core/"
        ),
        .package(
//            url: "https://github.com/taketo1024/swm-matrix-tools.git",
//            from: "1.3.0"
            path: "../swm-matrix-tools/"
        ),
        .package(
            url: "https://github.com/attaswift/BigInt.git",
            from: "5.2.1"
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwmxBigInt",
            dependencies: [
                .product(name: "SwmCore", package: "swm-core"),
                .product(name: "SwmMatrixTools", package: "swm-matrix-tools"),
                "BigInt"
            ]),
        .testTarget(
            name: "SwmxBigIntTests",
            dependencies: ["SwmxBigInt"]),
    ]
)
