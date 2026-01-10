import 'package:flutter/material.dart';
import 'package:flutter_ide/core/theme/colors.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

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
              IconButton(
                icon: const Icon(Icons.folder),
                color: Theme.of(context).colorScheme.onSurface,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.description),
                color: Theme.of(context).colorScheme.onSurface,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.search),
                color: Theme.of(context).colorScheme.onSurface,
                onPressed: () {},
              ),
            ],
          ),

          // === SETTINGS AT BOTTOM ===
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: IconButton(
              icon: const Icon(Icons.settings),
              color: Theme.of(context).colorScheme.onSurface,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
