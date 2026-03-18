import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/constants/storage_keys.dart';

abstract interface class OnboardingLocalDataSource {
  Future<bool> isCompleted();
  Future<void> markCompleted();
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  const OnboardingLocalDataSourceImpl({
    required FlutterSecureStorage secureStorage,
  }) : _secureStorage = secureStorage;

  final FlutterSecureStorage _secureStorage;

  @override
  Future<bool> isCompleted() async {
    final value = await _secureStorage.read(
      key: StorageKeys.onboardingCompleted,
    );
    return value == 'true';
  }

  @override
  Future<void> markCompleted() {
    return _secureStorage.write(
      key: StorageKeys.onboardingCompleted,
      value: 'true',
    );
  }
}
