class User {
  final String name;
  final String imageUrl;
  final bool isOnline;
  final bool viewedStory;

  User({
    required this.name,
    required this.imageUrl,
    required this.isOnline,
    required this.viewedStory,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      imageUrl: json['imageUrl'],
      isOnline: json['isOnline'],
      viewedStory: json['viewedStory'],
    );
  }
}