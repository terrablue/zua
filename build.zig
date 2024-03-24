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
        .files = &.{"src/lua.c"},
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
