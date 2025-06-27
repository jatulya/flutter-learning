import 'package:get_it/get_it.dart';
import 'package:my_first_app/cubit/movie/movie_cubit.dart';
import 'package:my_first_app/repositories/movie_repositories.dart';
import 'package:my_first_app/services/movie_services.dart';


final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => MovieService());
  getIt.registerLazySingleton(() => MovieRepository(getIt<MovieService>()));
  getIt.registerFactory(() => MovieCubit(getIt<MovieRepository>()));
}