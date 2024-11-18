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
    WebPOSInvoiceScreen(),
    WebPOSInvoiceScreen(),
    // Order Menu
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
