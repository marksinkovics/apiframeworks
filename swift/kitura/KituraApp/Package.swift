// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "KituraApp",
    dependencies: [
      .package(url: "https://github.com/IBM-Swift/Kitura.git", .upToNextMinor(from: "2.4.1")),
      .package(url: "https://github.com/IBM-Swift/Kitura-CredentialsHTTP.git", .upToNextMinor(from: "2.1.0")),
    ],
    targets: [
      .target(name: "KituraApp", dependencies: [ .target(name: "Application"), "Kitura", "CredentialsHTTP"]),
      .target(name: "Application", dependencies: ["Kitura", "CredentialsHTTP"]),
      .testTarget(name: "ApplicationTests" , dependencies: [.target(name: "Application"), "Kitura", "CredentialsHTTP"])
    ]
)
