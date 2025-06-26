import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _increment(){
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          

          GestureDetector(
            child : Icon(
              Icons.add,
              color: Colors.red,
              size : 36.0
            ),
            onTap: (){
              _increment();
            }
          ),
          SizedBox(width: 10),
          Text(
            '$_counter',
            style: TextStyle(color: Colors.pink[200]),
            )
        ],
      ),
    );
  }
}