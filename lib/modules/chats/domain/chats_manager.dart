import 'chats_add_state_holder.dart';

class ChatsManager {
  final ChatsAddStateHolder _chatsAddStateHolder;

  ChatsManager(this._chatsAddStateHolder);

  Future<void> createChat() async {
    final addState = _chatsAddStateHolder.data;
  }
}
