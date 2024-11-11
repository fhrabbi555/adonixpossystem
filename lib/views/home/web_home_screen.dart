import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes.dart';

class WebHomeScreen extends StatefulWidget {
  @override
  _WebHomeScreenState createState() => _WebHomeScreenState();
}

class _WebHomeScreenState extends State<WebHomeScreen> {
  int _selectedIndex = 0; // Track the selected index

  final List<Widget> _pages = [
    DashboardScreen(),
    UsersListScreen(),
    AddUserScreen(),
    SettingsScreen(),
    GeneralSettingsScreen(),
    AccountSettingsScreen(),
    PaymentSettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SidebarMenu(
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
          ),
          Expanded(
            child: SafeArea(
              child: _pages[_selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}

class SidebarMenu extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  SidebarMenu(
      {Key? key, required this.selectedIndex, required this.onItemTapped})
      : super(key: key);

  @override
  _SidebarMenuState createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu>
    with SingleTickerProviderStateMixin {
  bool _isSettingsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      margin: EdgeInsets.symmetric(
          horizontal: 10), // Added margin for left and right
      color: Colors.white, // Change the background color to white
      child: Column(
        children: [
          // Modify the DrawerHeader to remove any space
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Adonix POS System',
              style: TextStyle(
                color: Colors.green,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildMenuItem(
                  icon: Icons.dashboard,
                  title: 'Dashboard',
                  index: 0,
                ),
                _buildMenuItem(
                  icon: Icons.group,
                  title: 'Users',
                  index: 1,
                ),
                _buildMenuItem(
                  icon: Icons.add,
                  title: 'Add User',
                  index: 2,
                ),
                // Expandable Settings Menu
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.black),
                  title: Text(
                    'Settings',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: AnimatedRotation(
                    turns: _isSettingsExpanded
                        ? 0.5
                        : 0.0, // 180 degrees if expanded
                    duration: Duration(milliseconds: 90),
                    child: Icon(
                      Icons.expand_more,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _isSettingsExpanded = !_isSettingsExpanded;
                    });
                  },
                ),
                if (_isSettingsExpanded) ...[
                  _buildSubMenuItem('General Settings', Icons.settings, 4),
                  _buildSubMenuItem(
                      'Account Settings', Icons.account_circle, 5),
                  _buildSubMenuItem('Payment Settings', Icons.payment, 6),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
      {required IconData icon, required String title, required int index}) {
    bool isSelected = widget.selectedIndex == index;
    return AnimatedContainer(
      duration: Duration(milliseconds: 90),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ListTile(
        leading: Icon(icon,
            color: isSelected
                ? Colors.white
                : Colors.black), // Change icon color based on selection
        title: Text(
          title,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : Colors.black, // Change text color based on selection
            fontSize: 16, // Reduce text size
          ),
        ),
        onTap: () {
          widget.onItemTapped(index);
        },
      ),
    );
  }

  Widget _buildSubMenuItem(String title, IconData icon, int index) {
    bool isSelected = widget.selectedIndex == index;
    return AnimatedContainer(
      duration: Duration(milliseconds: 90),
      curve: Curves.easeInOut,
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ListTile(
        leading: Icon(icon, color: isSelected ? Colors.white : Colors.black),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 14, // Reduce text size for sub-menu items
          ),
        ),
        onTap: () {
          widget.onItemTapped(index);
        },
      ),
    );
  }
}

// Dummy screens for GeneralSettingsScreen, AccountSettingsScreen, and PaymentSettingsScreen
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Center(child: Text('Dashboard Screen')),
    );
  }
}

class UsersListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users List')),
      body: Center(child: Text('Users List Screen')),
    );
  }
}

class AddUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add User')),
      body: Center(child: Text('Add User Screen')),
    );
  }
}

class GeneralSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('General Settings')),
      body: Center(child: Text('This is the General Settings Screen')),
    );
  }
}

class AccountSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Account Settings')),
      body: Center(child: Text('This is the Account Settings Screen')),
    );
  }
}

class PaymentSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment Settings')),
      body: Center(child: Text('This is the Payment Settings Screen')),
    );
  }
}
