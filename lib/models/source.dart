
class Source {
  String name;

  Source(this.name);

  static Source getSourceFromJson(dynamic jsonObject) {
    String name = jsonObject['name'];
    return Source(name);
  }

}