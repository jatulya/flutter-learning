import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_first_app/bloc/login_bloc.dart';
import 'package:my_first_app/cubit/login_cubit.dart';
import 'package:my_first_app/loggedin.dart';
import 'package:my_first_app/login.dart';

void main (){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child : MaterialApp(
        home : LoginForm(),
        title: 'Login PAge Demo',
        routes: {
          '/logged-in' : (context) => LoggedInPage()
        },
      )
    ); 
  }
}
