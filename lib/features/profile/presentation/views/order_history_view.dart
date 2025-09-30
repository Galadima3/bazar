import 'package:bazar/features/profile/models/order_model.dart';
import 'package:bazar/features/profile/presentation/widgets/order_tile.dart';
import 'package:flutter/material.dart';


class OrderHistoryView extends StatefulWidget {
  const OrderHistoryView({super.key});

  @override
  State<OrderHistoryView> createState() => _OrderHistoryViewState();
}

class _OrderHistoryViewState extends State<OrderHistoryView> {
  // Sample order data
  List<Order> orders = [
    Order(
      id: '1',
      title: 'The Da Vinci Code',
      status: 'Delivered',
      itemCount: 1,
      imageUrl: 'assets/davinci.jpg', // placeholder
      orderDate: DateTime(2025, 08, 15),
    ),
    Order(
      id: '2',
      title: 'Carrie Fisher',
      status: 'Delivered',
      itemCount: 5,
      imageUrl: 'assets/carrie.jpg', // placeholder
      orderDate: DateTime(2025, 08, 12),
    ),
    Order(
      id: '3',
      title: 'The Waiting',
      status: 'Cancelled',
      itemCount: 2,
      imageUrl: 'assets/waiting.jpg', // placeholder
      orderDate: DateTime(2025, 08, 8),
    ),
  ];

  // Group orders by month-year
  Map<String, List<Order>> groupOrdersByMonth() {
    Map<String, List<Order>> groupedOrders = {};
    
    for (Order order in orders) {
      String monthYear = _formatMonthYear(order.orderDate);
      if (groupedOrders[monthYear] == null) {
        groupedOrders[monthYear] = [];
      }
      groupedOrders[monthYear]!.add(order);
    }
    
    return groupedOrders;
  }

  String _formatMonthYear(DateTime date) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    Map<String, List<Order>> groupedOrders = groupOrdersByMonth();
    
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Order History',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: groupedOrders.keys.length,
        itemBuilder: (context, index) {
          String monthYear = groupedOrders.keys.elementAt(index);
          List<Order> monthOrders = groupedOrders[monthYear]!;
          
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Month header
              Padding(
                padding: EdgeInsets.only(bottom: 16, top: index == 0 ? 0 : 24),
                child: Text(
                  monthYear,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              // Orders for this month
              ...monthOrders.map((order) => OrderTile(order: order)),
            ],
          );
        },
      ),
    );
  }
}

