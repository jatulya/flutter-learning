import 'package:flutter/material.dart';
import 'package:practice_flutter/app/common/exports.dart';

class CustomAppBarTitle extends StatelessWidget {
  final String title;

  const CustomAppBarTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 56),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.defaultTitle,
          ),
        ),
      ),
    );
  }
}
