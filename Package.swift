// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "QGVAPlayer",
    platforms: [
        .iOS("12.0")
    ],
    products: [
        .library(name: "QGVAPlayer", targets: ["QGVAPlayer"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "QGVAPlayer",
            path: "iOS/QGVAPlayer/QGVAPlayer",
            exclude: [
                "Info.plist",
            ],
            resources: [
                .process("Shaders/QGHWDShaders.metal"),
            ],
            publicHeadersPath: "include",
            cSettings: [
                // Classes/ 下面 11 个子目录互相 quote-import header (e.g. #import "QGMP4Parser.h"),
                // SPM 默认 header search 不递归, 必须把所有子目录列出
                .headerSearchPath("Classes"),
                .headerSearchPath("Classes/Controllers"),
                .headerSearchPath("Classes/Controllers/Decoders"),
                .headerSearchPath("Classes/MP4Parser"),
                .headerSearchPath("Classes/Models"),
                .headerSearchPath("Classes/Utils"),
                .headerSearchPath("Classes/Utils/Categorys"),
                .headerSearchPath("Classes/Utils/Logger"),
                .headerSearchPath("Classes/Views/Metal"),
                .headerSearchPath("Classes/Views/Metal/Vapx"),
                .headerSearchPath("Classes/Views/OpenGL"),
                .headerSearchPath("Shaders"),
            ],
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("GLKit"),
                .linkedFramework("Metal"),
                .linkedFramework("MetalKit"),
                .linkedFramework("OpenGLES"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("VideoToolbox"),
            ]
        )
    ]
)
