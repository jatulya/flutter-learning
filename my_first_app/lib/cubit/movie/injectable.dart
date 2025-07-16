import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_first_app/cubit/movie/injectable.config.dart';


final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureInjections() async { 
  print("Log from myself : Entered config"); 
  getIt.init();
  print("Log from myself : Instance created.");
  }

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio();
}
