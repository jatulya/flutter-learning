import 'package:flutter/material.dart';
import 'package:practice_flutter/app/modules/page_flip/widgets/dark_page.dart';
import 'package:practice_flutter/app/modules/page_flip/widgets/light_page.dart';

class PageFlip extends StatefulWidget{
  const PageFlip({super.key});
  @override
  State<PageFlip> createState() => _PageFlipState();
}

class _PageFlipState extends State<PageFlip> {
  bool _isDark = true;
  @override
  Widget build(BuildContext context) {
     return _isDark ? const DarkPage() : const LightPage();
  }
}