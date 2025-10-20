import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedPageFlipBuilder extends StatelessWidget {
  const AnimatedPageFlipBuilder({
    super.key,
    required this.animation,
    required this.showFrontSide,
    required this.frontBuilder,
    required this.backBuilder,
  });
  final Animation<double> animation;
  final bool showFrontSide;
  final WidgetBuilder frontBuilder;
  final WidgetBuilder backBuilder;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        final isAnimationFirstHalf = animation.value.abs() < 0.5;
        final child = isAnimationFirstHalf
            ? frontBuilder(context)
            : backBuilder(context);
        final rotationValue = animation.value * pi; //maps [0.0,1.0] to [0,pi]
        // calculate the correct rotation angle depening on which page we need to show
        // if same value is given for both, one shows miirrored image
        final rotationAngle = isAnimationFirstHalf
            ? rotationValue
            : pi - rotationValue;
        //tilt grows as animation is around middle, then decreases
        var tilt = (animation.value - 0.5).abs() - 0.5;
        // make this a small value (positive or negative as needed)
        tilt *= isAnimationFirstHalf ? -0.003 : 0.003;

        return Transform(
          transform: Matrix4.rotationY(rotationAngle)..setEntry(3, 0, tilt),
          alignment: Alignment.center,
          child: child,
        );
      },
    );
  }
}
