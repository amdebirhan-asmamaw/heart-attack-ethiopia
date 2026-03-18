import '../../features/auth/presentation/bloc/auth_cubit.dart';
import '../../features/onboarding/presentation/bloc/onboarding_cubit.dart';
import 'routes.dart';

abstract final class AppGuards {
  static String? redirect({
    required AuthState authState,
    required OnboardingState onboardingState,
    required String currentLocation,
  }) {
    final isAuthRoute = currentLocation == AppRoutes.login;
    final isOnboardingRoute = currentLocation == AppRoutes.onboarding;
    final isSplashRoute = currentLocation == AppRoutes.splash;
    final isProtectedRoute = currentLocation.startsWith(AppRoutes.shell);

    switch (onboardingState.status) {
      case OnboardingStatus.initial:
      case OnboardingStatus.loading:
        return isSplashRoute ? null : AppRoutes.splash;
      case OnboardingStatus.pending:
        return isOnboardingRoute ? null : AppRoutes.onboarding;
      case OnboardingStatus.completed:
        break;
    }

    switch (authState.status) {
      case AuthStatus.initial:
      case AuthStatus.loading:
        return isSplashRoute ? null : AppRoutes.splash;
      case AuthStatus.authenticated:
        if (isAuthRoute || isSplashRoute || isOnboardingRoute) {
          return AppRoutes.shell;
        }
        return null;
      case AuthStatus.unauthenticated:
        if (isProtectedRoute) {
          return AppRoutes.login;
        }
        return isSplashRoute || isAuthRoute ? null : AppRoutes.login;
    }
  }
}
