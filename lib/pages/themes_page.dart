import 'package:flutter/material.dart';
import 'package:flutter_ide/core/theme/colors.dart';
import 'package:flutter_ide/data/notifiers.dart';

class ThemesPage extends StatelessWidget {
  const ThemesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of names and their corresponding case numbers
    final List<Map<String, dynamic>> themes = [
      {'name': 'Default Grey', 'color': ColorConfig.primaryColor, 'id': 0},
      {'name': 'Blue Grey', 'color': ColorConfig.secondaryColor, 'id': 1},
      {'name': 'Teal Ocean', 'color': ColorConfig.tealColor, 'id': 2},
      {'name': 'Amber Sun', 'color': ColorConfig.amberColor, 'id': 3},
      {'name': 'Deep Purple', 'color': ColorConfig.deepPurpleColor, 'id': 4},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Select Theme")),
      body: ListView.builder(
        itemCount: themes.length,
        itemBuilder: (context, index) {
          final item = themes[index];
          return ListTile(
            leading: CircleAvatar(backgroundColor: item['color']),
            title: Text(item['name']),
            onTap: () {
              // Update the global notifier
              seedColorChoiceNotifier.value = item['id'];
              // Go back to the previous screen
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
