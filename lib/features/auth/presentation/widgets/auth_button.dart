import 'package:flutter/material.dart';
import 'package:heart_attack_ethiopia/core/constants/app_colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton.primary({
    required this.text,
    required this.onPressed,
    super.key,
    this.isLoading = false,
  }) : backgroundColor = AppColors.primary,
       textColor = AppColors.onPrimary,
       fontSize = 16,
       borderRadius = 50;

  const AuthButton.secondary({
    required this.text,
    required this.onPressed,
    super.key,
    this.isLoading = false,
  }) : backgroundColor = AppColors.surfaceVariant,
       textColor = AppColors.textPrimary,
       fontSize = 14,
       borderRadius = 13;

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final bool isLoading;
  final double borderRadius;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: double.infinity,
        minHeight: 48,
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: textColor,
                  strokeWidth: 2,
                ),
              )
            : Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
  }
}
