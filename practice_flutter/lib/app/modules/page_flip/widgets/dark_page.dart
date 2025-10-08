import 'package:flutter/material.dart';
import 'package:practice_flutter/app/common/constants/constant_values.dart';
import 'package:practice_flutter/app/common/exports.dart';
import 'package:practice_flutter/app/common/extensions.dart';

class DarkPage extends StatelessWidget {
  const DarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String profileImageUrl = pageFlipImages[0].darkModeImage;
    final String centerImageUrl = pageFlipImages[1].darkModeImage;
    return Card(
      color: AppColors.darkSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppColors.darkAccent, width: 2),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    AppStrings.pageFlipDarkCardHeading.translate(),
                    style: AppTextStyles.darkCardTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                // Profile image
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
            const Icon(Icons.flip, color: AppColors.darkTextPrimary, size: 36),
          ],
        ),
      ),
    );
  }
}
