import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../datasources/onboarding_local_data_source.dart';
import '../../domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  const OnboardingRepositoryImpl({
    required OnboardingLocalDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  final OnboardingLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, Unit>> complete() async {
    try {
      await _localDataSource.markCompleted();
      return Right(unit);
    } catch (_) {
      return const Left(CacheFailure('Unable to store onboarding progress.'));
    }
  }

  @override
  Future<Either<Failure, bool>> isCompleted() async {
    try {
      return Right(await _localDataSource.isCompleted());
    } catch (_) {
      return const Left(CacheFailure('Unable to read onboarding progress.'));
    }
  }
}
