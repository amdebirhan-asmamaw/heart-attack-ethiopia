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
class TranslationsNl extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsNl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.nl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <nl>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsNl _root = this; // ignore: unused_field

	@override 
	TranslationsNl $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsNl(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsStringsNl strings = _TranslationsStringsNl._(_root);
}

// Path: strings
class _TranslationsStringsNl extends TranslationsStringsEn {
	_TranslationsStringsNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsStringsAppNl app = _TranslationsStringsAppNl._(_root);
	@override late final _TranslationsStringsAuthNl auth = _TranslationsStringsAuthNl._(_root);
	@override late final _TranslationsStringsNavigationNl navigation = _TranslationsStringsNavigationNl._(_root);
	@override late final _TranslationsStringsCommonNl common = _TranslationsStringsCommonNl._(_root);
	@override late final _TranslationsStringsChatNl chat = _TranslationsStringsChatNl._(_root);
	@override late final _TranslationsStringsNotificationsNl notifications = _TranslationsStringsNotificationsNl._(_root);
	@override late final _TranslationsStringsProfileNl profile = _TranslationsStringsProfileNl._(_root);
	@override late final _TranslationsStringsSettingsNl settings = _TranslationsStringsSettingsNl._(_root);
	@override late final _TranslationsStringsConnectivityNl connectivity = _TranslationsStringsConnectivityNl._(_root);
	@override late final _TranslationsStringsOnboardingNl onboarding = _TranslationsStringsOnboardingNl._(_root);
}

// Path: strings.app
class _TranslationsStringsAppNl extends TranslationsStringsAppEn {
	_TranslationsStringsAppNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Heart Attack Ethiopia';
	@override String get tagline => 'Heart Attack Ethiopia Flutter-app.';
	@override String get loading => 'Je ervaring wordt voorbereid...';
}

// Path: strings.auth
class _TranslationsStringsAuthNl extends TranslationsStringsAuthEn {
	_TranslationsStringsAuthNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Welkom terug';
	@override String get subtitle => 'Log in om verder te gaan.';
	@override String get emailLabel => 'E-mailadres';
	@override String get passwordLabel => 'Wachtwoord';
	@override String get emailHint => 'demo@template.dev';
	@override String get passwordHint => 'Password123';
	@override String get submit => 'Inloggen';
	@override String get logout => 'Uitloggen';
	@override String get checkingSession => 'Je opgeslagen sessie wordt gecontroleerd...';
	@override String get demoHint => 'Demo-account: demo@template.dev / Password123';
	@override String get invalidCredentials => 'Gebruik de demo-inloggegevens om de app te openen.';
	@override String signedInAs({required Object email}) => 'Ingelogd als ${email}';
}

// Path: strings.navigation
class _TranslationsStringsNavigationNl extends TranslationsStringsNavigationEn {
	_TranslationsStringsNavigationNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get chat => 'Chat';
	@override String get notifications => 'Meldingen';
	@override String get profile => 'Profiel';
	@override String get settings => 'Instellingen';
}

// Path: strings.common
class _TranslationsStringsCommonNl extends TranslationsStringsCommonEn {
	_TranslationsStringsCommonNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get retry => 'Opnieuw proberen';
	@override String get cancel => 'Annuleren';
	@override String get comingSoon => 'Deze sectie is binnenkort beschikbaar.';
	@override String get noConnection => 'Geen internetverbinding';
}

// Path: strings.chat
class _TranslationsStringsChatNl extends TranslationsStringsChatEn {
	_TranslationsStringsChatNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Teamchat';
	@override String get description => 'Koppel hier je live berichtenstromen aan deze module.';
	@override String get emptyState => 'Nog geen gesprekken.';
}

// Path: strings.notifications
class _TranslationsStringsNotificationsNl extends TranslationsStringsNotificationsEn {
	_TranslationsStringsNotificationsNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Meldingen';
	@override String get description => 'Beheer hier push-, in-app- en lokale meldingen.';
}

// Path: strings.profile
class _TranslationsStringsProfileNl extends TranslationsStringsProfileEn {
	_TranslationsStringsProfileNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profiel';
	@override String get description => 'Toon hier accountvoorkeuren, beveiliging en persoonlijke gegevens.';
}

