import 'package:flutter/material.dart';

import '../../../core/localization/generated/strings.g.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text(
          context.t.strings.chat.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 12),
        Text(
          context.t.strings.chat.description,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const CircleAvatar(child: Icon(Icons.forum_outlined)),
                const SizedBox(width: 16),
                Expanded(child: Text(context.t.strings.chat.emptyState)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
