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
class TranslationsAr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsAr _root = this; // ignore: unused_field

	@override 
	TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsStringsAr strings = _TranslationsStringsAr._(_root);
}

// Path: strings
class _TranslationsStringsAr extends TranslationsStringsEn {
	_TranslationsStringsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsStringsAppAr app = _TranslationsStringsAppAr._(_root);
	@override late final _TranslationsStringsAuthAr auth = _TranslationsStringsAuthAr._(_root);
	@override late final _TranslationsStringsNavigationAr navigation = _TranslationsStringsNavigationAr._(_root);
	@override late final _TranslationsStringsCommonAr common = _TranslationsStringsCommonAr._(_root);
	@override late final _TranslationsStringsChatAr chat = _TranslationsStringsChatAr._(_root);
	@override late final _TranslationsStringsNotificationsAr notifications = _TranslationsStringsNotificationsAr._(_root);
	@override late final _TranslationsStringsProfileAr profile = _TranslationsStringsProfileAr._(_root);
	@override late final _TranslationsStringsSettingsAr settings = _TranslationsStringsSettingsAr._(_root);
	@override late final _TranslationsStringsConnectivityAr connectivity = _TranslationsStringsConnectivityAr._(_root);
	@override late final _TranslationsStringsOnboardingAr onboarding = _TranslationsStringsOnboardingAr._(_root);
}

// Path: strings.app
class _TranslationsStringsAppAr extends TranslationsStringsAppEn {
	_TranslationsStringsAppAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get name => 'Heart Attack Ethiopia';
	@override String get tagline => 'تطبيق Heart Attack Ethiopia.';
	@override String get loading => 'جارٍ تجهيز التجربة...';
}

// Path: strings.auth
class _TranslationsStringsAuthAr extends TranslationsStringsAuthEn {
	_TranslationsStringsAuthAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'مرحبًا بعودتك';
	@override String get subtitle => 'سجّل الدخول للدخول إلى مساحة العمل الابتدائية.';
	@override String get emailLabel => 'البريد الإلكتروني';
	@override String get passwordLabel => 'كلمة المرور';
	@override String get emailHint => 'demo@template.dev';
	@override String get passwordHint => 'Password123';
	@override String get submit => 'تسجيل الدخول';
	@override String get logout => 'تسجيل الخروج';
	@override String get checkingSession => 'جارٍ التحقق من الجلسة المحفوظة...';
	@override String get demoHint => 'حساب التجربة: demo@template.dev / Password123';
	@override String get invalidCredentials => 'استخدم بيانات التجربة للدخول إلى القالب.';
	@override String signedInAs({required Object email}) => 'تم تسجيل الدخول باسم ${email}';
}

// Path: strings.navigation
class _TranslationsStringsNavigationAr extends TranslationsStringsNavigationEn {
	_TranslationsStringsNavigationAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get chat => 'الدردشة';
	@override String get notifications => 'الإشعارات';
	@override String get profile => 'الملف الشخصي';
	@override String get settings => 'الإعدادات';
}

// Path: strings.common
class _TranslationsStringsCommonAr extends TranslationsStringsCommonEn {
	_TranslationsStringsCommonAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get retry => 'إعادة المحاولة';
	@override String get cancel => 'إلغاء';
	@override String get comingSoon => 'هذه الوحدة جاهزة للتنفيذ.';
	@override String get noConnection => 'لا يوجد اتصال بالإنترنت';
}

// Path: strings.chat
class _TranslationsStringsChatAr extends TranslationsStringsChatEn {
	_TranslationsStringsChatAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'دردشة الفريق';
	@override String get description => 'اربط تدفقات الرسائل الحية ضمن هذه الوحدة.';
	@override String get emptyState => 'لا توجد محادثات بعد.';
}

// Path: strings.notifications
class _TranslationsStringsNotificationsAr extends TranslationsStringsNotificationsEn {
	_TranslationsStringsNotificationsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الإشعارات';
	@override String get description => 'وجّه الإشعارات المحلية والداخلية والدفع من هذه الوحدة.';
}

// Path: strings.profile
class _TranslationsStringsProfileAr extends TranslationsStringsProfileEn {
	_TranslationsStringsProfileAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الملف الشخصي';
	@override String get description => 'اعرض تفضيلات الحساب والأمان والبيانات الشخصية هنا.';
}

// Path: strings.settings
class _TranslationsStringsSettingsAr extends TranslationsStringsSettingsEn {
	_TranslationsStringsSettingsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الإعدادات';
	@override String get language => 'اللغة';
	@override String get english => 'الإنجليزية';
	@override String get arabic => 'العربية';
	@override String get environment => 'البيئة';
	@override String activeEnvironment({required Object environment}) => 'البيئة الحالية: ${environment}';
}

// Path: strings.connectivity
class _TranslationsStringsConnectivityAr extends TranslationsStringsConnectivityEn {
	_TranslationsStringsConnectivityAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get online => 'متصل';
	@override String get offline => 'غير متصل';
}

