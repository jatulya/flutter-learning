import 'package:flutter/material.dart';

class Subheading extends StatelessWidget{
  const Subheading ({super.key});

  @override
  Widget build(BuildContext context) {
    return Row (
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(
        "Today's Task",
        style: TextStyle(
          fontSize: 18,
          color: Colors.indigo[900]
        ) ,
      ),

      SizedBox(width: 20,),

      Text(
        'See All',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 14
        ),
      )
    ],
    );
  }
}