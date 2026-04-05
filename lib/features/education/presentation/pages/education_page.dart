import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:heart_attack_ethiopia/features/home/presentation/widgets/resources_section.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 24, left: 16, bottom: 100),
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Text(
            'Learn Heart Health',
            style: GoogleFonts.leagueSpartan(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF000000),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 164,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            children: [
              _HeartHealthCard(
                iconWidget: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(Icons.description_outlined, color: Color(0xFFCE0D1F), size: 30),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.add_circle_outline, color: Color(0xFFCE0D1F), size: 14),
                      ),
                    ),
                  ],
                ),
                title: 'Symptoms',
                dividerColor: const Color(0xFFD01414),
                bulletPoints: const [
                  'Chest pain and pressure',
                  'Shortness of breath',
                  'Cold sweat, nausea, dizziness',
                ],
              ),
              const SizedBox(width: 8),
              const _HeartHealthCard(
                iconWidget: Text(
                  '?',
                  style: TextStyle(
                    fontSize: 34,
                    color: Color(0xFFD1CE16),
                    fontWeight: FontWeight.w300,
                  ),
                ),
                title: 'What to do',
                dividerColor: Color(0xFF6EA374),
                bulletPoints: [
                  'Call emergency services',
                  'Keep them calm & seated',
                  'Do not delay seeking help',
                ],
              ),
              const SizedBox(width: 8),
              const _HeartHealthCard(
                iconWidget: Icon(Icons.shield_outlined, color: Color(0xFF420C11), size: 34),
                title: 'Prevention',
                dividerColor: Color(0xFFD01414),
                bulletPoints: [
                  'Stay physically active',
                  'eat heart-healthy foods',
                  'avoid smoking & stress',
                ],
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Text(
            'Resources',
            style: GoogleFonts.leagueSpartan(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF000000),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 255,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
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
              SizedBox(width: 16),
            ],
          ),
        ),
      ],
    );
  }
}

class _HeartHealthCard extends StatelessWidget {
  const _HeartHealthCard({
    required this.iconWidget,
    required this.title,
    required this.dividerColor,
    required this.bulletPoints,
  });

  final Widget iconWidget;
  final String title;
  final Color dividerColor;
  final List<String> bulletPoints;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 151,
      height: 159,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFEAE8E8)),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 17),
          SizedBox(
            height: 35,
            child: Center(child: iconWidget),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.leagueSpartan(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF420C11),
              height: 1.0,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 90,
            height: 1,
            color: dividerColor,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: bulletPoints
                  .map(
                    (point) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 2, right: 6),
                            child: Icon(Icons.female, color: Color(0xFFD01414), size: 10), // Substitute for the custom gender marker / arrow from Figma
                          ),
                          Expanded(
                            child: Text(
                              point,
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 8,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF63373B).withValues(alpha: 0.5),
                                height: 1.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
