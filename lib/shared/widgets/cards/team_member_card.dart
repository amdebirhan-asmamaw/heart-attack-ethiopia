import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:heart_attack_ethiopia/app/resources/app_media.dart';

class TeamMemberCard extends StatelessWidget {
  const TeamMemberCard({
    super.key,
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
      padding: const EdgeInsets.all(10), // bumped padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 160, // bumped height for better mobile tap bounds
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
                    fontSize: 16, // 14 -> 16
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const Icon(Icons.call_made_rounded, size: 18, color: Colors.black),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 12, // 10 -> 12
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            role,
            style: GoogleFonts.inter(
              fontSize: 12, // 10 -> 12
              fontWeight: FontWeight.w400,
              color: Colors.black,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
