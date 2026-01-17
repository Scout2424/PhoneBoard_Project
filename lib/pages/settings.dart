import 'package:flutter/material.dart';
import 'package:flutter_ide/pages/themes_page.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool autoSave = false; // Temporary state for the toggle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: [
          // === THEME SECTION ===
          ListTile(
            leading: const Icon(Icons.palette),
            title: const Text("Theme"),
            subtitle: const Text("Change the app color scheme"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ThemesPage()),
              );
            },
          ),

          // === AUTO SAVE SECTION ===
          SwitchListTile(
            secondary: const Icon(Icons.save),
            title: const Text("Auto Save"),
            subtitle: const Text("Save changes automatically"),
            value: autoSave,
            onChanged: (bool value) {
              setState(() {
                autoSave = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
