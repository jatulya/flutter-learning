// movie_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_first_app/cubit/movie/movie_cubit.dart';
import 'package:my_first_app/cubit/movie/movie_locator.dart';
import 'package:my_first_app/cubit/movie/movie_state.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MovieCubit>()..loadMovie("Guardians OF the GALaxy"),
      child: Scaffold(
        appBar: AppBar(title: Text('Movie Search')),
        body: BlocBuilder<MovieCubit, MovieState>(
          builder: (context, state) {
            if (state.loading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state.error != null) {
              return Center(child: Text(state.error!));
            }
            if (state.movie == null) {
              return Center(child: Text('No movie found'));
            }

            final movie = state.movie!;
            return ListTile(
              leading: Image.network(
                movie.posterPath,
                errorBuilder: (context, _, __) => Icon(Icons.movie),
              ),
              title: Text(movie.title),
            );
          },
        ),
      ),
    );
  }
}
