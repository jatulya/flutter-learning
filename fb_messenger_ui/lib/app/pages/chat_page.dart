import 'package:fb_messenger_ui/app/common/widgets/chat_app_bar.dart';
import 'package:fb_messenger_ui/app/common/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
   ChatPage({super.key});
  final TextEditingController _searchController = TextEditingController();

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar :  ChatAppBar(),
      body: Column(
        children: [
          SearchBarWidget(controller: _searchController),
        ]
      ),
    );
  }
}