import 'package:flutter/material.dart';
import 'package:practice_flutter/app/common/constants/strings/app_strings.dart';
import 'package:practice_flutter/app/common/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle.translate(context),
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
