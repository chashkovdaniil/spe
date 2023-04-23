import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/professional_member.dart';
import '../../../../services/storage_service.dart';
import 'chat_message.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
class Chat with _$Chat {
  const factory Chat({
    required String id,
    required String name,
    required List<ProfessionalMember>? members,
    required DateTime createdAt,
    required List<ChatMessage>? messages,
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  factory Chat.fromDocument(Document document) {
    final data = document.data;
    if (data == null) {
      throw StateError('Chat is null');
    }

    return Chat.fromJson(data);
  }
}
