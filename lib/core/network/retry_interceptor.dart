import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  RetryInterceptor(this._dio);

  final Dio _dio;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final shouldRetry =
        err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout;
    final alreadyRetried = err.requestOptions.extra['retried'] == true;

    if (!shouldRetry || alreadyRetried) {
      handler.next(err);
      return;
    }

    final options = Options(
      method: err.requestOptions.method,
      headers: err.requestOptions.headers,
      responseType: err.requestOptions.responseType,
      contentType: err.requestOptions.contentType,
      sendTimeout: err.requestOptions.sendTimeout,
      receiveTimeout: err.requestOptions.receiveTimeout,
      extra: <String, Object?>{...err.requestOptions.extra, 'retried': true},
    );

    try {
      final response = await _dio.request<dynamic>(
        err.requestOptions.path,
        data: err.requestOptions.data,
        queryParameters: err.requestOptions.queryParameters,
        options: options,
        cancelToken: err.requestOptions.cancelToken,
      );
      handler.resolve(response);
    } on DioException catch (retryError) {
      handler.next(retryError);
    }
  }
}
