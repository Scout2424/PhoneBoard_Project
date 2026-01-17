import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
              // We will add theme selection logic here later
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
