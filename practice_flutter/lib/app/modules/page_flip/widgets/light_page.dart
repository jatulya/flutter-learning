import 'package:flutter/material.dart';
import 'package:practice_flutter/app/common/exports.dart';
import 'package:practice_flutter/app/common/extensions.dart';

class LightPage extends StatelessWidget {
  const LightPage({super.key});

  static const String profileImageUrl =
      "https://images.unsplash.com/vector-1743321182619-a3a4279a911b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZmlsZSUyMHBob3RvfGVufDB8fDB8fHww";
  static const String centerImageUrl =
      "https://images.unsplash.com/vector-1758527144432-e916b7c7cb82?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8ZGF5JTIwc2t5fGVufDB8fDB8fHww";

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppColors.lightAccent, width: 2),
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
                    AppStrings.pageFlipLightHeading.translate(),
                    style: AppTextStyles.lightCardTitle,
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
            const Icon(Icons.flip, color: AppColors.lightTextPrimary, size: 36),
          ],
        ),
      ),
    );
  }
}
