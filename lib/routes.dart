import 'package:adonixpossystem/views/home/web_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String home = '/home';
  static const String dashboard = '/dashboard';
  static const String usersList = '/users/list';
  static const String addUser = '/users/add';
  static const String settings = '/settings';

  static final routes = [
    GetPage(name: home, page: () => WebHomeScreen()),
    GetPage(
        name: dashboard, page: () => DashboardScreen()), // Create this screen
    GetPage(
        name: usersList, page: () => UsersListScreen()), // Create this screen
    GetPage(name: addUser, page: () => AddUserScreen()), // Create this screen
    GetPage(name: settings, page: () => SettingsScreen()), // Create this screen
  ];
}

// create a simple screen for DashboardScreen,UsersListScreen,AddUser Screen,SettingsScreen
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Text('This is the Dashboard'),
      ),
    );
  }
}

class UsersListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar Menu
          //  SidebarMenu(),
          // Main Content Area
          Expanded(
            child: Center(
              child: Text('Welcome to the Main Content Area'),
            ),
          ),
        ],
      ),
    );
  }
}

class AddUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: Center(
        child: Text('This is the Add User Screen'),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text('This is the Settings Screen'),
      ),
    );
  }
}
