import 'package:fb_messenger_ui/app/common/styles/app_colors.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;

  const SearchBarWidget({
    super.key, 
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        20,
        15,
        20,
        0,
      ), // Left, Top, Right, Bottom
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.greyBackground.withValues(alpha : 0.5) , // Light grey background
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          color: AppColors.black, // Darker grey text
        ),
        decoration: const InputDecoration(
          icon: Icon(Icons.search, color: AppColors.greyText),
          hintText: 'Search your friends',
          hintStyle: TextStyle(color: AppColors.greyText),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
