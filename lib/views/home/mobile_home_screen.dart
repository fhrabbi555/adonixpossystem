// lib/views/home/mobile_home_screen.dart
import 'package:flutter/material.dart';

class MobileHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mobile Home")),
      body: Center(child: Text("This is the Mobile Home Screen")),
    );
  }
}
