import 'package:adonixpossystem/responsive_layout.dart';
import 'package:get/get.dart';
import 'package:adonixpossystem/views/home/mobile_home_screen.dart';
import 'package:adonixpossystem/views/home/web_home_screen.dart'; // Ensure you have this screen in place

class AppRoutes {
  // Define the home route
  static const String home = '/';

  // GetPages with named routes and corresponding screens
  static final routes = [
    GetPage(
        name: home,
        page: () => ResponsiveLayout(
            mobileScreen: MobileHomeScreen(), webScreen: WebHomeScreen())),
    // Add more routes if necessary
  ];
}
