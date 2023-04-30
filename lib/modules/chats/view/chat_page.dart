import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../chats_providers.dart';
import '../domain/models/chat.dart';
import '../domain/models/chat_message.dart';

class ChatPage extends HookConsumerWidget {
  static const routeName = '/chat';

  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chat = ModalRoute.of(context)?.settings.arguments as Chat?;
    useEffect(() {
      if (chat != null) {
        ref.read(ChatsProviders.manager).selectChat(chat);
      }
      return null;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: const ChatPageTitle(),
      ),
      body: const ChatMessagesView(),
    );
  }
}

class ChatPageTitle extends ConsumerWidget {
  const ChatPageTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref
        .watch(ChatsProviders.stateHolder.select((value) => value.chat?.name));
    return Text(title ?? 'Чат не выбран');
  }
}

class ChatMessagesView extends ConsumerWidget {
  const ChatMessagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(
      ChatsProviders.stateHolder.select((value) => value.chat?.messages),
    );
    final children =
        messages?.map((msg) => MessageWidget(message: msg)).toList();

    if (children == null) {
      return const Center(child: Text('Чат не выбран'));
    }
    final body = children.isEmpty
        ? const Center(child: Text('Сообщений нет'))
        : ListView(children: children);

    return Column(
      children: [
        Expanded(child: body),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send),
            ),
          ],
        ),
      ],
    );
  }
}

class MessageWidget extends StatelessWidget {
  final ChatMessage message;
  const MessageWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          child: Text(message.sender.fullname.characters.first),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.shade200,
          ),
          child: Text(message.message),
        ),
      ],
    );
  }
}
