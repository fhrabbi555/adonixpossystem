import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/menu_controller.dart';
import '../routes.dart';
import '../utility /app_color.dart';

class MenuControllers extends GetxController {
  // Reactive properties
  RxInt selectedIndex = 0.obs; // Track selected menu item
  RxInt expandedIndex =
      (-1).obs; // Track expanded submenu (default is no item expanded)
  RxInt selectedSubmenuIndex = (-1).obs; // Track selected submenu item

  // Method to set selected index
  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  // Method to toggle the expansion of a submenu
  void toggleSubmenu(int index) {
    if (expandedIndex.value == index) {
      // If the clicked menu is already expanded, collapse it
      expandedIndex.value = -1;
    } else {
      // Otherwise, expand the clicked menu
      expandedIndex.value = index;
    }
  }

  // Method to set the selected submenu index
  void setSubmenuSelectedIndex(int index) {
    selectedSubmenuIndex.value = index;
  }
}

class MenuWidget extends StatelessWidget {
  final MenuControllers menuController = Get.put(MenuControllers());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        width: 200, // Adjusted the width to make it more compact
        color: Colors.white, // White background for the menu
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: ListView(
                children: [
                  _buildMenuItem(
                      material.Icons.home, "Home", 0, menuController, '/home'),
                  _buildMenuWithSubmenu(material.Icons.point_of_sale, "POS", 1,
                      menuController, '/pos'),
                  _buildMenuItem(material.Icons.report, "Reports", 2,
                      menuController, AppRoutes.reports),
                  _buildMenuWithSubmenu(material.Icons.settings, "Settings", 3,
                      menuController, '/settings'),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  // Header with the logo text
  Widget _buildHeader() {
    return Container(
      height: 60, // Reduced header height
      color: Colors.white, // White background for the header
      alignment: Alignment.center,
      child: const Text(
        "Adonix POS System", // Replaced with the new logo text
        style: TextStyle(
          color: AppColors.primaryGreen, // Set text color to green
          fontSize: 18, // Reduced font size
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Build a menu item with smooth transitions
  Widget _buildMenuItem(material.IconData icon, String title, int index,
      MenuControllers menuController, String route) {
    bool isSelected = menuController.selectedSubmenuIndex.value == -1 &&
        menuController.selectedIndex.value == index;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          menuController.setSelectedIndex(index);
          Get.toNamed(route); // Navigate to the respective screen
        },
        borderRadius:
            BorderRadius.circular(8), // Reduced radius for a smaller look
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primaryGreen.withOpacity(0.8)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            leading: Icon(
              icon,
              size: 18, // Smaller icon size
              color: isSelected ? Colors.white : AppColors.primaryGreen,
            ),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 14, // Smaller font size for the main menu items
                color: isSelected ? Colors.white : AppColors.primaryGreen,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Build a menu item with submenu and improved selection design
  Widget _buildMenuWithSubmenu(material.IconData icon, String title, int index,
      MenuControllers menuController, String route) {
    bool isSelected = menuController.selectedSubmenuIndex.value == -1 &&
        menuController.selectedIndex.value == index;
    bool isExpanded = menuController.expandedIndex.value == index;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          menuController.setSelectedIndex(index);
          menuController.toggleSubmenu(index); // Toggle submenu visibility
          Get.toNamed(route);
        },
        borderRadius: BorderRadius.circular(8),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primaryGreen.withOpacity(0.8)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              ListTile(
                leading: Icon(
                  icon,
                  size: 18, // Smaller icon size
                  color: isSelected ? Colors.white : AppColors.primaryGreen,
                ),
                title: Text(
                  title,
                  style: TextStyle(
                    fontSize: 14, // Smaller font size for the main menu item
                    color: isSelected ? Colors.white : AppColors.primaryGreen,
                  ),
                ),
                trailing: Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                  size: 18, // Smaller icon for expand/collapse
                  color: isSelected ? Colors.white : AppColors.primaryGreen,
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

  // Submenu for each expandable menu item with improved selection design
  Widget _buildSubmenu(MenuControllers menuController, int menuIndex) {
    return Container(
      padding:
          EdgeInsets.only(left: 8), // Reduced left padding for submenu items
      color: Colors.grey[200],
      child: Column(
        children: [
          _buildSubmenuItem("Submenu Item 1", 0, menuController, menuIndex),
          _buildSubmenuItem("Submenu Item 2", 1, menuController, menuIndex),
        ],
      ),
    );
  }

  // Submenu item with a better selection design
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
        borderRadius:
            BorderRadius.circular(6), // Reduced radius for submenu items
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: isSubmenuSelected
                ? AppColors.primaryGreen.withOpacity(0.8)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                fontSize: 12, // Reduced font size for submenu items
                color:
                    isSubmenuSelected ? Colors.white : AppColors.primaryGreen,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
