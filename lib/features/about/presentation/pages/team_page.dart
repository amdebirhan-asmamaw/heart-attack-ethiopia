import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:heart_attack_ethiopia/shared/widgets/cards/team_member_card.dart';
import 'package:heart_attack_ethiopia/shared/widgets/cards/board_member_card.dart';

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
                    child: TeamMemberCard(
                      name: 'Tesfaye Telila',
                      title: 'MD, FACC, FSCAI',
                      role: 'Founder and Executive Director',
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TeamMemberCard(
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
              height: 185,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                physics: const BouncingScrollPhysics(),
                children: const [
                  BoardMemberCard(
                    name: 'TARESSA WILLS\nMD',
                    role: 'Vice President',
                  ),
                  SizedBox(width: 8),
                  BoardMemberCard(
                    name: 'JON-ALAN MANNING\nMBA',
                    role: 'Director of Philanthropy',
                  ),
                  SizedBox(width: 8),
                  BoardMemberCard(
                    name: 'JAMES KAUTEN\nMD',
                    role: 'Director of Cardiac Surgery Training',
                  ),
                  SizedBox(width: 8),
                  BoardMemberCard(
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
              height: 185,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                physics: const BouncingScrollPhysics(),
                children: const [
                  BoardMemberCard(
                    name: 'VIRGINIA Burrell\nFNP-C',
                    role: 'Secretary',
                  ),
                  SizedBox(width: 8),
                  BoardMemberCard(
                    name: 'ARTHUR POOLE\nM.S.',
                    role: 'Cybersecurity & Technology Advisor',
                  ),
                  SizedBox(width: 8),
                  BoardMemberCard(
                    name: 'Odalys Sanchez\nMD',
                    role: 'Bookkeeper',
                  ),
                  SizedBox(width: 8),
                  BoardMemberCard(
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


