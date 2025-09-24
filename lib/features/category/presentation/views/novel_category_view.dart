import 'package:bazar/features/category/presentation/widgets/book_grid.dart';
import 'package:bazar/features/home/models/book.dart';
import 'package:flutter/material.dart';

class NovelCategoryView extends StatelessWidget {
  const NovelCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BookGrid(books: novelCategoryBooks);
  }
}

List<Book> novelCategoryBooks = [
  Book(
    name: "Pride and Prejudice",
    price: "\$9.99",
    author: "Jane Austen",
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU5AfrvhPMMEL7WHYy-I3HS9VOWRhhiT4McQ&s",
  ),
  Book(
    name: "Jane Eyre",
    price: "\$11.50",
    author: "Charlotte Brontë",
    imageUrl:
        "https://i5.walmartimages.com/seo/Jane-Eyre-Masterpiece-Library-Edition-Hardcover-9781441342140_e9924ae6-71b6-4018-89b3-3a9590bb934f.b05ce944f40376224ecdd2a7b323db46.jpeg",
  ),
  Book(
    name: "The Catcher in the Rye",
    price: "\$10.75",
    author: "J.D. Salinger",
    imageUrl:
        "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1398034300i/5107.jpg",
  ),
  Book(
    name: "Moby-Dick",
    price: "\$12.40",
    author: "Herman Melville",
    imageUrl:
        "https://cdn1.bookmanager.com/i/m.php?b=rBSsMLeAZlbH_8bDoVHfdA&cb=1736567719",
  ),

  Book(
    name: "Wuthering Heights",
    price: "\$9.25",
    author: "Emily Brontë",
    imageUrl: "https://m.media-amazon.com/images/I/81-8dCuxEsL.jpg",
  ),
  Book(
    name: "Great Expectations",
    price: "\$13.00",
    author: "Charles Dickens",
    imageUrl: "https://cdn.kobo.com/book-images/d1d264bb-edf9-4405-ab53-eb13f82342ab/1200/1200/False/great-expectations-398.jpg",
  ),
  Book(
    name: "Anna Karenina",
    price: "\$14.20",
    author: "Leo Tolstoy",
    imageUrl: "https://dover-books-us.imgix.net/covers/9780486114422.jpg?auto=format&w=300",
  ),
  Book(
    name: "The Picture of Dorian Gray",
    price: "\$8.95",
    author: "Oscar Wilde",
    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjP-24dFyFH-AMvu2BlA-EpSTwEXusFMNBDA&s",
  ),
];
