import 'package:freezed_annotation/freezed_annotation.dart';

import 'models/chat.dart';

part 'chats_state.freezed.dart';
part 'chats_state.g.dart';

@freezed
class ChatsState with _$ChatsState {
  const factory ChatsState({
    required List<Chat> chats,
    required Chat? chat,
  }) = _ChatsState;

  factory ChatsState.fromJson(Map<String, dynamic> json) =>
      _$ChatsStateFromJson(json);
}
