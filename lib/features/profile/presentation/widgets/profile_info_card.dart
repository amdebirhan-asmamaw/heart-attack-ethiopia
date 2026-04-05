import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({
    required this.name,
    required this.email,
    this.avatarUrl,
    super.key,
  });

  final String name;
  final String email;
  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 8, 15, 0),
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFF2F2F2),
              image: avatarUrl != null
                  ? DecorationImage(
                      image: NetworkImage(avatarUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: avatarUrl == null
                ? const Icon(Icons.person, color: Colors.grey, size: 30)
                : null,
          ),
          const SizedBox(width: 17),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: GoogleFonts.inter(
                    fontSize: 16, // bumped
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  email,
                  style: GoogleFonts.leagueSpartan(
                    fontSize: 14, // bumped
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.25),
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
