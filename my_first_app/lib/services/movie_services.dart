// movie_service.dart
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:my_first_app/cubit/movie/injectable.dart';
import '../models.dart';

@Injectable()
class MovieService {
  MovieService();   // 👉 inject Dio instead of creating it

  final Dio _dio = getIt<Dio>();

  /// Returns a parsed `Movie` or throws an [Exception].
  Future<Movie> fetchMovieByTitle(String title) async {
  
      final response = await _dio.get(
        'http://www.omdbapi.com/',
        queryParameters: {'t': title, 'apikey': 'd3e1282b'},
      );

      final data =  response.data as Map<String, dynamic>;
      print("Log from myself : Services : $data");

      if (data['Response'] == 'False') {
        throw Exception(data['Error']);
      }

      print("Log from myself : Services : Movie after truncate : ${Movie.fromJson(data).genre}");
      return Movie.fromJson(data);
    
  }
}