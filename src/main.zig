const std = @import("std");

/// Computes the nth Fibonacci number using recursion.
///
/// The Fibonacci sequence is defined as:
/// F(0) = 0, F(1) = 1
/// F(n) = F(n-1) + F(n-2) for n > 1
///
/// Steps:
/// 1. Base case: if n is 0 or 1, return n directly
/// 2. Recursive case: return fibonacci(n-1) + fibonacci(n-2)
///
/// Parameters:
/// - n: The position in the Fibonacci sequence (unsigned integer)
///
/// Returns:
/// The nth Fibonacci number
///
/// Note: This function can cause a stack overflow for large values of n
/// due to deep recursion. For large n, consider using an iterative approach.
pub fn fibonacci(n: u32) u64 {
    if (n <= 1) {
        return n;
    }
    return fibonacci(n - 1) + fibonacci(n - 2);
}

/// Demonstrates safe memory management by allocating and properly freeing memory.
///
/// This function shows the correct approach to memory management in Zig:
/// 1. Allocate memory using an allocator
/// 2. Write data to the allocated memory
/// 3. Free the memory before returning to prevent leaks
///
/// Parameters:
/// - allocator: The allocator to use for memory allocation
///
/// Returns:
/// A boolean indicating success (always true in this example)
pub fn safeMemoryManagement(allocator: std.mem.Allocator) !void {
    // Allocate memory for a string
    const buffer = try allocator.alloc(u8, 100);
    // Free the memory before returning to prevent leaks
    defer allocator.free(buffer);

    // Write data to the allocated memory
    const message = "This memory will be properly freed!";
    @memcpy(buffer[0..message.len], message);
}

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
/// - A recursive Fibonacci function that computes the nth Fibonacci number.
/// This program demonstrates the function by printing the first 15 Fibonacci numbers.
/// It does not return an error under normal circumstances.
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

    // Demonstrate the recursive Fibonacci function
    // Print first 15 Fibonacci numbers
    std.debug.print("\nFibonacci sequence (first 15 numbers):\n", .{});
    for (0..15) |i| {
        const result = fibonacci(@intCast(i));
        std.debug.print("fibonacci({}) = {}\n", .{ i, result });
    }
}
