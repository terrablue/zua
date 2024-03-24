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
            // base
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
            // lib
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
            // extensions
            "src/lua_bit.c",
            "src/lua_cjson.c",
            "src/lua_struct.c",
            "src/lua_cmsgpack.c",
            // extensions deps
            "src/strbuf.c",
            "src/fpconv.c",
        },
        .flags = &.{
            "-std=c99",
            "-Wall",
            "-Os",
            "-g",
        },
    });

    lib.installHeader("src/lua.h", "lua.h");
    lib.installHeader("src/lualib.h", "lualib.h");
    lib.installHeader("src/lauxlib.h", "lauxlib.h");
    b.installArtifact(lib);
}
