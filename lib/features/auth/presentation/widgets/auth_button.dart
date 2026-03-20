import 'package:flutter/material.dart';
import 'package:heart_attack_ethiopia/core/constants/app_colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton.primary({
    required this.text,
    required this.onPressed,
    super.key,
    this.isLoading = false,
    this.loadingText,
  }) : backgroundColor = AppColors.primary,
       textColor = AppColors.onPrimary,
       fontSize = 16,
       borderRadius = 50;

  const AuthButton.secondary({
    required this.text,
    required this.onPressed,
    super.key,
    this.isLoading = false,
    this.loadingText,
  }) : backgroundColor = AppColors.surfaceVariant,
       textColor = AppColors.textPrimary,
       fontSize = 14,
       borderRadius = 13;

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final bool isLoading;
  final String? loadingText;
  final double borderRadius;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final buttonLabel = isLoading ? (loadingText ?? text) : text;

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
          disabledBackgroundColor: backgroundColor.withValues(alpha: 0.85),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading) ...[
              SizedBox(
                height: 18,
                width: 18,
                child: CircularProgressIndicator(
                  color: textColor,
                  strokeWidth: 2,
                ),
              ),
              const SizedBox(width: 10),
            ],
            Flexible(
              child: Text(
                buttonLabel,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
