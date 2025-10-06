import 'package:flutter/material.dart';
import 'package:practice_flutter/app/common/exports.dart';
import 'package:practice_flutter/app/common/extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appTitle.translate()),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Heading
            Text(
              AppStrings.home.translate(),
              style: AppTextStyles.lightHeadline1,
            ),

            const SizedBox(height: 24),

            // Button
            
          ],
        ),
      ),
    );
  }
}

