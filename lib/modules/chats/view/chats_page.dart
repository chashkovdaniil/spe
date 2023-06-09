import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/app_providers.dart';
import '../../../core/widgets/appbar.dart';
import '../chats_providers.dart';
import 'chats_add_dialog.dart';

class ChatsPage extends HookConsumerWidget {
  static const routeName = '/chats';

  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.read(ChatsProviders.manager);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        manager.init();
      });

      return manager.cancelSubscriptionOnChatChanges;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar('Чаты'),
      ),
      body: const _ChatsList(),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Создать'),
        icon: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => const ChatsAddDialog(),
          );
        },
      ),
    );
  }
}

class _ChatsList extends ConsumerWidget {
  const _ChatsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chats = ref.watch(
      ChatsProviders.stateHolder.select((value) => value.chats),
    );

    if (chats.isEmpty) {
      return const Center(
        child: Text('Создайте первый чат'),
      );
    }

    return ListView(
      children: chats
          .map(
            (chat) => ListTile(
              title: Text(chat.name),
              onTap: () {
                ref.read(AppProvider.navigatorProvider).openChat(chat.id);
              },
            ),
          )
          .toList(),
    );
  }
}
