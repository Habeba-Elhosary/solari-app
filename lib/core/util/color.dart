// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

/// Converts a hex color code to a [Color].
///
/// - [hexCode]: The hex color code as a string (e.g., "#FFFFFF" or "FFFFFF").
/// - [opacity]: Optional opacity value (defaults to fully opaque).
Color hexToColor(String hexCode, {double opacity = 1.0}) {
  // Remove the "#" if it exists
  String sanitizedHex = hexCode.replaceAll('#', '');

  // Ensure the hex code is valid
  if (sanitizedHex.length != 6) {
    throw FormatException(
        "Invalid hex code: $hexCode. Must be 6 characters long.");
  }

  // Parse the hex code and return the color with opacity
  return Color(int.parse('FF$sanitizedHex', radix: 16)).withOpacity(opacity);
}
