import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'text_styles.dart';

abstract final class DarkTheme {
  static ThemeData get theme {
    const colorScheme = ColorScheme.dark(
      primary: AppColors.blackSecondary,
      secondary: AppColors.white,
      surface: AppColors.black,
      error: AppColors.error,
    );

    return ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.black,
      textTheme: TextStyles.textTheme(AppColors.white),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.black,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.black,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.surface),
        ),
      ),
    );
  }
}
