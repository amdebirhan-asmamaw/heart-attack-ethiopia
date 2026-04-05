import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(35),
        topRight: Radius.circular(35),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7.5, sigmaY: 7.5),
        child: Container(
          height: 75,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.7),
            border: const Border(
              top: BorderSide(color: Color(0xFFF3F3F3), width: 0.5),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x05000000), // 0.02 opacity equivalent
                blurRadius: 70,
                offset: Offset(0, 0),
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _NavItem(
                    icon: Icons.home,
                    isSelected: currentIndex == 0,
                    onTap: () => onTabSelected(0),
                  ),
                  _NavItem(
                    icon: Icons.school_outlined,
                    isSelected: currentIndex == 1,
                    onTap: () => onTabSelected(1),
                  ),
                  _CenterItem(onTap: () => onTabSelected(2)),
                  _NavItem(
                    icon: CupertinoIcons.news,
                    isSelected: currentIndex == 3,
                    onTap: () => onTabSelected(3),
                  ),
                  _NavItem(
                    icon: CupertinoIcons.person,
                    isSelected: currentIndex == 4,
                    onTap: () => onTabSelected(4),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Icon(
          icon,
          color: isSelected
              ? const Color(0xFF420C11)
              : const Color(0xFF420C11).withValues(alpha: 0.5),
          size: 26,
        ),
      ),
    );
  }
}

class _CenterItem extends StatelessWidget {
  const _CenterItem({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 44,
        height: 44,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFD72335), Color(0xFF71121C)],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFD72335).withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(
          CupertinoIcons.question,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
