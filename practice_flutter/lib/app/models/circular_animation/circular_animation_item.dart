import 'package:flutter/material.dart';

class CircularAnimationItem {
  final String title;
  final String description;
  final Widget animationWidget;

  const CircularAnimationItem({
    required this.title,
    required this.description,
    required this.animationWidget,
  });

  CircularAnimationItem copyWith({
    String? title,
    String? description,
    Widget? animationWidget,
  }) {
    return CircularAnimationItem(
      title: title ?? this.title,
      description: description ?? this.description,
      animationWidget: animationWidget ?? this.animationWidget,
    );
  }
}
