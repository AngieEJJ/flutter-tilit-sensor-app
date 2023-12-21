import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final centerX = MediaQuery.of(context).size.width / 2 - 50;
    final centerY = MediaQuery.of(context).size.height / 2 - 50;
    return Scaffold(
        body: Stack(children: [
      Positioned(
        left: centerX,
        top: centerY,
        child: Container(
            decoration:
                BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            width: 100,
            height: 100),
      ),
    ]));
  }
}
