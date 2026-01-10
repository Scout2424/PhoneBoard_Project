import 'package:flutter/material.dart';
import 'package:flutter_ide/core/theme/colors.dart';

class ThemeConfig {
  static ThemeData setTheme(bool brightnessToggle) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorConfig.seedColor,
        brightness: brightnessToggle ? Brightness.dark : Brightness.light,
      ),
    );
  }
}
