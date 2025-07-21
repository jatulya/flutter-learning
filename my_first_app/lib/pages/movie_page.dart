// movie_page.dart
import 'package:flutter/material.dart';
import 'package:my_first_app/common/custom_title.dart';
import 'package:my_first_app/common/movie_widget.dart';
import 'package:my_first_app/common/seat_counter.dart';


class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  static const itemsList = [
      CustomTitle(title: 'Select the Seats'),
      MovieWidget(), 
      SeatCounter()  
  ];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: Colors.grey[850],
   body:  Container(
    height: 1500,
    padding: EdgeInsets.all(10),
    child: ListView.separated(
      itemBuilder: (context, index) => itemsList[index], 
      separatorBuilder: (context, index) => const SizedBox(height: 10,), 
      itemCount: itemsList.length),
   )
   );
  }
}

