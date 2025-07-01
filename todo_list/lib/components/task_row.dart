import 'package:flutter/material.dart';

class TaskRow extends StatelessWidget {
  const TaskRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[50]!),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(15),
      height: 80,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
            clipBehavior: Clip.antiAlias, // Required to apply borderRadius!
            child: Image.asset(
              'images/todo_image.jpg',
              fit: BoxFit.cover, // Optional: scales image to fit nicely
            ),
          ),

          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Web Development',
                style: TextStyle(color: Colors.grey[900], fontSize: 18, fontWeight: FontWeight.w500),
              ),
              
              Text('09:00 AM - 11:00 AM', style: TextStyle(color: Colors.grey[400], fontSize : 13), )
            ],
          ),
        ],
      ),
    );
  }
}
