import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/features/home/presentation/widgets/category_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestVendors extends StatelessWidget {
  const BestVendors({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy2q-IjzBAEYRJZlwpwLDI9OuVlqJ50U2-Fg&s",
      "https://cdn.shopify.com/s/files/1/1403/8979/files/kuromi-sanrio-stationery.png?v=1728237646",
      "https://www.shutterstock.com/image-vector/book-store-600nw-174282452.jpg",
      "https://images-platform.99static.com//X1qlArSqZKzOCllam27j7U6AaHA=/67x1137:930x2000/fit-in/500x500/99designs-contests-attachments/150/150226/attachment_150226770",
    ];

    return SizedBox(
      height: 120,
      child: Column(
        children: [
          CategoryHeader(
            title: "Best Vendors",
            onPressed: () => context.push(RoutePaths.vendors),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: imageUrls.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          image: imageUrls[index].isNotEmpty
                              ? DecorationImage(
                                  image: NetworkImage(imageUrls[index]),
                                  fit: BoxFit.contain,
                                )
                              : null,
                          color: imageUrls[index].isEmpty
                              ? Colors.grey[300]
                              : null,
                        ),
                        child: imageUrls[index].isEmpty
                            ? Icon(
                                Icons.store,
                                size: 40,
                                color: Colors.grey[600],
                              )
                            : null,
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
