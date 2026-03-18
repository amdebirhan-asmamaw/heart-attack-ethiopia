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
class TranslationsDe extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsDe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.de,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <de>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsDe _root = this; // ignore: unused_field

	@override 
	TranslationsDe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsDe(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsStringsDe strings = _TranslationsStringsDe._(_root);
}

// Path: strings
class _TranslationsStringsDe extends TranslationsStringsEn {
	_TranslationsStringsDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsStringsAppDe app = _TranslationsStringsAppDe._(_root);
	@override late final _TranslationsStringsAuthDe auth = _TranslationsStringsAuthDe._(_root);
	@override late final _TranslationsStringsNavigationDe navigation = _TranslationsStringsNavigationDe._(_root);
	@override late final _TranslationsStringsCommonDe common = _TranslationsStringsCommonDe._(_root);
	@override late final _TranslationsStringsChatDe chat = _TranslationsStringsChatDe._(_root);
	@override late final _TranslationsStringsNotificationsDe notifications = _TranslationsStringsNotificationsDe._(_root);
	@override late final _TranslationsStringsProfileDe profile = _TranslationsStringsProfileDe._(_root);
	@override late final _TranslationsStringsSettingsDe settings = _TranslationsStringsSettingsDe._(_root);
	@override late final _TranslationsStringsConnectivityDe connectivity = _TranslationsStringsConnectivityDe._(_root);
	@override late final _TranslationsStringsOnboardingDe onboarding = _TranslationsStringsOnboardingDe._(_root);
}

// Path: strings.app
class _TranslationsStringsAppDe extends TranslationsStringsAppEn {
	_TranslationsStringsAppDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get name => 'Heart Attack Ethiopia';
	@override String get tagline => 'Heart Attack Ethiopia Flutter-Anwendung.';
	@override String get loading => 'Ihre Erfahrung wird vorbereitet...';
}

// Path: strings.auth
class _TranslationsStringsAuthDe extends TranslationsStringsAuthEn {
	_TranslationsStringsAuthDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Willkommen zurück';
	@override String get subtitle => 'Melden Sie sich an, um fortzufahren.';
	@override String get emailLabel => 'E-Mail-Adresse';
	@override String get passwordLabel => 'Passwort';
	@override String get emailHint => 'demo@template.dev';
	@override String get passwordHint => 'Password123';
	@override String get submit => 'Anmelden';
	@override String get logout => 'Abmelden';
	@override String get checkingSession => 'Ihre gespeicherte Sitzung wird geprüft...';
	@override String get demoHint => 'Demokonto: demo@template.dev / Password123';
	@override String get invalidCredentials => 'Verwenden Sie die Demo-Zugangsdaten, um die App zu öffnen.';
	@override String signedInAs({required Object email}) => 'Angemeldet als ${email}';
}

// Path: strings.navigation
class _TranslationsStringsNavigationDe extends TranslationsStringsNavigationEn {
	_TranslationsStringsNavigationDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get chat => 'Chat';
	@override String get notifications => 'Benachrichtigungen';
	@override String get profile => 'Profil';
	@override String get settings => 'Einstellungen';
}

// Path: strings.common
class _TranslationsStringsCommonDe extends TranslationsStringsCommonEn {
	_TranslationsStringsCommonDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get retry => 'Erneut versuchen';
	@override String get cancel => 'Abbrechen';
	@override String get comingSoon => 'Dieser Bereich ist bald verfügbar.';
	@override String get noConnection => 'Keine Internetverbindung';
}

// Path: strings.chat
class _TranslationsStringsChatDe extends TranslationsStringsChatEn {
	_TranslationsStringsChatDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Team-Chat';
	@override String get description => 'Verbinden Sie Ihre Live-Nachrichtenflüsse mit diesem Modul.';
	@override String get emptyState => 'Noch keine Unterhaltungen.';
}

// Path: strings.notifications
class _TranslationsStringsNotificationsDe extends TranslationsStringsNotificationsEn {
	_TranslationsStringsNotificationsDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Benachrichtigungen';
	@override String get description => 'Steuern Sie Push-, In-App- und lokale Benachrichtigungen aus diesem Bereich.';
}

// Path: strings.profile
class _TranslationsStringsProfileDe extends TranslationsStringsProfileEn {
	_TranslationsStringsProfileDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profil';
	@override String get description => 'Zeigen Sie hier Kontoeinstellungen, Sicherheit und persönliche Daten an.';
}

