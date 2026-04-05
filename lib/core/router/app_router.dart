import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/config/app_config.dart';
import '../../core/di/injection.dart';
import '../../features/auth/presentation/bloc/auth_cubit.dart';
import '../../home_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/auth/presentation/pages/phone_input_page.dart';
import '../../features/auth/presentation/pages/otp_verification_page.dart';
import '../../features/auth/presentation/pages/auth_success_page.dart';
import '../../features/chat/presentation/chat_page.dart';
import '../../features/home/presentation/pages/home_content_page.dart';
import '../../features/notifications/presentation/notifications_page.dart';
import '../../features/profile/presentation/profile_page.dart';
import '../../features/settings/presentation/settings_page.dart';
import '../../splash_page.dart';
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
            path: AppRoutes.signup,
            builder: (context, state) => const SignupPage(),
          ),
          GoRoute(
            path: AppRoutes.phoneInput,
            builder: (context, state) => const PhoneInputPage(),
          ),
          GoRoute(
            path: AppRoutes.otpVerification,
            builder: (context, state) => const OtpVerificationPage(),
          ),
          GoRoute(
            path: AppRoutes.authSuccess,
            builder: (context, state) => const AuthSuccessPage(),
          ),
          StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) {
              return HomePage(navigationShell: navigationShell);
            },
            branches: [
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: AppRoutes.home,
                    builder: (context, state) => const HomeContentPage(),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: AppRoutes.education,
                    builder: (context, state) => SettingsPage(
                      environmentLabel: sl<AppConfig>().environmentLabel,
                    ),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: AppRoutes.chat,
                    builder: (context, state) => const ChatPage(),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: AppRoutes.news,
                    builder: (context, state) => const NotificationsPage(),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: AppRoutes.profile,
                    builder: (context, state) {
                      final session = context.read<AuthCubit>().state.session;
                      return ProfilePage(userEmail: session?.user.email);
                    },
                  ),
                ],
              ),
            ],
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
