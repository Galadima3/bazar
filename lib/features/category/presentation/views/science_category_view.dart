import 'package:bazar/features/category/presentation/widgets/book_grid.dart';
import 'package:bazar/features/home/models/book.dart';
import 'package:flutter/material.dart';

class ScienceCategoryView extends StatelessWidget {
  const ScienceCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BookGrid(books: scienceCategoryBooks);
  }
}

List<Book> scienceCategoryBooks = [
  Book(
    name: "A Brief History of Time",
    price: "\$12.20",
    author: "Stephen Hawking",
    imageUrl:
        "https://upload.wikimedia.org/wikipedia/en/a/a3/BriefHistoryTime.jpg",
  ),
  Book(
    name: "The Selfish Gene",
    price: "\$11.75",
    author: "Richard Dawkins",
    imageUrl:
        "https://i.ebayimg.com/images/g/p~kAAOSwr~lYsVyG/s-l960.webp",
  ),
  Book(
    name: "Cosmos",
    price: "\$13.50",
    author: "Carl Sagan",
    imageUrl:
        "https://m.media-amazon.com/images/I/710C5x4MzwL.jpg",
  ),
  Book(
    name: "The Gene: An Intimate History",
    price: "\$14.10",
    author: "Siddhartha Mukherjee",
    imageUrl:
        "https://i.ebayimg.com/images/g/R1wAAeSwGyVouv1F/s-l1600.webp",
  ),
  Book(
    name: "Silent Spring",
    price: "\$9.80",
    author: "Rachel Carson",
    imageUrl:
        "https://upload.wikimedia.org/wikipedia/en/a/ac/SilentSpring.jpg",
  ),
  Book(
    name: "The Origin of Species",
    price: "\$10.99",
    author: "Charles Darwin",
    imageUrl:
        "https://m.media-amazon.com/images/I/71ea0N8I14L.jpg",
  ),
  Book(
    name: "Astrophysics for People in a Hurry",
    price: "\$11.25",
    author: "Neil deGrasse Tyson",
    imageUrl:
        "https://i.ebayimg.com/images/g/y-AAAeSwfyxouia7/s-l1600.webp",
  ),
  Book(
    name: "The Elegant Universe",
    price: "\$13.95",
    author: "Brian Greene",
    imageUrl:
        "https://i.ebayimg.com/images/g/euIAAeSw63dor1qR/s-l960.webp",
  ),
];
