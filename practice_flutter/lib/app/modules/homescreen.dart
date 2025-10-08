import 'package:flutter/material.dart';
import 'package:practice_flutter/app/common/constants/lists.dart';
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
            Text(AppStrings.home.translate(), style: AppTextStyles.title24),
            const SizedBox(height: 24),
            // Button
            ListView.builder(
              shrinkWrap: true,
              itemCount: homeButtons.length,
              itemBuilder: (context, index) {
                final item = homeButtons[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, item.buttonNavigation);
                    },
                    child: Text(
                      item.buttonName,
                      style: AppTextStyles.lightBody,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
