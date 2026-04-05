import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:heart_attack_ethiopia/core/router/routes.dart';
import '../widgets/news_list_card.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 100),
      children: [
        Text(
          'Latest News',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF000000),
          ),
        ),
        const SizedBox(height: 16),
        NewsListCard(
          category: 'INFRASTRUCTURE',
          categoryColor: const Color(0xFF07AC64),
          title: 'New Cardiac center opening in Addis Ababa this Friday.',
          timeAgo: '2 hrs ago',
          isHighlighted: true,
          hasPlayIcon: true,
          playBgColor: Colors.white,
          playIconColor: Colors.black,
          onTap: () => context.push(AppRoutes.newsDetail),
        ),
        const SizedBox(height: 10),
        NewsListCard(
          category: 'REPORT',
          categoryColor: const Color(0xFF1972E5),
          title: 'HAE Mission Report: Q3 Achievements and Future Goals.',
          timeAgo: '2 days ago',
          isHighlighted: true,
          hasPlayIcon: true,
          playBgColor: Colors.black,
          playIconColor: Colors.white,
          onTap: () => context.push(AppRoutes.newsDetail),
        ),
        const SizedBox(height: 10),
        NewsListCard(
          category: 'STORY',
          categoryColor: const Color(0xFFFF4D0C),
          title: 'New Cardiac center opening in Addis Ababa this Friday.',
          timeAgo: '2 hrs ago',
          onTap: () => context.push(AppRoutes.newsDetail),
        ),
        const SizedBox(height: 10),
        NewsListCard(
          category: 'STORY',
          categoryColor: const Color(0xFFFF4D0C),
          title: 'New Cardiac center opening in Addis Ababa this Friday.',
          timeAgo: '2 hrs ago',
          onTap: () => context.push(AppRoutes.newsDetail),
        ),
        const SizedBox(height: 10),
        NewsListCard(
          category: 'STORY',
          categoryColor: const Color(0xFFFF4D0C),
          title: 'New Cardiac center opening in Addis Ababa this Friday.',
          timeAgo: '2 hrs ago',
          onTap: () => context.push(AppRoutes.newsDetail),
        ),
        const SizedBox(height: 10),
        NewsListCard(
          category: 'STORY',
          categoryColor: const Color(0xFFFF4D0C),
          title: 'New Cardiac center opening in Addis Ababa this Friday.',
          timeAgo: '2 hrs ago',
          onTap: () => context.push(AppRoutes.newsDetail),
        ),
      ],
    );
  }
}

