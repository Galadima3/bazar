import 'package:bazar/core/themes/app_colors.dart';
import 'package:bazar/features/home/models/book.dart';
import 'package:bazar/features/home/presentation/widgets/category_header.dart';
import 'package:flutter/material.dart';

class TopOfTheWeek extends StatelessWidget {
  TopOfTheWeek({super.key});

  final List<Book> books = [
    Book(name: "The Kite Runner", price: "\$14.99", author: "Jamie", imageUrl: "https://thebookmarketng.com/wp-content/uploads/2020/08/9781526604736.jpg"),
    Book(name: "To Kill a Mockingbird", price: "\$12.99", author: "Harper Lee", imageUrl: "https://cdn.britannica.com/21/182021-050-666DB6B1/book-cover-To-Kill-a-Mockingbird-many-1961.jpg"),
    Book(name: "1984", price: "\$13.49", author: "George Orwell", imageUrl: "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1327144697i/3744438.jpg"),
    Book(name: "Pride and Prejudice", price: "\$11.99", author: "Jane Austen", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz_gmvRXnhb0BIBCghWahk6DXCk_OV7hQxew&s"),
    Book(name: "The Great Gatsby", price: "\$10.99", author: "F. Scott Fitzgerald", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoOE0_-MSgEYqEFUISl6zhzzBSNK5qbuuGzg&s"),
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
                      Container(
                        height: 150, 
                        width: 127,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: books[index].imageUrl != null
                              ? DecorationImage(
                                  image: NetworkImage(books[index].imageUrl!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                          color: books[index].imageUrl == null ? Colors.grey[300] : null,
                        ),
                        child: books[index].imageUrl == null
                            ? Icon(Icons.book, size: 50, color: Colors.grey[600])
                            : null,
                      ),
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