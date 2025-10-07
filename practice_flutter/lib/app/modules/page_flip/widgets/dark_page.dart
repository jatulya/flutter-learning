import 'package:flutter/material.dart';
import 'package:practice_flutter/app/common/exports.dart';
import 'package:practice_flutter/app/common/extensions.dart';

class DarkPage extends StatelessWidget {
  const DarkPage({super.key});

  static const String profileImageUrl =
      "https://images.unsplash.com/vector-1743321182619-a3a4279a911b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZmlsZSUyMHBob3RvfGVufDB8fDB8fHww";
  static const String centerImageUrl =
      "https://images.unsplash.com/vector-1753252769959-ef0b3d159379?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bmlnaHQlMjBza3l8ZW58MHx8MHx8fDA%3D";

  @override
  Widget build(BuildContext context) {
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
                    AppStrings.pageFlipDarkHeading.translate(),
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
