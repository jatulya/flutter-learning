import 'package:flutter/material.dart';
import 'app_colors.dart'; // Assuming AppColors is defined separately

class AppTheme {
  const AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Roboto', // Or any suitable modern sans-serif font
      primaryColor: AppColors.blue,
      scaffoldBackgroundColor: AppColors.offWhite,

      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.blue,
        elevation: 4,
        shadowColor: AppColors.greyShadow,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blueDark,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          shadowColor: AppColors.greyShadow,
        ),
      ),

      textTheme: TextTheme(
        bodyLarge: TextStyle(fontSize: 16, color: AppColors.black),
        bodyMedium: TextStyle(fontSize: 14, color: AppColors.greyText),
        titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.black),
      ),

      iconTheme: IconThemeData(color: AppColors.greyText),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.greyBackground,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(color: AppColors.greyText),
      ),

      cardTheme: CardThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 2,
        shadowColor: AppColors.greyShadow,
      ),

      dividerTheme: DividerThemeData(
        thickness: 0.5,
        color: AppColors.grey300,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'Roboto',
      primaryColor: AppColors.blueDark,
      scaffoldBackgroundColor: AppColors.black,

      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.black80,
        elevation: 2,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      textTheme: TextTheme(
        bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
        bodyMedium: TextStyle(fontSize: 14, color: AppColors.grey300),
        titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.black60,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(color: AppColors.grey300),
      ),

      cardTheme: CardThemeData(
        color: AppColors.black80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 1,
      ),

      iconTheme: IconThemeData(color: Colors.white),

      dividerTheme: DividerThemeData(
        thickness: 0.5,
        color: AppColors.grey300,
      ),
    );
  }
}

/// Custom shape scheme placeholder
class ShapeScheme {
  final ShapeBorder storyAvatarShape;

  const ShapeScheme({required this.storyAvatarShape});
}
