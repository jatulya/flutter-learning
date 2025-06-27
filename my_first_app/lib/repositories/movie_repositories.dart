import 'package:my_first_app/services/movie_services.dart';
import '../models.dart';


class MovieRepository {
  final MovieService service;
  MovieRepository(this.service);

  Future<Movie> getMovieByTitle(String title) =>
      service.fetchMovieByTitle(title);
}