// Path: strings.onboarding
class _TranslationsStringsOnboardingAr extends TranslationsStringsOnboardingEn {
	_TranslationsStringsOnboardingAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get skip => 'تخطي';
	@override String get next => 'التالي';
	@override String get getStarted => 'ابدأ';
	@override String get intro => 'جولة سريعة قبل المتابعة.';
	@override String get welcomeTitle => 'تحرّك أسرع عندما تظهر الأعراض';
	@override String get welcomeBody => 'ابدأ بدليل موجز يساعد الناس في إثيوبيا على ملاحظة علامات الخطر والاستجابة دون تأخير.';
	@override String get trackTitle => 'احتفظ بمعلومات القلب المهمة قريبًا';
	@override String get trackBody => 'احفظ التفاصيل الأساسية واتبع خطوات الطوارئ وكن جاهزًا لمشاركة ما يحتاجه مقدمو الرعاية.';
	@override String get supportTitle => 'تنقّل في الرعاية بثقة';
	@override String get supportBody => 'احصل على مسار أوضح من الأعراض الأولى إلى المتابعة في المستشفى والأدوية ودعم التعافي.';
}

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'strings.app.name' => 'Heart Attack Ethiopia',
			'strings.app.tagline' => 'تطبيق Heart Attack Ethiopia.',
			'strings.app.loading' => 'جارٍ تجهيز التجربة...',
			'strings.auth.title' => 'مرحبًا بعودتك',
			'strings.auth.subtitle' => 'سجّل الدخول للدخول إلى مساحة العمل الابتدائية.',
			'strings.auth.emailLabel' => 'البريد الإلكتروني',
			'strings.auth.passwordLabel' => 'كلمة المرور',
			'strings.auth.emailHint' => 'demo@template.dev',
			'strings.auth.passwordHint' => 'Password123',
			'strings.auth.submit' => 'تسجيل الدخول',
			'strings.auth.logout' => 'تسجيل الخروج',
			'strings.auth.checkingSession' => 'جارٍ التحقق من الجلسة المحفوظة...',
			'strings.auth.demoHint' => 'حساب التجربة: demo@template.dev / Password123',
			'strings.auth.invalidCredentials' => 'استخدم بيانات التجربة للدخول إلى القالب.',
			'strings.auth.signedInAs' => ({required Object email}) => 'تم تسجيل الدخول باسم ${email}',
			'strings.navigation.chat' => 'الدردشة',
			'strings.navigation.notifications' => 'الإشعارات',
			'strings.navigation.profile' => 'الملف الشخصي',
			'strings.navigation.settings' => 'الإعدادات',
			'strings.common.retry' => 'إعادة المحاولة',
			'strings.common.cancel' => 'إلغاء',
			'strings.common.comingSoon' => 'هذه الوحدة جاهزة للتنفيذ.',
			'strings.common.noConnection' => 'لا يوجد اتصال بالإنترنت',
			'strings.chat.title' => 'دردشة الفريق',
			'strings.chat.description' => 'اربط تدفقات الرسائل الحية ضمن هذه الوحدة.',
			'strings.chat.emptyState' => 'لا توجد محادثات بعد.',
			'strings.notifications.title' => 'الإشعارات',
			'strings.notifications.description' => 'وجّه الإشعارات المحلية والداخلية والدفع من هذه الوحدة.',
			'strings.profile.title' => 'الملف الشخصي',
			'strings.profile.description' => 'اعرض تفضيلات الحساب والأمان والبيانات الشخصية هنا.',
			'strings.settings.title' => 'الإعدادات',
			'strings.settings.language' => 'اللغة',
			'strings.settings.english' => 'الإنجليزية',
			'strings.settings.arabic' => 'العربية',
			'strings.settings.environment' => 'البيئة',
			'strings.settings.activeEnvironment' => ({required Object environment}) => 'البيئة الحالية: ${environment}',
			'strings.connectivity.online' => 'متصل',
			'strings.connectivity.offline' => 'غير متصل',
			'strings.onboarding.skip' => 'تخطي',
			'strings.onboarding.next' => 'التالي',
			'strings.onboarding.getStarted' => 'ابدأ',
			'strings.onboarding.intro' => 'جولة سريعة قبل المتابعة.',
			'strings.onboarding.welcomeTitle' => 'تحرّك أسرع عندما تظهر الأعراض',
			'strings.onboarding.welcomeBody' => 'ابدأ بدليل موجز يساعد الناس في إثيوبيا على ملاحظة علامات الخطر والاستجابة دون تأخير.',
			'strings.onboarding.trackTitle' => 'احتفظ بمعلومات القلب المهمة قريبًا',
			'strings.onboarding.trackBody' => 'احفظ التفاصيل الأساسية واتبع خطوات الطوارئ وكن جاهزًا لمشاركة ما يحتاجه مقدمو الرعاية.',
			'strings.onboarding.supportTitle' => 'تنقّل في الرعاية بثقة',
			'strings.onboarding.supportBody' => 'احصل على مسار أوضح من الأعراض الأولى إلى المتابعة في المستشفى والأدوية ودعم التعافي.',
			_ => null,
		};
	}
}
