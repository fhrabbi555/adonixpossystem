import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:adonixpossystem/responsive_layout.dart';
import 'package:adonixpossystem/views/home/mobile_home_screen.dart';
import 'package:adonixpossystem/views/home/web_home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Adjust import based on your setup

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adonix POS System',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English
        const Locale('es', ''), // Spanish
        const Locale('ar', ''), // Arabic
      ],
      locale: const Locale('en', ''), // Set default locale here
      home: ResponsiveLayout(
        mobileScreen: MobileHomeScreen(),
        webScreen: WebHomeScreen(),
      ),
    );
  }
}
