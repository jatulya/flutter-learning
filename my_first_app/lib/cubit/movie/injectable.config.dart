// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:my_first_app/cubit/movie/injectable.dart' as _i758;
import 'package:my_first_app/cubit/movie/movie_cubit.dart' as _i1065;
import 'package:my_first_app/repositories/movie_repositories.dart' as _i322;
import 'package:my_first_app/services/movie_services.dart' as _i457;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i1065.MovieCubit>(() => _i1065.MovieCubit());
    gh.factory<_i457.MovieService>(() => _i457.MovieService());
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.factory<_i322.IMovieRepository>(
      () => _i322.MovieRepository(gh<_i457.MovieService>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i758.RegisterModule {}
