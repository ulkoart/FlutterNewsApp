class Article {
  String title;
  String urlToImage;
  String url;
  String publishedAt;

  Article(this.title, this.urlToImage, this.url, this.publishedAt);

  static Article getArticleFromJson(dynamic jsonObject) {
    String title = jsonObject['title'];
    String urlToImage = jsonObject['urlToImage'];
    String url = jsonObject['url'];
    String publishedAt = jsonObject['publishedAt'];

    return new Article(title, urlToImage, url, publishedAt);
  }

  @override
  String toString() {
    return "$title";
  }
}
