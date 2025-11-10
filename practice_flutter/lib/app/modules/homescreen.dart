import 'package:flutter/material.dart';
import 'package:practice_flutter/app/common/constants/constant_values.dart';
import 'package:practice_flutter/app/common/exports.dart';
import 'package:practice_flutter/app/common/extensions.dart';
import 'package:practice_flutter/app/common/widgets/pushable_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appTitle.translate()),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Heading
          Text(AppStrings.home.translate(), style: AppTextStyles.title46),
          const SizedBox(height: AppSpacing.lg),
          // Button
          ListView.builder(
            shrinkWrap: true,
            itemCount: homeButtons.length,
            itemBuilder: (context, index) {
              final item = homeButtons[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.sm,
                  horizontal: AppSpacing.md,
                ),
                child: PushableButton(
                  text: item.buttonName,
                  onPressed: () {
                    Navigator.pushNamed(context, item.buttonNavigation);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
