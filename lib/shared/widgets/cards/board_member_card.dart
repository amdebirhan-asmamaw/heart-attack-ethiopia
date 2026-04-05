import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:heart_attack_ethiopia/app/resources/app_media.dart';

class BoardMemberCard extends StatelessWidget {
  const BoardMemberCard({
    super.key,
    required this.name,
    required this.role,
  });

  final String name;
  final String role;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140, // 123 -> 140 to accommodate larger text
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        border: Border.all(color: const Color(0xFFEAE8E8)),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 10), // bumped padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 90, // 78 -> 90
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
          const SizedBox(height: 12),
          Text(
            name,
            style: GoogleFonts.inter(
              fontSize: 13, // 10 -> 13
              fontWeight: FontWeight.w600,
              color: Colors.black,
              letterSpacing: -0.06,
              height: 1.2,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Text(
              role,
              style: GoogleFonts.inter(
                fontSize: 11, // 8 -> 11
                fontWeight: FontWeight.w400,
                color: Colors.black87,
                height: 1.2,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
