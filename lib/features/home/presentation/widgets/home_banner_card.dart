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
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(34),
              ),
              child: Container(
                width: 150,
                height: 118,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFF3B6BA),
                      Color(0xFFE98B92),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 123,
            top: -10,
            child: Transform.rotate(
              angle: 0.42,
              child: Container(
                width: 84,
                height: 194,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.heartRed.withValues(alpha: 0.26),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),
          for (final double right in [12, 28])
            Positioned(
              right: right,
              top: right == 12 ? -8 : 4,
              child: Transform.rotate(
                angle: 0.42,
                child: Container(
                  width: right == 12 ? 2.2 : 1.6,
                  height: right == 12 ? 118 : 112,
                  color: AppColors.heartRed.withValues(alpha: 0.5),
                ),
              ),
            ),
          Positioned(
            left: 188,
            top: 11,
            child: Icon(
              Icons.favorite,
              size: 130,
              color: AppColors.heartRed.withValues(alpha: 0.9),
              shadows: const [
                Shadow(
                  color: Color(0x33000000),
                  blurRadius: 22,
                  offset: Offset(0, 10),
                ),
              ],
            ),
          ),
          Positioned(
            left: 222,
            top: 23,
            child: Icon(
              Icons.monitor_heart_outlined,
              size: 28,
              color: Colors.white.withValues(alpha: 0.45),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 43, 15, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Save A Heart Today',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.heartRed,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Your Contribution Provides Heart\nSaving Surgeries For Children In Need.',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    height: 1.5,
                    color: Color(0xCC171717),
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                  width: 187,
                  height: 21,
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: AppColors.green.withValues(alpha: 0.47),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 8,
                        color: AppColors.greenSubtle,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'DONATE NOW',
                        style: TextStyle(
                          fontFamily: 'League Spartan',
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.4,
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
