import 'package:apinews/model/model.dart';
import 'package:dio/dio.dart';

class Newsservice {
  final Dio dio = Dio();

  Future<List<ArticleModel>> getNews(String category) async {
    // API call to get news
    final response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=&category=$category");
    Map<String, dynamic> json = response.data;
    // log(json.toString());
    List<dynamic> articles = json['articles'];
    List<ArticleModel> arts = [];
    for (var art in articles) {
      ArticleModel article = ArticleModel(
        title: art["title"] ?? "No Title",
        description: art["description"] ?? "No Description",
        urlToImage: art["urlToImage"] ??
            "https://w7.pngwing.com/pngs/658/622/png-transparent-page-not-found-illustration-thumbnail.png",
        publishedAt: art["publishedAt"] ?? "No Date",
        author: art["author"] ?? "No Author",
        content: art["content"] ?? "No Content",
      );
      arts.add(article);
    }
    return arts;
  }
}
