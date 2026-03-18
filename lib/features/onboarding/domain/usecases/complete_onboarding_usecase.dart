import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/onboarding_repository.dart';

class CompleteOnboardingUseCase {
  const CompleteOnboardingUseCase(this._repository);

  final OnboardingRepository _repository;

  Future<Either<Failure, Unit>> call() => _repository.complete();
}
