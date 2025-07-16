import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_first_app/cubit/movie/injectable.dart';
import 'package:my_first_app/cubit/movie/movie_state.dart';
import 'package:my_first_app/repositories/movie_repositories.dart';

@Injectable()
class MovieCubit extends Cubit<MovieState> {
  final IMovieRepository repository = getIt<IMovieRepository>();
  MovieCubit() : super(MovieState.initial());

  void loadMovie(String title) async {
    emit(MovieState(loading: true));
    try {
      final movieInfo = await repository.getMovieByTitle(title);
      emit(MovieState(movie: movieInfo));
    } catch (e) {
      emit(MovieState(error: e.toString()));
    }
  }
}
