import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import '../../controllers/OverviewController.dart';

class WebOverviewScreen extends StatelessWidget {
  final OverviewController controller = Get.put(OverviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Overview'),
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Overview Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(() => OverviewCard(
                    title: 'Total Users', value: controller.totalUsers.value)),
                Obx(() => OverviewCard(
                    title: 'New Users',
                    value: controller.newUsers.value)), // New card
                Obx(() => OverviewCard(
                    title: 'Total Sales', value: controller.totalSales.value)),
                Obx(() => OverviewCard(
                    title: 'Total Revenue',
                    value: controller.totalRevenue.value)), // New card
                Obx(() => OverviewCard(
                    title: 'Active Sessions',
                    value: controller.activeSessions.value)),
                Obx(() => OverviewCard(
                    title: 'Conversion Rate',
                    value: controller.conversionRate.value)), // New card
              ],
            ),
            // Graphs
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: LineChartWidget(),
            ),
            // Data Table
            DataTable(
              columns: [
                DataColumn(label: Text('Transaction ID')),
                DataColumn(label: Text('Amount')),
                DataColumn(label: Text('Date')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('TX123')),
                  DataCell(Text('\$200')),
                  DataCell(Text('2024-11-16')),
                ]),
                // Add more rows as needed
              ],
            ),
            // Notifications Section
            NotificationSection(),
            // User Activity Log
            UserActivityLog(),
          ],
        ),
      ),
    );
  }
}

class OverviewCard extends StatelessWidget {
  final String title;
  final String value;

  OverviewCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text(value,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

// Placeholder for LineChartWidget, NotificationSection, and UserActivityLog
class LineChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: LineChart(LineChartData(
        // Sample data for the line chart
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 1),
              FlSpot(1, 3),
              FlSpot(2, 2),
              FlSpot(3, 5),
              FlSpot(4, 4),
            ],
            isCurved: true,
            color: Colors.blue,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      )),
    );
  }
}

class NotificationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OverviewController controller = Get.find();
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recent Notifications', style: TextStyle(fontSize: 20)),
          Obx(() => ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.notifications.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.notifications[index]),
                  );
                },
              )),
        ],
      ),
    );
  }
}

class UserActivityLog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OverviewController controller = Get.find();
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('User  Activity Log', style: TextStyle(fontSize: 20)),
          Obx(() => ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.userActivityLogs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.userActivityLogs[index]),
                  );
                },
              )),
        ],
      ),
    );
  }
}
