import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/features/home/presentation/widgets/category_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestVendors extends StatelessWidget {
  const BestVendors({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 120,
      child: Column(
        children: [
          CategoryHeader(title: "Best Vendors", onPressed: () => context.push(RoutePaths.vendors)),
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
