import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'chats_state.dart';
import 'models/chat.dart';

class ChatsStateHolder extends StateNotifier<ChatsState> {
  ChatsStateHolder() : super(ChatsState.empty());

  ChatsState get data => state;

  void setChats(List<Chat> chats) => state = state.copyWith(chats: chats);

  void setChat(Chat chat) => state = state.copyWith(chat: chat);

  void clear() => state = ChatsState.empty();
}
