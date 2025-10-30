import 'package:flutter/material.dart';
import 'package:practice_flutter/app/modules/page_flip/widgets/dark_page.dart';
import 'package:practice_flutter/app/modules/page_flip/widgets/light_page.dart';
import 'package:practice_flutter/app/modules/page_flip/widgets/page_flip_builder.dart';

class PageFlip extends StatelessWidget {
  const PageFlip({super.key});

  @override
  Widget build(BuildContext context) {
    final pageFlipKey = GlobalKey<PageFlipBuilderState>();

    return Scaffold(
      backgroundColor: Colors.black, // Prevent flicker during animation
      body: PageFlipBuilder(
        key: pageFlipKey,
        frontBuilder: (_) => LightPage(
          onFlip: () => pageFlipKey.currentState?.flip(),
        ),
        backBuilder: (_) => DarkPage(
          onFlip: () => pageFlipKey.currentState?.flip(),
        ),
      ),
    );
  }
}
