import 'package:flutter/material.dart';
import 'package:practice_flutter/app/common/constants/theme/app_colors.dart';

class PulsingCircleAnimation extends StatefulWidget {
  const PulsingCircleAnimation({super.key});

  @override
  State<PulsingCircleAnimation> createState() => _PulsingCircleAnimationState();
}

class _PulsingCircleAnimationState extends State<PulsingCircleAnimation>
    with TickerProviderStateMixin {
  final List<_CirclePulse> _circles = [];
  late AnimationController _spawnController;
  final double size = 250;
  final Color baseColor = AppColors.green50;
  final Duration animationDuration = const Duration(seconds: 5);

  @override
  void initState() {
    super.initState();
    // Spawn interval is shorter than animation duration to ensure multiple circles
    final spawnInterval = Duration(
      milliseconds: animationDuration.inMilliseconds ~/ 5,
    );

    _spawnController = AnimationController(
      duration: spawnInterval,
      vsync: this,
    );

    // Spawn initial circle immediately
    _spawnCircle();

    // Spawn new circles at regular intervals to maintain continuous effect
    _spawnController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _spawnCircle();
        _spawnController.reset();
        _spawnController.forward();
      }
    });

    _spawnController.forward();
  }

  @override
  void dispose() {
    for (var circle in _circles) {
      circle.controller.dispose();
    }
    _spawnController.dispose();
    super.dispose();
  }

  void _spawnCircle() {
    final controller = AnimationController(
      duration: animationDuration,
      vsync: this,
    );

    final animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    final circle = _CirclePulse(controller: controller, animation: animation);

    setState(() {
      _circles.add(circle);
    });

    controller.forward().then((_) {
      if (mounted) {
        setState(() {
          _circles.remove(circle);
        });
        circle.controller.dispose();
      }
    });
  }

  Color _getColorForRadius(double radiusProgress) {
    // radiusProgress: 0.0 (center) to 1.0 (outer edge)
    // Calculate color based on the radius position
    // Dark at center, progressively lighter as radius increases

    final darkCenter = Color.lerp(
      baseColor,
      Colors.black,
      0.3, // Dark center
    )!;

    final lightOuter = Color.lerp(
      baseColor,
      Colors.white,
      0.9, // Very light outer
    )!;

    // Use the radius progress directly to interpolate color
    // This ensures the color matches the shade at that radius position
    return Color.lerp(darkCenter, lightOuter, radiusProgress)!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: _circles.map((circle) {
          return AnimatedBuilder(
            animation: circle.animation,
            builder: (context, child) {
              final progress = circle.animation.value;
              final currentSize = size * progress;

              // Color changes based on current radius position
              // As the circle grows, it adapts to the shade at that radius
              final color = _getColorForRadius(progress);

              return Container(
                width: currentSize,
                height: currentSize,
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

class _CirclePulse {
  final AnimationController controller;
  final Animation<double> animation;

  _CirclePulse({required this.controller, required this.animation});
}
