import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'article.dart';
import 'article_details.dart';

class NewsList extends StatefulWidget {
  NewsList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  __NewsListState createState() => __NewsListState();
}

class __NewsListState extends State<NewsList> {
  bool _isRequestSent = false;
  List<Article> articleList = [];

  @override
  Widget build(BuildContext context) {
    if (!_isRequestSent) {
      _sendRequest();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        child: !_isRequestSent
            ? CircularProgressIndicator()
            : Container(
                child: ListView.builder(
                    itemCount: articleList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return _getArticleWidgets(index);
                    }),
              ),
      ),
    );
  }

  void _sendRequest() async {
    String apiKey = "928161ee44754218bf713fd797f17ea7";
    String url =
        "https://newsapi.org/v2/top-headlines?country=ru&apiKey=$apiKey";
    http.Response response = await http.get(url);
    Map decode = json.decode(response.body);
    List articles = decode["articles"];
    for (var jsonObject in articles) {
      var article = Article.getArticleFromJson(jsonObject);
      articleList.add(article);
    }
    setState(() => _isRequestSent = true);
  }

  Widget _getArticleWidgets(int index) {
    var article = articleList[index];
    return GestureDetector(
      onTap: () {
        openDetailsUI(article);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5.0,
          child: Row(
            children: <Widget>[
              Container(
                width: 140.0,
                child: article.urlToImage != null
                    ? Image.network(
                        article.urlToImage,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        child: Icon(Icons.image, size: 52,),
                      ),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.all(5.0),
                child: Text(
                  article.title,
                  style: TextStyle(color: Colors.black, fontSize: 12.0),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  openDetailsUI(Article article) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => new ArticleDetails(article)));
  }
}
