import 'package:flutter/material.dart';

class CardItem {
  final String? imageUrl;
  final String? title;
  final IconData? icon;
  final String? description;

  const CardItem({this.imageUrl, this.title, this.icon, this.description});

  CardItem copyWith({
    String? imageUrl,
    String? title,
    IconData? icon,
    String? description,
  }) {
    return CardItem(
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      icon: icon ?? this.icon,
      description: description ?? this.description,
    );
  }
}
