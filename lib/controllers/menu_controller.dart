import 'package:get/get.dart';

class MenuControllers extends GetxController {
  var selectedIndex = 0.obs; // Main menu item index
  var expandedIndex = (-1).obs; // Index of the currently expanded menu
  var selectedSubmenuIndex = (-1).obs; // Submenu item index

  // Set the selected main menu item index
  void setSelectedIndex(int index) {
    selectedIndex.value = index;
    selectedSubmenuIndex.value =
        -1; // Reset submenu selection when main menu changes
  }

  // Set the selected submenu item index
  void setSubmenuSelectedIndex(int index) {
    selectedSubmenuIndex.value = index; // Set submenu selection
  }

  // Toggle submenu visibility (expand/collapse)
  void toggleSubmenu(int index) {
    if (expandedIndex.value == index) {
      expandedIndex.value = -1; // Collapse submenu
    } else {
      expandedIndex.value = index; // Expand submenu
    }
  }
}
