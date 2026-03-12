const std = @import("std");

/// Demonstrates:
/// - Basic variable types in Zig: integer, float, and string.
/// This program shows how to declare and print variables of different types.
/// It does not return an error under normal circumstances.
/// - A for-loop that iterates from 1 to 100 (inclusive),
/// converting each integer to a float using @floatFromInt.
/// This program does not return an error under normal circumstances.
/// - A for-loop that iterates over an array/slice of strings,
/// printing each message to the console.
/// This program does not return an error under normal circumstances.
pub fn main() !void {
    // Integer example: 32-bit signed integer
    const my_int: i32 = 42;
    // Float example: 64-bit floating-point number
    const my_float: f64 = 3.14;
    // String example: string literals are slices of bytes ([]const u8)
    const my_string: []const u8 = "Hello, Zig!";

    // Print integer value
    std.debug.print("Integer: {d}\n", .{my_int});

    // Format float to two decimal places for printing
    var float_buf: [32]u8 = undefined;
    const float_str = try std.fmt.bufPrint(&float_buf, "{:.2}", .{my_float});
    std.debug.print("Float: {s}\n", .{float_str});

    // Print string value
    std.debug.print("String: {s}\n", .{my_string});

    // Iterate from 1 to 100 inclusive
    // In Zig, the range syntax `1..101` creates an exclusive range,
    // meaning it includes 1 but excludes 101, giving us 1-100 inclusive.
    for (1..101) |i| {
        // Convert integer to float using Zig's builtin @floatFromInt
        // This converts i32 to f64 (default float type)
        const float_value: f64 = @floatFromInt(i);

        std.debug.print("Integer: {} -> Float: {:.2}\n", .{ i, float_value });
    }

    // For-loop over an array of strings
    // String literals in Zig are slices of bytes ([]const u8)
    // We create an anonymous array literal and coerce it to a slice
    const messages = &[_][]const u8{
        "This is me,",
        "your lost child.",
        "I've been waiting for you",
    };

    // Iterate over each string in the slice
    for (messages) |message| {
        std.debug.print("Message: {s}\n", .{message});
    }
}
