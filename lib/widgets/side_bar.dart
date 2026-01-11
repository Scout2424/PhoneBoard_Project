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
                color: Theme.of(context).colorScheme.surface,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                color: Theme.of(context).colorScheme.surface,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.search),
                color: Theme.of(context).colorScheme.surface,
                onPressed: () {},
              ),
            ],
          ),

          // === SETTINGS AT BOTTOM ===
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: IconButton(
              icon: const Icon(Icons.settings),
              color: Theme.of(context).colorScheme.surface,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
