import 'package:adonixpossystem/responsive_layout.dart';
import 'package:adonixpossystem/views/home/mobile_home_screen.dart';
import 'package:adonixpossystem/views/home/web_home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adonix POS System',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ResponsiveLayout(
          mobileScreen: MobileHomeScreen(), webScreen: WebHomeScreen()),
    );
  }
}
