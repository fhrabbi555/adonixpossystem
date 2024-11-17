import 'package:flutter/material.dart';

class WebInventoryOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Inventory Dashboard",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Add Product Logic
              },
              icon: Icon(Icons.add, color: Colors.white),
              label: Text("Add Product"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade600,
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: _buildSideNavigation(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Section with Gradient Background
              _buildHeroSection(),

              SizedBox(height: 32),

              // Stats Overview Section
              _buildStatsGrid(),

              SizedBox(height: 32),

              // Inventory Table Section
              _buildInventoryTable(),
            ],
          ),
        ),
      ),
    );
  }

  // Side Navigation for Web
  Widget _buildSideNavigation() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue.shade600,
            ),
            child: Text(
              'Navigation',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: Text('Dashboard'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Orders'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Products'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Customers'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  // Hero Section with Gradient Background
  Widget _buildHeroSection() {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade700, Colors.blue.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome to Your Inventory",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Manage and track your products with ease.",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  // Stats Grid with Hover Effects
  Widget _buildStatsGrid() {
    List<Map<String, String>> stats = [
      {"title": "Total Products", "value": "150"},
      {"title": "In Stock", "value": "120"},
      {"title": "Low Stock", "value": "20"},
      {"title": "Out of Stock", "value": "10"},
    ];
    List<Color> colors = [
      Colors.blue.shade600,
      Colors.green.shade500,
      Colors.orange.shade600,
      Colors.red.shade600,
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        return MouseRegion(
          onHover: (_) {
            // Add hover effect (optional)
          },
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [
                    colors[index].withOpacity(0.9),
                    colors[index].withOpacity(0.6),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stats[index]["title"]!,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Text(
                    stats[index]["value"]!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Inventory Table with Hover Effects and Tooltips
  Widget _buildInventoryTable() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DataTable(
          columnSpacing: 24,
          headingRowColor:
              MaterialStateColor.resolveWith((states) => Colors.blue.shade100),
          columns: [
            DataColumn(label: Text("Product Name")),
            DataColumn(label: Text("Category")),
            DataColumn(label: Text("Stock Quantity")),
            DataColumn(label: Text("Price")),
            DataColumn(label: Text("Actions")),
          ],
          rows: List.generate(
            10,
            (index) => DataRow(cells: [
              DataCell(Text("Product $index")),
              DataCell(Text("Category $index")),
              DataCell(Text("50")),
              DataCell(Text("\$100")),
              DataCell(Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.visibility, color: Colors.blue),
                    onPressed: () {},
                    tooltip: 'View Product',
                  ),
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.green),
                    onPressed: () {},
                    tooltip: 'Edit Product',
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {},
                    tooltip: 'Delete Product',
                  ),
                ],
              )),
            ]),
          ),
        ),
      ),
    );
  }
}
