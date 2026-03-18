class AppException implements Exception {
  const AppException(this.message);

  final String message;

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  const NetworkException([super.message = 'No internet connection available.']);
}

class ServerException extends AppException {
  const ServerException([super.message = 'The server returned an error.']);
}

class CacheException extends AppException {
  const CacheException([super.message = 'Unable to read cached data.']);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException([super.message = 'Invalid credentials.']);
}
