import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigationPage extends StatelessWidget{
  final String? stringValue;
  const NavigationPage({super.key, this.stringValue});

  @override
  Widget build(BuildContext context) {

    final arg = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    String a = arg['first'];
    return Material(
      child: SizedBox(
        height: 60,
        child: Text('Hey there $a'),
      ),
    );
  }
}