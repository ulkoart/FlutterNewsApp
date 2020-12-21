import 'package:flutter/material.dart';

import 'news_list.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsList(title: "News App"),
    );
  }
}