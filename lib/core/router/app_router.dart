import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/bloc/auth_cubit.dart';
import '../../features/auth/presentation/pages/app_shell_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/onboarding/presentation/bloc/onboarding_cubit.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import 'guards.dart';
import 'routes.dart';

class AppRouter {
  factory AppRouter({
    required AuthCubit authCubit,
    required OnboardingCubit onboardingCubit,
  }) {
    final refreshListenable = RouterRefreshListenable([
      authCubit.stream,
      onboardingCubit.stream,
    ]);
    return AppRouter._(
      refreshListenable: refreshListenable,
      router: GoRouter(
        initialLocation: AppRoutes.splash,
        refreshListenable: refreshListenable,
        redirect: (context, state) => AppGuards.redirect(
          authState: authCubit.state,
          onboardingState: onboardingCubit.state,
          currentLocation: state.matchedLocation,
        ),
        routes: [
          GoRoute(
            path: AppRoutes.splash,
            builder: (context, state) => const SplashPage(),
          ),
          GoRoute(
            path: AppRoutes.onboarding,
            builder: (context, state) => const OnboardingPage(),
          ),
          GoRoute(
            path: AppRoutes.login,
            builder: (context, state) => const LoginPage(),
          ),
          GoRoute(
            path: AppRoutes.shell,
            builder: (context, state) => const AppShellPage(),
          ),
        ],
      ),
    );
  }

  AppRouter._({
    required RouterRefreshListenable refreshListenable,
    required this.router,
  }) : _refreshListenable = refreshListenable;

  final RouterRefreshListenable _refreshListenable;
  final GoRouter router;

  void dispose() {
    _refreshListenable.dispose();
  }
}

class RouterRefreshListenable extends ChangeNotifier {
  RouterRefreshListenable(Iterable<Stream<dynamic>> streams) {
    _subscriptions = [
      for (final stream in streams)
        stream.asBroadcastStream().listen((_) {
          notifyListeners();
        }),
    ];
  }

  late final List<StreamSubscription<dynamic>> _subscriptions;

  @override
  void dispose() {
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }
}
