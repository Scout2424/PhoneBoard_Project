import 'package:flutter/material.dart';
import 'package:flutter_ide/widgets/side_bar.dart';
import 'package:flutter_ide/widgets/top_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopBar(),
            Expanded(child: Row(children: [SideBar()])),
          ],
        ),
      ),
    );
  }
}
