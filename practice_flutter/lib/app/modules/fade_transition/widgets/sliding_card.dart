import 'package:flutter/material.dart';
import 'package:practice_flutter/app/common/exports.dart';
import 'package:practice_flutter/app/models/scroll_section/card_item.dart';

class SlidingCard extends StatefulWidget {
  final CardItem item;
  final int index;
  final bool isAnimated;
  final Function(int) onAnimationCompleted;

  const SlidingCard({
    super.key,
    required this.item,
    required this.index,
    required this.isAnimated,
    required this.onAnimationCompleted,
  });

  @override
  State<SlidingCard> createState() => _SlidingCardState();
}

class _SlidingCardState extends State<SlidingCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;
  final GlobalKey _cardKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _slideAnimation =
        Tween<Offset>(
          begin: const Offset(0.8, 0.0), // Start from right
          end: Offset.zero,
        ).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _triggerAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _triggerAnimation() {
    // Check if this card has already been animated
    if (widget.isAnimated) {
      // If already animated, set controller to completed state
      if (!_animationController.isCompleted) {
        _animationController.value = 1.0;
      }
      return;
    }

    // Mark as animated in cubit
    widget.onAnimationCompleted(widget.index);

    final delay = Duration(milliseconds: widget.index * 100);

    Future.delayed(delay, () {
      if (mounted && !_animationController.isCompleted) {
        _animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? AppColors.green90 : AppColors.green20;
    final textColor = isDark ? AppColors.green10 : AppColors.green90;
    final secondaryTextColor = isDark ? AppColors.green30 : AppColors.grey20;

    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: Container(
          key: _cardKey,
          margin: const EdgeInsets.symmetric(
            horizontal: AppSpacing.spacing16,
            vertical: AppSpacing.spacing8,
          ),
          padding: const EdgeInsets.all(AppSpacing.spacing16),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(AppSpacing.spacing16),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? AppColors.green100.withValues(alpha: 0.4)
                    : AppColors.green90.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Icon on the left
              Container(
                padding: const EdgeInsets.all(AppSpacing.spacing12),
                decoration: BoxDecoration(
                  color: AppColors.green50,
                  borderRadius: BorderRadius.circular(AppSpacing.spacing12),
                ),
                child: Icon(
                  widget.item.icon,
                  color: isDark ? AppColors.green10 : AppColors.green90,
                  size: 32,
                ),
              ),
              const SizedBox(width: AppSpacing.spacing12),
              // Name and description on the right
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.title ?? '',
                      style: AppTextStyles.title18.copyWith(color: textColor),
                    ),
                    const SizedBox(height: AppSpacing.spacing8),
                    Text(
                      widget.item.description ?? '',
                      style: AppTextStyles.normal14.copyWith(
                        color: secondaryTextColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
