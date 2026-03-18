import 'package:flutter/material.dart';

import 'onboarding_action_button.dart';
import 'onboarding_indicator_row.dart';

class OnboardingBottomSheet extends StatelessWidget {
  final String title;
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
        height: 254,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 26, left: 25, right: 25),
          child: Column(
            children: [
              SizedBox(
                width: 313,
                height: 87,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                    color: textColor,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              OnboardingIndicatorRow(
                currentPage: currentPage,
                inactiveColor: indicatorInactiveColor,
                onTap: onIndicatorTap,
              ),
              const SizedBox(height: 20),
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
