class User {
  int? userId;
  int? id;
  String? title;
  String? body;

  User({this.userId, this.id, this.title, this.body});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
// const feed = {}['feed'][0]['content']["details"];
class Recipe {
  String name;
  String image;
  double rating;
  String totalTime;

  Recipe(
      {required this.name,
      required this.image,
      required this.rating,
      required this.totalTime});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      name: json["name"] as String,
      image: json["images"][0]["hostedLargeUrl"] as String,
      rating: json["rating"] as double,
      totalTime: json["totalTime"] as String,
    );
  }
  static List<Recipe> recipesFromSnapshot (List snapshot) {
    return snapshot.map((data) => Recipe.fromJson(data)).toList();
  }
}
