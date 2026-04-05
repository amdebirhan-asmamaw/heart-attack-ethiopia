import '../../features/auth/presentation/bloc/auth_cubit.dart';
import '../../features/onboarding/presentation/bloc/onboarding_cubit.dart';
import 'routes.dart';

abstract final class AppGuards {
  static String? redirect({
    required AuthState authState,
    required OnboardingState onboardingState,
    required String currentLocation,
  }) {
    final isUnprotectedRoute =
        currentLocation == AppRoutes.login ||
        currentLocation == AppRoutes.signup ||
        currentLocation == AppRoutes.phoneInput ||
        currentLocation == AppRoutes.otpVerification ||
        currentLocation == AppRoutes.authSuccess ||
        currentLocation == AppRoutes.splash ||
        currentLocation == AppRoutes.onboarding;
    
    final isAuthRoute =
        currentLocation == AppRoutes.login ||
        currentLocation == AppRoutes.signup ||
        currentLocation == AppRoutes.phoneInput ||
        currentLocation == AppRoutes.otpVerification;

    final isOnboardingRoute = currentLocation == AppRoutes.onboarding;
    final isSplashRoute = currentLocation == AppRoutes.splash;
    final isProtectedRoute = !isUnprotectedRoute;

    switch (onboardingState.status) {
      case OnboardingStatus.initial:
      case OnboardingStatus.loading:
        return isSplashRoute ? null : AppRoutes.splash;
      case OnboardingStatus.pending:
        return isOnboardingRoute ? null : AppRoutes.onboarding;
      case OnboardingStatus.completed:
        if (isSplashRoute) {
          return AppRoutes.onboarding;
        }
        break;
    }

    switch (authState.status) {
      case AuthStatus.initial:
      case AuthStatus.loading:
        return isSplashRoute ? null : AppRoutes.splash;
      case AuthStatus.authenticated:
        if (isAuthRoute || isSplashRoute || isOnboardingRoute) {
          return AppRoutes.home;
        }
        return null;
      case AuthStatus.unauthenticated:
        if (isProtectedRoute) {
          return AppRoutes.login;
        }
        if (isAuthRoute) {
          return null;
        }
        return AppRoutes.login;
    }
  }
}
