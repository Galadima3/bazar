import 'package:bazar/core/themes/app_colors.dart';
import 'package:bazar/features/home/models/book.dart';
import 'package:bazar/features/home/presentation/widgets/category_header.dart';
import 'package:flutter/material.dart';

class TopOfTheWeek extends StatelessWidget {
  TopOfTheWeek({super.key});

  final List<Book> books = [
    Book(name: "The Kite Runner", price: "\$14.99", author: "Jamie"),
    Book(name: "The Kite Runner", price: "\$14.99", author: "Jamie"),
    Book(name: "The Kite Runner", price: "\$14.99", author: "Jamie"),
    Book(name: "The Kite Runner", price: "\$14.99", author: "Jamie"),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        children: [
          CategoryHeader(title: "Top of the week", onPressed: () {}),
          SizedBox(height: 16),
          // Book list
          Expanded(
            child: ListView.builder(
              itemCount: books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height: 150, width: 127, color: Colors.black),
                      SizedBox(height: 8),
                      Text(
                        books[index].name,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        books[index].price,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
