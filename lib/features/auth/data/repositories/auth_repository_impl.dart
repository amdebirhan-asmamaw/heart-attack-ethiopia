import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required AuthLocalDataSource localDataSource,
    required AuthRemoteDataSource remoteDataSource,
    required NetworkInfo networkInfo,
  }) : _localDataSource = localDataSource,
       _remoteDataSource = remoteDataSource,
       _networkInfo = networkInfo;

  final AuthLocalDataSource _localDataSource;
  final AuthRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, AuthSession>> login({
    required String email,
    required String password,
  }) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    try {
      final session = await _remoteDataSource.login(
        email: email,
        password: password,
      );
      await _localDataSource.cacheSession(session);
      return Right(session.toEntity());
    } on UnauthorizedException catch (error) {
      return Left(AuthFailure(error.message));
    } on NetworkException catch (error) {
      return Left(NetworkFailure(error.message));
    } on CacheException catch (error) {
      return Left(CacheFailure(error.message));
    } catch (_) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AuthSession>> signup({
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    try {
      final session = await _remoteDataSource.signup(
        firstName: firstName,
        lastName: lastName,
        password: password,
      );
      await _localDataSource.cacheSession(session);
      return Right(session.toEntity());
    } on UnauthorizedException catch (error) {
      return Left(AuthFailure(error.message));
    } on NetworkException catch (error) {
      return Left(NetworkFailure(error.message));
    } on CacheException catch (error) {
      return Left(CacheFailure(error.message));
    } catch (_) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AuthSession>> restoreSession() async {
    try {
      final session = await _localDataSource.restoreSession();
      return Right(session.toEntity());
    } on CacheException catch (error) {
      return Left(AuthFailure(error.message));
    } catch (_) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await _localDataSource.clear();
      return Right(unit);
    } on CacheException catch (error) {
      return Left(CacheFailure(error.message));
    } catch (_) {
      return const Left(ServerFailure());
    }
  }
}
