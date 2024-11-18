import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Product {
  final String name;
  final int quantity;
  final double price;
  final String category;
  final String imageUrl;
  final DateTime lastUpdated;
  final int alertThreshold;

  Product({
    required this.name,
    required this.quantity,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.lastUpdated,
    required this.alertThreshold,
  });
}

class WebInventoryOverviewScreen extends StatefulWidget {
  const WebInventoryOverviewScreen({Key? key}) : super(key: key);

  @override
  State<WebInventoryOverviewScreen> createState() =>
      _WebInventoryOverviewScreenState();
}

class _WebInventoryOverviewScreenState
    extends State<WebInventoryOverviewScreen> {
  final List<Product> _products = [
    Product(
      name: 'Laptop XPS 15',
      quantity: 25,
      price: 1299.99,
      category: 'Electronics',
      imageUrl: 'assets/laptop.png',
      lastUpdated: DateTime.now().subtract(const Duration(days: 2)),
      alertThreshold: 20,
    ),
    Product(
      name: 'Wireless Mouse',
      quantity: 15,
      price: 29.99,
      category: 'Accessories',
      imageUrl: 'assets/mouse.png',
      lastUpdated: DateTime.now().subtract(const Duration(hours: 12)),
      alertThreshold: 25,
    ),
    Product(
      name: 'Smartphone Galaxy S23',
      quantity: 10,
      price: 999.99,
      category: 'Electronics',
      imageUrl: 'assets/smartphone.png',
      lastUpdated: DateTime.now().subtract(const Duration(days: 1)),
      alertThreshold: 5,
    ),
    Product(
      name: 'Bluetooth Speaker',
      quantity: 50,
      price: 49.99,
      category: 'Accessories',
      imageUrl: 'assets/speaker.png',
      lastUpdated: DateTime.now().subtract(const Duration(days: 3)),
      alertThreshold: 10,
    ),
    Product(
      name: 'Gaming Keyboard',
      quantity: 30,
      price: 79.99,
      category: 'Accessories',
      imageUrl: 'assets/keyboard.png',
      lastUpdated: DateTime.now().subtract(const Duration(hours: 6)),
      alertThreshold: 15,
    ),
    Product(
      name: 'Monitor 4K UHD',
      quantity: 20,
      price: 399.99,
      category: 'Electronics',
      imageUrl: 'assets/monitor.png',
      lastUpdated: DateTime.now().subtract(const Duration(days: 4)),
      alertThreshold: 5,
    ),
    Product(
      name: 'External SSD 1TB',
      quantity: 40,
      price: 129.99,
      category: 'Storage',
      imageUrl: 'assets/ssd.png',
      lastUpdated: DateTime.now().subtract(const Duration(days: 5)),
      alertThreshold: 10,
    ),
    Product(
      name: 'USB-C Docking Station',
      quantity: 15,
      price: 59.99,
      category: 'Accessories',
      imageUrl: 'assets/docking_station.png',
      lastUpdated: DateTime.now().subtract(const Duration(days: 2)),
      alertThreshold: 5,
    ),
    Product(
      name: 'Noise Cancelling Headphones',
      quantity: 25,
      price: 199.99,
      category: 'Accessories',
      imageUrl: 'assets/headphones.png',
      lastUpdated: DateTime.now().subtract(const Duration(days: 3)),
      alertThreshold: 10,
    ),
    Product(
      name: 'Smartwatch Series 8',
      quantity: 20,
      price: 349.99,
      category: 'Wearables',
      imageUrl: 'assets/smartwatch.png',
      lastUpdated: DateTime.now().subtract(const Duration(days: 1)),
      alertThreshold: 5,
    ),
    Product(
      name: 'Portable Charger 20,000mAh',
      quantity: 0,
      price: 39.99,
      category: 'Accessories',
      imageUrl: 'assets/charger.png',
      lastUpdated: DateTime.now().subtract(const Duration(days: 7)),
      alertThreshold: 15,
    ),
    Product(
      name: 'Wireless Earbuds',
      quantity: 35,
      price: 89.99,
      category: 'Accessories',
      imageUrl: 'assets/earbuds.png',
      lastUpdated: DateTime.now().subtract(const Duration(hours: 10)),
      alertThreshold: 10,
    ),
    // Add more sample products as needed
  ];

  String _searchQuery = '';
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Inventory Overview',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('MMMM dd, yyyy').format(DateTime.now()),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.file_download),
                    label: const Text('Export'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text('Add Product'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Stats Cards
          Row(
            children: [
              _buildStatCard(
                'Total Products',
                _products.length.toString(),
                Icons.inventory,
                Colors.blue,
                'Updated just now',
              ),
              const SizedBox(width: 16),
              _buildStatCard(
                'Low Stock Items',
                _products
                    .where((p) => p.quantity < p.alertThreshold)
                    .length
                    .toString(),
                Icons.warning,
                Colors.orange,
                'Requires attention',
              ),
              const SizedBox(width: 16),
              _buildStatCard(
                'Out of Stock',
                _products.where((p) => p.quantity == 0).length.toString(),
                Icons.error,
                Colors.red,
                'Critical items',
              ),
              const SizedBox(width: 16),
              _buildStatCard(
                'Total Value',
                '\$${NumberFormat('#,##0.00').format(_products.fold(0.0, (sum, product) => sum + (product.price * product.quantity)))}',
                Icons.attach_money,
                Colors.green,
                'Inventory worth',
              ),
            ],
          ),
          const SizedBox(height: 12), // Decreased top margin

          // Search and Filter
          Container(
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
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search products...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedCategory,
                      hint: const Text('Category'),
                      items: ['All', 'Electronics', 'Accessories']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCategory = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Products Table
          Expanded(
            child: Center(
              // Center the DataTable
              child: Container(
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
                      constraints:
                          BoxConstraints(maxWidth: 1200), // Set max width
                      child: DataTable(
                        headingRowColor:
                            MaterialStateProperty.all(Colors.grey[50]),
                        columns: const [
                          DataColumn(label: Text('Product')),
                          DataColumn(label: Text('Category')),
                          DataColumn(label: Text('Stock Status')),
                          DataColumn(label: Text('Price')),
                          DataColumn(label: Text('Last Updated')),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows: _products
                            .where((product) =>
                                product.name
                                    .toLowerCase()
                                    .contains(_searchQuery.toLowerCase()) &&
                                (_selectedCategory == 'All' ||
                                    product.category == _selectedCategory))
                            .map(
                              (product) => DataRow(
                                cells: [
                                  DataCell(
                                    Row(
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: const Icon(
                                              Icons.inventory_2_outlined),
                                        ),
                                        const SizedBox(width: 12),
                                        Text(
                                          product.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  DataCell(
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.blue[50],
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        product.category,
                                        style: TextStyle(
                                          color: Colors.blue[700],
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(_buildStockStatus(product)),
                                  DataCell(
                                    Text(
                                      '\$${NumberFormat('#,##0.00').format(product.price)}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      DateFormat('MMM dd, HH:mm')
                                          .format(product.lastUpdated),
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.edit_outlined),
                                          color: Colors.blue,
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon:
                                              const Icon(Icons.delete_outline),
                                          color: Colors.red,
                                          onPressed: () {},
                                        ),
                                      ],
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
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStockStatus(Product product) {
    Color backgroundColor;
    Color textColor;
    String status;
    IconData icon;

    if (product.quantity == 0) {
      backgroundColor = Colors.red[50]!;
      textColor = Colors.red[700]!;
      status = 'Out of Stock';
      icon = Icons.error_outline;
    } else if (product.quantity < product.alertThreshold) {
      backgroundColor = Colors.orange[50]!;
      textColor = Colors.orange[700]!;
      status = 'Low Stock';
      icon = Icons.warning_outlined;
    } else {
      backgroundColor = Colors.green[50]!;
      textColor = Colors.green[700]!;
      status = 'In Stock';
      icon = Icons.check_circle_outline;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: textColor),
          const SizedBox(width: 4),
          Text(
            status,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
      String title, String value, IconData icon, Color color, String subtitle) {
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
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
