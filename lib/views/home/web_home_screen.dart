import 'package:flutter/material.dart';
import '../InventoryOverview/web_inventory_overview_screen.dart';
import '../layouts/sidebar_menu.dart';
import '../overview/web_overview_screen.dart';
import '../pos_invoice/web_pos_invoice_screen.dart';
import '../sale_summary/web_sale_summary_screen.dart';

class WebHomeScreen extends StatefulWidget {
  @override
  _WebHomeScreenState createState() => _WebHomeScreenState();
}

class _WebHomeScreenState extends State<WebHomeScreen> {
  int _selectedIndex = 0; // Track the selected index

  final List<Widget> _pages = [
    WebOverviewScreen(),
    WebOverviewScreen(),
    WebSaleSummaryScreen(),
    WebInventoryOverviewScreen(),
    WebPOSInvoiceScreen(),
    GeneralSettingsScreen(),
    AccountSettingsScreen(),
    WebPOSInvoiceScreen(),
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

// Dummy screens for GeneralSettingsScreen, AccountSettingsScreen, and PaymentSettingsScreen

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

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment Settings')),
      body: Center(child: Text('This is the Payment Settings Screen')),
    );
  }
}
