import 'package:flutter/material.dart';
import 'package:flutter_ide/core/constants/constants.dart';

class ColorConfig {
  static const Color primaryColor = Colors.grey;
  static const Color secondaryColor = Colors.blueGrey;

  static const Color errorColor = Colors.redAccent;

  static const Color tealColor = Colors.teal;
  static const Color amberColor = Colors.amber;
  static const Color deepPurpleColor = Colors.deepPurple;

  static Color get seedColor {
    switch (seedColorChoice) {
      case 0:
        return primaryColor;
      case 1:
        return secondaryColor;
      case 2:
        return tealColor;
      case 3:
        return amberColor;
      case 4:
        return deepPurpleColor;
      default:
        return primaryColor;
    }
  }
}
