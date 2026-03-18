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
class TranslationsIt extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsIt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.it,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <it>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsIt _root = this; // ignore: unused_field

	@override 
	TranslationsIt $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsIt(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsStringsIt strings = _TranslationsStringsIt._(_root);
}

// Path: strings
class _TranslationsStringsIt extends TranslationsStringsEn {
	_TranslationsStringsIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsStringsAppIt app = _TranslationsStringsAppIt._(_root);
	@override late final _TranslationsStringsAuthIt auth = _TranslationsStringsAuthIt._(_root);
	@override late final _TranslationsStringsNavigationIt navigation = _TranslationsStringsNavigationIt._(_root);
	@override late final _TranslationsStringsCommonIt common = _TranslationsStringsCommonIt._(_root);
	@override late final _TranslationsStringsChatIt chat = _TranslationsStringsChatIt._(_root);
	@override late final _TranslationsStringsNotificationsIt notifications = _TranslationsStringsNotificationsIt._(_root);
	@override late final _TranslationsStringsProfileIt profile = _TranslationsStringsProfileIt._(_root);
	@override late final _TranslationsStringsSettingsIt settings = _TranslationsStringsSettingsIt._(_root);
	@override late final _TranslationsStringsConnectivityIt connectivity = _TranslationsStringsConnectivityIt._(_root);
	@override late final _TranslationsStringsOnboardingIt onboarding = _TranslationsStringsOnboardingIt._(_root);
}

// Path: strings.app
class _TranslationsStringsAppIt extends TranslationsStringsAppEn {
	_TranslationsStringsAppIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get name => 'Heart Attack Ethiopia';
	@override String get tagline => 'Applicazione Flutter di Heart Attack Ethiopia.';
	@override String get loading => 'Preparazione dell\'esperienza...';
}

// Path: strings.auth
class _TranslationsStringsAuthIt extends TranslationsStringsAuthEn {
	_TranslationsStringsAuthIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bentornato';
	@override String get subtitle => 'Accedi per continuare.';
	@override String get emailLabel => 'Indirizzo e-mail';
	@override String get passwordLabel => 'Password';
	@override String get emailHint => 'demo@template.dev';
	@override String get passwordHint => 'Password123';
	@override String get submit => 'Accedi';
	@override String get logout => 'Disconnetti';
	@override String get checkingSession => 'Controllo della sessione salvata in corso...';
	@override String get demoHint => 'Account demo: demo@template.dev / Password123';
	@override String get invalidCredentials => 'Usa le credenziali demo per entrare nell\'app.';
	@override String signedInAs({required Object email}) => 'Accesso effettuato come ${email}';
}

// Path: strings.navigation
class _TranslationsStringsNavigationIt extends TranslationsStringsNavigationEn {
	_TranslationsStringsNavigationIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get chat => 'Chat';
	@override String get notifications => 'Notifiche';
	@override String get profile => 'Profilo';
	@override String get settings => 'Impostazioni';
}

// Path: strings.common
class _TranslationsStringsCommonIt extends TranslationsStringsCommonEn {
	_TranslationsStringsCommonIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get retry => 'Riprova';
	@override String get cancel => 'Annulla';
	@override String get comingSoon => 'Questa sezione sarà disponibile presto.';
	@override String get noConnection => 'Nessuna connessione a Internet';
}

// Path: strings.chat
class _TranslationsStringsChatIt extends TranslationsStringsChatEn {
	_TranslationsStringsChatIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chat del team';
	@override String get description => 'Collega qui i tuoi flussi di messaggistica in tempo reale.';
	@override String get emptyState => 'Nessuna conversazione al momento.';
}

// Path: strings.notifications
class _TranslationsStringsNotificationsIt extends TranslationsStringsNotificationsEn {
	_TranslationsStringsNotificationsIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Notifiche';
	@override String get description => 'Gestisci da qui notifiche push, in-app e locali.';
}

// Path: strings.profile
class _TranslationsStringsProfileIt extends TranslationsStringsProfileEn {
	_TranslationsStringsProfileIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profilo';
	@override String get description => 'Mostra qui preferenze dell\'account, sicurezza e dati personali.';
}

