import 'package:fb_messenger_ui/app/components/stories.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Stories(),
        ],
      ),
    );
  }
}