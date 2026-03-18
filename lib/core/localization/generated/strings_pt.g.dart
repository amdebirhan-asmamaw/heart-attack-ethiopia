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
class TranslationsPt extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsPt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.pt,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pt>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsPt _root = this; // ignore: unused_field

	@override 
	TranslationsPt $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPt(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsStringsPt strings = _TranslationsStringsPt._(_root);
}

// Path: strings
class _TranslationsStringsPt extends TranslationsStringsEn {
	_TranslationsStringsPt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsStringsAppPt app = _TranslationsStringsAppPt._(_root);
	@override late final _TranslationsStringsAuthPt auth = _TranslationsStringsAuthPt._(_root);
	@override late final _TranslationsStringsNavigationPt navigation = _TranslationsStringsNavigationPt._(_root);
	@override late final _TranslationsStringsCommonPt common = _TranslationsStringsCommonPt._(_root);
	@override late final _TranslationsStringsChatPt chat = _TranslationsStringsChatPt._(_root);
	@override late final _TranslationsStringsNotificationsPt notifications = _TranslationsStringsNotificationsPt._(_root);
	@override late final _TranslationsStringsProfilePt profile = _TranslationsStringsProfilePt._(_root);
	@override late final _TranslationsStringsSettingsPt settings = _TranslationsStringsSettingsPt._(_root);
	@override late final _TranslationsStringsConnectivityPt connectivity = _TranslationsStringsConnectivityPt._(_root);
	@override late final _TranslationsStringsOnboardingPt onboarding = _TranslationsStringsOnboardingPt._(_root);
}

// Path: strings.app
class _TranslationsStringsAppPt extends TranslationsStringsAppEn {
	_TranslationsStringsAppPt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get name => 'Heart Attack Ethiopia';
	@override String get tagline => 'Aplicativo Flutter da Heart Attack Ethiopia.';
	@override String get loading => 'Preparando sua experiência...';
}

// Path: strings.auth
class _TranslationsStringsAuthPt extends TranslationsStringsAuthEn {
	_TranslationsStringsAuthPt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bem-vindo de volta';
	@override String get subtitle => 'Faça login para continuar.';
	@override String get emailLabel => 'Endereço de e-mail';
	@override String get passwordLabel => 'Senha';
	@override String get emailHint => 'demo@template.dev';
	@override String get passwordHint => 'Password123';
	@override String get submit => 'Entrar';
	@override String get logout => 'Sair';
	@override String get checkingSession => 'Verificando sua sessão salva...';
	@override String get demoHint => 'Conta demo: demo@template.dev / Password123';
	@override String get invalidCredentials => 'Use as credenciais de demonstração para entrar no aplicativo.';
	@override String signedInAs({required Object email}) => 'Conectado como ${email}';
}

// Path: strings.navigation
class _TranslationsStringsNavigationPt extends TranslationsStringsNavigationEn {
	_TranslationsStringsNavigationPt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get chat => 'Chat';
	@override String get notifications => 'Notificações';
	@override String get profile => 'Perfil';
	@override String get settings => 'Configurações';
}

// Path: strings.common
class _TranslationsStringsCommonPt extends TranslationsStringsCommonEn {
	_TranslationsStringsCommonPt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get retry => 'Tentar novamente';
	@override String get cancel => 'Cancelar';
	@override String get comingSoon => 'Esta seção estará disponível em breve.';
	@override String get noConnection => 'Sem conexão com a internet';
}

// Path: strings.chat
class _TranslationsStringsChatPt extends TranslationsStringsChatEn {
	_TranslationsStringsChatPt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chat da equipe';
	@override String get description => 'Conecte seus fluxos de mensagens em tempo real a este módulo.';
	@override String get emptyState => 'Ainda não há conversas.';
}

// Path: strings.notifications
class _TranslationsStringsNotificationsPt extends TranslationsStringsNotificationsEn {
	_TranslationsStringsNotificationsPt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Notificações';
	@override String get description => 'Gerencie daqui notificações push, locais e no aplicativo.';
}

// Path: strings.profile
class _TranslationsStringsProfilePt extends TranslationsStringsProfileEn {
	_TranslationsStringsProfilePt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Perfil';
	@override String get description => 'Mostre aqui preferências da conta, segurança e dados pessoais.';
}

