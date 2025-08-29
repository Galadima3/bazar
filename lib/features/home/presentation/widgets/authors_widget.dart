import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/core/themes/app_colors.dart';
import 'package:bazar/features/home/models/author.dart';
import 'package:bazar/features/home/presentation/widgets/category_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthorsWidget extends StatelessWidget {
  AuthorsWidget({super.key});

  final List<Author> authors = [
    Author(
      name: "Jamie Brown",
      jobTitle: "Poet",
      imageUrl:
          "https://plus.unsplash.com/premium_photo-1663047060215-eaf3846564a7?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTN8fHdyaXRlcnxlbnwwfHwwfHx8MA%3D%3D",
    ),
    Author(
      name: "Kentaji Brown",
      jobTitle: "Novelist",
      imageUrl:
          "https://images.unsplash.com/photo-1600188768149-f27db3bc6ef9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YXV0aG9yfGVufDB8fDB8fHww",
    ),
    Author(
      name: "Joaquin Felix",
      jobTitle: "Writer",
      imageUrl:
          "https://plus.unsplash.com/premium_photo-1681681061613-8540c8d67f0d?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          // Header
          CategoryHeader(
            title: "Authors",
            onPressed: () => context.push(RoutePaths.authors),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: authors.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: authors[index].imageUrl!.isNotEmpty
                            ? NetworkImage(authors[index].imageUrl!)
                            : null,
                        backgroundColor: authors[index].imageUrl!.isEmpty
                            ? Colors.grey[300]
                            : null,
                        child: authors[index].imageUrl!.isEmpty
                            ? Icon(Icons.person, size: 50, color: Colors.grey[600])
                            : null,
                      ),
                      SizedBox(height: 8),
                      Text(
                        authors[index].name,
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        authors[index].jobTitle,
                        style: textTheme.bodySmall?.copyWith(
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