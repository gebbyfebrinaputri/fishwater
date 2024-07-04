class Blog {
  final String title;
  final String description;
  final String imageUrl;
  int likes;
  List<String> comments;

  Blog({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.likes = 0,
    this.comments = const [],
  });
}
