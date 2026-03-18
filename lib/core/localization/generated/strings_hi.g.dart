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
class TranslationsHi extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsHi({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.hi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <hi>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsHi _root = this; // ignore: unused_field

	@override 
	TranslationsHi $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsHi(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsStringsHi strings = _TranslationsStringsHi._(_root);
}

// Path: strings
class _TranslationsStringsHi extends TranslationsStringsEn {
	_TranslationsStringsHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsStringsAppHi app = _TranslationsStringsAppHi._(_root);
	@override late final _TranslationsStringsAuthHi auth = _TranslationsStringsAuthHi._(_root);
	@override late final _TranslationsStringsNavigationHi navigation = _TranslationsStringsNavigationHi._(_root);
	@override late final _TranslationsStringsCommonHi common = _TranslationsStringsCommonHi._(_root);
	@override late final _TranslationsStringsChatHi chat = _TranslationsStringsChatHi._(_root);
	@override late final _TranslationsStringsNotificationsHi notifications = _TranslationsStringsNotificationsHi._(_root);
	@override late final _TranslationsStringsProfileHi profile = _TranslationsStringsProfileHi._(_root);
	@override late final _TranslationsStringsSettingsHi settings = _TranslationsStringsSettingsHi._(_root);
	@override late final _TranslationsStringsConnectivityHi connectivity = _TranslationsStringsConnectivityHi._(_root);
	@override late final _TranslationsStringsOnboardingHi onboarding = _TranslationsStringsOnboardingHi._(_root);
}

// Path: strings.app
class _TranslationsStringsAppHi extends TranslationsStringsAppEn {
	_TranslationsStringsAppHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get name => 'Heart Attack Ethiopia';
	@override String get tagline => 'Heart Attack Ethiopia Flutter ऐप.';
	@override String get loading => 'आपका अनुभव तैयार किया जा रहा है...';
}

// Path: strings.auth
class _TranslationsStringsAuthHi extends TranslationsStringsAuthEn {
	_TranslationsStringsAuthHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'वापसी पर स्वागत है';
	@override String get subtitle => 'जारी रखने के लिए साइन इन करें।';
	@override String get emailLabel => 'ईमेल पता';
	@override String get passwordLabel => 'पासवर्ड';
	@override String get emailHint => 'demo@template.dev';
	@override String get passwordHint => 'Password123';
	@override String get submit => 'साइन इन करें';
	@override String get logout => 'साइन आउट करें';
	@override String get checkingSession => 'आपका सहेजा गया सत्र जाँचा जा रहा है...';
	@override String get demoHint => 'डेमो खाता: demo@template.dev / Password123';
	@override String get invalidCredentials => 'ऐप में प्रवेश करने के लिए डेमो क्रेडेंशियल्स का उपयोग करें।';
	@override String signedInAs({required Object email}) => '${email} के रूप में साइन इन किया गया';
}

// Path: strings.navigation
class _TranslationsStringsNavigationHi extends TranslationsStringsNavigationEn {
	_TranslationsStringsNavigationHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get chat => 'चैट';
	@override String get notifications => 'सूचनाएँ';
	@override String get profile => 'प्रोफ़ाइल';
	@override String get settings => 'सेटिंग्स';
}

// Path: strings.common
class _TranslationsStringsCommonHi extends TranslationsStringsCommonEn {
	_TranslationsStringsCommonHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get retry => 'फिर से प्रयास करें';
	@override String get cancel => 'रद्द करें';
	@override String get comingSoon => 'यह अनुभाग जल्द ही उपलब्ध होगा।';
	@override String get noConnection => 'इंटरनेट कनेक्शन नहीं है';
}

// Path: strings.chat
class _TranslationsStringsChatHi extends TranslationsStringsChatEn {
	_TranslationsStringsChatHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'टीम चैट';
	@override String get description => 'अपने लाइव संदेश प्रवाह को इस मॉड्यूल से जोड़ें।';
	@override String get emptyState => 'अभी तक कोई बातचीत नहीं है।';
}

// Path: strings.notifications
class _TranslationsStringsNotificationsHi extends TranslationsStringsNotificationsEn {
	_TranslationsStringsNotificationsHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'सूचनाएँ';
	@override String get description => 'पुश, इन-ऐप और स्थानीय सूचनाओं को यहाँ से प्रबंधित करें।';
}

// Path: strings.profile
class _TranslationsStringsProfileHi extends TranslationsStringsProfileEn {
	_TranslationsStringsProfileHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'प्रोफ़ाइल';
	@override String get description => 'खाता प्राथमिकताएँ, सुरक्षा और व्यक्तिगत विवरण यहाँ दिखाएँ।';
}

// Path: strings.settings
class _TranslationsStringsSettingsHi extends TranslationsStringsSettingsEn {
	_TranslationsStringsSettingsHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get title => 'सेटिंग्स';
	@override String get language => 'भाषा';
	@override String get english => 'अंग्रेज़ी';
	@override String get arabic => 'अरबी';
	@override String get environment => 'पर्यावरण';
	@override String activeEnvironment({required Object environment}) => 'वर्तमान पर्यावरण: ${environment}';
}

// Path: strings.connectivity
class _TranslationsStringsConnectivityHi extends TranslationsStringsConnectivityEn {
	_TranslationsStringsConnectivityHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get online => 'ऑनलाइन';
	@override String get offline => 'ऑफ़लाइन';
}

// Path: strings.onboarding
class _TranslationsStringsOnboardingHi extends TranslationsStringsOnboardingEn {
	_TranslationsStringsOnboardingHi._(TranslationsHi root) : this._root = root, super.internal(root);

	final TranslationsHi _root; // ignore: unused_field

	// Translations
	@override String get skip => 'छोड़ें';
	@override String get next => 'आगे';
	@override String get getStarted => 'शुरू करें';
	@override String get title => 'Heart Attack Ethiopia में आपका स्वागत है';
	@override String get subtitle => 'इथियोपिया में हृदय स्वास्थ्य और आपातकालीन प्रतिक्रिया के लिए आपकी पॉकेट गाइड';
}

/// The flat map containing all translations for locale <hi>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsHi {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'strings.app.name' => 'Heart Attack Ethiopia',
			'strings.app.tagline' => 'Heart Attack Ethiopia Flutter ऐप.',
			'strings.app.loading' => 'आपका अनुभव तैयार किया जा रहा है...',
			'strings.auth.title' => 'वापसी पर स्वागत है',
			'strings.auth.subtitle' => 'जारी रखने के लिए साइन इन करें।',
			'strings.auth.emailLabel' => 'ईमेल पता',
			'strings.auth.passwordLabel' => 'पासवर्ड',
			'strings.auth.emailHint' => 'demo@template.dev',
			'strings.auth.passwordHint' => 'Password123',
			'strings.auth.submit' => 'साइन इन करें',
			'strings.auth.logout' => 'साइन आउट करें',
			'strings.auth.checkingSession' => 'आपका सहेजा गया सत्र जाँचा जा रहा है...',
			'strings.auth.demoHint' => 'डेमो खाता: demo@template.dev / Password123',
			'strings.auth.invalidCredentials' => 'ऐप में प्रवेश करने के लिए डेमो क्रेडेंशियल्स का उपयोग करें।',
			'strings.auth.signedInAs' => ({required Object email}) => '${email} के रूप में साइन इन किया गया',
			'strings.navigation.chat' => 'चैट',
			'strings.navigation.notifications' => 'सूचनाएँ',
			'strings.navigation.profile' => 'प्रोफ़ाइल',
			'strings.navigation.settings' => 'सेटिंग्स',
			'strings.common.retry' => 'फिर से प्रयास करें',
			'strings.common.cancel' => 'रद्द करें',
			'strings.common.comingSoon' => 'यह अनुभाग जल्द ही उपलब्ध होगा।',
			'strings.common.noConnection' => 'इंटरनेट कनेक्शन नहीं है',
			'strings.chat.title' => 'टीम चैट',
			'strings.chat.description' => 'अपने लाइव संदेश प्रवाह को इस मॉड्यूल से जोड़ें।',
			'strings.chat.emptyState' => 'अभी तक कोई बातचीत नहीं है।',
			'strings.notifications.title' => 'सूचनाएँ',
			'strings.notifications.description' => 'पुश, इन-ऐप और स्थानीय सूचनाओं को यहाँ से प्रबंधित करें।',
			'strings.profile.title' => 'प्रोफ़ाइल',
			'strings.profile.description' => 'खाता प्राथमिकताएँ, सुरक्षा और व्यक्तिगत विवरण यहाँ दिखाएँ।',
			'strings.settings.title' => 'सेटिंग्स',
			'strings.settings.language' => 'भाषा',
			'strings.settings.english' => 'अंग्रेज़ी',
			'strings.settings.arabic' => 'अरबी',
			'strings.settings.environment' => 'पर्यावरण',
			'strings.settings.activeEnvironment' => ({required Object environment}) => 'वर्तमान पर्यावरण: ${environment}',
			'strings.connectivity.online' => 'ऑनलाइन',
			'strings.connectivity.offline' => 'ऑफ़लाइन',
			'strings.onboarding.skip' => 'छोड़ें',
			'strings.onboarding.next' => 'आगे',
			'strings.onboarding.getStarted' => 'शुरू करें',
			'strings.onboarding.title' => 'Heart Attack Ethiopia में आपका स्वागत है',
			'strings.onboarding.subtitle' => 'इथियोपिया में हृदय स्वास्थ्य और आपातकालीन प्रतिक्रिया के लिए आपकी पॉकेट गाइड',
			_ => null,
		};
	}
}
