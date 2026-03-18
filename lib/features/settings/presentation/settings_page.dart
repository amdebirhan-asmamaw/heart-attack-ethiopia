import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/localization/generated/strings.g.dart';
import '../../../core/localization/locale_preferences.dart';
import '../../auth/presentation/bloc/auth_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({required this.environmentLabel, super.key});

  final String environmentLabel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text(
          context.t.strings.settings.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 24),
        Card(
          child: Column(
            children: [
              ListTile(
                title: Text(context.t.strings.settings.language),
                subtitle: Text(
                  context.t.strings.settings.activeEnvironment(
                    environment: environmentLabel,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final option in _localeOptions)
                      ChoiceChip(
                        label: Text(option.label),
                        selected: LocaleSettings.currentLocale == option.locale,
                        onSelected: (_) async {
                          await sl<LocalePreferences>().setPreferredLocale(
                            option.locale,
                          );
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        FilledButton.tonalIcon(
          onPressed: () {
            context.read<AuthCubit>().logout();
          },
          icon: const Icon(Icons.logout),
          label: Text(context.t.strings.auth.logout),
        ),
      ],
    );
  }
}

class _LocaleOption {
  const _LocaleOption({required this.locale, required this.label});

  final AppLocale locale;
  final String label;
}

const _localeOptions = [
  _LocaleOption(locale: AppLocale.en, label: 'English'),
  _LocaleOption(locale: AppLocale.am, label: 'አማርኛ'),
  _LocaleOption(locale: AppLocale.ar, label: 'العربية'),
  _LocaleOption(locale: AppLocale.de, label: 'Deutsch'),
  _LocaleOption(locale: AppLocale.hi, label: 'हिन्दी'),
  _LocaleOption(locale: AppLocale.zh, label: '简体中文'),
  _LocaleOption(locale: AppLocale.it, label: 'Italiano'),
  _LocaleOption(locale: AppLocale.nl, label: 'Nederlands'),
  _LocaleOption(locale: AppLocale.pt, label: 'Português'),
  _LocaleOption(locale: AppLocale.ru, label: 'Русский'),
  _LocaleOption(locale: AppLocale.fr, label: 'Français'),
  _LocaleOption(locale: AppLocale.es, label: 'Español'),
];
