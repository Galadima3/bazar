import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/core/themes/app_colors.dart';
import 'package:bazar/features/home/models/author.dart';
import 'package:bazar/features/home/presentation/widgets/category_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthorsWidget extends StatelessWidget {
  AuthorsWidget({super.key});

  final List<Author> authors = [
    Author(name: "Jamie Brown", jobTitle: "Poet"),
    Author(name: "Kentaji Brown", jobTitle: "Novelist"),
    Author(name: "Joaquin Felix", jobTitle: "Writer"),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          // Header
          CategoryHeader(title: "Authors", onPressed: () => context.push(RoutePaths.authors)),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(radius: 45),
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
