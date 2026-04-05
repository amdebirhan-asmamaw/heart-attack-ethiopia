import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:heart_attack_ethiopia/core/router/routes.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFAFAFA),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _AboutListItem(
                  iconWidget: const Icon(Icons.support_agent_outlined, color: Colors.black87),
                  title: 'Help center',
                  onTap: () {
                    context.push(AppRoutes.chat);
                  },
                ),
                const SizedBox(height: 16),
                _AboutListItem(
                  iconWidget: const Icon(Icons.call_outlined, color: Colors.black87),
                  title: 'Call center',
                  onTap: () {},
                ),
                const SizedBox(height: 16),
                _AboutListItem(
                  iconWidget: Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.all(2),
                    child: Center(
                      child: Image.asset('assets/logo/logo.png'), // TODO: Replace with specific icon if needed
                    ),
                  ),
                  title: 'Heart Attack Ethiopia',
                  onTap: () {
                    context.push('/about-hae');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutListItem extends StatelessWidget {
  const _AboutListItem({
    required this.iconWidget,
    required this.title,
    required this.onTap,
  });

  final Widget iconWidget;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Center(child: iconWidget),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF333333),
                  height: 1.2,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Color(0xFFEAE8E8),
            ),
          ],
        ),
      ),
    );
  }
}
