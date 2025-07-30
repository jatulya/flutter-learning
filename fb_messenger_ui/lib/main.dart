import 'package:fb_messenger_ui/app/common/styles/themes.dart';
import 'package:fb_messenger_ui/app/pages/chat_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // or ThemeMode.dark / light
      home: ChatPage(),
    );
  }
}

