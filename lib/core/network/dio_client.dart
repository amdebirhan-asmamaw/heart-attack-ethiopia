import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../config/app_config.dart';
import 'auth_interceptor.dart';
import 'retry_interceptor.dart';

class DioClient {
  DioClient({
    required AppConfig appConfig,
    required AuthTokenProvider tokenProvider,
  }) : client = Dio(
         BaseOptions(
           baseUrl: appConfig.env.apiBaseUrl,
           connectTimeout: appConfig.env.connectTimeout,
           receiveTimeout: appConfig.env.receiveTimeout,
           sendTimeout: appConfig.env.connectTimeout,
           headers: const <String, String>{
             'Accept': 'application/json',
             'Content-Type': 'application/json',
           },
         ),
       ) {
    client.interceptors.addAll([
      AuthInterceptor(tokenProvider: tokenProvider),
      RetryInterceptor(client),
      if (appConfig.env.enableDioLogging)
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
        ),
    ]);
  }

  final Dio client;
}
