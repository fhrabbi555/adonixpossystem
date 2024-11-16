import 'package:adonixpossystem/utility%20/app_color.dart';
import 'package:flutter/material.dart';

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
  bool _isDashboardExpanded = false;
  bool _isHelpExpanded = false;

  bool _isCustomerExpanded = false;
  bool _isMarketingExpanded = false;

  bool _isOrdersExpanded = false;
  bool _isPurchasesExpanded = false;
  bool _isProductsExpanded = false;
  bool _isReportsExpanded = false;
  bool _isProductionExpanded = false;
  bool _isAccountsExpanded = false;
  bool _isHRExpanded = false;

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Adonix POS System',
                    style: TextStyle(
                      color: AppColors.primaryGreen,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // Expandable Dashboard Menu
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.black),
                  title: Text(
                    'Dashboard',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: AnimatedRotation(
                    turns: _isDashboardExpanded
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
                      _isDashboardExpanded = !_isDashboardExpanded;
                    });
                  },
                ),
                if (_isDashboardExpanded) ...[
                  _buildSubMenuItem('Overview', Icons.dashboard, 1),
                  _buildSubMenuItem('Sales Summary', Icons.sell, 2),
                  _buildSubMenuItem('Inventory Overview', Icons.inventory, 3),
                ],
                // Expandable Orders Menu
                ListTile(
                  leading: Icon(Icons.receipt, color: Colors.black),
                  title: Text(
                    'Orders',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: AnimatedRotation(
                    turns: _isOrdersExpanded
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
                      _isOrdersExpanded = !_isOrdersExpanded;
                    });
                  },
                ),
                if (_isOrdersExpanded) ...[
                  _buildSubMenuItem('POS Invoice', Icons.print, 7),
                  _buildSubMenuItem('Order List', Icons.list, 8),
                  _buildSubMenuItem('Pending Orders', Icons.hourglass_empty, 9),
                  _buildSubMenuItem('Completed Orders', Icons.check_circle, 10),
                  _buildSubMenuItem('Canceled Orders', Icons.cancel, 11),
                ],
                // Expandable Purchases Menu
                ListTile(
                  leading: Icon(Icons.shopping_cart, color: Colors.black),
                  title: Text(
                    'Purchases',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: AnimatedRotation(
                    turns: _isPurchasesExpanded
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
                      _isPurchasesExpanded = !_isPurchasesExpanded;
                    });
                  },
                ),
                if (_isPurchasesExpanded) ...[
                  _buildSubMenuItem('Purchase Items', Icons.shopping_bag, 12),
                  _buildSubMenuItem(
                      'Add Purchase', Icons.add_shopping_cart, 13),
                  _buildSubMenuItem('Return Invoices', Icons.undo, 14),
                  _buildSubMenuItem(
                      'Manage Suppliers', Icons.local_shipping, 15),
                  _buildSubMenuItem(
                      'Supplier Ledger', Icons.account_balance, 16),
                  _buildSubMenuItem('Stock-Out Ingredients', Icons.warning, 17),
                ],
                // Expandable Products & Inventory Menu
                ListTile(
                  leading: Icon(Icons.store, color: Colors.black),
                  title: Text(
                    'Products & Inventory',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: AnimatedRotation(
                    turns: _isProductsExpanded
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
                      _isProductsExpanded = !_isProductsExpanded;
                    });
                  },
                ),
                if (_isProductsExpanded) ...[
                  _buildSubMenuItem('Manage Categories', Icons.category, 18),
                  _buildSubMenuItem('Manage Products', Icons.add_box, 19),
                  _buildSubMenuItem('Stock Management', Icons.storage, 20),
                  _buildSubMenuItem('Stock Adjustment', Icons.settings, 21),
                  _buildSubMenuItem(
                      'Low Stock Alerts', Icons.notifications, 22),
                ],
                // Expandable Reports Menu
                ListTile(
                  leading: Icon(Icons.bar_chart, color: Colors.black),
                  title: Text(
                    'Reports',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: AnimatedRotation(
                    turns: _isReportsExpanded
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
                      _isReportsExpanded = !_isReportsExpanded;
                    });
                  },
                ),
                if (_isReportsExpanded) ...[
                  _buildSubMenuItem('Sales Reports', Icons.analytics, 23),
                  _buildSubMenuItem('Inventory Reports', Icons.inventory_2, 24),
                  _buildSubMenuItem(
                      'Purchase Reports', Icons.shopping_cart_outlined, 25),
                  _buildSubMenuItem(
                      'Financial Reports', Icons.account_balance_wallet, 26),
                  _buildSubMenuItem('Custom Reports', Icons.file_copy, 27),
                ],
                // Expandable Production Menu
                ListTile(
                  leading: Icon(Icons.production_quantity_limits,
                      color: Colors.black),
                  title: Text(
                    'Production',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: AnimatedRotation(
                    turns: _isProductionExpanded
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
                      _isProductionExpanded = !_isProductionExpanded;
                    });
                  },
                ),
                if (_isProductionExpanded) ...[
                  _buildSubMenuItem('Set Production Units', Icons.build, 28),
                  _buildSubMenuItem('Add Production', Icons.add_circle, 29),
                  _buildSubMenuItem('Production List', Icons.list_alt, 30),
                ],
                // Expandable Accounts Menu
                ListTile(
                  leading: Icon(Icons.account_balance, color: Colors.black),
                  title: Text(
                    'Accounts',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: AnimatedRotation(
                    turns: _isAccountsExpanded
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
                      _isAccountsExpanded = !_isAccountsExpanded;
                    });
                  },
                ),
                if (_isAccountsExpanded) ...[
                  _buildSubMenuItem(
                      'Chart of Accounts', Icons.account_tree, 31),
                  _buildSubMenuItem('Supplier Payments', Icons.payment, 32),
                  _buildSubMenuItem(
                      'Cash Adjustments', Icons.monetization_on, 33),
                  _buildSubMenuItem('Debit Vouchers', Icons.arrow_downward, 34),
                  _buildSubMenuItem('Credit Vouchers', Icons.arrow_upward, 35),
                  _buildSubMenuItem(
                      'Contra Vouchers', Icons.compare_arrows, 36),
                  _buildSubMenuItem('Journal Vouchers', Icons.note, 37),
                  _buildSubMenuItem('Voucher Approval', Icons.check, 38),
                  _buildSubMenuItem(
                      'Financial Reports', Icons.account_balance_wallet, 39),
                ],
                // Expandable Human Resources Menu
                ListTile(
                  leading: Icon(Icons.people, color: Colors.black),
                  title: Text(
                    'Human Resources',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: AnimatedRotation(
                    turns: _isHRExpanded ? 0.5 : 0.0, // 180 degrees if expanded
                    duration: Duration(milliseconds: 90),
                    child: Icon(
                      Icons.expand_more,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _isHRExpanded = !_isHRExpanded;
                    });
                  },
                ),
                if (_isHRExpanded) ...[
                  _buildSubMenuItem('Employee Management', Icons.person, 40),
                  _buildSubMenuItem(
                      'Attendance Tracking', Icons.access_time, 41),
                  _buildSubMenuItem('Recruitment', Icons.business_center, 42),
                  _buildSubMenuItem('Awards & Recognition', Icons.star, 43),
                  _buildSubMenuItem('Department Management', Icons.folder, 44),
                  _buildSubMenuItem(
                      'Leave Management', Icons.calendar_today, 45),
                  _buildSubMenuItem('Loan Management', Icons.credit_card, 46),
                  _buildSubMenuItem(
                      'Payroll Processing', Icons.attach_money, 47),
                  _buildSubMenuItem(
                      'Expense Management', Icons.account_balance_wallet, 48),
                ],
                // Expandable Customer Management Menu
                ListTile(
                  leading: Icon(Icons.account_circle, color: Colors.black),
                  title: Text(
                    'Customer Management',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: AnimatedRotation(
                    turns: _isCustomerExpanded
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
                      _isCustomerExpanded = !_isCustomerExpanded;
                    });
                  },
                ),
                if (_isCustomerExpanded) ...[
                  _buildSubMenuItem(
                      'Manage Customers', Icons.people_outline, 49),
                  _buildSubMenuItem('Customer Orders', Icons.list_alt, 50),
                  _buildSubMenuItem('Loyalty Points', Icons.star_border, 51),
                  _buildSubMenuItem('Feedback & Reviews', Icons.comment, 52),
                ],
                // Expandable Marketing Tools Menu
                ListTile(
                  leading: Icon(Icons.local_offer, color: Colors.black),
                  title: Text(
                    'Marketing Tools',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: AnimatedRotation(
                    turns: _isMarketingExpanded
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
                      _isMarketingExpanded = !_isMarketingExpanded;
                    });
                  },
                ),
                if (_isMarketingExpanded) ...[
                  _buildSubMenuItem('Discount Codes', Icons.local_offer, 53),
                  _buildSubMenuItem('Campaign Management', Icons.campaign, 54),
                  _buildSubMenuItem(
                      'Push Notifications', Icons.notifications_active, 55),
                ],
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
                  _buildSubMenuItem('User Management', Icons.person_add, 56),
                  _buildSubMenuItem('Roles & Permissions', Icons.security, 57),
                  _buildSubMenuItem('Payment Settings', Icons.payment, 58),
                  _buildSubMenuItem('Tax Settings', Icons.attach_money, 59),
                  _buildSubMenuItem('Country Settings', Icons.language, 60),
                  _buildSubMenuItem(
                      'Currency Settings', Icons.monetization_on, 61),
                ],
                // Expandable Help & Support Menu
                ListTile(
                  leading: Icon(Icons.help_outline, color: Colors.black),
                  title: Text(
                    'Help & Support',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: AnimatedRotation(
                    turns:
                        _isHelpExpanded ? 0.5 : 0.0, // 180 degrees if expanded
                    duration: Duration(milliseconds: 90),
                    child: Icon(
                      Icons.expand_more,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _isHelpExpanded = !_isHelpExpanded;
                    });
                  },
                ),
                if (_isHelpExpanded) ...[
                  _buildSubMenuItem('User Guide', Icons.book, 62),
                  _buildSubMenuItem('FAQs', Icons.question_answer, 63),
                  _buildSubMenuItem('Contact Support', Icons.support_agent, 64),
                ],
              ],
            ),
          )
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
        color: isSelected ? AppColors.primaryGreen : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ListTile(
        leading: Icon(icon,
            color: isSelected
                ? AppColors.white
                : AppColors.black), // Change icon color based on selection
        title: Text(
          title,
          style: TextStyle(
            color: isSelected
                ? AppColors.white
                : AppColors.black, // Change text color based on selection
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
        color: isSelected ? AppColors.primaryGreen : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ListTile(
        leading:
            Icon(icon, color: isSelected ? AppColors.white : AppColors.black),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? AppColors.white : AppColors.black,
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
