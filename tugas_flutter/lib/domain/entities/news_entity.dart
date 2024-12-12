class NewsEntity {
  final String category;
  final String title;
  final String image;
  final int createdAt;
  final String author;
  final String description;

  NewsEntity({
    required this.category,
    required this.title,
    required this.image,
    required this.createdAt,
    required this.author,
    required this.description,
  });
}
