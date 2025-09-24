import 'package:bazar/features/category/presentation/widgets/book_grid.dart';
import 'package:bazar/features/home/models/book.dart';
import 'package:flutter/material.dart';

class RomanceCategoryView extends StatelessWidget {
  const RomanceCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BookGrid(books: romanceCategoryBooks);
  }
}

List<Book> romanceCategoryBooks = [
  Book(
    name: "Sense and Sensibility",
    price: "\$9.50",
    author: "Jane Austen",
    imageUrl: "https://covers.openlibrary.org/b/title/Sense%20and%20Sensibility-L.jpg",
  ),
  Book(
    name: "Persuasion",
    price: "\$10.75",
    author: "Jane Austen",
    imageUrl: "https://covers.openlibrary.org/b/title/Persuasion-L.jpg",
  ),
  Book(
    name: "A Room with a View",
    price: "\$11.20",
    author: "E.M. Forster",
    imageUrl: "https://covers.openlibrary.org/b/title/A%20Room%20with%20a%20View-L.jpg",
  ),
  Book(
    name: "Doctor Zhivago",
    price: "\$12.90",
    author: "Boris Pasternak",
    imageUrl: "https://covers.openlibrary.org/b/title/Doctor%20Zhivago-L.jpg",
  ),
  Book(
    name: "Outlander",
    price: "\$13.75",
    author: "Diana Gabaldon",
    imageUrl: "https://covers.openlibrary.org/b/title/Outlander-L.jpg",
  ),
  Book(
    name: "Call Me by Your Name",
    price: "\$12.40",
    author: "André Aciman",
    imageUrl: "https://covers.openlibrary.org/b/title/Call%20Me%20by%20Your%20Name-L.jpg",
  ),
  Book(
    name: "One Day",
    price: "\$11.80",
    author: "David Nicholls",
    imageUrl: "https://covers.openlibrary.org/b/title/One%20Day-L.jpg",
  ),
  Book(
    name: "Eleanor & Park",
    price: "\$10.60",
    author: "Rainbow Rowell",
    imageUrl: "https://covers.openlibrary.org/b/title/Eleanor%20&%20Park-L.jpg",
  ),
];
