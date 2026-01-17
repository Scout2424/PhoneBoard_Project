import 'package:flutter/material.dart';
import 'package:flutter_ide/core/theme/themes.dart';
import 'package:flutter_ide/data/notifiers.dart';
import 'package:flutter_ide/widgets/home.dart';

void main() {
  runApp(const IDEapp());
}

class IDEapp extends StatefulWidget {
  const IDEapp({super.key});

  @override
  State<IDEapp> createState() => _IDEappState();
}

class _IDEappState extends State<IDEapp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: brightnessNotifier,
      builder: (context, toggleBrightness, child) {
        return ValueListenableBuilder(
          valueListenable: seedColorChoiceNotifier,
          builder: (context, value, child) {
            return MaterialApp(
              title: 'Flip Flops',
              debugShowCheckedModeBanner: false,
              theme: ThemeConfig.setTheme(toggleBrightness),
              home: Home(),
            );
          },
        );
      },
    );
  }
}
