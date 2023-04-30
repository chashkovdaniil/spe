import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../chats_providers.dart';
import 'chats_add_dialog.dart';

class ChatsPage extends HookConsumerWidget {
  static const routeName = '/chats';

  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.watch(ChatsProviders.manager);

    useEffect(() {
      manager.init();
      manager.subscribeOnChatChanges();

      return manager.cancelSubscriptionOnChatChanges;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: Text('Чаты'),
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
    final chats = ref.watch(ChatsProviders.stateHolder).chats;

    return ListView(
      children: chats
          .map(
            (e) => ListTile(title: Text(e.name)),
          )
          .toList(),
    );
  }
}
