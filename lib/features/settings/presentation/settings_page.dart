import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/localization/generated/strings.g.dart';
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
              OverflowBar(
                children: [
                  OutlinedButton(
                    onPressed: () => LocaleSettings.setLocale(AppLocale.en),
                    child: Text(context.t.strings.settings.english),
                  ),
                  OutlinedButton(
                    onPressed: () => LocaleSettings.setLocale(AppLocale.ar),
                    child: Text(context.t.strings.settings.arabic),
                  ),
                ],
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
