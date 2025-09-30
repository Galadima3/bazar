import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/features/cart/presentation/widgets/cart_item_tile.dart';
import 'package:bazar/features/home/models/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  // Items in Cart
  List<Book> cartItems = [
    Book(name: 'The Alchemist', price: '\$5.99', author: 'Paulo Coelho'),
    Book(
      name: 'Sapiens: A Brief History of Humankind',
      price: '\$8.50',
      author: 'Yuval Noah Harari',
    ),
    Book(name: 'Dune', price: '\$7.25', author: 'Frank Herbert'),
    Book(
      name: 'The Hitchhiker\'s Guide to the Galaxy',
      price: '\$4.75',
      author: 'Douglas Adams',
    ),
    Book(
      name: 'The Lord of the Rings',
      price: '\$12.99',
      author: 'J.R.R. Tolkien',
    ),
    Book(name: 'The Hunger Games', price: '\$6.50', author: 'Suzanne Collins'),
  ];
  // Colors for book covers (separate list)
  List<Color> coverColors = [
    Colors.deepPurple,
    Colors.teal,
    Colors.brown,
    Colors.lime,
    Colors.indigo,
    Colors.cyan,
  ];

  void removeFromCart(int index) {
    setState(() {
      cartItems.removeAt(index);
      if (index < coverColors.length) {
        coverColors.removeAt(index);
      }
    });
  }

  double _calculateTotal() {
    double total = 0.0;
    for (var book in cartItems) {
      final priceString = book.price.replaceAll('\$', '');
      total += double.tryParse(priceString) ?? 0.0;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.shopping_cart,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'No Items in Cart yet',
                    style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: cartItems.length + 1, // Add 1 for the total/checkout section
              itemBuilder: (context, index) {
                // This is the total/checkout section
                if (index == cartItems.length) {
                  return Column(
                    children: [
                      
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: textTheme.headlineLarge,
                            ),
                            Text(
                              "\$${_calculateTotal().toStringAsFixed(2)}",
                              style: textTheme.headlineLarge,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0.w),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              
                              context.push(RoutePaths.confirmOrder, extra: cartItems);

                            },
                            child: Center(child: Text('Checkout', style: TextStyle(fontSize: 18.sp))),
                          ),
                        ),
                      ),
                    ],
                  );
                }

                // This is a normal cart item tile
                final book = cartItems[index];
                final coverColor = index < coverColors.length ? coverColors[index] : Colors.grey;

                return Column(
                  children: [
                    CartItemTile(
                      book: book,
                      coverColor: coverColor,
                      onRemove: () => removeFromCart(index),
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 20,
                      thickness: 1,
                      indent: 16,
                      endIndent: 16,
                    ),
                  ],
                );
              },
            ),
    );
  }
}