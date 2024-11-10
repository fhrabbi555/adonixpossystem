import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WebHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'.tr), // Localized title
      ),
      body: Center(
        child: Text('welcome'.tr), // Localized welcome message
      ),
    );
  }
}
