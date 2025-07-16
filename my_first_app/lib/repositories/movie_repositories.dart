import 'package:injectable/injectable.dart';
import 'package:my_first_app/models.dart';
import 'package:my_first_app/services/movie_services.dart';

abstract class IMovieRepository {
  Future<Movie> getMovieByTitle(String title);
}

@Injectable(as: IMovieRepository)
class MovieRepository implements IMovieRepository {
  final MovieService service ;
  MovieRepository(this.service);

  @override
   Future<Movie> getMovieByTitle(String title) async {
    return await service.fetchMovieByTitle(title);
   
  }
}
