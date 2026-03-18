import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract interface class OnboardingRepository {
  Future<Either<Failure, bool>> isCompleted();
  Future<Either<Failure, Unit>> complete();
}
