// movie_service.dart
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models.dart';

class MovieService {
  final Dio _dio = Dio();
  // final String _apiKey = dotenv.env['API_KEY'] ?? '';

  Future<Movie> fetchMovieByTitle(String title) async {
    final response = await _dio.get(
      'http://www.omdbapi.com/',
      queryParameters: {
        't': title,
        'apikey': '',
      },
    );

    final data = response.data;

    if (data['Response'] == 'False') {
      throw Exception(data['Error']);
    }

    return Movie.fromJson(data);
  }
}
