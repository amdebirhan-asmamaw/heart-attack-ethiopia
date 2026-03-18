import 'package:flutter/material.dart';

import '../../../core/localization/generated/strings.g.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({required this.userEmail, super.key});

  final String? userEmail;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text(
          context.t.strings.profile.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 12),
        Text(
          context.t.strings.profile.description,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        Card(
          child: ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person_outline_rounded),
            ),
            title: Text(userEmail ?? 'guest@template.dev'),
            subtitle: Text(
              context.t.strings.auth.signedInAs(email: userEmail ?? 'guest'),
            ),
          ),
        ),
      ],
    );
  }
}
