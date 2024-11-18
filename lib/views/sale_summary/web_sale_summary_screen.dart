import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SaleSummaryData {
  final String productName;
  final int quantity;
  final double price;
  final DateTime date;
  final double discount;
  final double tax;
  final String status;

  SaleSummaryData({
    required this.productName,
    required this.quantity,
    required this.price,
    required this.date,
    required this.discount,
    required this.tax,
    required this.status,
  });

  double get totalPrice => (price * quantity) - discount + tax;
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
      discount: 100.0,
      tax: 50.0,
      status: 'Completed',
    ),
    SaleSummaryData(
      productName: 'Wireless Mouse',
      quantity: 15,
      price: 29.99,
      date: DateTime.now().subtract(const Duration(days: 3)),
      discount: 10.0,
      tax: 5.0,
      status: 'Pending',
    ),
    SaleSummaryData(
      productName: 'Gaming Keyboard',
      quantity: 5,
      price: 89.99,
      date: DateTime.now().subtract(const Duration(days: 7)),
      discount: 20.0,
      tax: 10.0,
      status: 'Shipped',
    ),
    SaleSummaryData(
      productName: 'Smartphone XYZ',
      quantity: 8,
      price: 799.99,
      date: DateTime.now().subtract(const Duration(days: 2)),
      discount: 50.0,
      tax: 40.0,
      status: 'Cancelled',
    ),
    SaleSummaryData(
      productName: 'Bluetooth Headphones',
      quantity: 12,
      price: 59.99,
      date: DateTime.now().subtract(const Duration(days: 1)),
      discount: 30.0,
      tax: 5.0,
      status: 'Processing',
    ),
    SaleSummaryData(
      productName: 'External Hard Drive',
      quantity: 6,
      price: 99.99,
      date: DateTime.now().subtract(const Duration(days: 6)),
      discount: 15.0,
      tax: 10.0,
      status: 'Completed',
    ),
    SaleSummaryData(
      productName: 'Smartwatch',
      quantity: 4,
      price: 199.99,
      date: DateTime.now().subtract(const Duration(days: 4)),
      discount: 25.0,
      tax: 15.0,
      status: 'Failed',
    ),
  ];

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Completed':
        return Colors.green;
      case 'Pending':
        return Colors.orange;
      case 'Shipped':
        return Colors.blue;
      case 'Cancelled':
        return Colors.red;
      case 'Processing':
        return Colors.purple;
      case 'Failed':
        return Colors.redAccent;
      default:
        return Colors.grey;
    }
  }

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
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F7FF),
                  borderRadius: BorderRadius.circular(8),
                ),
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
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F7FF),
                  borderRadius: BorderRadius.circular(8),
                ),
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
    final averageOrderValue = totalSales / (totalOrders == 0 ? 1 : totalOrders);

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
          child: DataTable(
            headingRowColor: MaterialStateProperty.all(Colors.grey[50]),
            columns: const [
              DataColumn(label: Text('Product')),
              DataColumn(label: Text('Quantity')),
              DataColumn(label: Text('Price')),
              DataColumn(label: Text('Discount')),
              DataColumn(label: Text('Tax')),
              DataColumn(label: Text('Total Price')),
              DataColumn(label: Text('Date')),
              DataColumn(label: Text('Status')),
            ],
            rows: salesData
                .where((sale) =>
                    sale.date.isAfter(selectedStartDate) &&
                    sale.date
                        .isBefore(selectedEndDate.add(const Duration(days: 1))))
                .map(
                  (sale) => DataRow(
                    cells: [
                      DataCell(Text(sale.productName)),
                      DataCell(Text(sale.quantity.toString())),
                      DataCell(Text(currencyFormatter.format(sale.price))),
                      DataCell(Text(currencyFormatter.format(sale.discount))),
                      DataCell(Text(currencyFormatter.format(sale.tax))),
                      DataCell(Text(currencyFormatter.format(sale.totalPrice))),
                      DataCell(
                          Text(DateFormat('MMM dd, yyyy').format(sale.date))),
                      DataCell(
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 12),
                          decoration: BoxDecoration(
                            color:
                                _getStatusColor(sale.status).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            sale.status,
                            style: TextStyle(
                              color: _getStatusColor(sale.status),
                            ),
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
    );
  }
}
