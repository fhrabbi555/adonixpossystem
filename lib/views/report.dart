import 'package:flutter/material.dart';
import 'package:adonixpossystem/widgets/menu_widget.dart'; // Import the MenuWidget

class Report extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reports')),
      body: Row(
        children: [
          // Side menu
          MenuWidget(),
          // Main content area
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text('This is the Reports Page'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
