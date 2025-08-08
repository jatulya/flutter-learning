import 'package:fb_messenger_ui/app/common/widgets/chat_app_bar.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar :  ChatAppBar(),
    );
  }
}