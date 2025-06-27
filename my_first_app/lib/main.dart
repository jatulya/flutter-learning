import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:my_first_app/cubit/movie/movie_locator.dart';
import 'package:my_first_app/pages/loggedin.dart';
import 'package:my_first_app/pages/login.dart';
import 'package:my_first_app/pages/movie_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // try {
  //   dotenv.load(fileName: ".env"); 
  // } 
  // catch (e){
  //   debugPrint("Error ******** $e");
  // }
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : LoginForm(),
        title: 'Login PAge Demo',
        routes: {
          '/logged-in' : (context) => LoggedInPage(),
          '/movie-page' : (context) => MoviePage()
        },
      ); 
  }
}
