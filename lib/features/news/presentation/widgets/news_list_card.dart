import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsListCard extends StatelessWidget {
  const NewsListCard({
    super.key,
    required this.category,
    required this.categoryColor,
    required this.title,
    required this.timeAgo,
    this.isHighlighted = false,
    this.hasPlayIcon = false,
    this.playBgColor,
    this.playIconColor,
    this.onTap,
  });

  final String category;
  final Color categoryColor;
  final String title;
  final String timeAgo;
  final bool isHighlighted;
  final bool hasPlayIcon;
  final Color? playBgColor;
  final Color? playIconColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
