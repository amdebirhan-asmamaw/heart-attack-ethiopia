import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'app/app_bloc_observer.dart';
import 'core/config/app_config.dart';
import 'core/di/injection.dart';
import 'core/localization/generated/strings.g.dart';
import 'core/localization/locale_preferences.dart';
import 'features/auth/presentation/bloc/auth_cubit.dart';
import 'features/onboarding/presentation/bloc/onboarding_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlocObserver();

  final appConfig = await AppConfig.bootstrap();
  await configureDependencies(appConfig);
  await sl<LocalePreferences>().loadPreferredLocale();

  await _bootstrapWithTimeout(sl<OnboardingCubit>(), sl<AuthCubit>());

  runApp(TranslationProvider(child: App(appConfig: appConfig)));
}

Future<void> _bootstrapWithTimeout(
  OnboardingCubit onboardingCubit,
  AuthCubit authCubit,
) async {
  Future<void> bootstrapFuture() async {
    final onboardingResult = onboardingCubit.bootstrap();
    final authResult = authCubit.bootstrap();
    await Future.wait([onboardingResult, authResult]);
  }

  try {
    await bootstrapFuture().timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        onboardingCubit.handleBootstrapTimeout();
        authCubit.handleBootstrapTimeout();
      },
    );
  } catch (_) {
    onboardingCubit.handleBootstrapTimeout();
    authCubit.handleBootstrapTimeout();
  }
}
