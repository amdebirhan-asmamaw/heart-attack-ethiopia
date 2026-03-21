import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:heart_attack_ethiopia/core/config/app_config.dart';
import 'package:heart_attack_ethiopia/core/constants/app_colors.dart';
import 'package:heart_attack_ethiopia/core/di/injection.dart';
import 'package:heart_attack_ethiopia/core/localization/generated/strings.g.dart';
import 'package:heart_attack_ethiopia/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:heart_attack_ethiopia/features/chat/presentation/chat_page.dart';
import 'package:heart_attack_ethiopia/features/home/presentation/pages/home_content_page.dart';
import 'package:heart_attack_ethiopia/features/notifications/presentation/notifications_page.dart';
import 'package:heart_attack_ethiopia/features/profile/presentation/profile_page.dart';
import 'package:heart_attack_ethiopia/features/settings/presentation/settings_page.dart';
import 'package:heart_attack_ethiopia/shared/bloc/connectivity_cubit.dart';

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
      const ChatPage(),
      const NotificationsPage(),
      ProfilePage(userEmail: session?.user.email),
      SettingsPage(environmentLabel: sl<AppConfig>().environmentLabel),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final String title;
    switch (_currentIndex) {
      case 0:
        title = context.t.strings.app.name;
        break;
      case 1:
        title = context.t.strings.navigation.chat;
        break;
      case 2:
        title = context.t.strings.navigation.notifications;
        break;
      case 3:
        title = context.t.strings.navigation.profile;
        break;
      case 4:
        title = context.t.strings.navigation.settings;
        break;
      default:
        title = context.t.strings.app.name;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: AppColors.background,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
          ),
        ),
        centerTitle: _currentIndex == 3,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomSheet: BlocBuilder<ConnectivityCubit, ConnectivityState>(
        builder: (context, state) {
          if (state.isConnected) {
            return const SizedBox.shrink();
          }

          return MaterialBanner(
            content: Text(context.t.strings.common.noConnection),
            actions: [
              TextButton(
                onPressed: () {
                  context.read<ConnectivityCubit>().refresh();
                },
                child: Text(context.t.strings.common.retry),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 13.59, sigmaY: 13.59),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.background,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1A000000),
                  blurRadius: 110,
                  offset: Offset(0, -2),
                ),
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: SafeArea(
              top: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 8),
                  Container(
                    width: 134,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _NavItem(
                          icon: Icons.home_outlined,
                          activeIcon: Icons.home,
                          label: context.t.strings.navigation.home,
                          isSelected: _currentIndex == 0,
                          onTap: () => setState(() => _currentIndex = 0),
                        ),
                        _NavItem(
                          icon: Icons.chat_bubble_outline_rounded,
                          activeIcon: Icons.chat_bubble,
                          label: context.t.strings.navigation.chat,
                          isSelected: _currentIndex == 1,
                          onTap: () => setState(() => _currentIndex = 1),
                        ),
                        _NavItem(
                          icon: Icons.notifications_none_rounded,
                          activeIcon: Icons.notifications,
                          label: context.t.strings.navigation.notifications,
                          isSelected: _currentIndex == 2,
                          onTap: () => setState(() => _currentIndex = 2),
                        ),
                        _NavItem(
                          icon: Icons.person_outline_rounded,
                          activeIcon: Icons.person,
                          label: context.t.strings.navigation.profile,
                          isSelected: _currentIndex == 3,
                          onTap: () => setState(() => _currentIndex = 3),
                        ),
                        _NavItem(
                          icon: Icons.settings_outlined,
                          activeIcon: Icons.settings,
                          label: context.t.strings.navigation.settings,
                          isSelected: _currentIndex == 4,
                          onTap: () => setState(() => _currentIndex = 4),
                        ),
                      ],
                    ),
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
    required this.activeIcon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              color: isSelected
                  ? AppColors.primary
                  : AppColors.primary.withValues(alpha: 0.5),
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                color: isSelected
                    ? AppColors.primary
                    : AppColors.primary.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
