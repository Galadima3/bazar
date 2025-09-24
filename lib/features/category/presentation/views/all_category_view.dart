import 'package:bazar/features/category/presentation/widgets/book_grid.dart';
import 'package:bazar/features/home/models/book.dart';
import 'package:flutter/material.dart';


class AllCategoryView extends StatelessWidget {
  const AllCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BookGrid(books: allCategoryBooks);
  }
}

// keep your allCategoryBooks list here…

List<Book> allCategoryBooks = [
  Book(
    name: "To Kill a Mockingbird",
    price: "\$12.99",
    author: "Harper Lee",
    imageUrl: "https://cdn.britannica.com/21/182021-050-666DB6B1/book-cover-To-Kill-a-Mockingbird-many-1961.jpg",
  ),
  Book(
    name: "1984",
    price: "\$10.50",
    author: "George Orwell",
    imageUrl:
        "https://cdn.waterstones.com/bookjackets/large/9780/1410/9780141036144.jpg",
  ),
  Book(
    name: "The Great Gatsby",
    price: "\$11.25",
    author: "F. Scott Fitzgerald",
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoOE0_-MSgEYqEFUISl6zhzzBSNK5qbuuGzg&s",
  ),

  Book(
    name: "Becoming",
    price: "\$16.75",
    author: "Michelle Obama",
    imageUrl:
        "https://m.media-amazon.com/images/I/81KGjsBXQ7L.jpg",
  ),
  Book(
    name: "The Hobbit",
    price: "\$13.40",
    author: "J.R.R. Tolkien",
    imageUrl:
        "https://i5.walmartimages.com/seo/Lord-of-the-Rings-The-Hobbit-Graphic-Novel-Paperback-9780345445605_663b1072-039c-4791-abe6-da4907097d67.b9d2dc96d22c02f55c2d08f2dba3a11b.jpeg",
  ),
  Book(
    name: "Atomic Habits",
    price: "\$15.50",
    author: "James Clear",
    imageUrl: "https://i.ebayimg.com/images/g/wS8AAOSwxKJmsH2y/s-l1600.webp",
  ),
  Book(
    name: "A Brief History of Time",
    price: "\$12.20",
    author: "Stephen Hawking",
    imageUrl: "https://upload.wikimedia.org/wikipedia/en/a/a3/BriefHistoryTime.jpg",
  ),
];