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
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: onTabSelected,
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: const Color(0xFF420C11),
              unselectedItemColor: const Color(0xFF420C11).withValues(alpha: 0.5),
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 26),
                  label: '',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.school_outlined, size: 26),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    width: 44,
                    height: 44,
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
                    child: const Icon(CupertinoIcons.question, color: Colors.white, size: 24),
                  ),
                  label: '',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.news, size: 26),
                  label: '',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person, size: 26),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
