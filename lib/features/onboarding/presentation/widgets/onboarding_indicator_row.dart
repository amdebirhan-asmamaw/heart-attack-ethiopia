import 'package:flutter/material.dart';
import 'package:heart_attack_ethiopia/core/constants/app_colors.dart';

class OnboardingIndicatorRow extends StatelessWidget {
  final int currentPage;
  final Color inactiveColor;
  final Function(int) onTap;
  final int totalPages;

  const OnboardingIndicatorRow({
    super.key,
    required this.currentPage,
    required this.inactiveColor,
    required this.onTap,
    this.totalPages = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        final isActive = currentPage == index;
        return GestureDetector(
          onTap: () => onTap(index),
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.5),
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: isActive ? AppColors.red : inactiveColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      }),
    );
  }
}
