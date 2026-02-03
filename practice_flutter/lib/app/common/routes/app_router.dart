import 'package:flutter/material.dart';
import 'package:practice_flutter/app/common/routes/app_routes.dart';
import 'package:practice_flutter/app/modules/homescreen.dart';
import 'package:practice_flutter/app/modules/page_flip/page_flip.dart';
import 'package:practice_flutter/app/modules/slivers/sliver_practice_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.pageFlip:
        return MaterialPageRoute(builder: (_) => const PageFlip());
      case AppRoutes.sliverPractice:
        return MaterialPageRoute(builder: (_) => const SliverPracticePage());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("No route found"))),
        );
    }
  }
}
