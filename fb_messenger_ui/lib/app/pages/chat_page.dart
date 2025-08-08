import 'package:fb_messenger_ui/app/common/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
   ChatPage({super.key});
  final TextEditingController _searchController = TextEditingController();

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          SearchBarWidget(controller: _searchController),
        ]
      ),
    );
  }
}