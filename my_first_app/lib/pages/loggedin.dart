import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_first_app/cubit/loggedin/logged_in_cubit.dart';
import 'package:my_first_app/cubit/loggedin/logged_in_state.dart';
import 'package:my_first_app/pages/login.dart';

class LoggedInPage extends StatelessWidget {
  final String? email;
  final String? password;

  const LoggedInPage ({super.key, this.email, this.password});

  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)?.settings.arguments) as Arguements ;

    return BlocProvider(
      create: (_) => LoggedInCubit(),
      child : Material(
        child: BlocBuilder<LoggedInCubit, LoggedInState>(
              builder: (context, state) {
        context.read<LoggedInCubit>().initCubit();
              return  Center(
        child: SizedBox(
          height: 100,
          child : Column(
            children: [
              SizedBox(
                child: Row(children: [
                  Text("Sender : "), 
                  SizedBox(width: 10),
                  Text(state.sender ?? 'null value'),
                ]),
              ),
              
              SizedBox(
                child: Row(children: [
                  Text("Email : "), 
                  SizedBox(width: 10),
                  Text(args.email)
                ]),
              ),
              
              Row(children: [
                Text('Password : '), 
                SizedBox(width: 10),
                Text(args.password)
              ] ),
        
              GestureDetector(
                onTap : () => {
                  Navigator.pushNamed(context, '/movie-page')
                },
                child : Icon(Icons.arrow_back)
              )
            ],
          )
        ),
              );
          }),
      )
    ); 
  }
}

