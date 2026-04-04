import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:heart_attack_ethiopia/core/config/app_config.dart';
import 'package:heart_attack_ethiopia/core/di/injection.dart';
import 'package:heart_attack_ethiopia/core/localization/generated/strings.g.dart';
import 'package:heart_attack_ethiopia/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:heart_attack_ethiopia/features/chat/presentation/chat_page.dart';
import 'package:heart_attack_ethiopia/features/home/presentation/pages/home_content_page.dart';
import 'package:heart_attack_ethiopia/features/notifications/presentation/notifications_page.dart';
import 'package:heart_attack_ethiopia/features/profile/presentation/profile_page.dart';
import 'package:heart_attack_ethiopia/features/settings/presentation/settings_page.dart';
import 'package:heart_attack_ethiopia/shared/bloc/connectivity_cubit.dart';
import 'package:heart_attack_ethiopia/app/resources/app_media.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    final session = context.read<AuthCubit>().state.session;
    _pages = [
      const HomeContentPage(),
      SettingsPage(environmentLabel: sl<AppConfig>().environmentLabel), // Education slot
      const ChatPage(), // Central AI slot
      const NotificationsPage(), // News slot
      ProfilePage(userEmail: session?.user.email),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      extendBody: true, // Allows body to scroll behind transparent bottom nav
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(58),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 4, top: 8),
          alignment: Alignment.bottomCenter,
          child: SafeArea(
            bottom: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppMedia.onboardingLogoPng,
                  height: 34,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.favorite,
                    color: Color(0xFFD72335),
                    size: 28,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(CupertinoIcons.search, size: 24, color: Color(0xFF252525)),
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: 16),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        IconButton(
                          icon: const Icon(CupertinoIcons.bell, size: 24, color: Color(0xFF252525)),
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        Positioned(
                          right: -2,
                          top: -2,
                          child: Container(
                            padding: const EdgeInsets.all(1.5),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF0B0B),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white, width: 1.5),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 14,
                              minHeight: 14,
                            ),
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: BlocBuilder<ConnectivityCubit, ConnectivityState>(
        builder: (context, state) {
          return Column(
            children: [
              if (!state.isConnected)
                MaterialBanner(
                  content: Text(context.t.strings.common.noConnection),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.read<ConnectivityCubit>().refresh();
                      },
                      child: Text(context.t.strings.common.retry),
                    ),
                  ],
                ),
              Expanded(
                child: IndexedStack(index: _currentIndex, children: _pages),
              ),
            ],
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {},
              child: const Icon(
                Icons.volunteer_activism,
                color: Color(0xFFD72335),
                size: 24,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
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
                    _buildNavItem(
                      icon: Icons.home,
                      index: 0,
                    ),
                    _buildNavItem(
                      icon: Icons.school_outlined,
                      index: 1,
                    ),
                    _buildCenterItem(),
                    _buildNavItem(
                      icon: CupertinoIcons.news,
                      index: 3,
                    ),
                    _buildNavItem(
                      icon: CupertinoIcons.person,
                      index: 4,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required int index,
  }) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
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

  Widget _buildCenterItem() {
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = 2),
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
