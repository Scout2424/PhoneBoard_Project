import 'package:flutter/material.dart';

class FileExplorer extends StatefulWidget {
  const FileExplorer({super.key});

  @override
  State<FileExplorer> createState() => _FileExplorerState();
}

class _FileExplorerState extends State<FileExplorer> {
  // State to track which sections are open
  bool _isProjectOpen = true;
  bool _isOutlineOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // 1. HEADER (Static)
          Container(
            height: 25,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 16),
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: const Text(
              'FILE EXPLORER',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
            ),
          ),

          // 2. PROJECT SECTION
          _buildExpansionSection(
            title: "FLUTTER_PROJECT",
            isExpanded: _isProjectOpen,
            onExpansionChanged: (val) => setState(() => _isProjectOpen = val),
            content: "main.dart\nwidgets/\nassets/",
          ),

          // 3. SECOND SECTION (e.g., Outline or Dependencies)
          _buildExpansionSection(
            title: "OUTLINE",
            isExpanded: _isOutlineOpen,
            onExpansionChanged: (val) => setState(() => _isOutlineOpen = val),
            content: "class MyIDEApp\n  build()\nclass Home",
          ),
        ],
      ),
    );
  }

  // Helper method to create modular sections
  Widget _buildExpansionSection({
    required String title,
    required bool isExpanded,
    required ValueChanged<bool> onExpansionChanged,
    required String content,
  }) {
    return Expanded(
      // If closed, it only takes its own height. If open, it expands.
      flex: isExpanded ? 1 : 0,
      child: Column(
        children: [
          // The clickable header
          InkWell(
            onTap: () => onExpansionChanged(!isExpanded),
            child: Container(
              height: 24,
              color: Colors.black12,
              child: Row(
                children: [
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_right,
                    size: 18,
                    color: Colors.white,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // The Content
          if (isExpanded)
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                child: Text(
                  content,
                  style: const TextStyle(color: Colors.white60),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
