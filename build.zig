const std = @import("std");

pub fn build(b: *std.Build.Builder) void {
    var optimize = b.standardOptimizeOption(.{});
    var target = b.standardTargetOptions(.{});

    var plog = b.addStaticLibrary(.{ .name = "plog", .target = target, .optimize = optimize });

    plog.addCSourceFiles(
        &[_][]const u8{},
        &[_][]const u8{},
    );

    plog.installHeadersDirectory("include/", "./");

    plog.addIncludePath("include/");
    b.installArtifact(plog);
}
