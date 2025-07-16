import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_first_app/cubit/movie/movie_cubit.dart';
import 'package:my_first_app/cubit/movie/movie_locator.dart';
import 'package:my_first_app/cubit/movie/movie_state.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieCubit()..loadMovie("Guardians of the GalaxY"),
      child: Container(
        height: 638,
        padding: EdgeInsets.all(10),

        child: BlocConsumer<MovieCubit, MovieState>(
          listenWhen: (prev, curr) => prev.loading != curr.loading,
          listener: (context, state) {},
          buildWhen: (prev, curr) => prev.loading != curr.loading,
          builder: (context, state) {
            if (state.loading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state.error != null) {
              return Center(child: Text(state.error!));
            }

            final movie = state.movie!;
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    movie.posterPath,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return CircularProgressIndicator(); // shows a loader while image is loading
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.broken_image,
                      );
                    },
                  ),

                  Text(
                    movie.genre.toUpperCase(),
                    style: TextStyle(color: Colors.grey[400], fontSize: 18),
                  ),

                  Text(
                    movie.title.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
                  ),

                  Text(
                    movie.date.toString(),
                    style: TextStyle(color: Colors.grey[400], fontSize: 18),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