// Path: strings.settings
class _TranslationsStringsSettingsIt extends TranslationsStringsSettingsEn {
	_TranslationsStringsSettingsIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Impostazioni';
	@override String get language => 'Lingua';
	@override String get english => 'Inglese';
	@override String get arabic => 'Arabo';
	@override String get environment => 'Ambiente';
	@override String activeEnvironment({required Object environment}) => 'Ambiente corrente: ${environment}';
}

// Path: strings.connectivity
class _TranslationsStringsConnectivityIt extends TranslationsStringsConnectivityEn {
	_TranslationsStringsConnectivityIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get online => 'Online';
	@override String get offline => 'Offline';
}

// Path: strings.onboarding
class _TranslationsStringsOnboardingIt extends TranslationsStringsOnboardingEn {
	_TranslationsStringsOnboardingIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get skip => 'Salta';
	@override String get next => 'Avanti';
	@override String get getStarted => 'Inizia';
	@override String get title => 'Benvenuto in Heart Attack Ethiopia';
	@override String get subtitle => 'La tua guida tascabile alla salute del cuore e alla risposta alle emergenze in Etiopia';
}

/// The flat map containing all translations for locale <it>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsIt {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'strings.app.name' => 'Heart Attack Ethiopia',
			'strings.app.tagline' => 'Applicazione Flutter di Heart Attack Ethiopia.',
			'strings.app.loading' => 'Preparazione dell\'esperienza...',
			'strings.auth.title' => 'Bentornato',
			'strings.auth.subtitle' => 'Accedi per continuare.',
			'strings.auth.emailLabel' => 'Indirizzo e-mail',
			'strings.auth.passwordLabel' => 'Password',
			'strings.auth.emailHint' => 'demo@template.dev',
			'strings.auth.passwordHint' => 'Password123',
			'strings.auth.submit' => 'Accedi',
			'strings.auth.logout' => 'Disconnetti',
			'strings.auth.checkingSession' => 'Controllo della sessione salvata in corso...',
			'strings.auth.demoHint' => 'Account demo: demo@template.dev / Password123',
			'strings.auth.invalidCredentials' => 'Usa le credenziali demo per entrare nell\'app.',
			'strings.auth.signedInAs' => ({required Object email}) => 'Accesso effettuato come ${email}',
			'strings.navigation.chat' => 'Chat',
			'strings.navigation.notifications' => 'Notifiche',
			'strings.navigation.profile' => 'Profilo',
			'strings.navigation.settings' => 'Impostazioni',
			'strings.common.retry' => 'Riprova',
			'strings.common.cancel' => 'Annulla',
			'strings.common.comingSoon' => 'Questa sezione sarà disponibile presto.',
			'strings.common.noConnection' => 'Nessuna connessione a Internet',
			'strings.chat.title' => 'Chat del team',
			'strings.chat.description' => 'Collega qui i tuoi flussi di messaggistica in tempo reale.',
			'strings.chat.emptyState' => 'Nessuna conversazione al momento.',
			'strings.notifications.title' => 'Notifiche',
			'strings.notifications.description' => 'Gestisci da qui notifiche push, in-app e locali.',
			'strings.profile.title' => 'Profilo',
			'strings.profile.description' => 'Mostra qui preferenze dell\'account, sicurezza e dati personali.',
			'strings.settings.title' => 'Impostazioni',
			'strings.settings.language' => 'Lingua',
			'strings.settings.english' => 'Inglese',
			'strings.settings.arabic' => 'Arabo',
			'strings.settings.environment' => 'Ambiente',
			'strings.settings.activeEnvironment' => ({required Object environment}) => 'Ambiente corrente: ${environment}',
			'strings.connectivity.online' => 'Online',
			'strings.connectivity.offline' => 'Offline',
			'strings.onboarding.skip' => 'Salta',
			'strings.onboarding.next' => 'Avanti',
			'strings.onboarding.getStarted' => 'Inizia',
			'strings.onboarding.title' => 'Benvenuto in Heart Attack Ethiopia',
			'strings.onboarding.subtitle' => 'La tua guida tascabile alla salute del cuore e alla risposta alle emergenze in Etiopia',
			_ => null,
		};
	}
}
