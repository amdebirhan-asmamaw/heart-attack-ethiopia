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
class TranslationsFr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsFr _root = this; // ignore: unused_field

	@override 
	TranslationsFr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsStringsFr strings = _TranslationsStringsFr._(_root);
}

// Path: strings
class _TranslationsStringsFr extends TranslationsStringsEn {
	_TranslationsStringsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsStringsAppFr app = _TranslationsStringsAppFr._(_root);
	@override late final _TranslationsStringsAuthFr auth = _TranslationsStringsAuthFr._(_root);
	@override late final _TranslationsStringsNavigationFr navigation = _TranslationsStringsNavigationFr._(_root);
	@override late final _TranslationsStringsCommonFr common = _TranslationsStringsCommonFr._(_root);
	@override late final _TranslationsStringsChatFr chat = _TranslationsStringsChatFr._(_root);
	@override late final _TranslationsStringsNotificationsFr notifications = _TranslationsStringsNotificationsFr._(_root);
	@override late final _TranslationsStringsProfileFr profile = _TranslationsStringsProfileFr._(_root);
	@override late final _TranslationsStringsSettingsFr settings = _TranslationsStringsSettingsFr._(_root);
	@override late final _TranslationsStringsConnectivityFr connectivity = _TranslationsStringsConnectivityFr._(_root);
	@override late final _TranslationsStringsOnboardingFr onboarding = _TranslationsStringsOnboardingFr._(_root);
}

// Path: strings.app
class _TranslationsStringsAppFr extends TranslationsStringsAppEn {
	_TranslationsStringsAppFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get name => 'Heart Attack Ethiopia';
	@override String get tagline => 'Application Flutter Heart Attack Ethiopia.';
	@override String get loading => 'Préparation de votre expérience...';
}

// Path: strings.auth
class _TranslationsStringsAuthFr extends TranslationsStringsAuthEn {
	_TranslationsStringsAuthFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bon retour';
	@override String get subtitle => 'Connectez-vous pour continuer.';
	@override String get emailLabel => 'Adresse e-mail';
	@override String get passwordLabel => 'Mot de passe';
	@override String get emailHint => 'demo@template.dev';
	@override String get passwordHint => 'Password123';
	@override String get submit => 'Se connecter';
	@override String get logout => 'Se déconnecter';
	@override String get checkingSession => 'Vérification de votre session enregistrée...';
	@override String get demoHint => 'Compte démo : demo@template.dev / Password123';
	@override String get invalidCredentials => 'Utilisez les identifiants de démonstration pour entrer dans l\'application.';
	@override String signedInAs({required Object email}) => 'Connecté en tant que ${email}';
}

// Path: strings.navigation
class _TranslationsStringsNavigationFr extends TranslationsStringsNavigationEn {
	_TranslationsStringsNavigationFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get chat => 'Discussion';
	@override String get notifications => 'Notifications';
	@override String get profile => 'Profil';
	@override String get settings => 'Paramètres';
}

// Path: strings.common
class _TranslationsStringsCommonFr extends TranslationsStringsCommonEn {
	_TranslationsStringsCommonFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get retry => 'Réessayer';
	@override String get cancel => 'Annuler';
	@override String get comingSoon => 'Cette section sera bientôt disponible.';
	@override String get noConnection => 'Aucune connexion Internet';
}

// Path: strings.chat
class _TranslationsStringsChatFr extends TranslationsStringsChatEn {
	_TranslationsStringsChatFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Discussion d\'équipe';
	@override String get description => 'Connectez ici vos flux de messagerie en direct.';
	@override String get emptyState => 'Aucune conversation pour le moment.';
}

// Path: strings.notifications
class _TranslationsStringsNotificationsFr extends TranslationsStringsNotificationsEn {
	_TranslationsStringsNotificationsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Notifications';
	@override String get description => 'Gérez ici les notifications push, locales et intégrées à l\'application.';
}

// Path: strings.profile
class _TranslationsStringsProfileFr extends TranslationsStringsProfileEn {
	_TranslationsStringsProfileFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profil';
	@override String get description => 'Affichez ici les préférences du compte, la sécurité et les informations personnelles.';
}

