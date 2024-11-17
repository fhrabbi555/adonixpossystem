import 'package:get/get.dart';

class OverviewController extends GetxController {
  var totalUsers = '1,500'.obs;
  var newUsers = '150'.obs; // New metric
  var totalSales = '\$50,000'.obs;
  var totalRevenue = '\75,000'.obs; // New metric
  var activeSessions = '300'.obs;
  var conversionRate = '2.5%'.obs; // New metric

  var notifications = <String>[].obs; // List of notifications
  var userActivityLogs = <String>[].obs; // List of user activities

  @override
  void onInit() {
    super.onInit();
    // Initialize notifications and user activity logs
    notifications.addAll([
      'User  A logged in',
      'User  B made a purchase',
      'User  C logged out',
      'User  D updated their profile',
    ]);
    userActivityLogs.addAll([
      'User  A viewed the dashboard',
      'User  B checked their orders',
      'User  C added an item to the cart',
      'User  D completed a purchase',
    ]);
  }

  // Method to update metrics
  void updateData(String users, String newUser, String sales, String revenue,
      String sessions, String conversion) {
    totalUsers.value = users;
    newUsers.value = newUser;
    totalSales.value = sales;
    totalRevenue.value = revenue;
    activeSessions.value = sessions;
    conversionRate.value = conversion;
  }
}
