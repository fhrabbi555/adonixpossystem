import 'package:adonixpossystem/controllers/menu_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MenuWidget extends StatelessWidget {
  final Color primaryGreen =
      Colors.green[800]!; // Green color for selected items

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final MenuControllers menuController = Get.put(MenuControllers());

      return Container(
        width: 250,
        color: Colors.white, // White background for the menu
        child: Column(
          children: [
            Container(
              height: 120,
              color: primaryGreen,
              alignment: Alignment.center,
              child: const Text(
                "LOGO",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildMenuItem(material.Icons.dashboard, "Dashboard", 0,
                      menuController, '/dashboard'),
                  _buildMenuWithSubmenu(material.Icons.point_of_sale, "POS", 1,
                      menuController, '/pos'),
                  _buildMenuItem(material.Icons.report, "Reports", 2,
                      menuController, '/reports'),
                  _buildMenuWithSubmenu(material.Icons.settings, "Settings", 3,
                      menuController, '/settings'),
                  // Add more menu items as needed
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  // Helper function to create a menu item in the sidebar
  Widget _buildMenuItem(material.IconData icon, String title, int index,
      MenuControllers menuController, String route) {
    bool isSelected = menuController.selectedIndex.value == index;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          menuController.setSelectedIndex(index);
          Get.toNamed(route); // Navigate to the respective screen
        },
        borderRadius: BorderRadius.circular(10), // Button radius of 10
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? primaryGreen : Colors.transparent,
            borderRadius:
                BorderRadius.circular(10), // Increased radius for selected item
          ),
          child: ListTile(
            leading: Icon(
              icon,
              color: isSelected
                  ? Colors.white
                  : primaryGreen, // White when selected, green when not
            ),
            title: Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : primaryGreen, // White when selected, green when not
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to create a menu item with a submenu
  Widget _buildMenuWithSubmenu(material.IconData icon, String title, int index,
      MenuControllers menuController, String route) {
    bool isSelected = menuController.selectedIndex.value == index;
    bool isExpanded = menuController.expandedIndex.value == index;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          menuController.setSelectedIndex(index); // Select main menu item
          menuController.toggleSubmenu(index); // Toggle submenu visibility
          Get.toNamed(route); // Navigate to the respective screen
        },
        borderRadius:
            BorderRadius.circular(10), // Increased radius for selected item
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? primaryGreen : Colors.transparent,
            borderRadius:
                BorderRadius.circular(10), // Increased radius for selected item
          ),
          child: Column(
            children: [
              ListTile(
                leading: Icon(
                  icon,
                  color: isSelected
                      ? Colors.white
                      : primaryGreen, // White when selected, green when not
                ),
                title: Text(
                  title,
                  style: TextStyle(
                    color: isSelected
                        ? Colors.white
                        : primaryGreen, // White when selected, green when not
                  ),
                ),
                trailing: Icon(
                  isExpanded
                      ? Icons.expand_less // Show collapse icon when expanded
                      : Icons.expand_more, // Show expand icon when collapsed
                  color: isSelected ? Colors.white : primaryGreen,
                ),
              ),
              if (isExpanded)
                _buildSubmenu(
                    menuController, index), // Show submenu if expanded
            ],
          ),
        ),
      ),
    );
  }

  // Create a submenu for a specific menu item
  Widget _buildSubmenu(MenuControllers menuController, int menuIndex) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      color: Colors.grey[200],
      child: Column(
        children: [
          _buildSubmenuItem("Submenu Item 1", 0, menuController, menuIndex),
          _buildSubmenuItem("Submenu Item 2", 1, menuController, menuIndex),
          // Add more submenu items as needed
        ],
      ),
    );
  }

  // Helper function to create a submenu item
  Widget _buildSubmenuItem(String title, int submenuIndex,
      MenuControllers menuController, int menuIndex) {
    bool isSubmenuSelected =
        menuController.selectedSubmenuIndex.value == submenuIndex &&
            menuController.selectedIndex.value == menuIndex;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          menuController
              .setSubmenuSelectedIndex(submenuIndex); // Select the submenu item
        },
        borderRadius: BorderRadius.circular(10), // Button radius of 10
        child: Container(
          decoration: BoxDecoration(
            color: isSubmenuSelected ? primaryGreen : Colors.transparent,
            borderRadius: BorderRadius.circular(
                10), // Increased radius for selected submenu
          ),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                color: isSubmenuSelected
                    ? Colors.white
                    : primaryGreen, // White when selected, green when not
              ),
            ),
          ),
        ),
      ),
    );
  }
}