// Path: strings.settings
class _TranslationsStringsSettingsFr extends TranslationsStringsSettingsEn {
	_TranslationsStringsSettingsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Paramètres';
	@override String get language => 'Langue';
	@override String get english => 'Anglais';
	@override String get arabic => 'Arabe';
	@override String get environment => 'Environnement';
	@override String activeEnvironment({required Object environment}) => 'Environnement actuel : ${environment}';
}

// Path: strings.connectivity
class _TranslationsStringsConnectivityFr extends TranslationsStringsConnectivityEn {
	_TranslationsStringsConnectivityFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get online => 'En ligne';
	@override String get offline => 'Hors ligne';
}

// Path: strings.onboarding
class _TranslationsStringsOnboardingFr extends TranslationsStringsOnboardingEn {
	_TranslationsStringsOnboardingFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get skip => 'Passer';
	@override String get next => 'Suivant';
	@override String get getStarted => 'Commencer';
	@override String get title => 'Bienvenue sur Heart Attack Ethiopia';
	@override String get subtitle => 'Votre guide de poche pour la santé cardiaque et la réponse d\'urgence en Éthiopie';
}

/// The flat map containing all translations for locale <fr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'strings.app.name' => 'Heart Attack Ethiopia',
			'strings.app.tagline' => 'Application Flutter Heart Attack Ethiopia.',
			'strings.app.loading' => 'Préparation de votre expérience...',
			'strings.auth.title' => 'Bon retour',
			'strings.auth.subtitle' => 'Connectez-vous pour continuer.',
			'strings.auth.emailLabel' => 'Adresse e-mail',
			'strings.auth.passwordLabel' => 'Mot de passe',
			'strings.auth.emailHint' => 'demo@template.dev',
			'strings.auth.passwordHint' => 'Password123',
			'strings.auth.submit' => 'Se connecter',
			'strings.auth.logout' => 'Se déconnecter',
			'strings.auth.checkingSession' => 'Vérification de votre session enregistrée...',
			'strings.auth.demoHint' => 'Compte démo : demo@template.dev / Password123',
			'strings.auth.invalidCredentials' => 'Utilisez les identifiants de démonstration pour entrer dans l\'application.',
			'strings.auth.signedInAs' => ({required Object email}) => 'Connecté en tant que ${email}',
			'strings.navigation.chat' => 'Discussion',
			'strings.navigation.notifications' => 'Notifications',
			'strings.navigation.profile' => 'Profil',
			'strings.navigation.settings' => 'Paramètres',
			'strings.common.retry' => 'Réessayer',
			'strings.common.cancel' => 'Annuler',
			'strings.common.comingSoon' => 'Cette section sera bientôt disponible.',
			'strings.common.noConnection' => 'Aucune connexion Internet',
			'strings.chat.title' => 'Discussion d\'équipe',
			'strings.chat.description' => 'Connectez ici vos flux de messagerie en direct.',
			'strings.chat.emptyState' => 'Aucune conversation pour le moment.',
			'strings.notifications.title' => 'Notifications',
			'strings.notifications.description' => 'Gérez ici les notifications push, locales et intégrées à l\'application.',
			'strings.profile.title' => 'Profil',
			'strings.profile.description' => 'Affichez ici les préférences du compte, la sécurité et les informations personnelles.',
			'strings.settings.title' => 'Paramètres',
			'strings.settings.language' => 'Langue',
			'strings.settings.english' => 'Anglais',
			'strings.settings.arabic' => 'Arabe',
			'strings.settings.environment' => 'Environnement',
			'strings.settings.activeEnvironment' => ({required Object environment}) => 'Environnement actuel : ${environment}',
			'strings.connectivity.online' => 'En ligne',
			'strings.connectivity.offline' => 'Hors ligne',
			'strings.onboarding.skip' => 'Passer',
			'strings.onboarding.next' => 'Suivant',
			'strings.onboarding.getStarted' => 'Commencer',
			'strings.onboarding.title' => 'Bienvenue sur Heart Attack Ethiopia',
			'strings.onboarding.subtitle' => 'Votre guide de poche pour la santé cardiaque et la réponse d\'urgence en Éthiopie',
			_ => null,
		};
	}
}
