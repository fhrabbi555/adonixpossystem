import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class WebSaleSummaryScreen extends StatefulWidget {
  const WebSaleSummaryScreen({Key? key}) : super(key: key);

  @override
  State<WebSaleSummaryScreen> createState() => _WebSaleSummaryScreenState();
}

class _WebSaleSummaryScreenState extends State<WebSaleSummaryScreen> {
  final currencyFormatter =
      NumberFormat.currency(locale: 'en_US', symbol: '\$');
  DateTime selectedStartDate =
      DateTime.now().subtract(const Duration(days: 30));
  DateTime selectedEndDate = DateTime.now();

  final List<SaleSummaryData> salesData = [
    SaleSummaryData(
      date: DateTime.now(),
      totalSales: 1500.0,
      numberOfOrders: 25,
      averageOrderValue: 60.0,
      topSellingItems: ['Product A', 'Product B'],
      growth: 12.5,
    ),
    SaleSummaryData(
      date: DateTime.now().subtract(Duration(days: 1)),
      totalSales: 2000.0,
      numberOfOrders: 30,
      averageOrderValue: 66.67,
      topSellingItems: ['Product C', 'Product D'],
      growth: 15.0,
    ),
    SaleSummaryData(
      date: DateTime.now().subtract(Duration(days: 2)),
      totalSales: 1800.0,
      numberOfOrders: 28,
      averageOrderValue: 64.29,
      topSellingItems: ['Product E', 'Product F'],
      growth: 10.0,
    ),
    // Add more sample data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: Row(
        // Use Row to align content to the right
        children: [
          Expanded(
            // This allows the content to adjust to the right side
            child: Container(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 32),
                  _buildDateFilter(),
                  const SizedBox(height: 32),
                  _buildSummaryCards(),
                  const SizedBox(height: 32),
                  _buildSalesTable(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.1),
            Theme.of(context).primaryColor.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sales Summary',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2D3748),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Track your business performance and growth',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: const Color(0xFF718096),
                ),
              ),
            ],
          ),
          Row(
            children: [
              _buildActionButton(
                icon: Icons.file_download_outlined,
                label: 'Export',
                onPressed: () {},
              ),
              const SizedBox(width: 16),
              _buildActionButton(
                icon: Icons.refresh,
                label: 'Refresh',
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 20),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildDateFilter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.date_range, color: Color(0xFF718096)),
          const SizedBox(width: 16),
          _buildDateButton(
            date: selectedStartDate,
            onPressed: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: selectedStartDate,
                firstDate: DateTime(2020),
                lastDate: DateTime.now(),
              );
              if (picked != null) setState(() => selectedStartDate = picked);
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('to', style: TextStyle(color: Color(0xFF718096))),
          ),
          _buildDateButton(
            date: selectedEndDate,
            onPressed: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: selectedEndDate,
                firstDate: DateTime(2020),
                lastDate: DateTime.now(),
              );
              if (picked != null) setState(() => selectedEndDate = picked);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDateButton({
    required DateTime date,
    required VoidCallback onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xFFF7FAFC),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        DateFormat('MMM dd, yyyy').format(date),
        style: const TextStyle(
          color: Color(0xFF2D3748),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildSummaryCards() {
    return Row(
      children: [
        _buildSummaryCard(
          title: 'Total Sales',
          value: currencyFormatter.format(25000),
          subtitle: '+12.5% from last period',
          icon: Icons.trending_up,
          gradient: const LinearGradient(
            colors: [Color(0xFF6366F1), Color(0xFF818CF8)],
          ),
        ),
        const SizedBox(width: 24),
        _buildSummaryCard(
          title: 'Orders',
          value: '350',
          subtitle: '+8.2% from last period',
          icon: Icons.shopping_cart_outlined,
          gradient: const LinearGradient(
            colors: [Color(0xFF10B981), Color(0xFF34D399)],
          ),
        ),
        const SizedBox(width: 24),
        _buildSummaryCard(
          title: 'Average Order Value',
          value: currencyFormatter.format(71.43),
          subtitle: '+5.8% from last period',
          icon: Icons.analytics_outlined,
          gradient: const LinearGradient(
            colors: [Color(0xFFF59E0B), Color(0xFFFBBF24)],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Gradient gradient,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: gradient.colors.first.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(icon, color: Colors.white.withOpacity(0.9)),
              ],
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSalesTable() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sales Data',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2D3748),
            ),
          ),
          const SizedBox(height: 16),
          DataTable(
            columns: const [
              DataColumn(label: Text('Date')),
              DataColumn(label: Text('Sales')),
              DataColumn(label: Text('Orders')),
              DataColumn(label: Text('Avg Order Value')),
              DataColumn(label: Text('Top Selling Items')),
              DataColumn(label: Text('Growth')),
            ],
            rows: salesData
                .map((data) => DataRow(cells: [
                      DataCell(
                          Text(DateFormat('MMM dd, yyyy').format(data.date))),
                      DataCell(Text(currencyFormatter.format(data.totalSales))),
                      DataCell(Text(data.numberOfOrders.toString())),
                      DataCell(Text(
                          currencyFormatter.format(data.averageOrderValue))),
                      DataCell(Text(data.topSellingItems.join(', '))),
                      DataCell(Text('${data.growth}%')),
                    ]))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class SaleSummaryData {
  final DateTime date;
  final double totalSales;
  final int numberOfOrders;
  final double averageOrderValue;
  final List<String> topSellingItems;
  final double growth;

  SaleSummaryData({
    required this.date,
    required this.totalSales,
    required this.numberOfOrders,
    required this.averageOrderValue,
    required this.topSellingItems,
    required this.growth,
  });
}
