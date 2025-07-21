import 'package:flutter/material.dart';

class MaxSeats extends StatelessWidget {
  const MaxSeats({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        floatingActionButton: GestureDetector(
          onTap: () => {Navigator.pop(context)},
          child: Icon(Icons.arrow_back),
        ),
        body: Container(
          margin: EdgeInsets.only(top : 100, left : 40, right : 40),
          padding: EdgeInsets.all(15),
          color: const Color.fromARGB(255, 81, 180, 230),
          child : Text('Maximum Seats exceeded. Go back and reduce people.')
        ),
      ),
    );
  }
}
