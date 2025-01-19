import 'package:apinews/model/model.dart';
import 'package:flutter/material.dart';

class AritcleCard extends StatelessWidget {
  const AritcleCard({super.key, required this.article});
  final ArticleModel article;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blue,
      ),
      child: Row(
        children: [
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image(
                fit: BoxFit.fill,
                image: NetworkImage(
                  article.urlToImage,
                )),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 175,
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/newsify.png"),
                      radius: 22,
                    ),
                    title: Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      article.author,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    article.title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    article.publishedAt,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