// Path: strings.settings
class _TranslationsStringsSettingsPt extends TranslationsStringsSettingsEn {
	_TranslationsStringsSettingsPt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Configurações';
	@override String get language => 'Idioma';
	@override String get english => 'Inglês';
	@override String get arabic => 'Árabe';
	@override String get environment => 'Ambiente';
	@override String activeEnvironment({required Object environment}) => 'Ambiente atual: ${environment}';
}

// Path: strings.connectivity
class _TranslationsStringsConnectivityPt extends TranslationsStringsConnectivityEn {
	_TranslationsStringsConnectivityPt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get online => 'Online';
	@override String get offline => 'Offline';
}

// Path: strings.onboarding
class _TranslationsStringsOnboardingPt extends TranslationsStringsOnboardingEn {
	_TranslationsStringsOnboardingPt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get skip => 'Pular';
	@override String get next => 'Próximo';
	@override String get getStarted => 'Começar';
	@override String get title => 'Bem-vindo ao Heart Attack Ethiopia';
	@override String get subtitle => 'Seu guia de bolso para saúde do coração e resposta a emergências na Etiópia';
}

/// The flat map containing all translations for locale <pt>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsPt {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'strings.app.name' => 'Heart Attack Ethiopia',
			'strings.app.tagline' => 'Aplicativo Flutter da Heart Attack Ethiopia.',
			'strings.app.loading' => 'Preparando sua experiência...',
			'strings.auth.title' => 'Bem-vindo de volta',
			'strings.auth.subtitle' => 'Faça login para continuar.',
			'strings.auth.emailLabel' => 'Endereço de e-mail',
			'strings.auth.passwordLabel' => 'Senha',
			'strings.auth.emailHint' => 'demo@template.dev',
			'strings.auth.passwordHint' => 'Password123',
			'strings.auth.submit' => 'Entrar',
			'strings.auth.logout' => 'Sair',
			'strings.auth.checkingSession' => 'Verificando sua sessão salva...',
			'strings.auth.demoHint' => 'Conta demo: demo@template.dev / Password123',
			'strings.auth.invalidCredentials' => 'Use as credenciais de demonstração para entrar no aplicativo.',
			'strings.auth.signedInAs' => ({required Object email}) => 'Conectado como ${email}',
			'strings.navigation.chat' => 'Chat',
			'strings.navigation.notifications' => 'Notificações',
			'strings.navigation.profile' => 'Perfil',
			'strings.navigation.settings' => 'Configurações',
			'strings.common.retry' => 'Tentar novamente',
			'strings.common.cancel' => 'Cancelar',
			'strings.common.comingSoon' => 'Esta seção estará disponível em breve.',
			'strings.common.noConnection' => 'Sem conexão com a internet',
			'strings.chat.title' => 'Chat da equipe',
			'strings.chat.description' => 'Conecte seus fluxos de mensagens em tempo real a este módulo.',
			'strings.chat.emptyState' => 'Ainda não há conversas.',
			'strings.notifications.title' => 'Notificações',
			'strings.notifications.description' => 'Gerencie daqui notificações push, locais e no aplicativo.',
			'strings.profile.title' => 'Perfil',
			'strings.profile.description' => 'Mostre aqui preferências da conta, segurança e dados pessoais.',
			'strings.settings.title' => 'Configurações',
			'strings.settings.language' => 'Idioma',
			'strings.settings.english' => 'Inglês',
			'strings.settings.arabic' => 'Árabe',
			'strings.settings.environment' => 'Ambiente',
			'strings.settings.activeEnvironment' => ({required Object environment}) => 'Ambiente atual: ${environment}',
			'strings.connectivity.online' => 'Online',
			'strings.connectivity.offline' => 'Offline',
			'strings.onboarding.skip' => 'Pular',
			'strings.onboarding.next' => 'Próximo',
			'strings.onboarding.getStarted' => 'Começar',
			'strings.onboarding.title' => 'Bem-vindo ao Heart Attack Ethiopia',
			'strings.onboarding.subtitle' => 'Seu guia de bolso para saúde do coração e resposta a emergências na Etiópia',
			_ => null,
		};
	}
}
