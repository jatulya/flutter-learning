// movie.dart
class Movie {
  final String title;
  final String posterPath;

  Movie({required this.title, required this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'],
      posterPath: json['Poster'] ?? '',
    );
  }
}