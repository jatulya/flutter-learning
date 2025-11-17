import 'package:flutter/material.dart';
import 'package:practice_flutter/app/common/extensions.dart';
import 'package:practice_flutter/app/common/exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle.translate(),
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRouter.generateRoute,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
