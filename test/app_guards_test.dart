import 'package:flutter_test/flutter_test.dart';
import 'package:heart_attack_ethiopia/core/router/guards.dart';
import 'package:heart_attack_ethiopia/core/router/routes.dart';
import 'package:heart_attack_ethiopia/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:heart_attack_ethiopia/features/onboarding/presentation/bloc/onboarding_cubit.dart';

void main() {
  group('AppGuards.redirect', () {
    test('keeps loading flows on splash', () {
      final redirect = AppGuards.redirect(
        authState: const AuthState.initial(),
        onboardingState: const OnboardingState.initial(),
        currentLocation: AppRoutes.splash,
      );

      expect(redirect, isNull);
    });

    test('routes incomplete onboarding to onboarding page', () {
      final redirect = AppGuards.redirect(
        authState: const AuthState(status: AuthStatus.unauthenticated),
        onboardingState: const OnboardingState(
          status: OnboardingStatus.pending,
          isSubmitting: false,
        ),
        currentLocation: AppRoutes.login,
      );

      expect(redirect, AppRoutes.onboarding);
    });

    test('redirects to home when authenticated on auth routes', () {
      final authState = const AuthState(status: AuthStatus.authenticated);

      final redirect1 = AppGuards.redirect(
        authState: authState,
        onboardingState: const OnboardingState(
          status: OnboardingStatus.completed,
          isSubmitting: false,
        ),
        currentLocation: AppRoutes.login,
      );
      expect(redirect1, AppRoutes.home);

      final redirect2 = AppGuards.redirect(
        authState: authState,
        onboardingState: const OnboardingState(
          status: OnboardingStatus.completed,
          isSubmitting: false,
        ),
        currentLocation: AppRoutes.splash,
      );
      expect(redirect2, AppRoutes.home);

      final redirect3 = AppGuards.redirect(
        authState: authState,
        onboardingState: const OnboardingState(
          status: OnboardingStatus.completed,
          isSubmitting: false,
        ),
        currentLocation: AppRoutes.onboarding,
      );
      expect(redirect3, AppRoutes.home);
    });

    test('routes unauthenticated users to login after onboarding', () {
      final redirect = AppGuards.redirect(
        authState: const AuthState(status: AuthStatus.unauthenticated),
        onboardingState: const OnboardingState(
          status: OnboardingStatus.completed,
          isSubmitting: false,
        ),
        currentLocation: AppRoutes.home,
      );

      expect(redirect, AppRoutes.login);
    });

    test(
      'moves completed users from splash to onboarding during development',
      () {
        final redirect = AppGuards.redirect(
          authState: const AuthState(status: AuthStatus.unauthenticated),
          onboardingState: const OnboardingState(
            status: OnboardingStatus.completed,
            isSubmitting: false,
          ),
          currentLocation: AppRoutes.splash,
        );

        expect(redirect, AppRoutes.onboarding);
      },
    );

    test('moves completed unauthenticated users off onboarding to login', () {
      final redirect = AppGuards.redirect(
        authState: const AuthState(status: AuthStatus.unauthenticated),
        onboardingState: const OnboardingState(
          status: OnboardingStatus.completed,
          isSubmitting: false,
        ),
        currentLocation: AppRoutes.onboarding,
      );

      expect(redirect, AppRoutes.login);
    });
  });
}
