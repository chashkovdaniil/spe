import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/utils.dart';
import '../../../models/app_state.dart';
import '../../../models/professional_member.dart';
import '../../../services/storage_service.dart';
import '../api/chats_api.dart';
import 'chats_add_state_holder.dart';
import 'chats_state_holder.dart';
import 'models/chat.dart';
import 'models/chat_message.dart';

class ChatsManager with InitialDisposableMixin {
  final ChatsApi _chatsApi;
  final ChatsAddStateHolder _chatsAddStateHolder;
  final ChatsStateHolder _chatsStateHolder;
  final ProfessionalMember? _currentUser;
  StreamSubscription<List<Chat>>? _chatsSubscription;
  StreamSubscription<List<ChatMessage>>? _messagesSubscription;

  ChatsManager(
    this._chatsApi,
    this._chatsAddStateHolder,
    this._chatsStateHolder,
    this._currentUser,
  );

  @override
  Future<void> init() async {
    if (isInited) {
      return;
    }
    List<Chat> chats;
    if (_currentUser?.role == ProfessionalMemberRoles.admin) {
      chats = await _chatsApi.allChats();
    } else {
      chats = await _chatsApi.chats();
    }
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

  Future<void> subscribeOnChatMessages(String chatId) async {
    _messagesSubscription = _chatsApi.messagesStream(chatId).listen((messages) {
      _chatsStateHolder.setMessages(messages);
    });
  }

  Future<void> cancelSubscriptionOnMessages() async {
    await _messagesSubscription?.cancel();
  }

  Future<void> sendMessage(String message) async {
    if (message.isEmpty) {
      return;
    }
    final sender = _currentUser;
    final chat = _chatsStateHolder.data.chat;
    if (chat == null || sender == null) {
      return;
    }

    final chatMessage = ChatMessage(
      id: uuid.v4(),
      sentAt: DateTime.now(),
      message: message,
      sender: sender,
    );

    _chatsApi.sendMessage(chat, chatMessage);
  }

  Future<void> selectChat(Chat selectedChat) async {
    final chat = await _chatsApi.chat(id: selectedChat.id);

    if (chat == null) {
      return;
    }

    _chatsStateHolder.setChat(chat);
    subscribeOnChatMessages(chat.id);
  }

  void unselectChat() {
    cancelSubscriptionOnMessages();
    _chatsStateHolder.setChat(null);
  }

  @override
  Future<void> dispose() async {
    _chatsStateHolder.clear();
    cancelSubscriptionOnMessages();
    cancelSubscriptionOnChatChanges();
    super.dispose();
  }
}
