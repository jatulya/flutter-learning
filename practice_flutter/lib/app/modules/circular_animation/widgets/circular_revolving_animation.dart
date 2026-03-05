import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:practice_flutter/app/common/constants/theme/app_colors.dart';
import 'package:practice_flutter/app/common/exports.dart';
import 'package:practice_flutter/app/models/scroll_section/card_item.dart';

class CircularRevolvingAnimation extends StatefulWidget {
  final List<CardItem> items;

  const CircularRevolvingAnimation({super.key, required this.items});

  @override
  State<CircularRevolvingAnimation> createState() =>
      _CircularRevolvingAnimationState();
}

class _CircularRevolvingAnimationState extends State<CircularRevolvingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final animationDuration = const Duration(seconds: 10);
  final radius = 150;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: animationDuration, vsync: this)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Calculate position on the circle based on angle
  Offset _getPosition(double angle) {
    // Angle 0 = top center, π/2 = right, π = bottom, 3π/2 = left
    final x = radius * math.sin(angle);
    final y = -radius * math.cos(angle); // Negative for top to be at y=0
    return Offset(x, y);
  }

  // Calculate scale based on angle (top center = 1.5x, others = 1.0x)
  double _getScale(double angle) {
    // Normalize angle to [0, 2π]
    final normalizedAngle = angle % (2 * math.pi);

    // Top center is at angle 0 (or 2π)
    // Check if we're near the top (within a small range)
    const topRange = 0.3; // radians
    final distanceFromTop = math.min(
      normalizedAngle,
      2 * math.pi - normalizedAngle,
    );

    if (distanceFromTop < topRange) {
      // Scale from 1.0 to 1.5 based on proximity to top
      final scaleFactor = 1.0 + (0.5 * (1.0 - distanceFromTop / topRange));
      return scaleFactor;
    }
    return 1.0;
  }

  // Calculate alpha based on position (darker shades for items further from top)
  double _getAlpha(double angle) {
    // Normalize angle to [0, 2π]
    final normalizedAngle = angle % (2 * math.pi);

    // Distance from top (0 to π)
    final distanceFromTop = math.min(
      normalizedAngle,
      2 * math.pi - normalizedAngle,
    );

    // Alpha decreases as we move away from top
    // Top: alpha = 1.0, Bottom: alpha = 0.3
    final normalizedDistance = distanceFromTop / math.pi;
    return 1.0 - (0.7 * normalizedDistance);
  }

  @override
  Widget build(BuildContext context) {
    final itemCount = widget.items.length;
    final itemSize = 80.0;
    final totalSize = radius * 2 + itemSize * 2;
    final center = totalSize / 2;

    return SizedBox(
      width: totalSize,
      height: totalSize,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: [
              Positioned(
                left: itemSize,
                top: itemSize,
                child: Container(
                  width: radius * 2,
                  height: radius * 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.green50),
                  ),
                ),
              ),

              // Items - positioned along the circular path
              ...List.generate(itemCount, (index) {
                // Calculate angle for this item
                // Start each item at evenly spaced positions
                final baseAngle = (2 * math.pi * index) / itemCount;
                // Add rotation based on animation progress
                final currentAngle =
                    baseAngle + (_controller.value * 2 * math.pi);

                final position = _getPosition(currentAngle);
                final scale = _getScale(currentAngle);
                final alpha = _getAlpha(currentAngle);

                // Create color with varying alpha
                final color = AppColors.green50.withValues(alpha: alpha);

                return Positioned(
                  left: center + position.dx - itemSize / 2,
                  top: center + position.dy - itemSize / 2,
                  child: Transform.scale(
                    scale: scale,
                    child: Container(
                      width: itemSize,
                      height: itemSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Text(
                            widget.items[index].title ?? '',
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.title10.copyWith(
                              color: AppColors.green10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}


