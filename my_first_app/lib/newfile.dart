import 'package:flutter/material.dart';

class Newfile extends StatelessWidget{
  @override

  Widget build (BuildContext context){
    return Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26), 
              borderRadius: BorderRadius.all(Radius.circular(3)),
            ),
            child: Center(
              child : Text('hello', 
                        style : TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold  
                      )
            )) ,           
          ),
          SizedBox(height: 5),
          SizedBox(
            height: 50,
            child:Row(
            children: [
              Text('Hello1'), 
              SizedBox(width: 12),
              Text('Hello2'),
              Text('Hello3')
            ],            
          ) ,
          )
          
        ],
      
    );
  }
}

class NewList extends StatelessWidget {
  @override

  Widget build (BuildContext context){
    return SizedBox(
      height : 100,
      child: ListView(
        padding: const EdgeInsets.all(3),
        children : <Widget>[
          Container(
            height: 20,
            color: Colors.lightBlue.shade100,
            child: const Center(
              child: Text('Entry 1'),
            ),
          ),
          Container(
            height: 30,
            color: Colors.lightBlue.shade200,
            child: const Center(
              child: Text('Entry 1'),
            ),
          ),
          Container(
            height: 40,
            color: Colors.lightBlue.shade300,
            child: const Center(
              child: Text('Entry 1'),
            ),
          )
        ]
      ),
    );
  }
}

class NewListBuilder extends StatelessWidget {
  static List<String> _values = <String>['A', 'B', 'C'];
  static List<int> _colorCodes = <int>[300,200,100];

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 150,
      child: ListView.builder(
        padding: const EdgeInsets.all(7),
        itemCount: _values.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            height: 50,
            color: Colors.lightBlue[_colorCodes[index]],
            child: Center(child : Text('Entry ${_values[index]}')),
        );
      }
    )
  );
  }
}