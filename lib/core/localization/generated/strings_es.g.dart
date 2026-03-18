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
class TranslationsEs extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsStringsEs strings = _TranslationsStringsEs._(_root);
}

// Path: strings
class _TranslationsStringsEs extends TranslationsStringsEn {
	_TranslationsStringsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsStringsAppEs app = _TranslationsStringsAppEs._(_root);
	@override late final _TranslationsStringsAuthEs auth = _TranslationsStringsAuthEs._(_root);
	@override late final _TranslationsStringsNavigationEs navigation = _TranslationsStringsNavigationEs._(_root);
	@override late final _TranslationsStringsCommonEs common = _TranslationsStringsCommonEs._(_root);
	@override late final _TranslationsStringsChatEs chat = _TranslationsStringsChatEs._(_root);
	@override late final _TranslationsStringsNotificationsEs notifications = _TranslationsStringsNotificationsEs._(_root);
	@override late final _TranslationsStringsProfileEs profile = _TranslationsStringsProfileEs._(_root);
	@override late final _TranslationsStringsSettingsEs settings = _TranslationsStringsSettingsEs._(_root);
	@override late final _TranslationsStringsConnectivityEs connectivity = _TranslationsStringsConnectivityEs._(_root);
	@override late final _TranslationsStringsOnboardingEs onboarding = _TranslationsStringsOnboardingEs._(_root);
}

// Path: strings.app
class _TranslationsStringsAppEs extends TranslationsStringsAppEn {
	_TranslationsStringsAppEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get name => 'Heart Attack Ethiopia';
	@override String get tagline => 'Aplicación Flutter de Heart Attack Ethiopia.';
	@override String get loading => 'Preparando tu experiencia...';
}

// Path: strings.auth
class _TranslationsStringsAuthEs extends TranslationsStringsAuthEn {
	_TranslationsStringsAuthEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bienvenido de nuevo';
	@override String get subtitle => 'Inicia sesión para continuar.';
	@override String get emailLabel => 'Correo electrónico';
	@override String get passwordLabel => 'Contraseña';
	@override String get emailHint => 'demo@template.dev';
	@override String get passwordHint => 'Password123';
	@override String get submit => 'Iniciar sesión';
	@override String get logout => 'Cerrar sesión';
	@override String get checkingSession => 'Comprobando tu sesión guardada...';
	@override String get demoHint => 'Cuenta demo: demo@template.dev / Password123';
	@override String get invalidCredentials => 'Usa las credenciales de demostración para entrar en la aplicación.';
	@override String signedInAs({required Object email}) => 'Has iniciado sesión como ${email}';
}

// Path: strings.navigation
class _TranslationsStringsNavigationEs extends TranslationsStringsNavigationEn {
	_TranslationsStringsNavigationEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get chat => 'Chat';
	@override String get notifications => 'Notificaciones';
	@override String get profile => 'Perfil';
	@override String get settings => 'Configuración';
}

// Path: strings.common
class _TranslationsStringsCommonEs extends TranslationsStringsCommonEn {
	_TranslationsStringsCommonEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get retry => 'Reintentar';
	@override String get cancel => 'Cancelar';
	@override String get comingSoon => 'Esta sección estará disponible pronto.';
	@override String get noConnection => 'Sin conexión a Internet';
}

// Path: strings.chat
class _TranslationsStringsChatEs extends TranslationsStringsChatEn {
	_TranslationsStringsChatEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chat del equipo';
	@override String get description => 'Conecta aquí tus flujos de mensajería en tiempo real.';
	@override String get emptyState => 'Todavía no hay conversaciones.';
}

// Path: strings.notifications
class _TranslationsStringsNotificationsEs extends TranslationsStringsNotificationsEn {
	_TranslationsStringsNotificationsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Notificaciones';
	@override String get description => 'Gestiona desde aquí las notificaciones push, locales y dentro de la aplicación.';
}

// Path: strings.profile
class _TranslationsStringsProfileEs extends TranslationsStringsProfileEn {
	_TranslationsStringsProfileEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Perfil';
	@override String get description => 'Muestra aquí las preferencias de la cuenta, la seguridad y los datos personales.';
}

