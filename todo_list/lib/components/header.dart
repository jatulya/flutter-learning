import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row (
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            

            Text('Homepage', style: TextStyle(fontSize: 18),),

        
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
          ]
      
    );
  }
}