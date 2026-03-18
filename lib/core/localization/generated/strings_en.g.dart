///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsStringsEn strings = TranslationsStringsEn.internal(_root);
}

// Path: strings
class TranslationsStringsEn {
	TranslationsStringsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsStringsAppEn app = TranslationsStringsAppEn.internal(_root);
	late final TranslationsStringsAuthEn auth = TranslationsStringsAuthEn.internal(_root);
	late final TranslationsStringsNavigationEn navigation = TranslationsStringsNavigationEn.internal(_root);
	late final TranslationsStringsCommonEn common = TranslationsStringsCommonEn.internal(_root);
	late final TranslationsStringsChatEn chat = TranslationsStringsChatEn.internal(_root);
	late final TranslationsStringsNotificationsEn notifications = TranslationsStringsNotificationsEn.internal(_root);
	late final TranslationsStringsProfileEn profile = TranslationsStringsProfileEn.internal(_root);
	late final TranslationsStringsSettingsEn settings = TranslationsStringsSettingsEn.internal(_root);
	late final TranslationsStringsConnectivityEn connectivity = TranslationsStringsConnectivityEn.internal(_root);
	late final TranslationsStringsOnboardingEn onboarding = TranslationsStringsOnboardingEn.internal(_root);
}

// Path: strings.app
class TranslationsStringsAppEn {
	TranslationsStringsAppEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Heart Attack Ethiopia'
	String get name => 'Heart Attack Ethiopia';

	/// en: 'Heart Attack Ethiopia Flutter application.'
	String get tagline => 'Heart Attack Ethiopia Flutter application.';

	/// en: 'Preparing your experience...'
	String get loading => 'Preparing your experience...';
}

// Path: strings.auth
class TranslationsStringsAuthEn {
	TranslationsStringsAuthEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Welcome back'
	String get title => 'Welcome back';

	/// en: 'Sign in to enter the starter workspace.'
	String get subtitle => 'Sign in to enter the starter workspace.';

	/// en: 'Email address'
	String get emailLabel => 'Email address';

	/// en: 'Password'
	String get passwordLabel => 'Password';

	/// en: 'demo@template.dev'
	String get emailHint => 'demo@template.dev';

	/// en: 'Password123'
	String get passwordHint => 'Password123';

	/// en: 'Sign in'
	String get submit => 'Sign in';

	/// en: 'Sign out'
	String get logout => 'Sign out';

	/// en: 'Checking your saved session...'
	String get checkingSession => 'Checking your saved session...';

	/// en: 'Demo account: demo@template.dev / Password123'
	String get demoHint => 'Demo account: demo@template.dev / Password123';

	/// en: 'Use the demo credentials to enter the template.'
	String get invalidCredentials => 'Use the demo credentials to enter the template.';

	/// en: 'Signed in as $email'
	String signedInAs({required Object email}) => 'Signed in as ${email}';
}

// Path: strings.navigation
class TranslationsStringsNavigationEn {
	TranslationsStringsNavigationEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Chat'
	String get chat => 'Chat';

	/// en: 'Notifications'
	String get notifications => 'Notifications';

	/// en: 'Profile'
	String get profile => 'Profile';

	/// en: 'Settings'
	String get settings => 'Settings';
}

// Path: strings.common
class TranslationsStringsCommonEn {
	TranslationsStringsCommonEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'This feature slice is ready for implementation.'
	String get comingSoon => 'This feature slice is ready for implementation.';

	/// en: 'No internet connection'
	String get noConnection => 'No internet connection';
}

// Path: strings.chat
class TranslationsStringsChatEn {
	TranslationsStringsChatEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Team Chat'
	String get title => 'Team Chat';

	/// en: 'Hook your live messaging flows into this feature module.'
	String get description => 'Hook your live messaging flows into this feature module.';

	/// en: 'No conversations yet.'
	String get emptyState => 'No conversations yet.';
}

// Path: strings.notifications
class TranslationsStringsNotificationsEn {
	TranslationsStringsNotificationsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Notifications'
	String get title => 'Notifications';

	/// en: 'Route push, in-app, and local notifications from this slice.'
	String get description => 'Route push, in-app, and local notifications from this slice.';
}

// Path: strings.profile
class TranslationsStringsProfileEn {
	TranslationsStringsProfileEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Profile'
	String get title => 'Profile';

	/// en: 'Expose account preferences, security, and personal details here.'
	String get description => 'Expose account preferences, security, and personal details here.';
}

// Path: strings.settings
class TranslationsStringsSettingsEn {
	TranslationsStringsSettingsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings'
	String get title => 'Settings';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'English'
	String get english => 'English';

	/// en: 'Arabic'
	String get arabic => 'Arabic';

	/// en: 'Environment'
	String get environment => 'Environment';

