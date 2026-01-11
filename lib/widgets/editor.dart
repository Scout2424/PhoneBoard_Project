import 'package:flutter/material.dart';

class Editor extends StatefulWidget {
  const Editor({super.key});

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  late TextEditingController _controller;
  int _lineCount = 1;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    // Listen to changes to update line numbers
    _controller.addListener(_updateLineCount);
  }

  void _updateLineCount() {
    // Count how many lines are in the text
    final lines = _controller.text.split('\n').length;
    if (lines != _lineCount) {
      setState(() => _lineCount = lines);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --- LINE NUMBERS COLUMN ---
        Container(
          width: 40,
          padding: const EdgeInsets.only(top: 10),
          color: Theme.of(
            context,
          ).colorScheme.surfaceContainer, // Subtle background for the gutter
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _lineCount,
            itemBuilder: (context, index) => Text(
              '${index + 1}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),

        // --- THE ACTUAL TEXT FIELD ---
        Expanded(
          child: Column(
            children: [
              TextField(
                controller: _controller,
                maxLines: null, // Makes it grow/scroll
                keyboardType: TextInputType.multiline,
                style: Theme.of(context).textTheme.labelLarge,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Start coding...",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
