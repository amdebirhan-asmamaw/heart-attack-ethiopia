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
class TranslationsZh extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZh({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zh,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsZh _root = this; // ignore: unused_field

	@override 
	TranslationsZh $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZh(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsStringsZh strings = _TranslationsStringsZh._(_root);
}

// Path: strings
class _TranslationsStringsZh extends TranslationsStringsEn {
	_TranslationsStringsZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsStringsAppZh app = _TranslationsStringsAppZh._(_root);
	@override late final _TranslationsStringsAuthZh auth = _TranslationsStringsAuthZh._(_root);
	@override late final _TranslationsStringsNavigationZh navigation = _TranslationsStringsNavigationZh._(_root);
	@override late final _TranslationsStringsCommonZh common = _TranslationsStringsCommonZh._(_root);
	@override late final _TranslationsStringsChatZh chat = _TranslationsStringsChatZh._(_root);
	@override late final _TranslationsStringsNotificationsZh notifications = _TranslationsStringsNotificationsZh._(_root);
	@override late final _TranslationsStringsProfileZh profile = _TranslationsStringsProfileZh._(_root);
	@override late final _TranslationsStringsSettingsZh settings = _TranslationsStringsSettingsZh._(_root);
	@override late final _TranslationsStringsConnectivityZh connectivity = _TranslationsStringsConnectivityZh._(_root);
	@override late final _TranslationsStringsOnboardingZh onboarding = _TranslationsStringsOnboardingZh._(_root);
}

// Path: strings.app
class _TranslationsStringsAppZh extends TranslationsStringsAppEn {
	_TranslationsStringsAppZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get name => 'Heart Attack Ethiopia';
	@override String get tagline => 'Heart Attack Ethiopia Flutter 应用。';
	@override String get loading => '正在准备您的体验...';
}

// Path: strings.auth
class _TranslationsStringsAuthZh extends TranslationsStringsAuthEn {
	_TranslationsStringsAuthZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '欢迎回来';
	@override String get subtitle => '请登录以继续。';
	@override String get emailLabel => '电子邮箱地址';
	@override String get passwordLabel => '密码';
	@override String get emailHint => 'demo@template.dev';
	@override String get passwordHint => 'Password123';
	@override String get submit => '登录';
	@override String get logout => '退出登录';
	@override String get checkingSession => '正在检查您保存的会话...';
	@override String get demoHint => '演示账户：demo@template.dev / Password123';
	@override String get invalidCredentials => '请使用演示凭据进入应用。';
	@override String signedInAs({required Object email}) => '已登录为 ${email}';
}

// Path: strings.navigation
class _TranslationsStringsNavigationZh extends TranslationsStringsNavigationEn {
	_TranslationsStringsNavigationZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get chat => '聊天';
	@override String get notifications => '通知';
	@override String get profile => '个人资料';
	@override String get settings => '设置';
}

// Path: strings.common
class _TranslationsStringsCommonZh extends TranslationsStringsCommonEn {
	_TranslationsStringsCommonZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get retry => '重试';
	@override String get cancel => '取消';
	@override String get comingSoon => '此部分即将推出。';
	@override String get noConnection => '没有网络连接';
}

// Path: strings.chat
class _TranslationsStringsChatZh extends TranslationsStringsChatEn {
	_TranslationsStringsChatZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '团队聊天';
	@override String get description => '将您的实时消息流接入此模块。';
	@override String get emptyState => '暂无会话。';
}

// Path: strings.notifications
class _TranslationsStringsNotificationsZh extends TranslationsStringsNotificationsEn {
	_TranslationsStringsNotificationsZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '通知';
	@override String get description => '在这里管理推送、应用内和本地通知。';
}

// Path: strings.profile
class _TranslationsStringsProfileZh extends TranslationsStringsProfileEn {
	_TranslationsStringsProfileZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '个人资料';
	@override String get description => '在这里展示账户偏好、安全信息和个人资料。';
}

// Path: strings.settings
class _TranslationsStringsSettingsZh extends TranslationsStringsSettingsEn {
	_TranslationsStringsSettingsZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '设置';
	@override String get language => '语言';
	@override String get english => '英语';
	@override String get arabic => '阿拉伯语';
	@override String get environment => '环境';
	@override String activeEnvironment({required Object environment}) => '当前环境：${environment}';
}

// Path: strings.connectivity
class _TranslationsStringsConnectivityZh extends TranslationsStringsConnectivityEn {
	_TranslationsStringsConnectivityZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get online => '在线';
	@override String get offline => '离线';
}

// Path: strings.onboarding
class _TranslationsStringsOnboardingZh extends TranslationsStringsOnboardingEn {
	_TranslationsStringsOnboardingZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get skip => '跳过';
	@override String get next => '继续';
	@override String get getStarted => '开始使用';
	@override String get title => '欢迎使用 Heart Attack Ethiopia';
	@override String get subtitle => '您在埃塞俄比亚的心脏健康与紧急应对随身指南';
}

/// The flat map containing all translations for locale <zh>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsZh {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'strings.app.name' => 'Heart Attack Ethiopia',
			'strings.app.tagline' => 'Heart Attack Ethiopia Flutter 应用。',
			'strings.app.loading' => '正在准备您的体验...',
			'strings.auth.title' => '欢迎回来',
			'strings.auth.subtitle' => '请登录以继续。',
			'strings.auth.emailLabel' => '电子邮箱地址',
			'strings.auth.passwordLabel' => '密码',
			'strings.auth.emailHint' => 'demo@template.dev',
			'strings.auth.passwordHint' => 'Password123',
			'strings.auth.submit' => '登录',
			'strings.auth.logout' => '退出登录',
			'strings.auth.checkingSession' => '正在检查您保存的会话...',
			'strings.auth.demoHint' => '演示账户：demo@template.dev / Password123',
			'strings.auth.invalidCredentials' => '请使用演示凭据进入应用。',
			'strings.auth.signedInAs' => ({required Object email}) => '已登录为 ${email}',
			'strings.navigation.chat' => '聊天',
			'strings.navigation.notifications' => '通知',
			'strings.navigation.profile' => '个人资料',
			'strings.navigation.settings' => '设置',
			'strings.common.retry' => '重试',
			'strings.common.cancel' => '取消',
			'strings.common.comingSoon' => '此部分即将推出。',
			'strings.common.noConnection' => '没有网络连接',
			'strings.chat.title' => '团队聊天',
			'strings.chat.description' => '将您的实时消息流接入此模块。',
			'strings.chat.emptyState' => '暂无会话。',
			'strings.notifications.title' => '通知',
			'strings.notifications.description' => '在这里管理推送、应用内和本地通知。',
			'strings.profile.title' => '个人资料',
			'strings.profile.description' => '在这里展示账户偏好、安全信息和个人资料。',
			'strings.settings.title' => '设置',
			'strings.settings.language' => '语言',
			'strings.settings.english' => '英语',
			'strings.settings.arabic' => '阿拉伯语',
			'strings.settings.environment' => '环境',
			'strings.settings.activeEnvironment' => ({required Object environment}) => '当前环境：${environment}',
			'strings.connectivity.online' => '在线',
			'strings.connectivity.offline' => '离线',
			'strings.onboarding.skip' => '跳过',
			'strings.onboarding.next' => '继续',
			'strings.onboarding.getStarted' => '开始使用',
			'strings.onboarding.title' => '欢迎使用 Heart Attack Ethiopia',
			'strings.onboarding.subtitle' => '您在埃塞俄比亚的心脏健康与紧急应对随身指南',
			_ => null,
		};
	}
}
