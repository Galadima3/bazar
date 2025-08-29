class Book {
  final String name;
  final String price;
  final String author;
  String? imageUrl;

  Book({required this.name, required this.price, required this.author, this.imageUrl});
}