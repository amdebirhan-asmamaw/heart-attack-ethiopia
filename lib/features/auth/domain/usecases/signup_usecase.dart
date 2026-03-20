import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/auth_session.dart';
import '../repositories/auth_repository.dart';

class SignupUseCase {
  const SignupUseCase(this._repository);

  final AuthRepository _repository;

  Future<Either<Failure, AuthSession>> call({
    required String firstName,
    required String lastName,
    required String password,
  }) {
    return _repository.signup(
      firstName: firstName,
      lastName: lastName,
      password: password,
    );
  }
}
