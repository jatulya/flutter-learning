import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_first_app/cubit/movie/injectable.config.dart'; //run build_runner to genrate this file

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureInjections() async => getIt.init();
  
@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio();
}
