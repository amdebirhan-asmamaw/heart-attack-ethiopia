import 'package:flutter/material.dart';

abstract final class AppColors {
  // Scaffold & surfaces
  static const background = Color(0xFFFFFFFF); // page background
  static const surface = Color(0xFFF2F2F2); // input fields
  static const surfaceVariant = Color(0xFFE9E9E9); // social buttons

  // Brand
  static const primary = Color(0xFF420C11); // create account button
  static const onPrimary = Color(0xFFFFFFFF); // text on primary button

  // Text colors
  static const textPrimary = Color(0xFF000000);
  static const textSecondary = Color(0x80000000); // 50% opacity black
  static const textHint = Color(0xFF999999);
  static const textMuted = Color(0xFF808080);
  static const textSubtle = Color(0xFFCCCCCC);

  static const red = Color(0xFFD72335);

  // Feedback
  static const success = Color(0xFF1E9E62);
  static const warning = Color(0xFFF59E0B);
  static const error = Color(0xFFD64545);
}
