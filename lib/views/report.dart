import 'package:flutter/material.dart';
import 'package:adonixpossystem/widgets/menu_widget.dart'; // Import the MenuWidget

class Report extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        children: [
          // Sidebar Menu
          MenuWidget(), // Use the updated MenuWidget here

          // Main Dashboard Area
          Expanded(
            child: Column(
              children: [
                // Top Bar with Title
                Container(
                  height: 80,
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "POS System Dashboard",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Main Content Area for Dashboard
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        "Dashboard  Goes Here",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
