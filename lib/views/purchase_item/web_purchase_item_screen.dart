import 'package:flutter/material.dart';

class WebPurchaseItemScreen extends StatefulWidget {
  const WebPurchaseItemScreen({Key? key}) : super(key: key);

  @override
  _WebPurchaseItemScreenState createState() => _WebPurchaseItemScreenState();
}

class _WebPurchaseItemScreenState extends State<WebPurchaseItemScreen> {
  final List<PurchaseItem> purchaseItems = List.generate(
    50,
    (index) => PurchaseItem(
      productName: "Product ${index + 1} - Example Name",
      quantity: (index + 1) * 2,
      price: 49.99 + (index * 2),
      total: (49.99 + (index * 2)) * ((index + 1) * 2),
      date: DateTime.now().subtract(Duration(days: index)),
      currentStock: 100 - (index * 2),
    ),
  );

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredItems = purchaseItems
        .where((item) =>
            item.productName.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 32),
            _buildMostSoldProduct(),
            const SizedBox(height: 16),
            _buildAiSuggestion(),
            const SizedBox(height: 32),
            _buildSearchSortFilter(),
            const SizedBox(height: 16),
            _buildPurchaseItemList(filteredItems),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Purchase Items',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Track, analyze, and optimize your purchase and sales strategy',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Add Purchase'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryGreen,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMostSoldProduct() {
    final mostSoldProduct = purchaseItems.reduce((a, b) =>
        a.quantity > b.quantity ? a : b); // Find the most sold product.

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
              Icon(
                Icons.star,
                color: Colors.amber,
                size: 32,
              ),
              const SizedBox(width: 8),
              Text(
                'Most Sold Product',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            mostSoldProduct.productName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.primaryGreen,
            ),
          ),
          Text(
            '${mostSoldProduct.quantity} items sold',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Total Sales: \$${mostSoldProduct.total.toStringAsFixed(2)}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAiSuggestion() {
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
          Text(
            'AI Suggestions',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 12),
          _buildAiSuggestionItem(
              'Increase stock of Wireless Earbuds to meet high demand.'),
          _buildAiSuggestionItem(
              'Create a discount offer on Bluetooth Speakers for more sales.'),
          _buildAiSuggestionItem(
              'Leverage social media ads for Gaming Keyboards.'),
          _buildAiSuggestionItem(
              'Analyze customer feedback for product improvement.'),
        ],
      ),
    );
  }

  Widget _buildAiSuggestionItem(String suggestion) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_outline,
            color: AppColors.primaryGreen,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              suggestion,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ),
        ],
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

  Widget _buildPurchaseItemList(List<PurchaseItem> items) {
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
                    'Price',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Total',
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
                    'Current Stock',
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
          Container(
            height: 400, // Restrict height to make the table scrollable
            child: Scrollbar(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: items.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Row(
                    children: [
                      Expanded(child: Text(item.productName)),
                      Expanded(child: Text('${item.quantity}')),
                      Expanded(
                          child: Text('\$${item.price.toStringAsFixed(2)}')),
                      Expanded(
                          child: Text('\$${item.total.toStringAsFixed(2)}')),
                      Expanded(
                        child: Text(
                          '${item.date.toLocal()}'.split(' ')[0],
                        ),
                      ),
                      Expanded(child: Text('${item.currentStock}')),
                      Expanded(
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.visibility),
                              color: Colors.blue,
                              onPressed: () => _viewItemDetailsDialog(item),
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              color: Colors.orange,
                              onPressed: () => _editItemDialog(item),
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

  void _viewItemDetailsDialog(PurchaseItem item) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Details for ${item.productName}'),
          content: Text(
              'Quantity: ${item.quantity}\nPrice: \$${item.price}\nTotal: \$${item.total}'),
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

  void _editItemDialog(PurchaseItem item) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit ${item.productName}'),
          content: TextField(
            decoration: const InputDecoration(labelText: 'Update Stock'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

class PurchaseItem {
  final String productName;
  final int quantity;
  final double price;
  final double total;
  final DateTime date;
  final int currentStock;

  PurchaseItem({
    required this.productName,
    required this.quantity,
    required this.price,
    required this.total,
    required this.date,
    required this.currentStock,
  });
}

class AppColors {
  static const Color primaryGreen = Color(0xFF4CAF50);
}
