const std = @import("std");

pub fn build(b: *std.Build) void {
    // Standard target options allow specifying the CPU architecture, OS, etc.
    // The default is the host machine's target.
    const target = b.standardTargetOptions(.{});

    // Create the root module for the executable
    const exe_module = b.createModule(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = .ReleaseSafe,
    });

    const exe = b.addExecutable(.{
        .name = "zig-tutorial",
        .root_module = exe_module,
    });

    // Install the artifact
    b.installArtifact(exe);

    // Create a "run" step to easily run the executable with `zig build run`
    const run_cmd = b.addRunArtifact(exe);
    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
