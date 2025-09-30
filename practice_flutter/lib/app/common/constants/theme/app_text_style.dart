import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Light theme
  static const TextStyle lightHeadline1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.lightTextPrimary,
  );

  static const TextStyle lightBody = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.lightTextSecondary,
  );

  // Dark theme
  static const TextStyle darkHeadline1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.darkTextPrimary,
  );

  static const TextStyle darkBody = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.darkTextSecondary,
  );
}
