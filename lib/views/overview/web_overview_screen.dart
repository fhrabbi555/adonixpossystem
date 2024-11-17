import 'package:adonixpossystem/utility%20/app_color.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/OverviewController.dart';

class WebOverviewScreen extends StatelessWidget {
  final OverviewController controller = Get.put(OverviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 24),
            _buildOverviewCards(),
            SizedBox(height: 24),
            _buildChartSection(),
            SizedBox(height: 24),
            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2,
      title: Text(
        'Dashboard Overview',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications_none, color: Colors.black87),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.person_outline, color: Colors.black87),
          onPressed: () {},
        ),
        SizedBox(width: 16),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back, Admin!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              Text(
                DateFormat('EEEE, MMMM d, yyyy').format(DateTime.now()),
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                ),
              ),
            ],
          ),
          ElevatedButton.icon(
            icon: Icon(Icons.download, color: Colors.white),
            label: Text('Export Report', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryGreen,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewCards() {
    return GridView.count(
      crossAxisCount: 4,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildMetricCard(
          title: 'Total Customer',
          value: controller.totalCustomer.value,
          icon: Icons.people_outline,
          color: Colors.blue,
          trend: '+12.5%',
          isPositive: true,
        ),
        _buildMetricCard(
          title: 'Total Revenue',
          value: '\$${controller.totalRevenue.value}',
          icon: Icons.attach_money,
          color: Colors.green,
          trend: '+8.2%',
          isPositive: true,
        ),
        _buildMetricCard(
          title: 'Total Order',
          value: '${controller.totalOrder.value}%',
          icon: Icons.trending_up,
          color: Colors.orange,
          trend: '-2.1%',
          isPositive: false,
        ),
        _buildMetricCard(
          title: 'Today Sales',
          value: controller.todaySale.value,
          icon: Icons.shopping_cart,
          color: Colors.purple,
          trend: '+5.3%',
          isPositive: true,
        ),
      ],
    );
  }

  // Improved Metric Card and Recent Transactions Implementation

  Widget _buildMetricCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required String trend,
    required bool isPositive,
  }) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.1), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with icon and trend
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Icon with background
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              // Trend indicator
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isPositive ? Colors.green[50] : Colors.red[50],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                      color: isPositive ? Colors.green[700] : Colors.red[700],
                      size: 14,
                    ),
                    SizedBox(width: 4),
                    Text(
                      trend,
                      style: TextStyle(
                        color: isPositive ? Colors.green[700] : Colors.red[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Spacer
          SizedBox(height: 16),

          // Value
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              letterSpacing: -0.5,
            ),
          ),

          // Title
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),

          // Progress indicator
          SizedBox(height: 12),
          LinearProgressIndicator(
            value: 0.7, // You can make this dynamic based on your needs
            backgroundColor: color.withOpacity(0.1),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ],
      ),
    );
  }

// Improved Recent Transactions Implementation
  Widget _buildRecentTransactions() {
    // Sample transaction data - Replace this with your actual data from controller
    final List<Map<String, dynamic>> transactions = [
      {
        'id': 'TX123',
        'amount': '\$200',
        'date': '2024-11-16',
        'status': 'Completed',
        'customer': 'John Doe',
      },
      {
        'id': 'TX124',
        'amount': '\$350',
        'date': '2024-11-16',
        'status': 'Pending',
        'customer': 'Jane Smith',
      },
      {
        'id': 'TX125',
        'amount': '\$175',
        'date': '2024-11-15',
        'status': 'Completed',
        'customer': 'Mike Johnson',
      },
      {
        'id': 'TX126',
        'amount': '\$420',
        'date': '2024-11-15',
        'status': 'Failed',
        'customer': 'Sarah Williams',
      },
    ];

    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              TextButton.icon(
                icon: Icon(Icons.refresh),
                label: Text('Refresh'),
                onPressed: () {
                  // Add refresh functionality
                },
              ),
            ],
          ),
          SizedBox(height: 24),

          // Table Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Transaction ID',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Customer',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Amount',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Status',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 12),
          Divider(),

          // Transactions List
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: transactions.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        transaction['id'],
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        transaction['customer'],
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        transaction['amount'],
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: transaction['status'] == 'Completed'
                              ? Colors.green[50]
                              : transaction['status'] == 'Pending'
                                  ? Colors.orange[50]
                                  : Colors.red[50],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          transaction['status'],
                          style: TextStyle(
                            color: transaction['status'] == 'Completed'
                                ? Colors.green[700]
                                : transaction['status'] == 'Pending'
                                    ? Colors.orange[700]
                                    : Colors.red[700],
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildChartSection() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Revenue Trends',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 24),
          Container(
            height: 300,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: true),
                titlesData: FlTitlesData(show: true),
                borderData: FlBorderData(show: true),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 3),
                      FlSpot(2.6, 2),
                      FlSpot(4.9, 5),
                      FlSpot(6.8, 3.1),
                      FlSpot(8, 4),
                      FlSpot(9.5, 3),
                      FlSpot(11, 4),
                    ],
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 3,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.blue
                          .withOpacity(0.1), // Changed from colors to color
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: _buildRecentTransactions(),
        ),
        SizedBox(width: 16),
        Expanded(
          flex: 1,
          child: _buildUserActivity(),
        ),
      ],
    );
  }

  Widget _buildUserActivity() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Activity',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 24),
          Obx(() => ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.userActivityLogs.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue[50],
                      child: Icon(Icons.person_outline, color: Colors.blue),
                    ),
                    title: Text(controller.userActivityLogs[index]),
                    subtitle: Text('2 minutes ago'),
                    dense: true,
                  );
                },
              )),
        ],
      ),
    );
  }
}
