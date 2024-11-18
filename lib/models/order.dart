class Order {
  final String id;
  final String customerName;
  final int items;
  final double total;
  final String date;

  Order({
    required this.id,
    required this.customerName,
    required this.items,
    required this.total,
    required this.date,
  });
}
