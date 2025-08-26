import 'package:bazar/features/home/models/book.dart';
import 'package:bazar/features/profile/presentation/widgets/favorites_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteView extends ConsumerStatefulWidget {
  const FavoriteView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends ConsumerState<FavoriteView> {
  // List of favorite books
  List<Book> favoriteBooks = [
    Book(name: 'Things Fall Apart', price: '\$1.99', author: 'Chinua Achebe'),
    Book(name: 'To Kill a Mockingbird', price: '\$2.49', author: 'Harper Lee'),
    Book(name: '1984', price: '\$3.99', author: 'George Orwell'),
    Book(name: 'Pride and Prejudice', price: '\$2.99', author: 'Jane Austen'),
    Book(
      name: 'The Great Gatsby',
      price: '\$4.49',
      author: 'F. Scott Fitzgerald',
    ),
    Book(
      name: 'One Hundred Years of Solitude',
      price: '\$3.49',
      author: 'Gabriel García Márquez',
    ),
  ];

  // Colors for book covers (separate list)
  List<Color> coverColors = [
    Colors.black,
    Colors.blue,
    Colors.red,
    Colors.purple,
    Colors.green,
    Colors.orange,
  ];

  void removeFromFavorites(int index) {
    setState(() {
      favoriteBooks.removeAt(index);
      coverColors.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favourites"), centerTitle: true),
      body: favoriteBooks.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.heart, size: 64, color: Colors.grey),
                  SizedBox(height: 16.h),
                  Text(
                    'No favorite books yet',
                    style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: favoriteBooks.length,
              itemBuilder: (context, index) {
                final book = favoriteBooks[index];
                final coverColor = coverColors[index];
                return FavoritesTile(
                  book: book,
                  coverColor: coverColor,
                  onRemove: () => removeFromFavorites(index),
                );
              },
            ),
    );
  }
}

