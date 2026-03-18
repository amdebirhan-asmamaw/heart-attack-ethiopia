import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/localization/generated/strings.g.dart';
import '../../../../features/chat/presentation/chat_page.dart';
import '../../../../features/notifications/presentation/notifications_page.dart';
import '../../../../features/profile/presentation/profile_page.dart';
import '../../../../features/settings/presentation/settings_page.dart';
import '../../../../shared/bloc/connectivity_cubit.dart';
import '../bloc/auth_cubit.dart';

class AppShellPage extends StatefulWidget {
  const AppShellPage({super.key});

  @override
  State<AppShellPage> createState() => _AppShellPageState();
}

class _AppShellPageState extends State<AppShellPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final session = context.watch<AuthCubit>().state.session;
    final pages = [
      const ChatPage(),
      const NotificationsPage(),
      ProfilePage(userEmail: session?.user.email),
      SettingsPage(environmentLabel: sl<AppConfig>().environmentLabel),
    ];

    final destinations = [
      NavigationDestination(
        icon: const Icon(Icons.chat_bubble_outline_rounded),
        label: context.t.strings.navigation.chat,
      ),
      NavigationDestination(
        icon: const Icon(Icons.notifications_none_rounded),
        label: context.t.strings.navigation.notifications,
      ),
      NavigationDestination(
        icon: const Icon(Icons.person_outline_rounded),
        label: context.t.strings.navigation.profile,
      ),
      NavigationDestination(
        icon: const Icon(Icons.settings_outlined),
        label: context.t.strings.navigation.settings,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(context.t.strings.app.name)),
      body: Column(
        children: [
          BlocBuilder<ConnectivityCubit, ConnectivityState>(
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
          Expanded(
            child: IndexedStack(index: _currentIndex, children: pages),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        destinations: destinations,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
