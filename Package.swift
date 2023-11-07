// swift-tools-version:5.9
import PackageDescription

let package = Package(
	name: "EtchAPI",
	platforms: [
		.iOS(.v13),
		.macOS(.v10_15),
		.tvOS(.v13),
		.watchOS(.v6)
	],
	products: [
		.library(
			name: "EtchAPI",
			targets: ["EtchAPI"]
		)
	],
	dependencies: [
		.package(url: "https://github.com/Fleuronic/EtchService", branch: "main"),
		.package(url: "https://github.com/Fleuronic/Caesura", branch: "main")
	],
	targets: [
		.target(
			name: "EtchAPI",
			dependencies: [
				"EtchService",
				"Caesura"
			]
		)
	]
)
