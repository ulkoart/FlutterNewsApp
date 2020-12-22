import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'article.dart';

class ArticleDetails extends StatefulWidget {
  ArticleDetails(this.article);

  final Article article;

  @override
  State<StatefulWidget> createState() => new _ArticleDetailsState(article);
}

class _ArticleDetailsState extends State<ArticleDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final Article article;

  _ArticleDetailsState(this.article);

  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: AppBar(
          title: Text(
            article.source.name,
            style: TextStyle(fontSize: 16.0),
            overflow: TextOverflow.fade,
          ),
        ),
        body: Scaffold(
          key: _scaffoldKey,
          body: _articleCardView(),
        ),
      );

  Widget _articleCardView() {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Text(
            article.title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Divider(
              height: 1.0,
              color: Colors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.calendar_today
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(getFormattedTime()),
              )
            ],
          ),
          Container(
            height: 150.0,
            margin: EdgeInsets.all(10.0),
            child: article.urlToImage != null ? Image.network(
              article.urlToImage,
              fit: BoxFit.cover,
            ) : Container(
              child: Icon(Icons.image, size: 52,),
            ),
          ),
          Text(
            article.title,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: FlatButton(
              onPressed: _launchURL,
              child: Text(
                "читать полностью",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).accentColor
            ),
          )
        ],
      ),
    );
  }

  String getFormattedTime() {
    DateTime publishedAtRaw = DateTime.parse(article.publishedAt);
    print(publishedAtRaw);
    String formattedDate = DateFormat('dd-MM-yyyy – hh:mm').format(publishedAtRaw);
    return formattedDate;
  }

  // Todo https://pub.dev/packages/url_launcher хз чет не пашет
  void _launchURL() async {
    if (await canLaunch(article.url)) {
      await launch(article.url);
    } else {
      throw 'Could not launch $article.url';
    }
  }
}
