import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utility /app_color.dart';

class WebReturnInvoiceScreen extends StatefulWidget {
  const WebReturnInvoiceScreen({Key? key}) : super(key: key);

  @override
  _WebReturnInvoiceScreenState createState() => _WebReturnInvoiceScreenState();
}

class _WebReturnInvoiceScreenState extends State<WebReturnInvoiceScreen> {
  String selectedProduct = '';
  int returnQuantity = 0;
  String returnReason = '';
  DateTime returnDate = DateTime.now();
  String invoiceNumber = '';
  String searchQuery = '';
  String aiRecommendation = 'Start typing to see AI suggestions';

  final List<Map<String, dynamic>> returnInvoices = List.generate(
    20,
    (index) => {
      'product': 'Product $index',
      'quantity': index + 1,
      'reason': 'Reason $index',
      'status': index % 2 == 0 ? 'Completed' : 'Pending',
      'date': '2024-11-${15 - index}',
    },
  );

  @override
  Widget build(BuildContext context) {
    final filteredInvoices = returnInvoices
        .where((invoice) => invoice['product']
            .toLowerCase()
            .contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Return Invoice',
          style:
              TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold),
        ),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildForm(),
            const SizedBox(height: 24),
            _buildAIRecommendations(),
            const SizedBox(height: 32),
            _buildSubmitButton(),
            const SizedBox(height: 32),
            _buildSearchBar(),
            const SizedBox(height: 16),
            _buildReturnInvoiceTable(filteredInvoices),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Return Invoice',
          style: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
          ),
        ),
        Spacer(),
        IconButton(
          icon: Icon(Icons.help_outline, color: AppColors.primaryGreen),
          onPressed: _showHelpDialog,
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: _buildProductSelection()),
            const SizedBox(width: 16),
            Expanded(flex: 1, child: _buildReturnQuantity()),
            const SizedBox(width: 16),
            Expanded(flex: 1, child: _buildReturnDate()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(flex: 2, child: _buildReturnReason()),
            const SizedBox(width: 16),
            Expanded(flex: 1, child: _buildInvoiceNumber()),
          ],
        ),
      ],
    );
  }

  Widget _buildProductSelection() {
    return _buildCard(
      icon: Icons.shopping_cart_outlined,
      title: 'Product',
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Enter product name',
          labelStyle: TextStyle(color: AppColors.primaryGreen),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryGreen),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryGreen),
          ),
        ),
        onChanged: (value) {
          setState(() {
            selectedProduct = value;
            aiRecommendation =
                'AI Suggestion: Ensure proper checks for $value before returning.';
          });
        },
      ),
    );
  }

  Widget _buildReturnQuantity() {
    return _buildCard(
      icon: Icons.numbers,
      title: 'Return Quantity',
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Enter return quantity',
          labelStyle: TextStyle(color: AppColors.primaryGreen),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryGreen),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryGreen),
          ),
        ),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          setState(() {
            returnQuantity = int.tryParse(value) ?? 0;
          });
        },
      ),
    );
  }

  Widget _buildReturnDate() {
    return _buildCard(
      icon: Icons.calendar_today_outlined,
      title: 'Return Date',
      child: TextField(
        readOnly: true,
        controller: TextEditingController(
            text: '${returnDate.toLocal()}'.split(' ')[0]),
        decoration: InputDecoration(
          hintText: 'Select return date',
          labelStyle: TextStyle(color: AppColors.primaryGreen),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryGreen),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryGreen),
          ),
        ),
        onTap: () => _selectDate(context),
      ),
    );
  }

  Widget _buildReturnReason() {
    return _buildCard(
      icon: Icons.edit,
      title: 'Return Reason',
      child: TextField(
        minLines: 1,
        maxLines: 3,
        decoration: InputDecoration(
          hintText: 'Enter reason for return',
          labelStyle: TextStyle(color: AppColors.primaryGreen),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryGreen),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryGreen),
          ),
        ),
        onChanged: (value) {
          setState(() {
            returnReason = value;
          });
        },
      ),
    );
  }

  Widget _buildInvoiceNumber() {
    return _buildCard(
      icon: Icons.receipt_long_outlined,
      title: 'Invoice Number',
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Enter invoice number',
          labelStyle: TextStyle(color: AppColors.primaryGreen),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryGreen),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryGreen),
          ),
        ),
        onChanged: (value) {
          setState(() {
            invoiceNumber = value;
          });
        },
      ),
    );
  }

  Widget _buildAIRecommendations() {
    return _buildCard(
      icon: Icons.lightbulb_outline,
      title: 'AI Recommendations',
      child: Text(
        aiRecommendation,
        style: TextStyle(color: Colors.grey[800], fontSize: 14),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Center(
      child: ElevatedButton.icon(
        onPressed: _handleSubmit,
        icon: const Icon(Icons.save_outlined, color: Colors.white),
        label: const Text('Submit Return Invoice',
            style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryGreen,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search in return invoices...',
        prefixIcon: Icon(Icons.search, color: AppColors.primaryGreen),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primaryGreen),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primaryGreen),
        ),
      ),
      onChanged: (value) {
        setState(() {
          searchQuery = value;
        });
      },
    );
  }

  Widget _buildReturnInvoiceTable(List<Map<String, dynamic>> filteredInvoices) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
                  columns: const [
                    DataColumn(
                        label: Text('Product',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Quantity',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Reason',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Status',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Date',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Actions',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  rows: filteredInvoices.take(10).map((invoice) {
                    return DataRow(cells: [
                      DataCell(Text(invoice['product'])),
                      DataCell(Text(invoice['quantity'].toString())),
                      DataCell(Text(invoice['reason'])),
                      DataCell(_buildStatusChip(invoice['status'])),
                      DataCell(Text(invoice['date'])),
                      DataCell(Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.remove_red_eye,
                                color: Colors.green),
                            onPressed: () {},
                          ),
                        ],
                      )),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.primaryGreen, size: 24),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: status == 'Completed' ? Colors.green[50] : Colors.orange[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: status == 'Completed' ? Colors.green[700] : Colors.orange[700],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: returnDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != returnDate) {
      setState(() {
        returnDate = pickedDate;
      });
    }
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Help'),
          content: const Text(
              'Use this screen to create and manage return invoices. Add product details, reasons for return, and check AI recommendations to optimize the return process.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _handleSubmit() {
    if (selectedProduct.isEmpty ||
        returnQuantity <= 0 ||
        returnReason.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill out all fields before submitting!'),
        ),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text('Return invoice for $selectedProduct added successfully!'),
      ),
    );
    setState(() {
      selectedProduct = '';
      returnQuantity = 0;
      returnReason = '';
      returnDate = DateTime.now();
      invoiceNumber = '';
      aiRecommendation = 'Start typing to see AI suggestions';
    });
  }
}
