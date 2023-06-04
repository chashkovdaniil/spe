import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../chats_providers.dart';
import '../domain/models/chat.dart';
import 'widgets/chat_message_view.dart';
import 'widgets/chat_page_title.dart';

class ChatPage extends HookConsumerWidget {
  static const routeName = '/chats/:chatId';

  final String chatId;
  const ChatPage(this.chatId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(ChatsProviders.manager).loadChat(chatId);
      final unselectChatFuncRef = ref.read(ChatsProviders.manager).closeChat;
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
