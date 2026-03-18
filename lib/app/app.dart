import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../core/config/app_config.dart';
import '../core/di/injection.dart';
import '../core/localization/generated/strings.g.dart';
import '../core/router/app_router.dart';
import '../core/theme/app_theme.dart';
import '../features/auth/presentation/bloc/auth_cubit.dart';
import '../features/onboarding/presentation/bloc/onboarding_cubit.dart';
import '../shared/bloc/connectivity_cubit.dart';

class App extends StatefulWidget {
  const App({required this.appConfig, super.key});

  final AppConfig appConfig;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AuthCubit _authCubit = sl<AuthCubit>();
  late final OnboardingCubit _onboardingCubit = sl<OnboardingCubit>();
  late final ConnectivityCubit _connectivityCubit = sl<ConnectivityCubit>()
    ..startMonitoring();
  late final AppRouter _appRouter = sl<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>.value(value: _authCubit),
        BlocProvider<OnboardingCubit>.value(value: _onboardingCubit),
        BlocProvider<ConnectivityCubit>.value(value: _connectivityCubit),
      ],
      child: MaterialApp.router(
        title: widget.appConfig.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        routerConfig: _appRouter.router,
      ),
    );
  }

  @override
  void dispose() {
    _appRouter.dispose();
    _connectivityCubit.close();
    _onboardingCubit.close();
    _authCubit.close();
    super.dispose();
  }
}
