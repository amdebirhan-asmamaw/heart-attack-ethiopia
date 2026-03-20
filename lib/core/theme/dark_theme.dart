import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'text_styles.dart';

abstract final class DarkTheme {
  static ThemeData get theme {
    const colorScheme = ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.onPrimary,
      surface: AppColors.textPrimary,
      error: AppColors.error,
    );

    return ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.textPrimary,
      textTheme: TextStyles.textTheme(AppColors.onPrimary),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.textPrimary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.surface),
        ),
      ),
    );
  }
}
