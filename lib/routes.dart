import 'package:adonixpossystem/responsive_layout.dart';
import 'package:adonixpossystem/views/home/mobile_home_screen.dart';
import 'package:adonixpossystem/views/home/web_home_screen.dart';
import 'package:adonixpossystem/views/report.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String home = '/';
  static const String reports = '/reports';

  static final routes = [
    GetPage(
      name: home,
      page: () => ResponsiveLayout(
        mobileScreen: MobileHomeScreen(),
        webScreen: WebHomeScreen(),
      ),
    ),
    GetPage(
      name: reports,
      page: () => Report(), // Replace with your actual ReportScreen widget
    ),
  ];
}
