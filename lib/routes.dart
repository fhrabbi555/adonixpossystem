import 'package:adonixpossystem/views/home/web_home_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String home = '/home';
  static const String dashboard = '/dashboard';
  static const String usersList = '/users/list';
  static const String addUser = '/users/add';
  static const String settings = '/settings';

  static final routes = [
    GetPage(name: home, page: () => WebHomeScreen()),
  ];
}
