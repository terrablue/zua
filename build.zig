const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "zua",
        .target = target,
        .optimize = optimize,
    });
    lib.linkLibC();
    lib.addCSourceFiles(.{
        .files = &.{
            "src/lapi.c",
            "src/lcode.c",
            "src/ldebug.c",
            "src/ldo.c",
            "src/ldump.c",
            "src/lfunc.c",
            "src/lgc.c",
            "src/llex.c",
            "src/lmem.c",
            "src/lobject.c",
            "src/lopcodes.c",
            "src/lparser.c",
            "src/lstate.c",
            "src/lstring.c",
            "src/ltable.c",
            "src/ltm.c",
            "src/lundump.c",
            "src/lvm.c",
            "src/lzio.c",
            "src/lauxlib.c",
            "src/lbaselib.c",
            "src/ldblib.c",
            "src/liolib.c",
            "src/lmathlib.c",
            "src/loslib.c",
            "src/ltablib.c",
            "src/lstrlib.c",
            "src/loadlib.c",
            "src/linit.c",
        },
        .flags = &.{
            "-std=c99",
            "-Wall",
            "-Os",
            "-g",
        },
    });

    lib.installHeader("src/lua.h", "lua.h");
    b.installArtifact(lib);
}
