

class Source {
  String name;

  Source(this.name);

  static Source getSourceFromJson(dynamic jsonObject) {
    String name = jsonObject['name'];
    return Source(name);
  }

}

class Article {
  String title;
  String urlToImage;
  String url;
  String publishedAt;
  Source source;

  Article(this.title, this.urlToImage, this.url, this.publishedAt, this.source);

  static Article getArticleFromJson(dynamic jsonObject) {
    String title = jsonObject['title'];
    String urlToImage = jsonObject['urlToImage'];
    String url = jsonObject['url'];
    String publishedAt = jsonObject['publishedAt'];
    Source source = Source.getSourceFromJson(jsonObject['source']);

    return Article(title, urlToImage, url, publishedAt, source);
  }

  @override
  String toString() {
    return "$title";
  }
}
