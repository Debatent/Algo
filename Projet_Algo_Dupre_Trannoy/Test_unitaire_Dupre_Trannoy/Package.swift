// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Test_unitaire_Dupre_Trannoy",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Test_unitaire_Dupre_Trannoy",
            targets: ["Test_unitaire_Dupre_Trannoy"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(path: "../Library_Dupre_Trannoy")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Test_unitaire_Dupre_Trannoy",
            dependencies: ["Library_Dupre_Trannoy"]),
        .testTarget(
            name: "Test_unitaire_Dupre_TrannoyTests",
            dependencies: ["Test_unitaire_Dupre_Trannoy"]),
    ]
)
