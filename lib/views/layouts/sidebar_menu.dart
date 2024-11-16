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
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Adonix POS System',
                    style: TextStyle(
                      color: AppColors.primaryGreen,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(thickness: 1, color: Colors.grey),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildExpandableMenu('Dashboard', Icons.dashboard, () {
                  setState(() {
                    _isDashboardExpanded = !_isDashboardExpanded;
                  });
                }, _isDashboardExpanded, [
                  _buildSubMenuItem('Overview', Icons.dashboard, 1),
                  _buildSubMenuItem('Sales Summary', Icons.sell, 2),
                  _buildSubMenuItem('Inventory Overview', Icons.inventory, 3),
                ]),
                _buildExpandableMenu('Orders', Icons.receipt, () {
                  setState(() {
                    _isOrdersExpanded = !_isOrdersExpanded;
                  });
                }, _isOrdersExpanded, [
                  _buildSubMenuItem('POS Invoice', Icons.print, 7),
                  _buildSubMenuItem('Order List', Icons.list, 8),
                  _buildSubMenuItem('Pending Orders', Icons.hourglass_empty, 9),
                  _buildSubMenuItem('Completed Orders', Icons.check_circle, 10),
                  _buildSubMenuItem('Canceled Orders', Icons.cancel, 11),
                ]),
                _buildExpandableMenu('Purchases', Icons.shopping_cart, () {
                  setState(() {
                    _isPurchasesExpanded = !_isPurchasesExpanded;
                  });
                }, _isPurchasesExpanded, [
                  _buildSubMenuItem('Purchase Items', Icons.shopping_bag, 12),
                  _buildSubMenuItem(
                      'Add Purchase', Icons.add_shopping_cart, 13),
                  _buildSubMenuItem('Return Invoices', Icons.undo, 14),
                  _buildSubMenuItem(
                      'Manage Suppliers', Icons.local_shipping, 15),
                  _buildSubMenuItem(
                      'Supplier Ledger', Icons.account_balance, 16),
                  _buildSubMenuItem('Stock-Out Ingredients', Icons.warning, 17),
                ]),
                _buildExpandableMenu('Products & Inventory', Icons.store, () {
                  setState(() {
                    _isProductsExpanded = !_isProductsExpanded;
                  });
                }, _isProductsExpanded, [
                  _buildSubMenuItem('Manage Categories', Icons.category, 18),
                  _buildSubMenuItem('Manage Products', Icons.add_box, 19),
                  _buildSubMenuItem('Stock Management', Icons.storage, 20),
                  _buildSubMenuItem('Stock Adjustment', Icons.settings, 21),
                  _buildSubMenuItem(
                      'Low Stock Alerts', Icons.notifications, 22),
                ]),
                _buildExpandableMenu('Reports', Icons.bar_chart, () {
                  setState(() {
                    _isReportsExpanded = !_isReportsExpanded;
                  });
                }, _isReportsExpanded, [
                  _buildSubMenuItem('Sales Reports', Icons.analytics, 23),
                  _buildSubMenuItem('Inventory Reports', Icons.inventory_2, 24),
                  _buildSubMenuItem(
                      'Purchase Reports', Icons.shopping_cart_outlined, 25),
                  _buildSubMenuItem(
                      'Financial Reports', Icons.account_balance_wallet, 26),
                  _buildSubMenuItem('Custom Reports', Icons.file_copy, 27),
                ]),
                _buildExpandableMenu(
                    'Production', Icons.production_quantity_limits, () {
                  setState(() {
                    _isProductionExpanded = !_isProductionExpanded;
                  });
                }, _isProductionExpanded, [
                  _buildSubMenuItem('Set Production Units', Icons.build, 28),
                  _buildSubMenuItem('Add Production', Icons.add_circle, 29),
                  _buildSubMenuItem('Production List', Icons.list_alt, 30),
                ]),
                _buildExpandableMenu('Accounts', Icons.account_balance, () {
                  setState(() {
                    _isAccountsExpanded = !_isAccountsExpanded;
                  });
                }, _isAccountsExpanded, [
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
                ]),
                _buildExpandableMenu('Human Resources', Icons.people, () {
                  setState(() {
                    _isHRExpanded = !_isHRExpanded;
                  });
                }, _isHRExpanded, [
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
                ]),
                _buildExpandableMenu(
                    'Customer Management', Icons.account_circle, () {
                  setState(() {
                    _isCustomerExpanded = !_isCustomerExpanded;
                  });
                }, _isCustomerExpanded, [
                  _buildSubMenuItem(
                      'Manage Customers', Icons.people_outline, 49),
                  _buildSubMenuItem('Customer Orders', Icons.list_alt, 50),
                  _buildSubMenuItem('Loyalty Points', Icons.star_border, 51),
                  _buildSubMenuItem('Feedback & Reviews', Icons.comment, 52),
                ]),
                _buildExpandableMenu('Marketing Tools', Icons.local_offer, () {
                  setState(() {
                    _isMarketingExpanded = !_isMarketingExpanded;
                  });
                }, _isMarketingExpanded, [
                  _buildSubMenuItem('Discount Codes', Icons.local_offer, 53),
                  _buildSubMenuItem('Campaign Management', Icons.campaign, 54),
                  _buildSubMenuItem(
                      'Push Notifications', Icons.notifications_active, 55),
                ]),
                _buildExpandableMenu('Settings', Icons.settings, () {
                  setState(() {
                    _isSettingsExpanded = !_isSettingsExpanded;
                  });
                }, _isSettingsExpanded, [
                  _buildSubMenuItem('User  Management', Icons.person_add, 56),
                  _buildSubMenuItem('Roles & Permissions', Icons.security, 57),
                  _buildSubMenuItem('Payment Settings', Icons.payment, 58),
                  _buildSubMenuItem('Tax Settings', Icons.attach_money, 59),
                  _buildSubMenuItem('Country Settings', Icons.language, 60),
                  _buildSubMenuItem(
                      'Currency Settings', Icons.monetization_on, 61),
                ]),
                _buildExpandableMenu('Help & Support', Icons.help_outline, () {
                  setState(() {
                    _isHelpExpanded = !_isHelpExpanded;
                  });
                }, _isHelpExpanded, [
                  _buildSubMenuItem('User  Guide', Icons.book, 62),
                  _buildSubMenuItem('FAQs', Icons.question_answer, 63),
                  _buildSubMenuItem('Contact Support', Icons.support_agent, 64),
                ]),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildExpandableMenu(String title, IconData icon, VoidCallback onTap,
      bool isExpanded, List<Widget> subMenuItems) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.black),
          title:
              Text(title, style: TextStyle(color: Colors.black, fontSize: 16)),
          trailing: AnimatedRotation(
            turns: isExpanded ? 0.5 : 0.0,
            duration: Duration(milliseconds: 200),
            child: Icon(Icons.expand_more, color: Colors.black),
          ),
          onTap: onTap,
        ),
        if (isExpanded) ...subMenuItems,
      ],
    );
  }

  Widget _buildSubMenuItem(String title, IconData icon, int index) {
    bool isSelected = widget.selectedIndex == index;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
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
            fontSize: 14,
          ),
        ),
        onTap: () {
          widget.onItemTapped(index);
        },
      ),
    );
  }
}
