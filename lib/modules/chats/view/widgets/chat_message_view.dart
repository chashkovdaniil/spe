import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/app_providers.dart';
import '../../chats_providers.dart';
import 'message_widget.dart';

class ChatMessagesView extends HookConsumerWidget {
  const ChatMessagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(
      ChatsProviders.stateHolder.select((value) => value.chat?.messages),
    );
    final currentMember =
        ref.watch(AppProvider.appStateHolder).professionalMember;
    const noMessagesWidget = Center(child: Text('Сообщений нет'));

    if (currentMember == null) {
      return noMessagesWidget;
    }

    final children = messages?.map((msg) {
      return MessageWidget(
        message: msg,
        isCurrentMember: currentMember.id == msg.sender.id,
      );
    }).toList();

    final body = children == null || children.isEmpty
        ? noMessagesWidget
        : ListView(reverse: true, children: children);

    final textEditingController = useTextEditingController();

    return Column(
      children: [
        Expanded(child: body),
        Container(
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).inputDecorationTheme.focusColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    filled: false,
                    hintText: 'Введите сообщение...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: null,
                    focusedBorder: null,
                    errorBorder: null,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              IconButton(
                onPressed: () {
                  ref.read(ChatsProviders.manager).sendMessage(
                        textEditingController.text,
                      );
                  textEditingController.clear();
                },
                icon: const Icon(Icons.send),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }
}
