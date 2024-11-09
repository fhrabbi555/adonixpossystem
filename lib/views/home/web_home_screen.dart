import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WebHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Web Home")),
      body: Center(
        child: Text("This is the Web Home Screen"),
      ),
    );
  }
}
