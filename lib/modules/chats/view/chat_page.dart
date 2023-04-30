import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../chats_providers.dart';
import '../domain/models/chat.dart';
import 'widgets/chat_message_view.dart';
import 'widgets/chat_page_title.dart';

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
      final unselectChatFuncRef = ref.read(ChatsProviders.manager).unselectChat;
      return () => Future.delayed(Duration.zero, unselectChatFuncRef);
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: const ChatPageTitle(),
      ),
      body: const ChatMessagesView(),
    );
  }
}
