// movie.dart
class Movie {
  final String title;
  final String posterPath;
  final String date;
  final String genre;


  Movie({required this.title, required this.posterPath, required this.date, required this.genre});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'],
      posterPath: json['Poster'] ?? '',
      date: json['Released'],
      genre: json['Genre']
    );
  }
}

// {
//   "Title": "Friends",
//   "Year": "1994–2004",
//   "Rated": "TV-14",
//   "Released": "22 Sep 1994",
//   "Runtime": "22 min",
//   "Genre": "Comedy, Romance",
//   "Director": "N/A",
//   "Writer": "David Crane, Marta Kauffman",
//   "Actors": "Jennifer Aniston, Courteney Cox, Lisa Kudrow",
//   "Plot": "Follows the personal and professional lives of six twenty to thirty year-old friends living in the Manhattan borough of New York City.",
//   "Language": "English, Spanish, Italian, French, Dutch, Hebrew",
//   "Country": "United States",
//   "Awards": "Won 6 Primetime Emmys. 79 wins & 231 nominations total",
//   "Poster": "https://m.media-amazon.com/images/M/MV5BOTU2YmM5ZjctOGVlMC00YTczLTljM2MtYjhlNGI5YWMyZjFkXkEyXkFqcGc@._V1_SX300.jpg",
//   "Ratings": [
//     {
//       "Source": "Internet Movie Database",
//       "Value": "8.9/10"
//     }
//   ],
//   "Metascore": "N/A",
//   "imdbRating": "8.9",
//   "imdbVotes": "1,147,483",
//   "imdbID": "tt0108778",
//   "Type": "series",
//   "totalSeasons": "10",
//   "Response": "True"
// }