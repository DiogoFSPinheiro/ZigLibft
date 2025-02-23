const std = @import("std");
const lib = @import("header");

pub fn main() !void {
    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    // stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    try stdout.print("Run `zig build test` to run the tests.\n", .{});

    try bw.flush(); // don't forget to flush!
}

test "isalpha" {
    std.debug.print("Testing isalpha:  ", .{});
    try std.testing.expectEqual(true, lib.isalpha('a'));
    try std.testing.expectEqual(false, lib.isalpha('2'));
    try std.testing.expectEqual(true, lib.isalpha('F'));
    std.debug.print("All good\n", .{});
}

test "isalnum" {
    std.debug.print("Testing isalnum:  ", .{});
    try std.testing.expectEqual(true, lib.isalnum('0'));
    try std.testing.expectEqual(true, lib.isalnum('9'));
    try std.testing.expectEqual(true, lib.isalnum('f'));
    try std.testing.expectEqual(false, lib.isalnum('-'));
    std.debug.print("All good\n", .{});
}

test "isdigit" {
    std.debug.print("Testing isdigit:  ", .{});
    try std.testing.expectEqual(true, lib.isdigit('0'));
    try std.testing.expectEqual(true, lib.isdigit('9'));
    try std.testing.expectEqual(false, lib.isdigit('d'));
    std.debug.print("All good\n", .{});
}

