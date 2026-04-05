import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:heart_attack_ethiopia/core/constants/app_colors.dart';
import 'package:heart_attack_ethiopia/core/router/routes.dart';

class ResourcesSection extends StatelessWidget {
  const ResourcesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _ResourcesHeader(),
            const SizedBox(height: 16),
            SizedBox(
              height: 275, // bumped
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: const [
                  ResourceCard(
                    title: 'Emergency Heart Care\n101',
                    subtitle:
                        'Learn the critical steps to take when someone is experiencing cardiac...',
                    category: 'Medical Guide',
                    readTime: '5 Min read',
                  ),
                  SizedBox(width: 16),
                  ResourceCard(
                    title: 'Emergency Heart Care\n101',
                    subtitle:
                        'Learn the critical steps to take when someone is experiencing cardiac...',
                    category: 'Medical Guide',
                    readTime: '5 Min read',
                  ),
                ],
              ),
            ),
          ],
        ),
        const Positioned(
          right: -2,
          top: 34,
          child: _QuestionBadge(),
        ),
      ],
    );
  }
}

class ResourceCard extends StatelessWidget {
  const ResourceCard({
    required this.title,
    required this.subtitle,
    required this.category,
    required this.readTime,
    super.key,
  });

  final String title;
  final String subtitle;
  final String category;
  final String readTime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRoutes.educationDetail),
      child: Container(
        width: 232,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.borderLight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(
            height: 135,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: const _ResourceMedia(),
                  ),
                ),
                Positioned(
                  left: 7,
                  bottom: 6,
                  child: Container(
                    height: 22,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFEBE7E7),
                          AppColors.background,
                          Color(0xFFEBE7E7),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Text(
                      readTime,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 11, // 8 -> 11
                        fontWeight: FontWeight.w500,
                        color: Color(0x99000000),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(19, 16, 19, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.categoryMedicalGuide,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x40000000),
                            blurRadius: 9.1,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      category,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 11, // 8 -> 11
                        fontWeight: FontWeight.w500,
                        color: AppColors.categoryMedicalGuide,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16, // 14 -> 16
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12, // 8 -> 12
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                    color: AppColors.textPrimary.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
  }
}

class _ResourceMedia extends StatelessWidget {
  const _ResourceMedia();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF746246),
            const Color(0xFFC7B79F),
            const Color(0xFF3A2A1F).withValues(alpha: 0.9),
          ],
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: -18,
            top: 22,
            child: Transform.rotate(
              angle: -0.25,
              child: Container(
                width: 150,
                height: 62,
                color: Colors.white.withValues(alpha: 0.82),
              ),
            ),
          ),
          Positioned(
            right: -10,
            top: 8,
            child: Transform.rotate(
              angle: 0.12,
              child: Container(
                width: 122,
                height: 84,
                color: const Color(0xFFF7F0E0).withValues(alpha: 0.9),
              ),
            ),
          ),
          const Center(
            child: Icon(
              Icons.favorite,
              size: 46,
              color: AppColors.categoryReport,
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.2),
                  Colors.black.withValues(alpha: 0.45),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ResourcesHeader extends StatelessWidget {
  const _ResourcesHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'resources',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16, // 14 -> 16
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        Row(
          children: [
            const Text(
              'Detail',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14, // 12 -> 14
                fontWeight: FontWeight.w400,
                color: AppColors.red,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.arrow_forward_ios,
              size: 10,
              color: AppColors.red.withValues(alpha: 0.6),
            ),
          ],
        ),
      ],
    );
  }
}

class _QuestionBadge extends StatelessWidget {
  const _QuestionBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.background,
            Color(0xFFEBE6E6),
            AppColors.background,
          ],
        ),
      ),
      child: const Center(
        child: Text(
          '?',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.red,
          ),
        ),
      ),
    );
  }
}
