///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsRu extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	@override 
	TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsStringsRu strings = _TranslationsStringsRu._(_root);
}

// Path: strings
class _TranslationsStringsRu extends TranslationsStringsEn {
	_TranslationsStringsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsStringsAppRu app = _TranslationsStringsAppRu._(_root);
	@override late final _TranslationsStringsAuthRu auth = _TranslationsStringsAuthRu._(_root);
	@override late final _TranslationsStringsNavigationRu navigation = _TranslationsStringsNavigationRu._(_root);
	@override late final _TranslationsStringsCommonRu common = _TranslationsStringsCommonRu._(_root);
	@override late final _TranslationsStringsChatRu chat = _TranslationsStringsChatRu._(_root);
	@override late final _TranslationsStringsNotificationsRu notifications = _TranslationsStringsNotificationsRu._(_root);
	@override late final _TranslationsStringsProfileRu profile = _TranslationsStringsProfileRu._(_root);
	@override late final _TranslationsStringsSettingsRu settings = _TranslationsStringsSettingsRu._(_root);
	@override late final _TranslationsStringsConnectivityRu connectivity = _TranslationsStringsConnectivityRu._(_root);
	@override late final _TranslationsStringsOnboardingRu onboarding = _TranslationsStringsOnboardingRu._(_root);
}

// Path: strings.app
class _TranslationsStringsAppRu extends TranslationsStringsAppEn {
	_TranslationsStringsAppRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get name => 'Heart Attack Ethiopia';
	@override String get tagline => 'Flutter-приложение Heart Attack Ethiopia.';
	@override String get loading => 'Подготавливаем приложение...';
}

// Path: strings.auth
class _TranslationsStringsAuthRu extends TranslationsStringsAuthEn {
	_TranslationsStringsAuthRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'С возвращением';
	@override String get subtitle => 'Войдите, чтобы продолжить.';
	@override String get emailLabel => 'Адрес электронной почты';
	@override String get passwordLabel => 'Пароль';
	@override String get emailHint => 'demo@template.dev';
	@override String get passwordHint => 'Password123';
	@override String get submit => 'Войти';
	@override String get logout => 'Выйти';
	@override String get checkingSession => 'Проверяем сохранённую сессию...';
	@override String get demoHint => 'Демо-аккаунт: demo@template.dev / Password123';
	@override String get invalidCredentials => 'Используйте демо-данные, чтобы войти в приложение.';
	@override String signedInAs({required Object email}) => 'Вход выполнен как ${email}';
}

// Path: strings.navigation
class _TranslationsStringsNavigationRu extends TranslationsStringsNavigationEn {
	_TranslationsStringsNavigationRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get chat => 'Чат';
	@override String get notifications => 'Уведомления';
	@override String get profile => 'Профиль';
	@override String get settings => 'Настройки';
}

// Path: strings.common
class _TranslationsStringsCommonRu extends TranslationsStringsCommonEn {
	_TranslationsStringsCommonRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get retry => 'Повторить';
	@override String get cancel => 'Отмена';
	@override String get comingSoon => 'Этот раздел скоро появится.';
	@override String get noConnection => 'Нет подключения к интернету';
}

// Path: strings.chat
class _TranslationsStringsChatRu extends TranslationsStringsChatEn {
	_TranslationsStringsChatRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Командный чат';
	@override String get description => 'Подключите сюда потоки обмена сообщениями в реальном времени.';
	@override String get emptyState => 'Пока нет разговоров.';
}

// Path: strings.notifications
class _TranslationsStringsNotificationsRu extends TranslationsStringsNotificationsEn {
	_TranslationsStringsNotificationsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Уведомления';
	@override String get description => 'Управляйте push-, локальными и встроенными уведомлениями отсюда.';
}

// Path: strings.profile
class _TranslationsStringsProfileRu extends TranslationsStringsProfileEn {
	_TranslationsStringsProfileRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Профиль';
	@override String get description => 'Показывайте здесь настройки аккаунта, безопасность и личные данные.';
}

