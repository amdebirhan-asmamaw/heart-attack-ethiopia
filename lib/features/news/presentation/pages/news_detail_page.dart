import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:heart_attack_ethiopia/features/news/presentation/widgets/news_list_card.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF420C11)),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 80, left: 16, right: 16, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Media Container
            Container(
              width: double.infinity,
              height: 190,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.5),
                    Colors.black.withValues(alpha: 0.3),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.56, 0.87],
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      width: 30,
                      height: 27,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Icon(Icons.play_arrow_rounded, color: Colors.white, size: 20),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.3),
                                  borderRadius: BorderRadius.circular(99),
                                ),
                                child: Text(
                                  '17:13 / 21:04',
                                  style: GoogleFonts.inter(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              const Icon(Icons.fullscreen_rounded, color: Colors.white, size: 14),
                            ],
                          ),
                        ),
                        const SizedBox(height: 6),
                        Stack(
                          children: [
                            Container(
                              height: 3,
                              width: double.infinity,
                              color: Colors.white.withValues(alpha: 0.2),
                            ),
                            Container(
                              height: 3,
                              width: 202, // Progress tracker bar simulating completion percentage
                              color: const Color(0xFFFF1111),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            
            // Post metadata header
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: const Color(0xFF07AC64),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.25),
                        blurRadius: 9.1,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  'INFRASTRUCTURE',
                  style: GoogleFonts.leagueSpartan(
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF07AC64),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            
            // Context header formatting
            Text(
              'New Cardiac center opening in Addis Ababa this Friday.',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF000000),
                height: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Watch on Youtube',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF4285F4),
                  decoration: TextDecoration.underline,
                  decorationColor: const Color(0xFF4285F4),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Nested additional news context rows simulating relational algorithm feeds linearly.
            const NewsListCard(
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
            const NewsListCard(
              category: 'STORY',
              categoryColor: Color(0xFFFF4D0C),
              title: 'New Cardiac center opening in Addis Ababa this Friday.',
              timeAgo: '2 hrs ago',
            ),
            const SizedBox(height: 10),
            const NewsListCard(
              category: 'STORY',
              categoryColor: Color(0xFFFF4D0C),
              title: 'New Cardiac center opening in Addis Ababa this Friday.',
              timeAgo: '2 hrs ago',
            ),
            const SizedBox(height: 10),
            const NewsListCard(
              category: 'STORY',
              categoryColor: Color(0xFFFF4D0C),
              title: 'New Cardiac center opening in Addis Ababa this Friday.',
              timeAgo: '2 hrs ago',
            ),
          ],
        ),
      ),
    );
  }
}
