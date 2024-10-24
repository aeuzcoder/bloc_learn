class User {
  final int id;
  final String title;
  final String urlSmallImage;
  final String urlBigImage;

  User({
    required this.id,
    required this.title,
    required this.urlSmallImage,
    required this.urlBigImage,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      title: json['title'],
      urlSmallImage: json['thumbnailUrl'],
      urlBigImage: json['url'],
    );
  }
}
