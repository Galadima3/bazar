import 'package:bazar/core/themes/app_colors.dart';
import 'package:bazar/features/home/models/book.dart';
import 'package:flutter/material.dart';

class BookGrid extends StatelessWidget {
  final List<Book> books;
  const BookGrid({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.9,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
          child: SizedBox(
            height: 214,
            width: 158,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 158,
                  width: 158,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: book.imageUrl != null && book.imageUrl!.isNotEmpty
                        ? DecorationImage(
                            image: NetworkImage(book.imageUrl!),
                            fit: BoxFit.cover,
                          )
                        : null,
                    color: Colors.grey.shade300,
                  ),
                  child: (book.imageUrl == null || book.imageUrl!.isEmpty)
                      ? const Icon(Icons.book, size: 48, color: Colors.grey)
                      : null,
                ),
                const SizedBox(height: 4),
                Text(
                  book.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  book.price,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary500,
                      ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
