import 'package:flutter/material.dart';
import 'package:heart_attack_ethiopia/core/constants/app_colors.dart';

class HomeBannerCard extends StatelessWidget {
  const HomeBannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 171,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: 10,
            top: 0,
            child: Icon(
              Icons.favorite,
              size: 150,
              color: AppColors.heartRed.withValues(alpha: 0.1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Save a heart today',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.heartRed,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Your contribution provides heart saving surgeries for children in need.',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    color: Color(0xCC171717),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: const Color(0x7797D923),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 8,
                        color: AppColors.greenSubtle,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'DONATE',
                        style: TextStyle(
                          fontFamily: 'League Spartan',
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                          color: AppColors.greenSubtle,
                        ),
                      ),
                    ],
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
