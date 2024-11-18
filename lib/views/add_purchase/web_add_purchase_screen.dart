import 'package:flutter/material.dart';

import '../../utility /app_color.dart';

class WebAddPurchaseScreen extends StatefulWidget {
  const WebAddPurchaseScreen({Key? key}) : super(key: key);

  @override
  _WebAddPurchaseScreenState createState() => _WebAddPurchaseScreenState();
}

class _WebAddPurchaseScreenState extends State<WebAddPurchaseScreen> {
  String selectedProduct = '';
  String selectedSupplier = '';
  int purchaseQuantity = 0;
  DateTime purchaseDate = DateTime.now();
  String aiRecommendation = 'Start typing to see AI suggestions';
  String barcode = '';

  final List<String> products = [
    'Wireless Earbuds',
    'Bluetooth Speaker',
    'Gaming Keyboard',
    'Smartphone',
    'Laptop',
  ];

  final List<String> suppliers = [
    'TechWorld Supplies',
    'GadgetHub Distributors',
    'SmartElectro Partners',
    'Global Tech Solutions',
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Add New Purchase',
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
            _buildHeader(isMobile),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: _buildProductSelection()),
                const SizedBox(width: 16),
                Expanded(flex: 2, child: _buildSupplierSelection()),
              ],
            ),
            const SizedBox(height: 16),
            _buildPurchaseDetails(),
            const SizedBox(height: 16),
            _buildBarcodeInput(),
            const SizedBox(height: 24),
            _buildAIRecommendations(),
            const SizedBox(height: 32),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Add Purchase',
          style: TextStyle(
            fontSize: isMobile ? 24 : 32,
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

  Widget _buildProductSelection() {
    return _buildCard(
      icon: Icons.shopping_cart_outlined,
      title: 'Product',
      child: _buildSuggestionField(
        hintText: 'Enter product name',
        suggestions: products,
        onChanged: (value) {
          setState(() {
            selectedProduct = value;
            aiRecommendation =
                'AI Suggestion: Consider purchasing 50 units of $value.';
          });
        },
      ),
    );
  }

  Widget _buildSupplierSelection() {
    return _buildCard(
      icon: Icons.store_outlined,
      title: 'Supplier',
      child: _buildSuggestionField(
        hintText: 'Enter supplier name',
        suggestions: suppliers,
        onChanged: (value) {
          setState(() {
            selectedSupplier = value;
          });
        },
      ),
    );
  }

  Widget _buildBarcodeInput() {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: _buildCard(
          icon: Icons.qr_code,
          title: 'Barcode',
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter barcode or scan',
                    labelStyle: TextStyle(color: AppColors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryGreen),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryGreen),
                    ),
                    prefixIcon: const Icon(Icons.qr_code, color: Colors.grey),
                  ),
                  onChanged: (value) {
                    setState(() {
                      barcode = value;
                    });
                  },
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    barcode = 'SCANNED-12345';
                  });
                },
                icon: const Icon(Icons.qr_code_scanner, color: Colors.white),
                label:
                    const Text('Scan', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestionField({
    required String hintText,
    required List<String> suggestions,
    required ValueChanged<String> onChanged,
  }) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        }
        return suggestions.where((suggestion) => suggestion
            .toLowerCase()
            .contains(textEditingValue.text.toLowerCase()));
      },
      fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: hintText,
            labelStyle: TextStyle(color: AppColors.primaryGreen),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryGreen),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryGreen),
            ),
            prefixIcon: const Icon(Icons.edit, color: Colors.grey),
          ),
          onChanged: onChanged,
        );
      },
      onSelected: onChanged,
    );
  }

  Widget _buildPurchaseDetails() {
    return _buildCard(
      icon: Icons.date_range_outlined,
      title: 'Purchase Details',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Quantity',
              labelStyle: TextStyle(color: AppColors.black),
              hintText: 'Enter purchase quantity',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryGreen),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryGreen),
              ),
              prefixIcon: const Icon(Icons.numbers, color: Colors.grey),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                purchaseQuantity = int.tryParse(value) ?? 0;
              });
            },
          ),
          const SizedBox(height: 16),
          TextField(
            readOnly: true,
            controller: TextEditingController(
                text: '${purchaseDate.toLocal()}'.split(' ')[0]),
            decoration: InputDecoration(
              labelText: 'Purchase Date',
              labelStyle: TextStyle(color: AppColors.primaryGreen),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryGreen),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryGreen),
              ),
              prefixIcon:
                  const Icon(Icons.calendar_today_outlined, color: Colors.grey),
            ),
            onTap: () => _selectDate(context),
          ),
        ],
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
        label: Text(
          'Submit Purchase',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryGreen,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: purchaseDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != purchaseDate) {
      setState(() {
        purchaseDate = pickedDate;
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
              'Use this screen to add new purchases. Start typing to see product and supplier suggestions. AI recommendations will help guide your decisions. Use the barcode field for scanning or manual input.'),
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
        selectedSupplier.isEmpty ||
        purchaseQuantity <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill out all fields before submitting!'),
        ),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Purchase for $selectedProduct from $selectedSupplier added successfully!'),
      ),
    );
    setState(() {
      selectedProduct = '';
      selectedSupplier = '';
      purchaseQuantity = 0;
      purchaseDate = DateTime.now();
      barcode = '';
      aiRecommendation = 'Start typing to see AI suggestions';
    });
  }
}
