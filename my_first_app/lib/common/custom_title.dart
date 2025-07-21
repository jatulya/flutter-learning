import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  const CustomTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style : TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.bold
        )),
    ) ;
  }
}