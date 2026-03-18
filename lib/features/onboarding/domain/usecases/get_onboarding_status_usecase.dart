import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/onboarding_repository.dart';

class GetOnboardingStatusUseCase {
  const GetOnboardingStatusUseCase(this._repository);

  final OnboardingRepository _repository;

  Future<Either<Failure, bool>> call() => _repository.isCompleted();
}
