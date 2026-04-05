import 'package:flutter/material.dart';

import 'package:heart_attack_ethiopia/core/constants/app_colors.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({super.key, this.onSeeAll});

  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'News',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
            GestureDetector(
              onTap: onSeeAll,
              child: const Text(
                'Detail',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF420C11),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const NewsCard(
          category: 'Infrastructure',
          title: 'New Cardiac center opening in Addis Ababa this Friday.',
          timeAgo: '2 hrs ago',
          categoryColor: AppColors.categoryInfrastructure,
          thumbnailColor: Color(0xFF1669C8),
          thumbnailIcon: Icons.apartment_rounded,
        ),
        const SizedBox(height: 8),
        const NewsCard(
          category: 'Report',
          title: 'HAE Mission Report: Q3 Achievements and Future Goals.',
          timeAgo: '2 days ago',
          categoryColor: AppColors.categoryReport,
          thumbnailColor: AppColors.categoryMedicalGuide,
          thumbnailIcon: Icons.favorite,
          darkPlayButton: true,
        ),
        const SizedBox(height: 8),
        const NewsCard(
          category: 'Story',
          title: 'New Cardiac center opening in Addis Ababa this Friday.',
          timeAgo: '2 hrs ago',
          categoryColor: AppColors.categoryStory,
          thumbnailColor: Color(0xFF76AFD8),
          thumbnailIcon: Icons.people_alt_outlined,
        ),
      ],
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    required this.category,
    required this.title,
    required this.timeAgo,
    required this.categoryColor,
    required this.thumbnailColor,
    required this.thumbnailIcon,
    this.darkPlayButton = false,
    super.key,
  });

  final String category;
  final String title;
  final String timeAgo;
  final Color categoryColor;
  final Color thumbnailColor;
  final IconData thumbnailIcon;
  final bool darkPlayButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            Color(0xFFFDFDFD),
            Color(0xFFEFECEC),
            Color(0xFFFDFDFD),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
              color: thumbnailColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1A000000),
                  blurRadius: 15.2,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    thumbnailIcon,
                    size: 34,
                    color: AppColors.background.withValues(alpha: 0.96),
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: 5,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: darkPlayButton
                          ? AppColors.textPrimary
                          : AppColors.background,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      size: 12,
                      color: darkPlayButton
                          ? AppColors.background
                          : AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    category.toUpperCase(),
                    style: TextStyle(
                      fontFamily: 'League Spartan',
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                      color: categoryColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'League Spartan',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    timeAgo,
                    style: const TextStyle(
                      fontFamily: 'League Spartan',
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: AppColors.textPrimary,
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
