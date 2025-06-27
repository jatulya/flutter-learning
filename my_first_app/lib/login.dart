import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_first_app/bloc/login_bloc.dart';
import 'package:my_first_app/bloc/login_event.dart';
import 'package:my_first_app/bloc/login_state.dart';

class Arguements {
  String email;
  String password;

  Arguements(this.email, this.password);
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Scaffold(
        backgroundColor: Colors.black,
        
        body: BlocConsumer<LoginBloc, LoginState>(
          listenWhen: (prev, curr) =>
              prev.enabled != curr.enabled && curr.enabled,
          listener: (context, state) {},
          buildWhen: (prev, curr) => prev.enabled != curr.enabled,
          builder: (context, state) {
            return SizedBox(
              height: 1000,
              child: ListView(
                children: [
                  Container(
                    height: 120,
                    padding: EdgeInsets.only(top: 30),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter Your Credentials',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "You'll use this email to make and track investments",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 80),

                  Container(
                    height: 210,
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('EMAIL', style: TextStyle(color: Colors.white60)),

                        SizedBox(height: 10),

                        TextField(
                          cursorColor: Colors.green[200],
                          style: TextStyle(color: Colors.green[300]),
                          decoration: InputDecoration(
                            hintText: "firstname@domain.com",
                            hintStyle: TextStyle(
                              color: const Color.fromARGB(255, 152, 179, 153),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2,
                              ),
                            ),
                          ),
                          onChanged: (text) {
                            context.read<LoginBloc>().add(EmailChanged(text));
                          },
                        ),

                        SizedBox(height: 20),

                        Text(
                          'PASSWORD',
                          style: TextStyle(color: Colors.white60),
                        ),

                        SizedBox(height: 10),

                        TextField(
                          cursorColor: Colors.green[200],
                          style: TextStyle(color: Colors.green[300]),
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter your  password",
                            hintStyle: TextStyle(
                              color: const Color.fromARGB(255, 152, 179, 153),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2,
                              ),
                            ),
                          ),
                          onChanged: (text) {
                            context.read<LoginBloc>().add(
                              PasswordChanged(text),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 200),

                  Visibility(
                    visible: state.enabled,
                    child: FilledButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll<Color>(
                          Colors.green,
                        ),
                      ),
                      onPressed: () {
                        if (state.email != 'atulya@gmail.com') {
                          Fluttertoast.showToast(
                            msg: "Wrong credentials. Type again",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.redAccent,
                            textColor: Colors.white,
                          );
                          return;
                        }
                        Navigator.pushNamed(
                          context,
                          '/logged-in',
                          arguments: Arguements(state.email, state.password),
                        );
                      },
                      child: Text('Login'),
                    ),
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
