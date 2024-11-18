import 'package:flutter/material.dart';

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
            _buildSearchSortFilter(),
            const SizedBox(height: 16),
            _buildReturnInvoiceTable(filteredInvoices),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchSortFilter() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Search products...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 16),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.filter_list),
          label: const Text('Filter'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryGreen,
            foregroundColor: Colors.white,
          ),
        ),
        const SizedBox(width: 16),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.sort),
          label: const Text('Sort'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryGreen,
            foregroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Return Invoice',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
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

  Widget _buildReturnInvoiceTable(List<Map<String, dynamic>> filteredInvoices) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Table Headers
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Product Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Quantity',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Reason',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Status',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Actions',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          // Table Content
          SizedBox(
            height: 400, // Restrict height to make the table scrollable
            child: Scrollbar(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: filteredInvoices.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final invoice = filteredInvoices[index];
                  return Row(
                    children: [
                      Expanded(child: Text(invoice['product'])),
                      Expanded(child: Text('${invoice['quantity']}')),
                      Expanded(child: Text(invoice['reason'])),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: invoice['status'] == 'Completed'
                                ? Colors.green[50]
                                : Colors.orange[50],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            invoice['status'],
                            style: TextStyle(
                              color: invoice['status'] == 'Completed'
                                  ? Colors.green[700]
                                  : Colors.orange[700],
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          invoice['date'],
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.visibility),
                              color: Colors.blue,
                              onPressed: () {
                                // View details action
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              color: Colors.orange,
                              onPressed: () {
                                // Edit action
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
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
