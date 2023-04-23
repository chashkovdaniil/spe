import 'dart:async';

import '../../../core/utils.dart';
import '../api/chats_api.dart';
import 'chats_add_state_holder.dart';
import 'chats_state_holder.dart';
import 'models/chat.dart';

class ChatsManager with InitialDisposableMixin {
  final ChatsApi _chatsApi;
  final ChatsAddStateHolder _chatsAddStateHolder;
  final ChatsStateHolder _chatsStateHolder;
  StreamSubscription<List<Chat>>? _chatsSubscription;

  ChatsManager(
    this._chatsApi,
    this._chatsAddStateHolder,
    this._chatsStateHolder,
  );

  @override
  Future<void> init() async {
    if (isInited) {
      return;
    }
    final chats = await _chatsApi.chats();
    _chatsStateHolder.setChats(chats);
    super.init();
  }

  Future<void> subscribeOnChatChanges() async {
    _chatsSubscription = _chatsApi.chatsStream.listen((chats) {
      _chatsStateHolder.setChats(chats);
    });
  }

  Future<void> cancelSubscriptionOnChatChanges() async {
    await _chatsSubscription?.cancel();
  }

  Future<void> createChat() async {
    final addState = _chatsAddStateHolder.data;
    await _chatsApi.createChat(addState.name, addState.selectedMembers);
  }

  Future<void> selectChat(Chat selectedChat) async {
    final chat = await _chatsApi.chat(id: selectedChat.id);

    if (chat == null) {
      return;
    }

    _chatsStateHolder.setChat(chat);
  }

  @override
  Future<void> dispose() async {
    _chatsStateHolder.clear();
    super.dispose();
  }
}
