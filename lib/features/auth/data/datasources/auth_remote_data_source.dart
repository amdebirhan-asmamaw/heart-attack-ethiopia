import '../../../../core/constants/app_strings.dart';
import '../../../../core/error/exceptions.dart';
import '../models/auth_session_model.dart';
import '../models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<AuthSessionModel> login({
    required String email,
    required String password,
  });

  Future<AuthSessionModel> signup({
    required String firstName,
    required String lastName,
    required String password,
  });
}

class MockAuthRemoteDataSource implements AuthRemoteDataSource {
  @override
  Future<AuthSessionModel> login({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 800));

    if (email != AppStrings.demoEmail || password != AppStrings.demoPassword) {
      throw const UnauthorizedException(
        'Use the demo credentials to authenticate.',
      );
    }

    return AuthSessionModel(
      user: const UserModel(
        id: 'user_demo',
        email: AppStrings.demoEmail,
        displayName: 'Demo Operator',
      ),
      accessToken: 'mock_access_token_123',
      signedInAt: DateTime.now(),
    );
  }

  @override
  Future<AuthSessionModel> signup({
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 800));

    return AuthSessionModel(
      user: UserModel(
        id: 'user_new',
        email: 'new_user@example.com',
        displayName: '$firstName $lastName',
      ),
      accessToken: 'mock_access_token_signup_123',
      signedInAt: DateTime.now(),
    );
  }
}
