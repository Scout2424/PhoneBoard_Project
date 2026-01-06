import 'package:flutter/material.dart';
import 'package:flutter_ide/core/theme/colors.dart';

class ThemeConfig {
  static Brightness _currentBrightness = Brightness.dark;
  static Brightness get currentBrightness => _currentBrightness;

  static ThemeData setTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorConfig.seedColor,
        brightness: ThemeConfig._currentBrightness,
      ),
    );
  }

  static void toggleBrightness() {
    _currentBrightness = _currentBrightness == Brightness.dark
        ? Brightness.light
        : Brightness.dark;
  }
}
