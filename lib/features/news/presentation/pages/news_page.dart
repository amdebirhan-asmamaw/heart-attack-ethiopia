import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        const _NewsCard(
          category: 'INFRASTRUCTURE',
          categoryColor: Color(0xFF07AC64),
          title: 'New Cardiac center opening in Addis Ababa this Friday.',
          timeAgo: '2 hrs ago',
          isHighlighted: true,
          hasPlayIcon: true,
          playBgColor: Colors.white,
          playIconColor: Colors.black,
        ),
        const SizedBox(height: 10),
        const _NewsCard(
          category: 'REPORT',
          categoryColor: Color(0xFF1972E5),
          title: 'HAE Mission Report: Q3 Achievements and Future Goals.',
          timeAgo: '2 days ago',
          isHighlighted: true,
          hasPlayIcon: true,
          playBgColor: Colors.black,
          playIconColor: Colors.white,
        ),
        const SizedBox(height: 10),
        const _NewsCard(
          category: 'STORY',
          categoryColor: Color(0xFFFF4D0C),
          title: 'New Cardiac center opening in Addis Ababa this Friday.',
          timeAgo: '2 hrs ago',
        ),
        const SizedBox(height: 10),
        const _NewsCard(
          category: 'STORY',
          categoryColor: Color(0xFFFF4D0C),
          title: 'New Cardiac center opening in Addis Ababa this Friday.',
          timeAgo: '2 hrs ago',
        ),
        const SizedBox(height: 10),
        const _NewsCard(
          category: 'STORY',
          categoryColor: Color(0xFFFF4D0C),
          title: 'New Cardiac center opening in Addis Ababa this Friday.',
          timeAgo: '2 hrs ago',
        ),
        const SizedBox(height: 10),
        const _NewsCard(
          category: 'STORY',
          categoryColor: Color(0xFFFF4D0C),
          title: 'New Cardiac center opening in Addis Ababa this Friday.',
          timeAgo: '2 hrs ago',
        ),
      ],
    );
  }
}

class _NewsCard extends StatelessWidget {
  const _NewsCard({
    required this.category,
    required this.categoryColor,
    required this.title,
    required this.timeAgo,
    this.isHighlighted = false,
    this.hasPlayIcon = false,
    this.playBgColor,
    this.playIconColor,
  });

  final String category;
  final Color categoryColor;
  final String title;
  final String timeAgo;
  final bool isHighlighted;
  final bool hasPlayIcon;
  final Color? playBgColor;
  final Color? playIconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: isHighlighted ? const Color(0xFFE9F6FE) : const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(20),
        border: isHighlighted ? Border.all(color: Colors.white, width: 1) : null,
      ),
      child: Row(
        children: [
          Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 15.2,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: hasPlayIcon
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          color: playBgColor ?? Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.play_arrow_rounded,
                          size: 14,
                          color: playIconColor ?? Colors.black,
                        ),
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6, right: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    category,
                    style: GoogleFonts.leagueSpartan(
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                      color: categoryColor,
                      height: 1.2,
                    ),
                  ),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.leagueSpartan(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF000000),
                      height: 1.2,
                    ),
                  ),
                  Text(
                    timeAgo,
                    style: GoogleFonts.leagueSpartan(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xFF000000),
                      height: 1.2,
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
