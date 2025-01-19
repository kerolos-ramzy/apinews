import 'package:apinews/model/model.dart';
import 'package:flutter/material.dart';

class Everyevent extends StatelessWidget {
  const Everyevent({super.key, required this.article});
  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3c4cd4),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          article.publishedAt,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(article.urlToImage), fit: BoxFit.fill)),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              article.title,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              article.description,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              article.content,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              "Author: " + article.author,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
