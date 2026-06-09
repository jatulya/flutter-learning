import 'package:flutter/material.dart';

class BookItem {
  final String title;
  final String author;
  final String? imageUrl;
  final Color backgroundColor;
  final String description;

  const BookItem({
    required this.title,
    required this.author,
    this.imageUrl,
    required this.backgroundColor,
    required this.description,
  });

  BookItem copyWith({
    String? title,
    String? author,
    String? imageUrl,
    Color? backgroundColor,
    String? description,
  }) {
    return BookItem(
      title: title ?? this.title,
      author: author ?? this.author,
      imageUrl: imageUrl ?? this.imageUrl,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      description: description ?? this.description,
    );
  }
}
