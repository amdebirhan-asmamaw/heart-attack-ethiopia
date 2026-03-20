import 'package:flutter/material.dart';

import 'onboarding_action_button.dart';
import 'onboarding_indicator_row.dart';

class OnboardingBottomSheet extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Color backgroundColor;
  final Color textColor;
  final int currentPage;
  final Color indicatorInactiveColor;
  final Function(int) onIndicatorTap;
  final String buttonText;
  final Color buttonBackgroundColor;
  final Color buttonTextColor;
  final VoidCallback onButtonPressed;
  final bool isButtonLoading;

  const OnboardingBottomSheet({
    super.key,
    required this.title,
    this.subtitle,
    required this.backgroundColor,
    required this.textColor,
    required this.currentPage,
    required this.indicatorInactiveColor,
    required this.onIndicatorTap,
    required this.buttonText,
    required this.buttonBackgroundColor,
    required this.buttonTextColor,
    required this.onButtonPressed,
    this.isButtonLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 254, // CSS height: 254px
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), // CSS border-radius: 30px
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 26,
            left: 25,
            right: 25,
            bottom: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title Section
              SizedBox(
                width: 313, // CSS width
                height: 87, // CSS height
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 24, // CSS font-size
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                        color: textColor,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle!,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                          color: textColor.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Indicators Row
              OnboardingIndicatorRow(
                currentPage: currentPage,
                inactiveColor: indicatorInactiveColor,
                onTap: onIndicatorTap,
              ),

              const Spacer(),

              // Action Button
              OnboardingActionButton(
                text: buttonText,
                backgroundColor: buttonBackgroundColor,
                textColor: buttonTextColor,
                onPressed: onButtonPressed,
                isLoading: isButtonLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
