import 'package:flutter/material.dart';
import 'package:heart_attack_ethiopia/core/constants/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.title,
    required this.icon,
    required this.items,
    this.lineColor = AppColors.red,
  });

  final String title;
  final IconData icon;
  final List<String> items;
  final Color lineColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 151.62,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 34,
            color: AppColors.primary,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'League Spartan',
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: 90,
            height: 1,
            color: lineColor,
          ),
          const SizedBox(height: 8),
          ...items.map((item) => _CategoryItem(text: item)),
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Container(
            width: 4.92,
            height: 8,
            decoration: BoxDecoration(
              color: AppColors.textMuted.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontSize: 8,
                fontWeight: FontWeight.w400,
                color: AppColors.primary.withValues(alpha: 0.5),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'What do you want to know?',
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 159,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const CategoryCard(
                title: 'Symptoms',
                icon: Icons.medical_information_outlined,
                items: [
                  'Chest pain and pressure',
                  'Shortness of breath',
                  'Cold sweat, nausea, dizziness',
                ],
                lineColor: AppColors.red,
              ),
              const SizedBox(width: 8),
              const CategoryCard(
                title: 'What to do',
                icon: Icons.help_outline,
                items: [
                  'Call emergency services',
                  'Keep them calm & seated',
                  'Do not delay seeking help',
                ],
                lineColor: AppColors.green,
              ),
              const SizedBox(width: 8),
              const CategoryCard(
                title: 'Prevention',
                icon: Icons.shield_outlined,
                items: [
                  'Stay physically active',
                  'Eat heart-healthy foods',
                  'Avoid smoking & stress',
                ],
                lineColor: AppColors.red,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
