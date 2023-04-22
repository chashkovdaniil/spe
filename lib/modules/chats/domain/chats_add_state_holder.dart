import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'chats_add_state.dart';

class ChatsAddStateHolder extends StateNotifier<ChatsAddState> {
  ChatsAddStateHolder() : super(ChatsAddState.empty());

  ChatsAddState get data => state;
}
