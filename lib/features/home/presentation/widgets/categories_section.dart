import 'package:flutter/material.dart';

import 'package:heart_attack_ethiopia/core/constants/app_colors.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'What Do You Want To Know?',
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontSize: 18, // bumped
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 195, // bumped
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: const [
              _CategoryCard(
                title: 'Symptoms',
                icon: Icons.medical_services_outlined,
                accentColor: Color(0xFFCE0D1F),
                overlayIcon: Icons.favorite,
                items: [
                  'Chest Pain And Pressure',
                  'Shortness Of Breath',
                  'Cold Sweat, Nausea, Dizziness',
                ],
              ),
              SizedBox(width: 8),
              _CategoryCard(
                title: 'What To Do',
                icon: Icons.question_mark,
                accentColor: Color(0xFFC9B400),
                lineColor: Color(0xFF6EA374),
                items: [
                  'Call Emergency Services',
                  'Keep Them Calm & Seated',
                  'Do Not Delay Seeking Help',
                ],
              ),
              SizedBox(width: 8),
              _CategoryCard(
                title: 'Prevention',
                icon: Icons.health_and_safety_outlined,
                accentColor: Color(0xFF54B95D),
                lineColor: Color(0xFF54B95D),
                elevated: true,
                items: [
                  'Stay Physically Active',
                  'Eat Heart-Healthy Foods',
                  'Avoid Smoking & Stress',
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.title,
    required this.icon,
    required this.items,
    required this.accentColor,
    this.lineColor,
    this.overlayIcon,
    this.elevated = false,
  });

  final String title;
  final IconData icon;
  final List<String> items;
  final Color accentColor;
  final Color? lineColor;
  final IconData? overlayIcon;
  final bool elevated;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 151.62,
      height: 185, // bumped
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          if (elevated)
            const BoxShadow(
              color: Color(0x0D000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
        ],
      ),
      child: Stack(
        children: [
          if (overlayIcon != null)
            Positioned(
              right: 6,
              top: -4,
              child: Icon(
                overlayIcon,
                size: 108,
                color: AppColors.primary.withValues(alpha: 0.11),
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(13, 10, 13, 10),
            child: Column(
              children: [
                Icon(icon, size: 32, color: accentColor),
                const SizedBox(height: 6),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'League Spartan',
                    fontSize: 16, // bumped
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  width: 90,
                  height: 1,
                  color: lineColor ?? accentColor,
                ),
                const SizedBox(height: 6),
                for (final String item in items) ...[
                  _CategoryItem(text: item, accentColor: accentColor),
                  if (item != items.last) const SizedBox(height: 8),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({required this.text, required this.accentColor});

  final String text;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.emergency_outlined,
          size: 8,
          color: accentColor,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'League Spartan',
              fontSize: 11, // bumped
              fontWeight: FontWeight.w400,
              color: const Color(0xFF63373B).withValues(alpha: 0.5),
            ),
          ),
        ),
      ],
    );
  }
}
