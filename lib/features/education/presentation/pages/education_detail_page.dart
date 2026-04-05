import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heart_attack_ethiopia/features/news/presentation/widgets/news_list_card.dart';
import 'package:heart_attack_ethiopia/shared/widgets/shell/home_app_bar.dart';

class EducationDetailPage extends StatelessWidget {
  const EducationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image
            Container(
              width: double.infinity,
              height: 190.86,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage('assets/images/placeholder.png'), // Figma placeholder fallback
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.12, 0.56, 1.0],
                    colors: [
                      Colors.black.withValues(alpha: 0.0),
                      Colors.black.withValues(alpha: 0.3),
                      Colors.black.withValues(alpha: 0.5),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Post metadata tag
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD72335),
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
                  'Medical Guide',
                  style: GoogleFonts.inter(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFB90B1C),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            
            // Post Title
            Text(
              'Winter storm delays Piedmont cardiologists\' lifesaving mission to Ethiopia',
              style: GoogleFonts.quicksand(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF000000),
                height: 1.2,
              ),
            ),
            const SizedBox(height: 16),
            
            // Section Header
            Text(
              'The Brief',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF000000),
              ),
            ),
            const SizedBox(height: 16),
            
            // Article Body
            Text(
              'A team of Piedmont cardiologists, part of Heart Attack Ethiopia, has been delayed in Atlanta due to a winter storm, affecting their mission to perform lifesaving surgeries in Ethiopia.\n\n'
              'The team, including Dr. Tesfaye Telila, was ready to depart when their flight was grounded, with over 1,200 flights canceled at Hartsfield-Jackson Atlanta International Airport.\n\n'
              'The mission involves sending over half a million dollars\' worth of medical supplies and 14 healthcare professionals to Ethiopia, with volunteers sacrificing their vacation time for the cause.\n\n'
              'A team of Piedmont cardiologists, part of Heart Attack Ethiopia, has been delayed in Atlanta due to a winter storm, affecting their mission to perform lifesaving surgeries in Ethiopia.',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF000000).withValues(alpha: 0.8),
                height: 1.4,
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Learn More Section
            Text(
              'Learn More',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF000000),
              ),
            ),
            const SizedBox(height: 16),
            
            // Related / Learn More Items List simulating the Figma spec layout
            const NewsListCard(
              category: 'INFRASTRUCTURE',
              categoryColor: Color(0xFF07AC64),
              title: 'New Cardiac center opening in Addis Ababa this Friday.',
              timeAgo: '2 hrs ago',
            ),
            const SizedBox(height: 10),
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
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: FloatingActionButton(
          onPressed: () => context.pop(),
          backgroundColor: Colors.white,
          child: const Icon(Icons.arrow_back_rounded, color: Color(0xFF420C11)),
        ),
      ),
    );
  }
}
