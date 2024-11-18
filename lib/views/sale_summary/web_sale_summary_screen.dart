import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SaleSummaryData {
  final String productName;
  final int quantity;
  final double price;
  final DateTime date;

  SaleSummaryData({
    required this.productName,
    required this.quantity,
    required this.price,
    required this.date,
  });
}

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
      productName: 'Laptop XPS 15',
      quantity: 10,
      price: 1299.99,
      date: DateTime.now().subtract(const Duration(days: 5)),
    ),
    SaleSummaryData(
      productName: 'Wireless Mouse',
      quantity: 15,
      price: 29.99,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
    // Add more sample sales data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 32),
            _buildDateFilter(),
            const SizedBox(height: 32),
            _buildSummaryCards(),
            const SizedBox(height: 32),
            Expanded(
              child: Center(
                child: _buildSalesTable(),
              ),
            ),
          ],
        ),
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

  Widget _buildDateFilter() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () async {
                final pickedStartDate = await showDatePicker(
                  context: context,
                  initialDate: selectedStartDate,
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                );
                if (pickedStartDate != null) {
                  setState(() {
                    selectedStartDate = pickedStartDate;
                  });
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Start Date',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: const Color(0xFF718096),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('MMM dd, yyyy').format(selectedStartDate),
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF2D3748),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                final pickedEndDate = await showDatePicker(
                  context: context,
                  initialDate: selectedEndDate,
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                );
                if (pickedEndDate != null) {
                  setState(() {
                    selectedEndDate = pickedEndDate;
                  });
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'End Date',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: const Color(0xFF718096),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('MMM dd, yyyy').format(selectedEndDate),
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF2D3748),
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

  Widget _buildSummaryCards() {
    final totalSales = salesData.fold(
      0.0,
      (sum, sale) => sum + (sale.quantity * sale.price),
    );
    final totalOrders = salesData.length;
    final averageOrderValue = totalSales / totalOrders;

    return Row(
      children: [
        _buildSummaryCard(
          title: 'Total Sales',
          value: currencyFormatter.format(totalSales),
          icon: Icons.attach_money,
          color: Colors.green,
        ),
        const SizedBox(width: 16),
        _buildSummaryCard(
          title: 'Total Orders',
          value: totalOrders.toString(),
          icon: Icons.shopping_cart,
          color: Colors.blue,
        ),
        const SizedBox(width: 16),
        _buildSummaryCard(
          title: 'Average Order Value',
          value: currencyFormatter.format(averageOrderValue),
          icon: Icons.equalizer,
          color: Colors.orange,
        ),
      ],
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: color,
                size: 20,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2D3748),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: const Color(0xFF718096),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSalesTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1200),
            child: DataTable(
              headingRowColor: MaterialStateProperty.all(Colors.grey[50]),
              columns: const [
                DataColumn(label: Text('Product')),
                DataColumn(label: Text('Quantity')),
                DataColumn(label: Text('Price')),
                DataColumn(label: Text('Date')),
              ],
              rows: salesData
                  .where((sale) =>
                      sale.date.isAfter(selectedStartDate) &&
                      sale.date.isBefore(selectedEndDate.add(const Duration(
                          days: 1)))) // Include sales on the end date
                  .map(
                    (sale) => DataRow(
                      cells: [
                        DataCell(
                          Text(
                            sale.productName,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            sale.quantity.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            currencyFormatter.format(sale.price),
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            DateFormat('MMM dd, yyyy').format(sale.date),
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
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
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
