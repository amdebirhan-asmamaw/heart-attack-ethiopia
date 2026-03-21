import 'package:flutter/material.dart';
import 'package:heart_attack_ethiopia/core/constants/app_colors.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.category,
    required this.title,
    required this.timeAgo,
    this.categoryColor = AppColors.categoryInfrastructure,
  });

  final String category;
  final String title;
  final String timeAgo;
  final Color categoryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.background.withValues(alpha: 0.95),
            AppColors.surface.withValues(alpha: 0.7),
            AppColors.background.withValues(alpha: 0.9),
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
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Icon(
                Icons.favorite,
                size: 32,
                color: AppColors.heartRedDark,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
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
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'League Spartan',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
          Container(
            width: 18,
            height: 18,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.arrow_forward_ios,
              size: 8,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class NewsSection extends StatelessWidget {
  const NewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        const SizedBox(height: 16),
        const NewsCard(
          category: 'Infrastructure',
          title: 'New Cardiac center opening in Addis Ababa this Friday.',
          timeAgo: '2 hrs ago',
          categoryColor: AppColors.categoryInfrastructure,
        ),
        const SizedBox(height: 8),
        const NewsCard(
          category: 'Report',
          title: 'HAE Mission Report: Q3 Achievements and Future Goals.',
          timeAgo: '2 days ago',
          categoryColor: AppColors.categoryReport,
        ),
        const SizedBox(height: 8),
        const NewsCard(
          category: 'Story',
          title: 'New Cardiac center opening in Addis Ababa this Friday.',
          timeAgo: '2 hrs ago',
          categoryColor: AppColors.categoryStory,
        ),
      ],
    );
  }
}
