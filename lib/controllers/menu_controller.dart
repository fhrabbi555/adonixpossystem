// import 'package:get/get.dart';
//
// class MenuControllers extends GetxController {
//   var selectedIndex = 0.obs; // Main menu item index
//   var expandedIndex = (-1).obs; // Index of the currently expanded menu
//   var selectedSubmenuIndex = (-1).obs; // Submenu item index
//
//   // Set the selected main menu item index
//   void setSelectedIndex(int index) {
//     selectedIndex.value = index;
//     selectedSubmenuIndex.value =
//         -1; // Reset submenu selection when main menu changes
//   }
//
//   // Set the selected submenu item index
//   void setSubmenuSelectedIndex(int index) {
//     selectedSubmenuIndex.value = index; // Set submenu selection
//   }
//
//   // Toggle submenu visibility (expand/collapse)
//   void toggleSubmenu(int index) {
//     if (expandedIndex.value == index) {
//       expandedIndex.value = -1; // Collapse submenu
//     } else {
//       expandedIndex.value = index; // Expand submenu
//     }
//   }
// }
import 'package:get/get.dart';

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
