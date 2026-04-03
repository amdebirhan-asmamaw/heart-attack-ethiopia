import 'package:flutter/material.dart';

import 'package:heart_attack_ethiopia/core/constants/app_colors.dart';

class AiAssistantCard extends StatelessWidget {
  const AiAssistantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 121,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 72.5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: 28,
            top: 45,
            child: Container(
              width: 150,
              height: 5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFF8EAEA).withValues(alpha: 0),
                    const Color(0xFFF0DDDD),
                    const Color(0xFFDDEDDD),
                  ],
                ),
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ),
          Positioned(
            left: 2,
            bottom: -2,
            child: Icon(
              Icons.health_and_safety_outlined,
              size: 100,
              color: AppColors.greenLight.withValues(alpha: 0.45),
            ),
          ),
          const Positioned(
            left: 102,
            top: 7,
            child: SizedBox(
              width: 214,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Heart health AI Assistant',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Get instant guidance on symptoms, risks,\nand emergencies.',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      height: 1.2,
                      color: Color(0xB3279944),
                    ),
                  ),
                  SizedBox(height: 12),
                  _AiButton(),
                  SizedBox(height: 8),
                  Text(
                    'Not for diagnosis. Emergency cases redirected instantly',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      color: Color(0x660E3618),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AiButton extends StatelessWidget {
  const _AiButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 162,
      height: 24,
      decoration: BoxDecoration(
        color: AppColors.greenLight,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.question_mark,
            size: 10,
            color: AppColors.background,
          ),
          SizedBox(width: 6),
          Text(
            'Ask the AI',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.background,
            ),
          ),
        ],
      ),
    );
  }
}
