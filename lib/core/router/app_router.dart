import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/bloc/auth_cubit.dart';
import '../../features/profile/presentation/pages/edit_profile_page.dart';
import '../../features/profile/presentation/pages/change_password_page.dart';
import '../../features/profile/presentation/pages/language_page.dart';
import '../../features/news/presentation/pages/news_detail_page.dart';
import '../../features/education/presentation/pages/education_detail_page.dart';
import 'package:heart_attack_ethiopia/features/about/presentation/pages/about_hae_page.dart';
import 'package:heart_attack_ethiopia/features/about/presentation/pages/team_page.dart';
import 'package:heart_attack_ethiopia/features/chat/presentation/chat_page.dart';
import '../../shared/widgets/shell/app_shell.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/auth/presentation/pages/phone_input_page.dart';
import '../../features/auth/presentation/pages/otp_verification_page.dart';
import '../../features/auth/presentation/pages/auth_success_page.dart';
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
          GoRoute(
            path: AppRoutes.editProfile,
            builder: (context, state) => const EditProfilePage(),
          ),
          GoRoute(
            path: AppRoutes.changePassword,
            builder: (context, state) => const ChangePasswordPage(),
          ),
          GoRoute(
            path: AppRoutes.language,
            builder: (context, state) => const LanguagePage(),
          ),
          GoRoute(
            path: AppRoutes.newsDetail,
            builder: (context, state) => const NewsDetailPage(),
          ),
          GoRoute(
            path: AppRoutes.educationDetail,
            builder: (context, state) => const EducationDetailPage(),
          ),
          GoRoute(
            path: AppRoutes.aboutHae,
            builder: (context, state) => const AboutHAEPage(),
          ),
          GoRoute(
            path: AppRoutes.team,
            builder: (context, state) => const TeamPage(),
          ),
          GoRoute(
            path: AppRoutes.chat,
            builder: (context, state) => const ChatPage(),
          ),
          GoRoute(
            path: AppRoutes.home,
            builder: (context, state) => const AppShell(),
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
