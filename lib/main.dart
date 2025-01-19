import 'package:apinews/pages/splashpage.dart';
import 'package:flutter/material.dart';

void main() {
  // Newsservice().getNews(selectedcategory);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashpage(),
    );
  }
}
