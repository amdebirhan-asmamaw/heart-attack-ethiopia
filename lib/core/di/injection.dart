import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/logout_usecase.dart';
import '../../features/auth/domain/usecases/restore_session_usecase.dart';
import '../../features/auth/presentation/bloc/auth_cubit.dart';
import '../../features/auth/presentation/bloc/login_cubit.dart';
import '../../features/onboarding/data/datasources/onboarding_local_data_source.dart';
import '../../features/onboarding/data/repositories/onboarding_repository_impl.dart';
import '../../features/onboarding/domain/repositories/onboarding_repository.dart';
import '../../features/onboarding/domain/usecases/complete_onboarding_usecase.dart';
import '../../features/onboarding/domain/usecases/get_onboarding_status_usecase.dart';
import '../../features/onboarding/presentation/bloc/onboarding_cubit.dart';
import '../../shared/bloc/connectivity_cubit.dart';
import '../config/app_config.dart';
import '../localization/locale_preferences.dart';
import '../network/auth_interceptor.dart';
import '../network/dio_client.dart';
import '../network/network_info.dart';
import '../network/websocket_manager.dart';
import '../router/app_router.dart';

final sl = GetIt.instance;

Future<void> configureDependencies(AppConfig appConfig) async {
  await sl.reset();

  sl.registerSingleton<AppConfig>(appConfig);
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => LocalePreferences(secureStorage: sl()));
  sl.registerLazySingleton<Connectivity>(Connectivity.new);

  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(secureStorage: sl()),
  );
  sl.registerLazySingleton<OnboardingLocalDataSource>(
    () => OnboardingLocalDataSourceImpl(secureStorage: sl()),
  );
  sl.registerLazySingleton<AuthRemoteDataSource>(MockAuthRemoteDataSource.new);
  sl.registerLazySingleton<NetworkInfo>(
    () => ConnectivityNetworkInfo(connectivity: sl()),
  );
  sl.registerLazySingleton<AuthTokenProvider>(
    () => AuthTokenProvider(readToken: sl<AuthLocalDataSource>().readToken),
  );
  sl.registerLazySingleton<Dio>(
    () => DioClient(appConfig: sl(), tokenProvider: sl()).client,
  );
  sl.registerLazySingleton(WebSocketManager.new);

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(localDataSource: sl()),
  );
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton(() => RestoreSessionUseCase(sl()));
  sl.registerLazySingleton(() => GetOnboardingStatusUseCase(sl()));
  sl.registerLazySingleton(() => CompleteOnboardingUseCase(sl()));

  sl.registerLazySingleton(
    () => AuthCubit(logoutUseCase: sl(), restoreSessionUseCase: sl()),
  );
  sl.registerLazySingleton(
    () => OnboardingCubit(
      completeOnboardingUseCase: sl(),
      getOnboardingStatusUseCase: sl(),
    ),
  );
  sl.registerFactory(() => LoginCubit(loginUseCase: sl()));
  sl.registerLazySingleton(() => ConnectivityCubit(connectivity: sl()));
  sl.registerLazySingleton(
    () => AppRouter(authCubit: sl(), onboardingCubit: sl()),
  );
}
