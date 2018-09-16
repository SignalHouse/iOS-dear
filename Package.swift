// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "socket.io-test",
    products: [
        .executable(name: "socket.io-test", targets: ["iOS_dear"])
    ],
    dependencies: [
        .package(url: "https://github.com/socketio/socket.io-client-swift", .upToNextMinor(from: "13.3.0"))
    ],
    targets: [
        .target(name: "iOS_dear", dependencies: ["SocketIO"], path: "/Users/minhocheon/Documents/GitHub/iOS_dear")
    ]
)
