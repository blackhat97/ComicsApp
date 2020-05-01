class RecommendEveryDay {
  int id;
  String cover;
  String title;
  String author;
  dynamic rating;

  RecommendEveryDay.fromJson(Map data) {
    id = data['id'];
    cover = data['cover'];
    title = data['title'];
    author = data['author'];
    rating = data['rating'];
  }
}
