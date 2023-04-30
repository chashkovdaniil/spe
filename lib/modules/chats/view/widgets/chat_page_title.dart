import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../chats_providers.dart';

class ChatPageTitle extends ConsumerWidget {
  const ChatPageTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref
        .watch(ChatsProviders.stateHolder.select((value) => value.chat?.name));
    return Text(title ?? 'Чат не выбран');
  }
}
