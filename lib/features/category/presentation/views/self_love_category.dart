import 'package:bazar/features/category/presentation/widgets/book_grid.dart';
import 'package:bazar/features/home/models/book.dart';
import 'package:flutter/material.dart';

class SelfLoveCategory extends StatelessWidget {
  const SelfLoveCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BookGrid(books: selfLoveCategoryBooks);
  }
}

List<Book> selfLoveCategoryBooks = [
  Book(
    name: "The Gifts of Imperfection",
    price: "\$11.99",
    author: "Brené Brown",
    imageUrl:
        "https://m.media-amazon.com/images/I/61pEljvVxcL._SL1500_.jpg",
  ),
  Book(
    name: "You Are a Badass",
    price: "\$10.50",
    author: "Jen Sincero",
    imageUrl:
        "https://bookpeddler.ng/wp-content/uploads/2019/03/You-Are-a-Badass.png",
  ),
  Book(
    name: "Radical Acceptance",
    price: "\$12.75",
    author: "Tara Brach",
    imageUrl:
        "https://i.ebayimg.com/images/g/p6IAAOSwdVBf~j-D/s-l960.webp",
  ),
  Book(
    name: "Untamed",
    price: "\$14.20",
    author: "Glennon Doyle",
    imageUrl:
        "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1585832694l/52129515.jpg",
  ),
  Book(
    name: "Love Yourself Like Your Life Depends On It",
    price: "\$9.95",
    author: "Kamal Ravikant",
    imageUrl:
        "https://i.ebayimg.com/images/g/B34AAOSwMNxib55K/s-l1600.webp",
  ),
  Book(
    name: "Good Vibes, Good Life",
    price: "\$13.50",
    author: "Vex King",
    imageUrl:
        "https://m.media-amazon.com/images/I/61xbuSU9BlL.jpg",
  ),
  Book(
    name: "Daring Greatly",
    price: "\$12.40",
    author: "Brené Brown",
    imageUrl:
        "https://i.ebayimg.com/images/g/vBAAAeSwNYFovFjW/s-l1600.webp",
  ),
  Book(
    name: "The Self-Love Experiment",
    price: "\$10.25",
    author: "Shannon Kaiser",
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj5s3xGHvaVtT2WEUz9YjKtUgp9hE8a7iAGw&s",
  ),
];