	/// en: 'Current environment: $environment'
	String activeEnvironment({required Object environment}) => 'Current environment: ${environment}';
}

// Path: strings.connectivity
class TranslationsStringsConnectivityEn {
	TranslationsStringsConnectivityEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Online'
	String get online => 'Online';

	/// en: 'Offline'
	String get offline => 'Offline';
}

// Path: strings.onboarding
class TranslationsStringsOnboardingEn {
	TranslationsStringsOnboardingEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Skip'
	String get skip => 'Skip';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Get started'
	String get getStarted => 'Get started';

	/// en: 'A quick walkthrough before you continue.'
	String get intro => 'A quick walkthrough before you continue.';

	/// en: 'Move faster when symptoms matter'
	String get welcomeTitle => 'Move faster when symptoms matter';

	/// en: 'Start with a focused guide built to help people in Ethiopia spot warning signs and respond without delay.'
	String get welcomeBody => 'Start with a focused guide built to help people in Ethiopia spot warning signs and respond without delay.';

	/// en: 'Keep urgent heart-health information close'
	String get trackTitle => 'Keep urgent heart-health information close';

	/// en: 'Store key details, follow emergency steps, and stay ready to share what responders need.'
	String get trackBody => 'Store key details, follow emergency steps, and stay ready to share what responders need.';

	/// en: 'Navigate care with confidence'
	String get supportTitle => 'Navigate care with confidence';

	/// en: 'Get a clearer path from first symptoms to hospital follow-up, medication, and recovery support.'
	String get supportBody => 'Get a clearer path from first symptoms to hospital follow-up, medication, and recovery support.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'strings.app.name' => 'Heart Attack Ethiopia',
			'strings.app.tagline' => 'Heart Attack Ethiopia Flutter application.',
			'strings.app.loading' => 'Preparing your experience...',
			'strings.auth.title' => 'Welcome back',
			'strings.auth.subtitle' => 'Sign in to enter the starter workspace.',
			'strings.auth.emailLabel' => 'Email address',
			'strings.auth.passwordLabel' => 'Password',
			'strings.auth.emailHint' => 'demo@template.dev',
			'strings.auth.passwordHint' => 'Password123',
			'strings.auth.submit' => 'Sign in',
			'strings.auth.logout' => 'Sign out',
			'strings.auth.checkingSession' => 'Checking your saved session...',
			'strings.auth.demoHint' => 'Demo account: demo@template.dev / Password123',
			'strings.auth.invalidCredentials' => 'Use the demo credentials to enter the template.',
			'strings.auth.signedInAs' => ({required Object email}) => 'Signed in as ${email}',
			'strings.navigation.chat' => 'Chat',
			'strings.navigation.notifications' => 'Notifications',
			'strings.navigation.profile' => 'Profile',
			'strings.navigation.settings' => 'Settings',
			'strings.common.retry' => 'Retry',
			'strings.common.cancel' => 'Cancel',
			'strings.common.comingSoon' => 'This feature slice is ready for implementation.',
			'strings.common.noConnection' => 'No internet connection',
			'strings.chat.title' => 'Team Chat',
			'strings.chat.description' => 'Hook your live messaging flows into this feature module.',
			'strings.chat.emptyState' => 'No conversations yet.',
			'strings.notifications.title' => 'Notifications',
			'strings.notifications.description' => 'Route push, in-app, and local notifications from this slice.',
			'strings.profile.title' => 'Profile',
			'strings.profile.description' => 'Expose account preferences, security, and personal details here.',
			'strings.settings.title' => 'Settings',
			'strings.settings.language' => 'Language',
			'strings.settings.english' => 'English',
			'strings.settings.arabic' => 'Arabic',
			'strings.settings.environment' => 'Environment',
			'strings.settings.activeEnvironment' => ({required Object environment}) => 'Current environment: ${environment}',
			'strings.connectivity.online' => 'Online',
			'strings.connectivity.offline' => 'Offline',
			'strings.onboarding.skip' => 'Skip',
			'strings.onboarding.next' => 'Next',
			'strings.onboarding.getStarted' => 'Get started',
			'strings.onboarding.intro' => 'A quick walkthrough before you continue.',
			'strings.onboarding.welcomeTitle' => 'Move faster when symptoms matter',
			'strings.onboarding.welcomeBody' => 'Start with a focused guide built to help people in Ethiopia spot warning signs and respond without delay.',
			'strings.onboarding.trackTitle' => 'Keep urgent heart-health information close',
			'strings.onboarding.trackBody' => 'Store key details, follow emergency steps, and stay ready to share what responders need.',
			'strings.onboarding.supportTitle' => 'Navigate care with confidence',
			'strings.onboarding.supportBody' => 'Get a clearer path from first symptoms to hospital follow-up, medication, and recovery support.',
			_ => null,
		};
	}
}
