import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appTitle.translate(context)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Heading
            Text(
              StringValues.home.translate(context),
              style: AppTextStyles.thick24(context),
            ),

            const SizedBox(height: 24),

            // Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.about);
              },
              child: Text(
                StringValues.about.translate(context),
                style: AppTextStyles.thick20(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

