import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection available.']);
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'The server returned an error.']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Unable to read cached data.']);
}

class AuthFailure extends Failure {
  const AuthFailure([super.message = 'Authentication failed.']);
}
