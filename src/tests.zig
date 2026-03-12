// @file src/tests.zig
// @brief Test aggregation file that includes all modules containing tests.
//
// In Zig, tests in imported modules are compiled but may not be automatically discovered.
// This file imports the modules and also includes inline test declarations to ensure
// the test runner can find them.

const std = @import("std");
const main = @import("main.zig");

const testing = std.testing;

// Test cases for the fibonacci function
test "fibonacci basic cases" {
    try std.testing.expectEqual(@as(u64, 0), main.fibonacci(0));
    try std.testing.expectEqual(@as(u64, 1), main.fibonacci(1));
    try std.testing.expectEqual(@as(u64, 1), main.fibonacci(2));
    try std.testing.expectEqual(@as(u64, 2), main.fibonacci(3));
    try std.testing.expectEqual(@as(u64, 3), main.fibonacci(4));
    try std.testing.expectEqual(@as(u64, 5), main.fibonacci(5));
    try std.testing.expectEqual(@as(u64, 8), main.fibonacci(6));
    try std.testing.expectEqual(@as(u64, 13), main.fibonacci(7));
    try std.testing.expectEqual(@as(u64, 21), main.fibonacci(8));
    try std.testing.expectEqual(@as(u64, 34), main.fibonacci(9));
    try std.testing.expectEqual(@as(u64, 55), main.fibonacci(10));
}
