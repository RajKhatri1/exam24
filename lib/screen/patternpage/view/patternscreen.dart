import 'package:flutter/material.dart';

class patternscreen extends StatefulWidget {
  const patternscreen({Key? key}) : super(key: key);

  @override
  State<patternscreen> createState() => _patternscreenState();
}

class _patternscreenState extends State<patternscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.settings),
      ),
      ),
    );
  }
}
