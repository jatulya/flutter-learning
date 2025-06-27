import 'package:my_first_app/models.dart';

class MovieState {
  final Movie? movie;
  final bool loading;
  final String? error;

  MovieState({this.movie, this.loading = false, this.error});

  factory MovieState.initial() => MovieState();
}
