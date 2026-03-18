import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/constants/storage_keys.dart';
import '../../../../core/error/exceptions.dart';
import '../models/auth_session_model.dart';

abstract interface class AuthLocalDataSource {
  Future<void> cacheSession(AuthSessionModel session);
  Future<AuthSessionModel> restoreSession();
  Future<String?> readToken();
  Future<void> clear();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  const AuthLocalDataSourceImpl({required FlutterSecureStorage secureStorage})
    : _secureStorage = secureStorage;

  final FlutterSecureStorage _secureStorage;

  @override
  Future<void> cacheSession(AuthSessionModel session) async {
    await _secureStorage.write(
      key: StorageKeys.accessToken,
      value: session.accessToken,
    );
    await _secureStorage.write(
      key: StorageKeys.currentUser,
      value: jsonEncode(session.toJson()),
    );
  }

  @override
  Future<AuthSessionModel> restoreSession() async {
    final rawSession = await _secureStorage.read(key: StorageKeys.currentUser);
    if (rawSession == null || rawSession.isEmpty) {
      throw const CacheException('No saved session was found.');
    }

    try {
      return AuthSessionModel.fromJson(
        jsonDecode(rawSession) as Map<String, dynamic>,
      );
    } on FormatException {
      throw const CacheException('The saved session is corrupted.');
    }
  }

  @override
  Future<String?> readToken() =>
      _secureStorage.read(key: StorageKeys.accessToken);

  @override
  Future<void> clear() async {
    await _secureStorage.delete(key: StorageKeys.accessToken);
    await _secureStorage.delete(key: StorageKeys.currentUser);
  }
}
