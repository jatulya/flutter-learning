import 'package:flutter/material.dart';
import 'package:practice_flutter/app/models/scroll_section/card_item.dart';

class ImageTextCard extends StatelessWidget {
  final CardItem item;

  const ImageTextCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.shade200,
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image section
          Expanded(
            child: item.imageUrl != null
                ? Image.network(item.imageUrl ?? '', fit: BoxFit.cover)
                : Container(color: Colors.grey),
          ),

          // Text section with gradient background
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black54, Colors.black87],
              ),
            ),
            alignment: Alignment.bottomLeft,
            child: Text(
              item.textToShow ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
