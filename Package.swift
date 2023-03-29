// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "rAthena",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "rAthenaCommon",
            targets: ["rAthenaCommon"]
        ),
        .library(
            name: "rAthenaLogin",
            type: .dynamic,
            targets: ["rAthenaLogin"]
        ),
        .library(
            name: "rAthenaChar",
            type: .dynamic,
            targets: ["rAthenaChar"]
        ),
        .library(
            name: "rAthenaMap",
            type: .dynamic,
            targets: ["rAthenaMap"]
        ),
        .library(
            name: "rAthenaWeb",
            type: .dynamic,
            targets: ["rAthenaWeb"]
        ),
        .library(
            name: "rAthenaPacket",
            type: .dynamic,
            targets: ["rAthenaPacket"]
        ),
    ],
    targets: [
        .target(
            name: "rAthenaCommon",
            dependencies: [
                "ryml",
                "YYModel",
            ],
            path: ".",
            exclude: [
                "3rdparty",
                "doc",
                "src",
                "tools",
                "App",
            ],
            sources: [
                "Sources/rAthenaCommon",
            ],
            resources: [
                .copy("ragnarok.sqlite3"),
                .copy("conf"),
                .copy("db"),
                .copy("npc"),
                .copy("sql-files"),
            ],
            publicHeadersPath: "Sources/rAthenaCommon",
            cxxSettings: [
                .headerSearchPath("3rdparty"),
                .headerSearchPath("3rdparty/rapidyaml/ext/c4core/src"),
                .headerSearchPath("3rdparty/rapidyaml/src"),
                .headerSearchPath("src"),
            ]
        ),
        .target(
            name: "rAthenaLogin",
            dependencies: [
                "libconfig",
                "ryml",
                "rAthenaCommon",
            ],
            exclude: [
                "common/winapi.hpp",
                "common/winapi.cpp",
                "3rdparty",
            ],
            publicHeadersPath: "",
            cxxSettings: [
                .headerSearchPath("3rdparty/rapidyaml/ext/c4core/src"),
                .headerSearchPath("3rdparty/rapidyaml/src"),
                .unsafeFlags(["-fmodules", "-fcxx-modules"]),
            ],
            linkerSettings: [
                .linkedFramework("CoreFoundation"),
                .linkedFramework("Foundation"),
                .linkedLibrary("sqlite3"),
                .linkedLibrary("z"),
            ]
        ),
        .target(
            name: "rAthenaChar",
            dependencies: [
                "libconfig",
                "ryml",
                "rAthenaCommon",
            ],
            exclude: [
                "common/winapi.hpp",
                "common/winapi.cpp",
                "3rdparty",
            ],
            publicHeadersPath: "",
            cxxSettings: [
                .headerSearchPath("3rdparty/rapidyaml/ext/c4core/src"),
                .headerSearchPath("3rdparty/rapidyaml/src"),
                .unsafeFlags(["-fmodules", "-fcxx-modules"]),
            ],
            linkerSettings: [
                .linkedFramework("CoreFoundation"),
                .linkedFramework("Foundation"),
                .linkedLibrary("sqlite3"),
                .linkedLibrary("z"),
            ]
        ),
        .target(
            name: "rAthenaMap",
            dependencies: [
                "libconfig",
                "ryml",
                "rAthenaCommon",
            ],
            exclude: [
                "common/winapi.hpp",
                "common/winapi.cpp",
                "3rdparty",
            ],
            publicHeadersPath: "",
            cxxSettings: [
                .headerSearchPath("3rdparty/rapidyaml/ext/c4core/src"),
                .headerSearchPath("3rdparty/rapidyaml/src"),
                .unsafeFlags(["-fmodules", "-fcxx-modules"]),
            ],
            linkerSettings: [
                .linkedFramework("CoreFoundation"),
                .linkedFramework("Foundation"),
                .linkedLibrary("sqlite3"),
                .linkedLibrary("z"),
            ]
        ),
        .target(
            name: "rAthenaWeb",
            dependencies: [
                "httplib",
                "libconfig",
                "ryml",
                "yaml-cpp",
                "rAthenaCommon",
            ],
            exclude: [
                "common/winapi.hpp",
                "common/winapi.cpp",
                "3rdparty",
            ],
            publicHeadersPath: "",
            cxxSettings: [
                .headerSearchPath("3rdparty/httplib"),
                .headerSearchPath("3rdparty/json/include"),
                .headerSearchPath("3rdparty/rapidyaml/ext/c4core/src"),
                .headerSearchPath("3rdparty/rapidyaml/src"),
                .unsafeFlags(["-fmodules", "-fcxx-modules"]),
            ],
            linkerSettings: [
                .linkedFramework("CoreFoundation"),
                .linkedFramework("Foundation"),
                .linkedLibrary("sqlite3"),
                .linkedLibrary("z"),
            ]
        ),
        .target(
            name: "rAthenaPacket",
            dependencies: [
                "rAthenaCommon",
            ]
        ),
        .target(
            name: "httplib",
            path: "3rdparty/httplib",
            publicHeadersPath: ""
        ),
        .target(
            name: "libconfig",
            path: "3rdparty/libconfig",
            publicHeadersPath: "",
            cSettings: [
                .define("HAVE_XLOCALE_H"),
            ]
        ),
        .target(
            name: "ryml",
            path: "3rdparty/rapidyaml",
            sources: [
                "ext/c4core/src",
                "src",
            ],
            publicHeadersPath: "src",
            cxxSettings: [
                .headerSearchPath("ext/c4core/src"),
                .headerSearchPath("src"),
            ]
        ),
        .target(
            name: "yaml-cpp",
            path: "3rdparty/yaml-cpp",
            sources: ["src"],
            publicHeadersPath: "include"
        ),
        .target(
            name: "YYModel",
            path: "3rdparty/YYModel",
            publicHeadersPath: ""
        ),
        .testTarget(
            name: "rAthenaCommonTests",
            dependencies: ["rAthenaCommon"]
        ),
        .testTarget(
            name: "rAthenaLoginTests",
            dependencies: ["rAthenaLogin"]
        ),
        .testTarget(
            name: "rAthenaCharTests",
            dependencies: ["rAthenaChar"]
        ),
        .testTarget(
            name: "rAthenaMapTests",
            dependencies: ["rAthenaMap"]
        ),
        .testTarget(
            name: "rAthenaWebTests",
            dependencies: ["rAthenaWeb"]
        ),
    ],
    cxxLanguageStandard: .cxx14
)