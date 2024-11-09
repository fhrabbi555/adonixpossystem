// lib/responsive/responsive_layout.dart
import 'package:flutter/material.dart';

// ResponsiveLayout helps to switch between mobile and web screens based on screen width.
class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScreen;
  final Widget webScreen;
  final double mobileBreakpoint;

  const ResponsiveLayout({
    required this.mobileScreen,
    required this.webScreen,
    this.mobileBreakpoint = 600, // Default breakpoint for mobile
  });

  @override
  Widget build(BuildContext context) {
    // Get screen width
    final double width = MediaQuery.of(context).size.width;

    // Switch between mobile and web layouts based on screen width
    if (width < mobileBreakpoint) {
      return mobileScreen; // Mobile screen for widths below the breakpoint
    } else {
      return webScreen; // Web screen for larger widths
    }
  }
}