// Path: strings.settings
class _TranslationsStringsSettingsRu extends TranslationsStringsSettingsEn {
	_TranslationsStringsSettingsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Настройки';
	@override String get language => 'Язык';
	@override String get english => 'Английский';
	@override String get arabic => 'Арабский';
	@override String get environment => 'Среда';
	@override String activeEnvironment({required Object environment}) => 'Текущая среда: ${environment}';
}

// Path: strings.connectivity
class _TranslationsStringsConnectivityRu extends TranslationsStringsConnectivityEn {
	_TranslationsStringsConnectivityRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get online => 'В сети';
	@override String get offline => 'Не в сети';
}

// Path: strings.onboarding
class _TranslationsStringsOnboardingRu extends TranslationsStringsOnboardingEn {
	_TranslationsStringsOnboardingRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get skip => 'Пропустить';
	@override String get next => 'Далее';
	@override String get getStarted => 'Начать';
	@override String get title => 'Добро пожаловать в Heart Attack Ethiopia';
	@override String get subtitle => 'Ваш карманный помощник по здоровью сердца и экстренной помощи в Эфиопии';
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'strings.app.name' => 'Heart Attack Ethiopia',
			'strings.app.tagline' => 'Flutter-приложение Heart Attack Ethiopia.',
			'strings.app.loading' => 'Подготавливаем приложение...',
			'strings.auth.title' => 'С возвращением',
			'strings.auth.subtitle' => 'Войдите, чтобы продолжить.',
			'strings.auth.emailLabel' => 'Адрес электронной почты',
			'strings.auth.passwordLabel' => 'Пароль',
			'strings.auth.emailHint' => 'demo@template.dev',
			'strings.auth.passwordHint' => 'Password123',
			'strings.auth.submit' => 'Войти',
			'strings.auth.logout' => 'Выйти',
			'strings.auth.checkingSession' => 'Проверяем сохранённую сессию...',
			'strings.auth.demoHint' => 'Демо-аккаунт: demo@template.dev / Password123',
			'strings.auth.invalidCredentials' => 'Используйте демо-данные, чтобы войти в приложение.',
			'strings.auth.signedInAs' => ({required Object email}) => 'Вход выполнен как ${email}',
			'strings.navigation.chat' => 'Чат',
			'strings.navigation.notifications' => 'Уведомления',
			'strings.navigation.profile' => 'Профиль',
			'strings.navigation.settings' => 'Настройки',
			'strings.common.retry' => 'Повторить',
			'strings.common.cancel' => 'Отмена',
			'strings.common.comingSoon' => 'Этот раздел скоро появится.',
			'strings.common.noConnection' => 'Нет подключения к интернету',
			'strings.chat.title' => 'Командный чат',
			'strings.chat.description' => 'Подключите сюда потоки обмена сообщениями в реальном времени.',
			'strings.chat.emptyState' => 'Пока нет разговоров.',
			'strings.notifications.title' => 'Уведомления',
			'strings.notifications.description' => 'Управляйте push-, локальными и встроенными уведомлениями отсюда.',
			'strings.profile.title' => 'Профиль',
			'strings.profile.description' => 'Показывайте здесь настройки аккаунта, безопасность и личные данные.',
			'strings.settings.title' => 'Настройки',
			'strings.settings.language' => 'Язык',
			'strings.settings.english' => 'Английский',
			'strings.settings.arabic' => 'Арабский',
			'strings.settings.environment' => 'Среда',
			'strings.settings.activeEnvironment' => ({required Object environment}) => 'Текущая среда: ${environment}',
			'strings.connectivity.online' => 'В сети',
			'strings.connectivity.offline' => 'Не в сети',
			'strings.onboarding.skip' => 'Пропустить',
			'strings.onboarding.next' => 'Далее',
			'strings.onboarding.getStarted' => 'Начать',
			'strings.onboarding.title' => 'Добро пожаловать в Heart Attack Ethiopia',
			'strings.onboarding.subtitle' => 'Ваш карманный помощник по здоровью сердца и экстренной помощи в Эфиопии',
			_ => null,
		};
	}
}
