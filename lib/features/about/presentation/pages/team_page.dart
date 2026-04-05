import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:heart_attack_ethiopia/app/resources/app_media.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

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
        title: Text(
          'THE TEAM',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF32080C),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            // Founders Section
            Text(
              'Founders',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF32080C).withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: _FounderCard(
                      name: 'Tesfaye Telila',
                      title: 'MD, FACC, FSCAI',
                      role: 'Founder and Executive Director',
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: _FounderCard(
                      name: 'OBSINET MERID',
                      title: 'MD',
                      role: 'Co-Founder & CEO',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Executive Board Members
            Text(
              'Executive Board Members',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF32080C).withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 145,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                physics: const BouncingScrollPhysics(),
                children: const [
                  _BoardMemberCard(
                    name: 'TARESSA WILLS\nMD',
                    role: 'Vice President',
                  ),
                  SizedBox(width: 8),
                  _BoardMemberCard(
                    name: 'JON-ALAN MANNING\nMBA',
                    role: 'Director of Philanthropy',
                  ),
                  SizedBox(width: 8),
                  _BoardMemberCard(
                    name: 'JAMES KAUTEN\nMD',
                    role: 'Director of Cardiac Surgery Training',
                  ),
                  SizedBox(width: 8),
                  _BoardMemberCard(
                    name: 'WESLEY HOWARD',
                    role: 'CFO',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Advisory Board Members
            Text(
              'Advisory Board Members',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF32080C).withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 145,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                physics: const BouncingScrollPhysics(),
                children: const [
                  _BoardMemberCard(
                    name: 'VIRGINIA Burrell\nFNP-C',
                    role: 'Secretary',
                  ),
                  SizedBox(width: 8),
                  _BoardMemberCard(
                    name: 'ARTHUR POOLE\nM.S.',
                    role: 'Cybersecurity & Technology Advisor',
                  ),
                  SizedBox(width: 8),
                  _BoardMemberCard(
                    name: 'Odalys Sanchez\nMD',
                    role: 'Bookkeeper',
                  ),
                  SizedBox(width: 8),
                  _BoardMemberCard(
                    name: 'Stephanie Robbins',
                    role: 'CLO',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48), // Bottom padding
          ],
        ),
      ),
    );
  }
}

// ------------------------------
// Local Component Definitions
// ------------------------------

class _FounderCard extends StatelessWidget {
  const _FounderCard({
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

class _BoardMemberCard extends StatelessWidget {
  const _BoardMemberCard({
    required this.name,
    required this.role,
  });

  final String name;
  final String role;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 123,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        border: Border.all(color: const Color(0xFFEAE8E8)),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 78,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              image: const DecorationImage(
                image: AssetImage(AppMedia.teamDoctor),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              name,
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                letterSpacing: -0.06,
                height: 1.2,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            role,
            style: GoogleFonts.inter(
              fontSize: 8,
              fontWeight: FontWeight.w300,
              color: Colors.black,
              height: 1.2,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
