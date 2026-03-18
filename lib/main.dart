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
  await sl<OnboardingCubit>().bootstrap();
  await sl<AuthCubit>().bootstrap();

  runApp(TranslationProvider(child: App(appConfig: appConfig)));
}
