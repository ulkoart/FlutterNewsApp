import 'package:flutter/material.dart';
import 'models/article.dart';
import 'article_details.dart';

class ArticleItem extends StatelessWidget {
  // ArticleItem(this.article);
  // final Article article;

  final Article article;

  ArticleItem({Article article}) : this.article = article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) => new ArticleDetails(article)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: Card(
          shape: RoundedRectangleBorder(
            // side: BorderSide(color: Colors.blue, width: 1.0),
            borderRadius: BorderRadius.circular(0.0),
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
                        child: Icon(
                          Icons.image,
                          size: 52,
                        ),
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

  // openDetailsUI(Article article) {
  //   Navigator.push(
  //       context,
  //       new MaterialPageRoute(
  //           builder: (BuildContext context) => new ArticleDetails(article)));
  // }
}
