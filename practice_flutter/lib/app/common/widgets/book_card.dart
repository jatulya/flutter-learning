import 'package:flutter/material.dart';
import 'package:practice_flutter/app/common/exports.dart';
import 'package:practice_flutter/app/models/book/book_item.dart';

class BookCard extends StatelessWidget {
  final BookItem item;
  final double? width;
  final double? height;

  const BookCard({super.key, required this.item, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: item.backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.dark.withValues(alpha: 0.12),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: NetworkImageWidget(
              imageUrl: item.imageUrl,
              placeholderBackgroundColor: AppColors.dark.withValues(
                alpha: 0.15,
              ),
              placeholderIcon: Icons.menu_book,
              placeholderIconColor: AppColors.light.withValues(alpha: 0.5),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.spacing12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.light,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.spacing4),
                  Text(
                    item.author,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.light.withValues(alpha: 0.85),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.spacing8),
                  Expanded(
                    child: Text(
                      item.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.light.withValues(alpha: 0.75),
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
