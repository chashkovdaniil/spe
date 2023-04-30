import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../chats_providers.dart';

class ChatPage extends ConsumerWidget {
  static const routeName = '/chat';

  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatName = ref
        .watch(ChatsProviders.stateHolder.select((value) => value.chat?.name));
    final body = chatName == null ? const ChatMessagesView() : ListView();

    return Scaffold(
      appBar: AppBar(
        title: Text(chatName ?? 'Чат не выбран'),
      ),
      body: body,
    );
  }
}

class ChatMessagesView extends StatelessWidget {
  const ChatMessagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
