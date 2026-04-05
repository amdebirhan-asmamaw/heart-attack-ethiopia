import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:heart_attack_ethiopia/core/config/app_config.dart';
import 'package:heart_attack_ethiopia/core/di/injection.dart';
import 'package:heart_attack_ethiopia/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:heart_attack_ethiopia/features/chat/presentation/chat_page.dart';
import 'package:heart_attack_ethiopia/features/home/presentation/pages/home_content_page.dart';
import 'package:heart_attack_ethiopia/features/notifications/presentation/notifications_page.dart';
import 'package:heart_attack_ethiopia/features/profile/presentation/profile_page.dart';
import 'package:heart_attack_ethiopia/features/settings/presentation/settings_page.dart';

import 'home_app_bar.dart';
import 'home_bottom_nav.dart';
import 'home_fab.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _currentIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    final session = context.read<AuthCubit>().state.session;
    _pages = [
      const HomeContentPage(),
      SettingsPage(environmentLabel: sl<AppConfig>().environmentLabel),
      const ChatPage(),
      const NotificationsPage(),
      ProfilePage(userEmail: session?.user.email),
    ];
  }

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      extendBody: true,
      appBar: const HomeAppBar(),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: HomeFab(onTap: () {}),
      bottomNavigationBar: HomeBottomNav(
        currentIndex: _currentIndex,
        onTabSelected: _onTabSelected,
      ),
    );
  }
}
