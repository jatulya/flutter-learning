import 'package:flutter/material.dart';

class Homepage extends StatelessWidget{
  const Homepage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child : Container(
        padding: EdgeInsets.all(20),
        child : Row (
          children: [
            Container ( 
              decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              height: 35,
              width: 35,
              child : Icon(
                Icons.menu, 
                color: Colors.blueGrey[300],),
            ),
            SizedBox(width: 96,),

            Text('Homepage'),

            SizedBox(width: 96,),
            Container ( 
              decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              height: 35,
              width: 35,
              child : Icon(
                Icons.notifications, 
                color: Colors.blueGrey[300],),
            ),

            

          ],)
      )
    );    
  }
}