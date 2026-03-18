import 'package:flutter/material.dart';

import '../../../core/localization/generated/strings.g.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text(
          context.t.strings.notifications.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 12),
        Text(
          context.t.strings.notifications.description,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        const Card(
          child: ListTile(
            leading: Icon(Icons.notifications_active_outlined),
            title: Text('Push/local notification orchestration lives here.'),
          ),
        ),
      ],
    );
  }
}
