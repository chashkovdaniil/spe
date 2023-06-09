import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'chats_state.dart';
import 'models/chat.dart';
import 'models/chat_message.dart';

const _initialState = ChatsState(
  chats: [],
  chat: null,
);

class ChatsStateHolder extends StateNotifier<ChatsState> {
  ChatsStateHolder() : super(_initialState);

  ChatsState get data => state;

  void setChats(List<Chat> chats) => state = state.copyWith(chats: chats);

  void setChat(Chat? chat) => state = state.copyWith(chat: chat);

  void setMessages(List<ChatMessage> messages) {
    final chat = state.chat;
    if (chat == null) {
      throw StateError('Chat is null for set messages');
    }
    state = state.copyWith(chat: chat.copyWith(messages: messages));
  }

  void clear() => state = _initialState;
}
