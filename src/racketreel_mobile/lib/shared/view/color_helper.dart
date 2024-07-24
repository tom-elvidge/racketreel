import 'package:flutter/material.dart';

class ColorHelper {
  static Color lightenColor(Color color, [double amount = 0.2]) {
    assert(amount >= 0 && amount <= 1, 'amount must be between 0 and 1');
    final hsl = HSLColor.fromColor(color);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }
}