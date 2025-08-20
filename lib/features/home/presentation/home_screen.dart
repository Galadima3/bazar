import 'package:bazar/core/themes/app_colors.dart';
import 'package:bazar/features/home/models/author.dart';
import 'package:bazar/features/home/models/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
        leading: Icon(CupertinoIcons.search),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Badge(
              backgroundColor: Colors.red,
              label: Text("3"),
              child: Icon(CupertinoIcons.bell),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Special Offers Box
            Container(height: 150, width: 327, color: Colors.black),
            SizedBox(height: 27),

            // Top of the week
            TopOfTheWeek(),
            SizedBox(height: 32),

            //Best Vendors
            BestVendors(),

            SizedBox(height: 32),
            //Authors
            Authors(),

            Center(child: Text("Home Screen")),
          ],
        ),
      ),
    );
  }
}

class Authors extends StatelessWidget {
  Authors({super.key});

  final List<Author> authors = [
    Author(name: "Jamie Brown", jobTitle: "Poet"),
    Author(name: "Kentaji Brown", jobTitle: "Novelist"),
    Author(name: "Joaquin Felix", jobTitle: "Writer"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Authors",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text("See all"),
              ],
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  //child: CircleAvatar(radius: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Container(height: 150, width: 127, color: Colors.black),
                      CircleAvatar(radius: 45),
                      SizedBox(height: 8),
                      Text(
                        authors[index].name,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        authors[index].jobTitle,
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
    //return Container(height: 120, width: 351, color: Colors.black);
  }
}

class BestVendors extends StatelessWidget {
  const BestVendors({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Best Vendors",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text("See all"),
              ],
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height: 80, width: 80, color: Colors.black),
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
      height: 250, // Updated height to accommodate book cover and text
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top of the week",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text("See all"),
              ],
            ),
          ),
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
