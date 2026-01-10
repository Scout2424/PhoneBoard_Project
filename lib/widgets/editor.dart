import 'package:flutter/material.dart';

class Editor extends StatefulWidget {
  const Editor({super.key});

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  late TextEditingController _controller;
  late ScrollController _scrollController;
  int _lineCount = 1;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: "// Start coding here...");
    _scrollController = ScrollController();

    // Listen to text changes to update line numbers
    _controller.addListener(_updateLineCount);
  }

  void _updateLineCount() {
    final lines = '\n'.allMatches(_controller.text).length + 1;
    if (lines != _lineCount) {
      setState(() => _lineCount = lines);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1E1E1E), // VSCode background
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. LINE NUMBERS
          Container(
            width: 45,
            padding: const EdgeInsets.only(top: 10),
            color: Colors.black12,
            child: ListView.builder(
              controller: _scrollController, // Link scroll
              itemCount: _lineCount,
              itemBuilder: (context, index) => Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    color: Colors.white24,
                    fontFamily: 'monospace',
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),

          // 2. ACTUAL TEXT AREA
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: TextField(
                controller: _controller,
                scrollController: _scrollController, // Link scroll
                maxLines: null, // Makes it expand vertically
                keyboardType: TextInputType.multiline,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'monospace',
                  fontSize: 14,
                  height: 1.5, // Line height
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                cursorColor: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
