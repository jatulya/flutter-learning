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
        leading: const SizedBox.shrink(),
      ),

      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Heading
          Text(AppStrings.home.translate(), style: AppTextStyles.title46),
          const SizedBox(height: AppSpacing.spacing24),
          // Button
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 50),
              scrollDirection: Axis.vertical,
              itemCount: homeButtons.length,
              itemBuilder: (context, index) {
                final item = homeButtons[index];
                return PushableButton(
                  text: item.buttonName,
                  onPressed: () {
                    Navigator.pushNamed(context, item.buttonNavigation);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
