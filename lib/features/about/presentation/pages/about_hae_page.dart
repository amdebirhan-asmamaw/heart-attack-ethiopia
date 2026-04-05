import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:heart_attack_ethiopia/app/resources/app_media.dart';

import 'package:heart_attack_ethiopia/core/router/routes.dart';

class AboutHAEPage extends StatelessWidget {
  const AboutHAEPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF420C11)),
          onPressed: () => context.pop(),
        ),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 32.0),
            child: SizedBox(
               height: 40,
               child: Image.asset('assets/logo/logo.png'), // Placeholder for HAE Logo
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headboard Section
            Text(
              'Saving Lives,\nOne Heart At A Time.',
              style: GoogleFonts.leagueSpartan(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF32080C),
                height: 1.1,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Heart Attack Ethiopia is a nonprofit initiative founded by Ethiopian-American physicians to reduce premature deaths caused by heart attacks and strokes across Ethiopia and Africa. We focus on improving awareness, prevention, and timely care to save lives and strengthen cardiovascular health in our communities.',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black.withValues(alpha: 0.5),
                height: 1.4,
                letterSpacing: -0.05,
              ),
            ),
            const SizedBox(height: 32),

            // Accordion Sections
            const _HAEAccordion(
              title: 'Our Mission',
              previewText: 'Heart Attack Ethiopia is dedicated to saving lives and improving cardiovascular health in ...',
            ),
            const SizedBox(height: 10),
            const _HAEAccordion(
              title: 'Our Vision',
              previewText: 'We aspire to inspire and catalyze positive change in cardiovascular health throughout Africa. ...',
            ),
            const SizedBox(height: 10),
            const _HAEAccordion(
              title: 'Our Approach',
              previewText: 'We believe in a holistic approach to cardiovascular health. Through community outreach pro...',
            ),
            const SizedBox(height: 10),
            const _HAEAccordion(
              title: 'Why Ethiopia?',
              previewText: 'Cardiovascular disease is a leading cause of death in Ethiopia, responsible for nearly 30% of ...',
            ),
            const SizedBox(height: 32),

            // The Team Section
            Center(
              child: Text(
                'THE TEAM',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF32080C),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(
                  child: _TeamCard(
                    name: 'Tesfaye Telila',
                    title: 'MD, FACC, FSCAI',
                    role: 'Founder and Executive Director',
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: _TeamCard(
                    name: 'OBSINET MERID',
                    title: 'MD',
                    role: 'Co-Founder & CEO',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: InkWell(
                onTap: () {
                  context.push(AppRoutes.team);
                },
                child: Text(
                  'See the full team',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF2C8A23),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Be Part of the Change Section
            Text(
              'BE PART OF THE CHANGE',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF32080C),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 347,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: const [
                  _DonationCard(
                    title: 'One-Time Donation',
                    bullets: [
                      'Fund medical supplies and treatments for those in need.',
                      'Create awareness campaigns that educate communities about heart health.',
                    ],
                  ),
                  SizedBox(width: 16),
                  _DonationCard(
                    title: 'Monthly Donation',
                    bullets: [
                      'Just \$5/month helps provide life-saving cardiac care to patients on long waiting list in Ethiopia.',
                      'Support the training of future doctors and nurses to expand access to expert care.',
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Donate Buttom Fixed Footer
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2C8A23),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Text(
              'Donate Now',
              style: GoogleFonts.inter(
                fontSize: 14, // Slightly bumped up from 10px Figma for standard mobile legibility
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ------------------------------
// Local Component Definitions
// ------------------------------

class _HAEAccordion extends StatelessWidget {
  const _HAEAccordion({
    required this.title,
    required this.previewText,
  });

  final String title;
  final String previewText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFEAE8E8)),
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF000000),
                ),
              ),
              const Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF32080C)),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            previewText,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.black.withValues(alpha: 0.5),
              height: 1.4,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _TeamCard extends StatelessWidget {
  const _TeamCard({
    required this.name,
    required this.title,
    required this.role,
  });

  final String name;
  final String title;
  final String role;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        border: Border.all(color: const Color(0xFFEAE8E8)),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 139,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage(AppMedia.teamDoctor),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  name,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const Icon(Icons.call_made_rounded, size: 16, color: Colors.black),
            ],
          ),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            role,
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w300,
              color: Colors.black,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

class _DonationCard extends StatelessWidget {
  const _DonationCard({
    required this.title,
    required this.bullets,
  });

  final String title;
  final List<String> bullets;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 333,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFEAE8E8)),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 162,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              image: DecorationImage(
                image: AssetImage(AppMedia.donationEvent),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19, right: 19, top: 11, bottom: 16),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...bullets.map((bullet) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0, right: 6.0),
                                child: Container(
                                  width: 4,
                                  height: 4,
                                  decoration: const BoxDecoration(
                                    color: Colors.black54,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  bullet,
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withValues(alpha: 0.5),
                                    height: 1.2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