// Path: strings.settings
class _TranslationsStringsSettingsEs extends TranslationsStringsSettingsEn {
	_TranslationsStringsSettingsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Configuración';
	@override String get language => 'Idioma';
	@override String get english => 'Inglés';
	@override String get arabic => 'Árabe';
	@override String get environment => 'Entorno';
	@override String activeEnvironment({required Object environment}) => 'Entorno actual: ${environment}';
}

// Path: strings.connectivity
class _TranslationsStringsConnectivityEs extends TranslationsStringsConnectivityEn {
	_TranslationsStringsConnectivityEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get online => 'En línea';
	@override String get offline => 'Sin conexión';
}

// Path: strings.onboarding
class _TranslationsStringsOnboardingEs extends TranslationsStringsOnboardingEn {
	_TranslationsStringsOnboardingEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get skip => 'Omitir';
	@override String get next => 'Siguiente';
	@override String get getStarted => 'Comenzar';
	@override String get title => 'Bienvenido a Heart Attack Ethiopia';
	@override String get subtitle => 'Tu guía de bolsillo sobre salud cardíaca y respuesta de emergencia en Etiopía';
}

/// The flat map containing all translations for locale <es>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'strings.app.name' => 'Heart Attack Ethiopia',
			'strings.app.tagline' => 'Aplicación Flutter de Heart Attack Ethiopia.',
			'strings.app.loading' => 'Preparando tu experiencia...',
			'strings.auth.title' => 'Bienvenido de nuevo',
			'strings.auth.subtitle' => 'Inicia sesión para continuar.',
			'strings.auth.emailLabel' => 'Correo electrónico',
			'strings.auth.passwordLabel' => 'Contraseña',
			'strings.auth.emailHint' => 'demo@template.dev',
			'strings.auth.passwordHint' => 'Password123',
			'strings.auth.submit' => 'Iniciar sesión',
			'strings.auth.logout' => 'Cerrar sesión',
			'strings.auth.checkingSession' => 'Comprobando tu sesión guardada...',
			'strings.auth.demoHint' => 'Cuenta demo: demo@template.dev / Password123',
			'strings.auth.invalidCredentials' => 'Usa las credenciales de demostración para entrar en la aplicación.',
			'strings.auth.signedInAs' => ({required Object email}) => 'Has iniciado sesión como ${email}',
			'strings.navigation.chat' => 'Chat',
			'strings.navigation.notifications' => 'Notificaciones',
			'strings.navigation.profile' => 'Perfil',
			'strings.navigation.settings' => 'Configuración',
			'strings.common.retry' => 'Reintentar',
			'strings.common.cancel' => 'Cancelar',
			'strings.common.comingSoon' => 'Esta sección estará disponible pronto.',
			'strings.common.noConnection' => 'Sin conexión a Internet',
			'strings.chat.title' => 'Chat del equipo',
			'strings.chat.description' => 'Conecta aquí tus flujos de mensajería en tiempo real.',
			'strings.chat.emptyState' => 'Todavía no hay conversaciones.',
			'strings.notifications.title' => 'Notificaciones',
			'strings.notifications.description' => 'Gestiona desde aquí las notificaciones push, locales y dentro de la aplicación.',
			'strings.profile.title' => 'Perfil',
			'strings.profile.description' => 'Muestra aquí las preferencias de la cuenta, la seguridad y los datos personales.',
			'strings.settings.title' => 'Configuración',
			'strings.settings.language' => 'Idioma',
			'strings.settings.english' => 'Inglés',
			'strings.settings.arabic' => 'Árabe',
			'strings.settings.environment' => 'Entorno',
			'strings.settings.activeEnvironment' => ({required Object environment}) => 'Entorno actual: ${environment}',
			'strings.connectivity.online' => 'En línea',
			'strings.connectivity.offline' => 'Sin conexión',
			'strings.onboarding.skip' => 'Omitir',
			'strings.onboarding.next' => 'Siguiente',
			'strings.onboarding.getStarted' => 'Comenzar',
			'strings.onboarding.title' => 'Bienvenido a Heart Attack Ethiopia',
			'strings.onboarding.subtitle' => 'Tu guía de bolsillo sobre salud cardíaca y respuesta de emergencia en Etiopía',
			_ => null,
		};
	}
}
