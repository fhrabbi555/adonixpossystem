// lib/views/home/mobile_home_screen.dart
import 'package:flutter/material.dart';

class WebHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("web Home")),
      body: Center(child: Text("This is the Web Home Screen")),
    );
  }
}
