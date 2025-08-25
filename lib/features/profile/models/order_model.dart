
// Order model
class Order {
  final String id;
  final String title;
  final String status;
  final int itemCount;
  final String imageUrl;
  final DateTime orderDate;

  Order({
    required this.id,
    required this.title,
    required this.status,
    required this.itemCount,
    required this.imageUrl,
    required this.orderDate,
  });
}