// Path: strings.settings
class _TranslationsStringsSettingsDe extends TranslationsStringsSettingsEn {
	_TranslationsStringsSettingsDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Einstellungen';
	@override String get language => 'Sprache';
	@override String get english => 'Englisch';
	@override String get arabic => 'Arabisch';
	@override String get environment => 'Umgebung';
	@override String activeEnvironment({required Object environment}) => 'Aktuelle Umgebung: ${environment}';
}

// Path: strings.connectivity
class _TranslationsStringsConnectivityDe extends TranslationsStringsConnectivityEn {
	_TranslationsStringsConnectivityDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get online => 'Online';
	@override String get offline => 'Offline';
}

// Path: strings.onboarding
class _TranslationsStringsOnboardingDe extends TranslationsStringsOnboardingEn {
	_TranslationsStringsOnboardingDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get skip => 'Überspringen';
	@override String get next => 'Weiter';
	@override String get getStarted => 'Loslegen';
	@override String get title => 'Willkommen bei Heart Attack Ethiopia';
	@override String get subtitle => 'Ihr Begleiter für Herzgesundheit und Notfallreaktion in Äthiopien';
}

/// The flat map containing all translations for locale <de>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsDe {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'strings.app.name' => 'Heart Attack Ethiopia',
			'strings.app.tagline' => 'Heart Attack Ethiopia Flutter-Anwendung.',
			'strings.app.loading' => 'Ihre Erfahrung wird vorbereitet...',
			'strings.auth.title' => 'Willkommen zurück',
			'strings.auth.subtitle' => 'Melden Sie sich an, um fortzufahren.',
			'strings.auth.emailLabel' => 'E-Mail-Adresse',
			'strings.auth.passwordLabel' => 'Passwort',
			'strings.auth.emailHint' => 'demo@template.dev',
			'strings.auth.passwordHint' => 'Password123',
			'strings.auth.submit' => 'Anmelden',
			'strings.auth.logout' => 'Abmelden',
			'strings.auth.checkingSession' => 'Ihre gespeicherte Sitzung wird geprüft...',
			'strings.auth.demoHint' => 'Demokonto: demo@template.dev / Password123',
			'strings.auth.invalidCredentials' => 'Verwenden Sie die Demo-Zugangsdaten, um die App zu öffnen.',
			'strings.auth.signedInAs' => ({required Object email}) => 'Angemeldet als ${email}',
			'strings.navigation.chat' => 'Chat',
			'strings.navigation.notifications' => 'Benachrichtigungen',
			'strings.navigation.profile' => 'Profil',
			'strings.navigation.settings' => 'Einstellungen',
			'strings.common.retry' => 'Erneut versuchen',
			'strings.common.cancel' => 'Abbrechen',
			'strings.common.comingSoon' => 'Dieser Bereich ist bald verfügbar.',
			'strings.common.noConnection' => 'Keine Internetverbindung',
			'strings.chat.title' => 'Team-Chat',
			'strings.chat.description' => 'Verbinden Sie Ihre Live-Nachrichtenflüsse mit diesem Modul.',
			'strings.chat.emptyState' => 'Noch keine Unterhaltungen.',
			'strings.notifications.title' => 'Benachrichtigungen',
			'strings.notifications.description' => 'Steuern Sie Push-, In-App- und lokale Benachrichtigungen aus diesem Bereich.',
			'strings.profile.title' => 'Profil',
			'strings.profile.description' => 'Zeigen Sie hier Kontoeinstellungen, Sicherheit und persönliche Daten an.',
			'strings.settings.title' => 'Einstellungen',
			'strings.settings.language' => 'Sprache',
			'strings.settings.english' => 'Englisch',
			'strings.settings.arabic' => 'Arabisch',
			'strings.settings.environment' => 'Umgebung',
			'strings.settings.activeEnvironment' => ({required Object environment}) => 'Aktuelle Umgebung: ${environment}',
			'strings.connectivity.online' => 'Online',
			'strings.connectivity.offline' => 'Offline',
			'strings.onboarding.skip' => 'Überspringen',
			'strings.onboarding.next' => 'Weiter',
			'strings.onboarding.getStarted' => 'Loslegen',
			'strings.onboarding.title' => 'Willkommen bei Heart Attack Ethiopia',
			'strings.onboarding.subtitle' => 'Ihr Begleiter für Herzgesundheit und Notfallreaktion in Äthiopien',
			_ => null,
		};
	}
}