// Path: strings.settings
class _TranslationsStringsSettingsNl extends TranslationsStringsSettingsEn {
	_TranslationsStringsSettingsNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Instellingen';
	@override String get language => 'Taal';
	@override String get english => 'Engels';
	@override String get arabic => 'Arabisch';
	@override String get environment => 'Omgeving';
	@override String activeEnvironment({required Object environment}) => 'Huidige omgeving: ${environment}';
}

// Path: strings.connectivity
class _TranslationsStringsConnectivityNl extends TranslationsStringsConnectivityEn {
	_TranslationsStringsConnectivityNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get online => 'Online';
	@override String get offline => 'Offline';
}

// Path: strings.onboarding
class _TranslationsStringsOnboardingNl extends TranslationsStringsOnboardingEn {
	_TranslationsStringsOnboardingNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get skip => 'Overslaan';
	@override String get next => 'Volgende';
	@override String get getStarted => 'Aan de slag';
	@override String get title => 'Welkom bij Heart Attack Ethiopia';
	@override String get subtitle => 'Jouw gids op zak voor hartgezondheid en noodhulp in Ethiopië';
}

/// The flat map containing all translations for locale <nl>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsNl {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'strings.app.name' => 'Heart Attack Ethiopia',
			'strings.app.tagline' => 'Heart Attack Ethiopia Flutter-app.',
			'strings.app.loading' => 'Je ervaring wordt voorbereid...',
			'strings.auth.title' => 'Welkom terug',
			'strings.auth.subtitle' => 'Log in om verder te gaan.',
			'strings.auth.emailLabel' => 'E-mailadres',
			'strings.auth.passwordLabel' => 'Wachtwoord',
			'strings.auth.emailHint' => 'demo@template.dev',
			'strings.auth.passwordHint' => 'Password123',
			'strings.auth.submit' => 'Inloggen',
			'strings.auth.logout' => 'Uitloggen',
			'strings.auth.checkingSession' => 'Je opgeslagen sessie wordt gecontroleerd...',
			'strings.auth.demoHint' => 'Demo-account: demo@template.dev / Password123',
			'strings.auth.invalidCredentials' => 'Gebruik de demo-inloggegevens om de app te openen.',
			'strings.auth.signedInAs' => ({required Object email}) => 'Ingelogd als ${email}',
			'strings.navigation.chat' => 'Chat',
			'strings.navigation.notifications' => 'Meldingen',
			'strings.navigation.profile' => 'Profiel',
			'strings.navigation.settings' => 'Instellingen',
			'strings.common.retry' => 'Opnieuw proberen',
			'strings.common.cancel' => 'Annuleren',
			'strings.common.comingSoon' => 'Deze sectie is binnenkort beschikbaar.',
			'strings.common.noConnection' => 'Geen internetverbinding',
			'strings.chat.title' => 'Teamchat',
			'strings.chat.description' => 'Koppel hier je live berichtenstromen aan deze module.',
			'strings.chat.emptyState' => 'Nog geen gesprekken.',
			'strings.notifications.title' => 'Meldingen',
			'strings.notifications.description' => 'Beheer hier push-, in-app- en lokale meldingen.',
			'strings.profile.title' => 'Profiel',
			'strings.profile.description' => 'Toon hier accountvoorkeuren, beveiliging en persoonlijke gegevens.',
			'strings.settings.title' => 'Instellingen',
			'strings.settings.language' => 'Taal',
			'strings.settings.english' => 'Engels',
			'strings.settings.arabic' => 'Arabisch',
			'strings.settings.environment' => 'Omgeving',
			'strings.settings.activeEnvironment' => ({required Object environment}) => 'Huidige omgeving: ${environment}',
			'strings.connectivity.online' => 'Online',
			'strings.connectivity.offline' => 'Offline',
			'strings.onboarding.skip' => 'Overslaan',
			'strings.onboarding.next' => 'Volgende',
			'strings.onboarding.getStarted' => 'Aan de slag',
			'strings.onboarding.title' => 'Welkom bij Heart Attack Ethiopia',
			'strings.onboarding.subtitle' => 'Jouw gids op zak voor hartgezondheid en noodhulp in Ethiopië',
			_ => null,
		};
	}
}
