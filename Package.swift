// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Aspects",
    products: [
        .library(
            name: "Aspects",
            targets: ["AspectsObjC", "Aspects"]),
    ],
    dependencies: [
    ],
    targets: [
		.target(
		   name: "AspectsObjC", 
		   dependencies: [],
		   cSettings: [
			  .headerSearchPath("Internal"),
		   ]
		),
		.target(
		   name: "Aspects", 
		   dependencies: ["AspectsObjC"]
		),
    ]
)
