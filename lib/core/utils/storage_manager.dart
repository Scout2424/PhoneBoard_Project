import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  static const String _brightnessKey = "isDarkMode";
  static const String _colorKey = "seedColorChoice";

  // Save the Brightness
  static Future<void> saveBrightness(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_brightnessKey, isDark);
  }

  // Save the Color Choice
  static Future<void> saveColorChoice(int choice) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_colorKey, choice);
  }

  // Load everything when the app starts
  static Future<Map<String, dynamic>> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'isDark': prefs.getBool(_brightnessKey) ?? true, // Default to dark
      'colorId': prefs.getInt(_colorKey) ?? 0,        // Default to 0
    };
  }
}