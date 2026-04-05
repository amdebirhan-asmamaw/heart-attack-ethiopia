import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:heart_attack_ethiopia/core/localization/generated/strings.g.dart';
import 'package:heart_attack_ethiopia/shared/bloc/connectivity_cubit.dart';
import 'package:heart_attack_ethiopia/shared/widgets/shell/home_app_bar.dart';
import 'package:heart_attack_ethiopia/shared/widgets/shell/home_bottom_nav.dart';
import 'package:heart_attack_ethiopia/shared/widgets/shell/home_fab.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onTabSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      extendBody: true,
      appBar: const HomeAppBar(),
      body: BlocBuilder<ConnectivityCubit, ConnectivityState>(
        builder: (context, state) {
          return Column(
            children: [
              if (!state.isConnected)
                MaterialBanner(
                  content: Text(context.t.strings.common.noConnection),
                  actions: [
                    TextButton(
                      onPressed: () => context.read<ConnectivityCubit>().refresh(),
                      child: Text(context.t.strings.common.retry),
                    ),
                  ],
                ),
              Expanded(
                child: navigationShell,
              ),
            ],
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: HomeFab(onTap: () {}),
      bottomNavigationBar: HomeBottomNav(
        currentIndex: navigationShell.currentIndex,
        onTabSelected: _onTabSelected,
      ),
    );
  }
}
