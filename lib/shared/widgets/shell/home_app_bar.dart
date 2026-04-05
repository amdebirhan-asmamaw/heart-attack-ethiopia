import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_attack_ethiopia/app/resources/app_media.dart';
import 'package:go_router/go_router.dart';
import 'package:heart_attack_ethiopia/core/router/routes.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(58);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      titleSpacing: 16,
      toolbarHeight: 58,
      title: Image.asset(
        AppMedia.onboardingLogoPng,
        height: 34,
        errorBuilder: (context, error, stackTrace) => const Icon(
          Icons.favorite,
          color: Color(0xFFD72335),
          size: 28,
        ),
      ),
      actions: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: const Icon(CupertinoIcons.bell, size: 24, color: Color(0xFF252525)),
              onPressed: () => context.push(AppRoutes.notifications),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            Positioned(
              right: -2,
              top: 6,
              child: Container(
                padding: const EdgeInsets.all(1.5),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF0B0B),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
                constraints: const BoxConstraints(minWidth: 14, minHeight: 14),
                child: const Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
