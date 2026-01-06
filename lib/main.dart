import 'package:flutter/material.dart';
import 'package:flutter_ide/core/theme/themes.dart';
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
    return MaterialApp(
      title: 'Flip Flops',
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.setTheme(),
      home: Home(),
    );
  }
}
