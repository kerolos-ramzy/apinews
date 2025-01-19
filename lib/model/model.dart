class ArticleModel {
  final String urlToImage;
  final String title;
  final String description;
  final String author;
  final String publishedAt;
  final String content;

  ArticleModel(
      {required this.title,
      required this.description,
      required this.author,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});
}
