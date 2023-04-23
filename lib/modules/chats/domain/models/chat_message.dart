import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/professional_member.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    required DateTime sentAt,
    required String message,
    required ProfessionalMember sender,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}
