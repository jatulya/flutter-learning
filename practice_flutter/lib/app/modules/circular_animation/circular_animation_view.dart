import 'package:flutter/material.dart';
import 'package:practice_flutter/app/common/exports.dart';
import 'package:practice_flutter/app/common/extensions.dart';
import 'package:practice_flutter/app/modules/circular_animation/widgets/pulsing_circle_animation.dart';
import '../../models/circular_animation/circular_animation_item.dart';

class CircularAnimationView extends StatelessWidget {
  const CircularAnimationView({super.key});

  List<CircularAnimationItem> get _animationItems => [
    CircularAnimationItem(
      title: AppStrings.smoothCircleAnimationTitle.translate(),
      description: AppStrings.smoothCircleAnimationDescription.translate(),
      animationWidget: const PulsingCircleAnimation(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? AppColors.green100 : AppColors.green10;
    final textColor = isDark ? AppColors.green10 : AppColors.green90;
    final secondaryTextColor = isDark ? AppColors.green30 : AppColors.grey20;
    final sectionBgColor = isDark ? AppColors.green90 : AppColors.green20;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        // used to get - SliverAppBar and SliverFillRemaining
        physics:
            const NeverScrollableScrollPhysics(), // prevents conflict with the PageView scrolling
        slivers: [
          SliverAppBar(
            expandedHeight: 70,
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(
                left: AppSpacing.spacing56,
                bottom: AppSpacing.spacing16,
              ),
              title: Text(
                AppStrings.circularAnimationsTitle.translate(),
                style: AppTextStyles.bold24.copyWith(color: textColor),
              ),
            ),
          ),

          SliverFillRemaining(
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              physics: const PageScrollPhysics(), // ensures page snapping
              itemCount: _animationItems.length,
              itemBuilder: (context, index) {
                final item = _animationItems[index];

                return Container(
                  color: backgroundColor,
                  padding: const EdgeInsets.all(AppSpacing.spacing16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        color: sectionBgColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.spacing16,
                          vertical: AppSpacing.spacing12,
                        ),
                        child: Text(
                          item.title,
                          style: AppTextStyles.title18.copyWith(
                            color: textColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.spacing16),
                      Text(
                        item.description,
                        style: AppTextStyles.normal16.copyWith(
                          color: secondaryTextColor,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.spacing24),
                      Expanded(child: Center(child: item.animationWidget)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
