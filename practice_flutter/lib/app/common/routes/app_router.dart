import 'package:flutter/material.dart';
import 'package:practice_flutter/app/common/routes/app_routes.dart';
import 'package:practice_flutter/app/modules/homescreen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.pageFlip:
        return MaterialPageRoute(builder: (_) => const Scaffold(
            body: Center(child: Text("PAgeflip page")),
          ),);
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("No route found")),
          ),
        );
    }
  }
}
