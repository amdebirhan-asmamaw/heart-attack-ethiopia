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
class TranslationsAm extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAm({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.am,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <am>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsAm _root = this; // ignore: unused_field

	@override 
	TranslationsAm $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAm(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsStringsAm strings = _TranslationsStringsAm._(_root);
}

// Path: strings
class _TranslationsStringsAm extends TranslationsStringsEn {
	_TranslationsStringsAm._(TranslationsAm root) : this._root = root, super.internal(root);

	final TranslationsAm _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsStringsAppAm app = _TranslationsStringsAppAm._(_root);
	@override late final _TranslationsStringsAuthAm auth = _TranslationsStringsAuthAm._(_root);
	@override late final _TranslationsStringsNavigationAm navigation = _TranslationsStringsNavigationAm._(_root);
	@override late final _TranslationsStringsCommonAm common = _TranslationsStringsCommonAm._(_root);
	@override late final _TranslationsStringsChatAm chat = _TranslationsStringsChatAm._(_root);
	@override late final _TranslationsStringsNotificationsAm notifications = _TranslationsStringsNotificationsAm._(_root);
	@override late final _TranslationsStringsProfileAm profile = _TranslationsStringsProfileAm._(_root);
	@override late final _TranslationsStringsSettingsAm settings = _TranslationsStringsSettingsAm._(_root);
	@override late final _TranslationsStringsConnectivityAm connectivity = _TranslationsStringsConnectivityAm._(_root);
	@override late final _TranslationsStringsOnboardingAm onboarding = _TranslationsStringsOnboardingAm._(_root);
}

// Path: strings.app
class _TranslationsStringsAppAm extends TranslationsStringsAppEn {
	_TranslationsStringsAppAm._(TranslationsAm root) : this._root = root, super.internal(root);

	final TranslationsAm _root; // ignore: unused_field

	// Translations
	@override String get name => 'Heart Attack Ethiopia';
	@override String get tagline => 'የHeart Attack Ethiopia መተግበሪያ።';
	@override String get loading => 'ልምድዎን እያዘጋጀን ነው...';
}

// Path: strings.auth
class _TranslationsStringsAuthAm extends TranslationsStringsAuthEn {
	_TranslationsStringsAuthAm._(TranslationsAm root) : this._root = root, super.internal(root);

	final TranslationsAm _root; // ignore: unused_field

	// Translations
	@override String get title => 'እንኳን ደህና መጡ';
	@override String get subtitle => 'ለመቀጠል ይግቡ።';
	@override String get emailLabel => 'ኢሜይል አድራሻ';
	@override String get passwordLabel => 'የይለፍ ቃል';
	@override String get emailHint => 'demo@template.dev';
	@override String get passwordHint => 'Password123';
	@override String get submit => 'ግባ';
	@override String get logout => 'ውጣ';
	@override String get checkingSession => 'የተቀመጠውን ክፍለ-ጊዜ እየመረመርን ነው...';
	@override String get demoHint => 'የሙከራ መለያ: demo@template.dev / Password123';
	@override String get invalidCredentials => 'ወደ መተግበሪያው ለመግባት የሙከራ መረጃውን ይጠቀሙ።';
	@override String signedInAs({required Object email}) => 'እንደ ${email} ገብተዋል';
}

// Path: strings.navigation
class _TranslationsStringsNavigationAm extends TranslationsStringsNavigationEn {
	_TranslationsStringsNavigationAm._(TranslationsAm root) : this._root = root, super.internal(root);

	final TranslationsAm _root; // ignore: unused_field

	// Translations
	@override String get chat => 'ውይይት';
	@override String get notifications => 'ማሳወቂያዎች';
	@override String get profile => 'መገለጫ';
	@override String get settings => 'ቅንብሮች';
}

// Path: strings.common
class _TranslationsStringsCommonAm extends TranslationsStringsCommonEn {
	_TranslationsStringsCommonAm._(TranslationsAm root) : this._root = root, super.internal(root);

	final TranslationsAm _root; // ignore: unused_field

	// Translations
	@override String get retry => 'እንደገና ሞክር';
	@override String get cancel => 'ሰርዝ';
	@override String get comingSoon => 'ይህ ክፍል በቅርቡ ይመጣል።';
	@override String get noConnection => 'የበይነመረብ ግንኙነት የለም';
}

// Path: strings.chat
class _TranslationsStringsChatAm extends TranslationsStringsChatEn {
	_TranslationsStringsChatAm._(TranslationsAm root) : this._root = root, super.internal(root);

	final TranslationsAm _root; // ignore: unused_field

	// Translations
	@override String get title => 'የቡድን ውይይት';
	@override String get description => 'የቀጥታ መልዕክት ፍሰቶችዎን ወደዚህ ክፍል ያያይዙ።';
	@override String get emptyState => 'እስካሁን ውይይት የለም።';
}

// Path: strings.notifications
class _TranslationsStringsNotificationsAm extends TranslationsStringsNotificationsEn {
	_TranslationsStringsNotificationsAm._(TranslationsAm root) : this._root = root, super.internal(root);

	final TranslationsAm _root; // ignore: unused_field

	// Translations
	@override String get title => 'ማሳወቂያዎች';
	@override String get description => 'የግፋ፣ የውስጥ መተግበሪያ እና የአካባቢ ማሳወቂያዎችን ከዚህ ክፍል ያስተዳድሩ።';
}

// Path: strings.profile
class _TranslationsStringsProfileAm extends TranslationsStringsProfileEn {
	_TranslationsStringsProfileAm._(TranslationsAm root) : this._root = root, super.internal(root);

	final TranslationsAm _root; // ignore: unused_field

	// Translations
	@override String get title => 'መገለጫ';
	@override String get description => 'የመለያ ምርጫዎች፣ ደህንነት እና የግል መረጃዎችን እዚህ ያሳዩ።';
}

// Path: strings.settings
class _TranslationsStringsSettingsAm extends TranslationsStringsSettingsEn {
	_TranslationsStringsSettingsAm._(TranslationsAm root) : this._root = root, super.internal(root);

	final TranslationsAm _root; // ignore: unused_field

	// Translations
	@override String get title => 'ቅንብሮች';
	@override String get language => 'ቋንቋ';
	@override String get english => 'እንግሊዝኛ';
	@override String get arabic => 'አረብኛ';
	@override String get environment => 'አካባቢ';
	@override String activeEnvironment({required Object environment}) => 'የአሁኑ አካባቢ: ${environment}';
}

// Path: strings.connectivity
class _TranslationsStringsConnectivityAm extends TranslationsStringsConnectivityEn {
	_TranslationsStringsConnectivityAm._(TranslationsAm root) : this._root = root, super.internal(root);

	final TranslationsAm _root; // ignore: unused_field

	// Translations
	@override String get online => 'በመስመር ላይ';
	@override String get offline => 'ከመስመር ውጭ';
}

// Path: strings.onboarding
class _TranslationsStringsOnboardingAm extends TranslationsStringsOnboardingEn {
	_TranslationsStringsOnboardingAm._(TranslationsAm root) : this._root = root, super.internal(root);

	final TranslationsAm _root; // ignore: unused_field

	// Translations
	@override String get skip => 'ዝለል';
	@override String get next => 'ቀጥል';
	@override String get getStarted => 'ጀምር';
	@override String get title => 'ወደ Heart Attack Ethiopia እንኳን ደህና መጡ';
	@override String get subtitle => 'በኢትዮጵያ ውስጥ ለልብ ጤና እና ለድንገተኛ ምላሽ የእጅ መመሪያዎ';
}

/// The flat map containing all translations for locale <am>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsAm {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'strings.app.name' => 'Heart Attack Ethiopia',
			'strings.app.tagline' => 'የHeart Attack Ethiopia መተግበሪያ።',
			'strings.app.loading' => 'ልምድዎን እያዘጋጀን ነው...',
			'strings.auth.title' => 'እንኳን ደህና መጡ',
			'strings.auth.subtitle' => 'ለመቀጠል ይግቡ።',
			'strings.auth.emailLabel' => 'ኢሜይል አድራሻ',
			'strings.auth.passwordLabel' => 'የይለፍ ቃል',
			'strings.auth.emailHint' => 'demo@template.dev',
			'strings.auth.passwordHint' => 'Password123',
			'strings.auth.submit' => 'ግባ',
			'strings.auth.logout' => 'ውጣ',
			'strings.auth.checkingSession' => 'የተቀመጠውን ክፍለ-ጊዜ እየመረመርን ነው...',
			'strings.auth.demoHint' => 'የሙከራ መለያ: demo@template.dev / Password123',
			'strings.auth.invalidCredentials' => 'ወደ መተግበሪያው ለመግባት የሙከራ መረጃውን ይጠቀሙ።',
			'strings.auth.signedInAs' => ({required Object email}) => 'እንደ ${email} ገብተዋል',
			'strings.navigation.chat' => 'ውይይት',
			'strings.navigation.notifications' => 'ማሳወቂያዎች',
			'strings.navigation.profile' => 'መገለጫ',
			'strings.navigation.settings' => 'ቅንብሮች',
			'strings.common.retry' => 'እንደገና ሞክር',
			'strings.common.cancel' => 'ሰርዝ',
			'strings.common.comingSoon' => 'ይህ ክፍል በቅርቡ ይመጣል።',
			'strings.common.noConnection' => 'የበይነመረብ ግንኙነት የለም',
			'strings.chat.title' => 'የቡድን ውይይት',
			'strings.chat.description' => 'የቀጥታ መልዕክት ፍሰቶችዎን ወደዚህ ክፍል ያያይዙ።',
			'strings.chat.emptyState' => 'እስካሁን ውይይት የለም።',
			'strings.notifications.title' => 'ማሳወቂያዎች',
			'strings.notifications.description' => 'የግፋ፣ የውስጥ መተግበሪያ እና የአካባቢ ማሳወቂያዎችን ከዚህ ክፍል ያስተዳድሩ።',
			'strings.profile.title' => 'መገለጫ',
			'strings.profile.description' => 'የመለያ ምርጫዎች፣ ደህንነት እና የግል መረጃዎችን እዚህ ያሳዩ።',
			'strings.settings.title' => 'ቅንብሮች',
			'strings.settings.language' => 'ቋንቋ',
			'strings.settings.english' => 'እንግሊዝኛ',
			'strings.settings.arabic' => 'አረብኛ',
			'strings.settings.environment' => 'አካባቢ',
			'strings.settings.activeEnvironment' => ({required Object environment}) => 'የአሁኑ አካባቢ: ${environment}',
			'strings.connectivity.online' => 'በመስመር ላይ',
			'strings.connectivity.offline' => 'ከመስመር ውጭ',
			'strings.onboarding.skip' => 'ዝለል',
			'strings.onboarding.next' => 'ቀጥል',
			'strings.onboarding.getStarted' => 'ጀምር',
			'strings.onboarding.title' => 'ወደ Heart Attack Ethiopia እንኳን ደህና መጡ',
			'strings.onboarding.subtitle' => 'በኢትዮጵያ ውስጥ ለልብ ጤና እና ለድንገተኛ ምላሽ የእጅ መመሪያዎ',
			_ => null,
		};
	}
}
