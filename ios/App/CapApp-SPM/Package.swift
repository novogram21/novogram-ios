// swift-tools-version: 5.9
import PackageDescription

// DO NOT MODIFY THIS FILE - managed by Capacitor CLI commands
let package = Package(
    name: "CapApp-SPM",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "CapApp-SPM",
            targets: ["CapApp-SPM"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", exact: "8.3.0"),
        .package(name: "CordovaPluginAudiotoggle", path: "../../capacitor-cordova-ios-plugins/sources/CordovaPluginAudiotoggle"),
        .package(name: "CordovaPluginProximitySensor", path: "../../capacitor-cordova-ios-plugins/sources/CordovaPluginProximitySensor"),
        .package(name: "Cordova.plugins.diagnostic", path: "../../capacitor-cordova-ios-plugins/sources/Cordova.plugins.diagnostic")
    ],
    targets: [
        .target(
            name: "CapApp-SPM",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm"),
                .product(name: "CordovaPluginAudiotoggle", package: "CordovaPluginAudiotoggle"),
                .product(name: "CordovaPluginProximitySensor", package: "CordovaPluginProximitySensor"),
                .product(name: "Cordova.plugins.diagnostic", package: "Cordova.plugins.diagnostic")
            ]
        )
    ]
)
