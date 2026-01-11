import 'package:flutter/material.dart';
import 'package:flutter_ide/widgets/editor.dart';
import 'package:flutter_ide/widgets/file_explorer.dart';
import 'package:flutter_ide/widgets/side_bar.dart';
import 'package:flutter_ide/widgets/top_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activePanelIndex = 0;
  double explorerWidth = 200.0;

  void togglePanel(int index) {
    setState(() {
      if (activePanelIndex == index) {
        activePanelIndex = -1; // Close if already open
      } else {
        activePanelIndex = index; // Switch to new panel
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double maxWidth = screenWidth * 0.50;
    double minWidth = 170.0;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TopBar(),
            Expanded(
              child: Row(
                children: [
                  SideBar(
                    activeIndex: activePanelIndex,
                    onIconPressed: togglePanel,
                  ),

                  if (activePanelIndex == 0) ...[
                    // 3. The Explorer with dynamic width
                    SizedBox(width: explorerWidth, child: const FileExplorer()),

                    // 4. THE DRAGGABLE DIVIDER
                    MouseRegion(
                      cursor: SystemMouseCursors
                          .resizeLeftRight, // Shows mouse pointer
                      child: GestureDetector(
                        onHorizontalDragUpdate: (details) {
                          setState(() {
                            explorerWidth += details.delta.dx;
                            // 5. Clamping logic
                            if (explorerWidth < minWidth) {
                              explorerWidth = minWidth;
                            }
                            if (explorerWidth > maxWidth) {
                              explorerWidth = maxWidth;
                            }
                          });
                        },
                        child: Container(
                          width: 4, // Hit area for the drag
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],

                  const Expanded(child: Editor()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
