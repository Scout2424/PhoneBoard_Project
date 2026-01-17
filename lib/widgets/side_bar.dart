import 'package:flutter/material.dart';
import 'package:flutter_ide/core/theme/colors.dart';
import 'package:flutter_ide/pages/settings.dart';

class SideBar extends StatelessWidget {
  final int activeIndex;
  final Function(int) onIconPressed;

  const SideBar({
    super.key,
    required this.activeIndex,
    required this.onIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      color: ColorConfig.seedColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // === TOP ICONS ===
          Column(
            children: [
              _buildSidebarIcon(Icons.folder, 0, context),
              _buildSidebarIcon(Icons.shopping_cart, 1, context),
              _buildSidebarIcon(Icons.search, 2, context),
            ],
          ),

          // === SETTINGS AT BOTTOM ===
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: IconButton(
              icon: const Icon(Icons.settings),
              color: Theme.of(context).colorScheme.surface,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Settings()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarIcon(IconData icon, int index, BuildContext context) {
    bool isActive = activeIndex == index;

    return IconButton(
      icon: Icon(icon),
      // If active, use high contrast; if not, dim it
      color: isActive
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.surface,
      onPressed: () => onIconPressed(index),
    );
  }
}
