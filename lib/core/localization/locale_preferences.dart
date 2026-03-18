import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constants/storage_keys.dart';
import 'generated/strings.g.dart';

class LocalePreferences {
  const LocalePreferences({required FlutterSecureStorage secureStorage})
    : _secureStorage = secureStorage;

  final FlutterSecureStorage _secureStorage;

  Future<AppLocale> loadPreferredLocale() async {
    final rawLocale = await _secureStorage.read(key: StorageKeys.locale);
    if (rawLocale == null || rawLocale.isEmpty) {
      return LocaleSettings.useDeviceLocale();
    }

    try {
      return LocaleSettings.setLocaleRaw(rawLocale);
    } catch (_) {
      await _secureStorage.delete(key: StorageKeys.locale);
      return LocaleSettings.useDeviceLocale();
    }
  }

  Future<AppLocale> setPreferredLocale(AppLocale locale) async {
    await _secureStorage.write(
      key: StorageKeys.locale,
      value: locale.languageCode,
    );
    return LocaleSettings.setLocale(locale);
  }
}
