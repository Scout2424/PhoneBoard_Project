import 'package:flutter/material.dart';
import 'package:flutter_ide/core/theme/colors.dart';
import 'package:flutter_ide/data/notifiers.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: ColorConfig.seedColor,
      child: Row(
        children: [
          const SizedBox(width: 10),

          // === LOGO ===
          SizedBox(
            width: 28,
            height: 28,
            child: Image(
              image: AssetImage('assets/flutter_logo.png'),
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(width: 12),

          // === MENU ITEMS ===
          _menuItem("File"),
          _menuItem("Edit"),
          _menuItem("View"),
          _menuItem("Help"),

          const Spacer(),

          // === BRIGHTNESS BUTTON (right side) ===
          IconButton(
            tooltip: "Toggle Brightness",
            color: Theme.of(context).colorScheme.surface,
            onPressed: () {
              brightnessNotifier.value = !brightnessNotifier.value;
            },
            icon: ValueListenableBuilder(
              valueListenable: brightnessNotifier,
              builder: (context, toggleBrightness, child) {
                return Icon(
                  toggleBrightness ? Icons.dark_mode : Icons.light_mode,
                );
              },
            ),
          ),

          const SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget _menuItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }
}
