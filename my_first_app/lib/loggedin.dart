import 'package:flutter/material.dart';
import 'package:my_first_app/login.dart';

class LoggedInPage extends StatelessWidget {
  final String? email;
  final String? password;

  const LoggedInPage ({super.key, this.email, this.password});

  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)?.settings.arguments) as Arguements ;

    return Material(
      child: Center(
        child: SizedBox(
          height: 100,
          child : Column(
            children: [
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
                  Navigator.pop(context)
                },
                child : Icon(Icons.arrow_back)
              )
            ],
          )
        ),
      ),
    );
  }
}

