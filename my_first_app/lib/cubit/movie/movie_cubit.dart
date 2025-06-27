
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_first_app/cubit/movie/movie_state.dart';
import 'package:my_first_app/models.dart';
import 'package:my_first_app/repositories/movie_repositories.dart';



class MovieCubit extends Cubit<MovieState> {
  final MovieRepository repository;

  MovieCubit(this.repository) : super(MovieState.initial());

  void loadMovie(String title) async {
    emit(MovieState(loading: true));
    try {
      final movie = await repository.getMovieByTitle(title);
      emit(MovieState(movie: movie));
    } catch (e) {
      emit(MovieState(error: e.toString()));
    }
  }
}
