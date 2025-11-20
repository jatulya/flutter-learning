import 'package:flutter/material.dart';
import 'package:practice_flutter/app/common/constants/constant_values.dart';
import 'package:practice_flutter/app/common/exports.dart';
import 'package:practice_flutter/app/common/extensions.dart';

class LightPage extends StatelessWidget {
  final VoidCallback? onFlip;
  const LightPage({super.key, this.onFlip});

  @override
  Widget build(BuildContext context) {
    final String profileImageUrl = pageFlipImages[0].lightModeImage;
    final String centerImageUrl = pageFlipImages[1].lightModeImage;
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.lightAccent, width: 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.lightTextPrimary,
                  size: AppSpacing.lg,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  AppStrings.pageFlipLightCardHeading.translate(),
                  style: AppTextStyles.lightCardTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              CircleAvatar(
                radius: 36,
                backgroundImage: NetworkImage(profileImageUrl),
              ),
            ],
          ),
          CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(centerImageUrl),
          ),
          GestureDetector(
            onTap: () {
              onFlip?.call();
            },
            child: const Icon(
              Icons.flip,
              color: AppColors.lightTextPrimary,
              size: 36,
            ),
          ),
        ],
      ),
    );
  }
}
