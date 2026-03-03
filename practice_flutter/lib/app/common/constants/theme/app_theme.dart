import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  // ---------- LIGHT THEME ----------
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.green10,
    primaryColor: AppColors.green50,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.green50,
      primary: AppColors.green50,
      secondary: AppColors.green60,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.green20,
      foregroundColor: AppColors.green90,
      elevation: 0,
    ),
    shadowColor: AppColors.green90.withValues(alpha: 0.2),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.green50,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    ),
  );

  // ---------- DARK THEME ----------
  static ThemeData darkTheme = ThemeData(
scaffoldBackgroundColor: AppColors.green100,
    primaryColor: AppColors.green50,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.green50,
      primary: AppColors.green50,
      secondary: AppColors.green60,
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.green90,
      foregroundColor: AppColors.green10,
      elevation: 0,
    ),
    shadowColor: AppColors.green100.withValues(alpha: 0.4),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.green50,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    ),
  );
}
